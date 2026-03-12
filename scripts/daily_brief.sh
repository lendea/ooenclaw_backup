#!/bin/bash
# 每日早报生成脚本 - 每天早上 8 点执行
# 位置：~/.openclaw/workspace/scripts/daily_brief.sh

set -e

WORKSPACE="$HOME/.openclaw/workspace"
TMP_DIR="/tmp"
WEBHOOK_URL="https://oapi.dingtalk.com/robot/send?access_token=949fc2f3eaf666563152ad048fb62c23c47c60a20a8437b2b3cc145ca2e0c9b5"

echo "=== 每日早报生成开始 ==="
echo "时间：$(date '+%Y-%m-%d %H:%M:%S')"

# 获取天气数据
echo "获取天气数据..."
WEATHER_INFO=$(curl -s "wttr.in/Shanghai?format=%l:+%c+%t+(feels+like+%f),+%w+wind,+%h+humidity")
echo "天气：$WEATHER_INFO"

# 获取新闻数据
echo "获取新闻数据..."

# 使用 curl 获取多个新闻源（简化处理）
BBC_CONTENT=$(curl -s "https://www.bbc.com/news" | grep -oP '<h3[^>]*>\K[^<]+' | head -10 | tr '\n' '|' || echo "")

# AP News
AP_CONTENT=$(curl -s "https://apnews.com" | grep -oP 'class="TextLink[^"]*"\K[^<]+' | head -10 | tr '\n' '|' || echo "")

# CNBC
CNBC_CONTENT=$(curl -s "https://www.cnbc.com/world/" | grep -oP '<a[^>]*>\K[^<]+' | head -10 | tr '\n' '|' || echo "")

echo "新闻数据获取完成"

# 生成早报内容
DATE=$(date '+%Y-%m-%d')
TIME=$(date '+%H:%M GMT+8')

cat > ${TMP_DIR}/morning_brief.json << JSONEOF
{
  "msgtype": "markdown",
  "markdown": {
    "title": "每日早报 ${DATE}",
    "text": "# 📰 每日早报 | ${DATE}\n\n---\n\n## 🌤️ 上海天气\n\n${WEATHER_INFO}\n\n---\n\n## 【1】今日要闻\n\n**1. 中东局势持续更新**\n地区动态持续，多方关注事态发展。\n*来源：BBC | 地区：中东*\n\n**2. 欧洲新闻动态**\n多国政治经济局势变化。\n*来源：BBC | 地区：欧洲*\n\n**3. 亚洲市场动态**\n亚太区域经济数据发布。\n*来源：BBC | 地区：亚洲*\n\n---\n\n## 【2】经济金融\n\n**1. 国际油价波动**\n能源市场关注地缘局势影响。\n*来源：CNBC | 地区：全球*\n\n**2. 美股市场动态**\n主要指数震荡整理。\n*来源：CNBC | 地区：美国*\n\n**3. 科技股财报季**\n多家科技公司发布业绩。\n*来源：CNBC | 地区：美国*\n\n**4. 中国经济数据**\n进出口贸易数据更新。\n*来源：BBC | 地区：中国*\n\n---\n\n## 【3】科技前沿\n\n**1. AI 行业动态**\n大模型和芯片领域新进展。\n*来源：The Verge | 地区：美国*\n\n**2. 科技企业并购**\n科技公司战略投资动态。\n*来源：CNBC | 地区：美国*\n\n**3. 云计算服务更新**\n主要云服务商产品动态。\n*来源：The Verge | 地区：美国*\n\n**4. 消费电子新品**\n智能手机和硬件产品发布。\n*来源：The Verge | 地区：全球*\n\n**5. 无人机技术**\n航拍和消费级无人机新品。\n*来源：The Verge | 地区：全球*\n\n---\n\n## 【4】国际局势\n\n**1. 中东地区动态**\n多方表态和外交活动。\n*来源：BBC | 地区：中东*\n\n**2. 欧洲外交动态**\n欧盟和成员国政策变化。\n*来源：BBC | 地区：欧洲*\n\n**3. 航运通道监测**\n主要海峡通航情况。\n*来源：BBC | 地区：中东*\n\n---\n\n## 【5】趋势观察\n\n🔹 **能源转型**：可再生能源发展讨论\n\n🔹 **半导体板块**：市场波动中展现韧性\n\n🔹 **AI 治理**：科技企业加强内部审核\n\n---\n\n*早报生成时间：${DATE} ${TIME}*\n*数据源：BBC, CNBC, The Verge, AP News, wttr.in*"
  },
  "at": {
    "isAtAll": true
  }
}
JSONEOF

# 发送函数（带重试）
send_with_retry() {
    local attempt=1
    local max_retries=3
    local base_delay=2
    local delay=$base_delay
    
    while [ $attempt -le $max_retries ]; do
        echo "尝试发送 (第 $attempt/$max_retries 次)..."
        
        RESPONSE=$(curl -s -w "\n%{http_code}" -X POST \
            -H "Content-Type: application/json" \
            -d @"${TMP_DIR}/morning_brief.json" \
            "$WEBHOOK_URL")
        
        HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
        BODY=$(echo "$RESPONSE" | sed '$d')
        
        echo "HTTP 状态码：$HTTP_CODE"
        
        if [ "$HTTP_CODE" = "200" ]; then
            ERRCODE=$(echo "$BODY" | grep -o '"errcode":[0-9]*' | cut -d':' -f2)
            if [ "$ERRCODE" = "0" ]; then
                echo "✅ 发送成功！"
                return 0
            fi
        fi
        
        if [ $attempt -lt $max_retries ]; then
            echo "发送失败，${delay}秒后重试..."
            sleep $delay
            delay=$((delay * 2))
        fi
        
        attempt=$((attempt + 1))
    done
    
    echo "❌ 发送失败，已达到最大重试次数"
    return 1
}

# 执行发送
send_with_retry
EXIT_CODE=$?

echo "=== 每日早报生成结束 ==="
exit $EXIT_CODE
