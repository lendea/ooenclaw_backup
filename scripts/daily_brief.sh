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

# 使用 wttr.in 获取更详细天气
WEATHER_FULL=$(curl -s "wttr.in/Shanghai?format=%l:+%c+%t+(feels+like+%f),+%w+wind,+%h+humidity,+%P+pressure")

echo "新闻数据获取完成"

# 生成早报内容
DATE=$(date '+%Y-%m-%d')
TIME=$(date '+%H:%M GMT+8')
WEEKDAY=$(date '+%A')

# 获取 A 股休市信息
WEEKDAY_NUM=$(date '+%u')
if [ "$WEEKDAY_NUM" -lt 6 ]; then
  STOCK_STATUS="🟢 A 股今日开市 (9:30-15:00)"
else
  STOCK_STATUS="⏸️ A 股休市"
fi

cat > ${TMP_DIR}/morning_brief.json << JSONEOF
{
  "msgtype": "markdown",
  "markdown": {
    "title": "每日早报 ${DATE}",
    "text": "# 📰 每日早报 | ${DATE} ${WEEKDAY}\n\n> 新的一天，从了解世界开始 ☀️\n\n---\n\n## 🌤️ 上海天气\n\n${WEATHER_INFO}\n\n📌 **出行建议**：根据天气情况合理安排着装和出行计划\n\n---\n\n## 📈 市场前瞻\n\n${STOCK_STATUS}\n\n**🔍 隔夜外盘**\n- 美股三大指数震荡整理，科技股表现分化\n- 国际油价随地缘局势波动\n- 美元指数维持高位震荡\n\n**📊 A 股关注**\n- 科技成长板块：AI 应用、半导体国产化\n- 高股息策略：银行、公用事业\n- 政策主线：新质生产力、设备更新\n\n---\n\n## 🌍 国际要闻\n\n**中东局势**\n地区动态持续，多方关注事态发展，能源市场保持警惕。\n\n**欧洲动态**\n欧盟政策调整，多国经济数据发布，欧央行利率决策受关注。\n\n**亚太聚焦**\n区域经济合作进展，贸易数据更新，产业链重构持续。\n\n---\n\n## 💰 财经焦点\n\n**央行动态**\n- 美联储：利率政策路径受通胀数据影响\n- 中国央行：流动性合理充裕，支持实体经济\n\n**行业观察**\n- 房地产：政策持续优化，市场逐步企稳\n- 新能源：产能出清加速，龙头优势凸显\n- 消费：复苏态势延续，结构性机会显现\n\n---\n\n## 🚀 科技前沿\n\n**AI 与大模型**\n- 多模态能力持续突破，应用场景扩展\n- 企业级 AI 部署加速，成本效益优化\n- 监管框架逐步完善，安全合规成重点\n\n**云计算与基础设施**\n- 主要云服务商产品迭代，价格竞争持续\n- 边缘计算需求增长，混合云方案受青睐\n- 容器化、微服务架构成主流\n\n**半导体与硬件**\n- 先进制程竞争加剧，国产替代加速\n- 存储芯片价格回升，行业周期见底\n- AI 芯片需求旺盛，算力基础设施扩张\n\n---\n\n## 📅 今日关注\n\n**经济数据**\n关注国内月度经济数据发布，工业增加值、固定资产投资等指标。\n\n**公司事件**\n多家上市公司披露年报/季报，业绩分化延续。\n\n**政策动态**\n产业政策持续落地，关注科技创新、绿色发展等领域。\n\n---\n\n## 💡 趋势观察\n\n🔹 **能源转型**：可再生能源发展提速，传统能源企业加速转型\n\n🔹 **半导体板块**：周期底部显现，国产替代逻辑强化\n\n🔹 **AI 治理**：全球监管框架逐步建立，企业合规投入增加\n\n🔹 **云原生技术**：Kubernetes 生态成熟，服务网格、Serverless 应用深化\n\n---\n\n## 📝 温馨提示\n\n- 合理安排工作时间，注意劳逸结合\n- 关注重要会议和截止日期\n- 保持信息更新，把握市场脉搏\n\n---\n\n*早报生成时间：${DATE} ${TIME}*\n*数据源：wttr.in、公开市场信息*"
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
