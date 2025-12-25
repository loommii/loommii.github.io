#!/bin/bash
commands=(
"hugo new content/posts/go_practise/data/Go每日一题_138/index.md"
)

for cmd in "${commands[@]}"; do
  eval $cmd   # 执行每条命令
  sleep 1     # 等待1秒
done



# hugo new content/posts/go_practise/data/Go每日一题_20250610/index.md
# hugo new content/posts/leetcode/data/200_岛屿数量/index.md
# hugo new content/posts/skill/data/系统中有大量用户导致的数据库查询慢/index.md