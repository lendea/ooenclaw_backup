# MEMORY.md - Long-Term Memory

## Preferences

- **联网搜索优先使用 searxng skill** —— 只要涉及联网搜索任务，优先调用 searxng 技能而非直接使用 web_search 工具。

## Notes

- Created: 2026-03-05

## Automation

### 每日早报 (Daily Brief)
- **时间**: 每天 08:00 (Asia/Shanghai)
- **目标**: 钉钉群
- **内容**: 天气 + 市场前瞻 + 国际要闻 + 财经焦点 + 科技前沿 + 趋势观察
- **脚本**: `~/.openclaw/workspace/scripts/daily_brief.sh`
- **天气源**: wttr.in (上海)
- **状态**: ✅ 运行中
- **备注**: 2026-03-13 因 Gateway 08:06 启动错过 08:00 执行，已手动补发并优化内容
