#!/bin/bash

# 配置参数
MAX_ATTEMPTS=3
TIMEOUT=60

# 更新 README.md 的函数
update_readme() {
  local registry="$1"
  local status="$2"
  local speed="$3"
  local time="$4"
  local integrity="$5"
  sed -i "s#| $registry |.*#| $registry | $status | $speed | $time | $integrity |#" README.md
}

# 测试 registry 的函数
test_registry() {
  local registry="$1"
  local image="$2"
  local attempt=1
  local output=$(mktemp)

  docker pull docker.io/$image > /dev/null 2>&1
  official_digest=$(docker inspect --format='{{index .RepoDigests 0}}' docker.io/$image | cut -d'@' -f2)

  while [ $attempt -le $MAX_ATTEMPTS ]; do
    echo "Attempt $attempt of $MAX_ATTEMPTS for $registry"
    if timeout ${TIMEOUT}s bash -c "time docker pull $registry/$image" > "$output" 2>&1; then
      status="✅ Good"
      pull_time=$(grep real "$output" | awk '{print $2}' | sed 's/0m//;s/s//')
      image_size=$(docker image inspect "$registry/$image" --format='{{.Size}}' | awk '{print $1/1024/1024}')
      speed=$(echo "scale=2; $image_size / $pull_time" | bc)
      echo "$registry is good, Speed: ${speed} MB/s, Time: ${pull_time}s"

      registry_digest=$(docker inspect --format='{{index .RepoDigests 0}}' $registry/$image | cut -d'@' -f2)
      if [ "$official_digest" = "$registry_digest" ]; then
        integrity="✅ Verified"
      else
        integrity="❌ Mismatch"
      fi

      update_readme "$registry" "$status" "${speed} MB/s" "${pull_time}s" "$integrity"
      echo "$registry,$speed" >> /tmp/registry_speeds.txt
      rm "$output"
      return 0
    else
      echo "$registry failed on attempt $attempt"
      attempt=$((attempt + 1))
      sleep 5
    fi
  done

  status="❌ Failed"
  update_readme "$registry" "$status" "-" "-" "-"
  rm "$output"
  return 1
}

# 读取 README.md 中的 registry 列表
registries=$(awk '/\| Registry \| Status \| Speed \| Time \| Integrity \|/,/^$/' README.md | tail -n +3 | sed '/^$/d' | awk -F'|' '{print $2}' | sed 's/^ *//;s/ *$//')

# 测试每个 registry
image="library/nginx:alpine"
> /tmp/registry_speeds.txt
for registry in $registries; do
  echo "Testing $registry"
  docker rmi "$registry/$image" > /dev/null 2>&1 || true
  
  (
    test_registry "$registry" "$image"
    docker rmi "$registry/$image" > /dev/null 2>&1 || true
  ) || true
done

docker rmi docker.io/$image > /dev/null 2>&1 || true

# 获取前三快的镜像
top_three=$(sort -t',' -k2 -nr /tmp/registry_speeds.txt | head -n 3 | cut -d',' -f1 | sed 's/^/"/' | sed 's/$/"/' | tr '\n' ',' | sed 's/,$//')

# 更新 README.md 中的镜像列表
sed -i '/^     "registry-mirrors": \[/,/^     \]/ c\
     "registry-mirrors": [\
             '"$top_three"'\
     ]' README.md
