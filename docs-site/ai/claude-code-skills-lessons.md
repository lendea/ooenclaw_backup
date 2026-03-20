# 构建 Claude Code Skills 的经验：我们如何使用 Skills

> **原文**: Lessons from Building Claude Code: How We Use Skills  
> **作者**: Thariq (@trq212)  
> **翻译**: 雷宛毓  
> **发布时间**: 2026-03-17  
> **原文链接**: https://x.com/trq212/status/2033949937936085378  
> **互动数据**: ❤️ 6,888 | 🔁 811 | 👀 1.79M | 🔖 19,357

---

Skills 已成为 Claude Code 中最常用的扩展点之一。它们灵活、易于创建、分发简单。

但这种灵活性也让人难以确定什么最有效。什么样的 Skills 值得做？写好一个 Skill 的秘诀是什么？什么时候应该与他人分享？

在 Anthropic，我们已在 Claude Code 中广泛使用 Skills，目前有数百个处于活跃使用状态。以下是我们关于使用 Skills 加速开发所总结的经验。

## 什么是 Skills？

如果你是 Skills 的新手，建议先阅读官方文档或观看 Skilljar 上关于 Agent Skills 的最新课程。本文假设你对 Skills 已有一定了解。

关于 Skills，一个常见的误解是它们"只是 Markdown 文件"。但 Skills 最有趣的地方在于，它们不仅仅是文本文件——它们是**文件夹**，可以包含脚本、资源、数据等，Agent 可以发现、探索和操作这些内容。

在 Claude Code 中，Skills 还有各种配置选项，包括注册动态 hooks。

我们发现，Claude Code 中最有趣的一些 Skills 都创造性地使用了这些配置选项和文件夹结构。

---

# Skills 的类型

在整理所有 Skills 后，我们发现它们可以归为几个重复出现的类别。最好的 Skills 清晰地属于某一类；较复杂的可能跨越多个类别。这不是一个详尽的列表，但它是思考你的组织是否缺少某些 Skills 的好方法。

## 1. 库与 API 参考 (Library & API Reference)

解释如何正确使用库、CLI 或 SDK 的 Skills。这些可以针对内部库，也可以是 Claude Code 有时会出问题的常用库。这些 Skills 通常包含一个参考代码片段文件夹，以及 Claude 编写脚本时应避免的陷阱列表。

**示例：**

- `billing-lib` — 内部计费库：边界情况、陷阱等
- `internal-platform-cli` — 内部 CLI 包装器的每个子命令，附带使用场景示例
- `frontend-design` — 让 Claude 更擅长你的设计系统

## 2. 产品验证 (Product Verification)

描述如何测试或验证代码是否正常工作的 Skills。这些通常与外部工具（如 Playwright、tmux 等）配对使用以进行验证。

验证 Skills 对于确保 Claude 的输出正确非常有用。值得让工程师花一周时间专门把验证 Skills 做好。

考虑使用以下技术：
- 让 Claude 录制输出的视频，这样你可以确切地看到它测试了什么
- 在每一步强制执行状态编程断言

这些通常通过在 Skill 中包含各种脚本来实现。

**示例：**

- `signup-flow-driver` — 在无头浏览器中运行注册 → 邮箱验证 → 入职流程，在每一步都有断言状态的 hooks
- `checkout-verifier` — 使用 Stripe 测试卡驱动结账 UI，验证发票是否确实进入正确状态
- `tmux-cli-driver` — 用于交互式 CLI 测试，适用于需要 TTY 的验证场景

## 3. 数据获取与分析 (Data Fetching & Analysis)

连接你的数据和监控栈的 Skills。这些 Skills 可能包括带凭证获取数据的库、特定的仪表板 ID 等，以及常见工作流程或获取数据方法的说明。

**示例：**

- `funnel-query` — "需要关联哪些事件才能看到注册 → 激活 → 付费"，以及实际包含规范 user_id 的表
- `cohort-compare` — 比较两个队列的留存率或转化率，标记统计显著的差异，链接到细分定义
- `grafana` — 数据源 UID、集群名称、问题 → 仪表板查找表

## 4. 业务流程与团队自动化 (Business Process & Team Automation)

将重复性工作流自动化为一条命令的 Skills。这些 Skills 通常是指令相对简单，但可能对其他 Skills 或 MCPs 有更复杂的依赖。对于这些 Skills，将之前的结果保存到日志文件中可以帮助模型保持一致性并反思之前的执行。

**示例：**

- `standup-post` — 聚合你的工单追踪器、GitHub 活动和之前的 Slack → 格式化的站会报告，仅显示差异
- `create-<ticket-system>-ticket` — 强制执行模式（有效的枚举值、必填字段）加上创建后的工作流（通知审核人、在 Slack 中链接）
- `weekly-recap` — 合并的 PR + 关闭的工单 + 部署 → 格式化的周报

## 5. 代码脚手架与模板 (Code Scaffolding & Templates)

为代码库中的特定功能生成框架样板代码的 Skills。你可以将这些 Skills 与可组合的脚本结合使用。当你的脚手架有无法仅通过代码覆盖的自然语言需求时，它们特别有用。

**示例：**

- `new-<framework>-workflow` — 用你的注解脚手架一个新的服务/工作流/处理器
- `new-migration` — 你的迁移文件模板加上常见陷阱
- `create-app` — 新的内部应用，预配置好认证、日志和部署配置

## 6. 代码质量与审查 (Code Quality & Review)

在组织内强制执行代码质量并帮助审查代码的 Skills。这些可以包括确定性脚本或工具以实现最大稳健性。你可能希望将这些 Skills 作为 hooks 或 GitHub Action 的一部分自动运行。

**示例：**

- `adversarial-review` — 生成一个"新鲜视角"的子代理进行批评，实施修复，迭代直到发现退化为吹毛求疵
- `code-style` — 强制执行代码风格，尤其是 Claude 默认做不好的风格
- `testing-practices` — 关于如何编写测试以及测试什么的说明

## 7. CI/CD 与部署 (CI/CD & Deployment)

帮助你在代码库中获取、推送和部署代码的 Skills。这些 Skills 可能引用其他 Skills 来收集数据。

**示例：**

- `babysit-pr` — 监控 PR → 重试不稳定的 CI → 解决合并冲突 → 启用自动合并
- `deploy-<service>` — 构建 → 冒烟测试 → 逐步流量推出并比较错误率 → 回归时自动回滚
- `cherry-pick-prod` — 隔离工作树 → cherry-pick → 冲突解决 → 带模板的 PR

## 8. 运行手册 (Runbooks)

接受症状（如 Slack 线程、警报或错误签名），遍历多工具调查，并生成结构化报告的 Skills。

**示例：**

- `<service>-debugging` — 为高流量服务映射症状 → 工具 → 查询模式
- `oncall-runner` — 获取警报 → 检查常见嫌疑对象 → 格式化发现
- `log-correlator` — 给定请求 ID，从每个可能接触过它的系统中拉取匹配的日志

## 9. 基础设施运维 (Infrastructure Operations)

执行例行维护和操作程序的 Skills——其中一些涉及需要防护措施的破坏性操作。这些使工程师更容易在关键操作中遵循最佳实践。

**示例：**

- `<resource>-orphans` — 查找孤立的 pod/卷 → 发布到 Slack → 浸泡期 → 用户确认 → 级联清理
- `dependency-management` — 组织的依赖审批工作流
- `cost-investigation` — "为什么我们的存储/出口账单激增"，包含具体的存储桶和查询模式

---

# 创建 Skills 的技巧

决定要做什么 Skill 后，如何编写它？以下是我们发现的一些最佳实践、技巧和窍门。

我们最近还发布了 **Skill Creator**，让在 Claude Code 中创建 Skills 更容易。

## 不要陈述显而易见的内容

Claude Code 对你的代码库了解很多，Claude 对编码也了解很多，包括许多默认观点。如果你发布的主要是关于知识的 Skill，尽量专注于推动 Claude 跳出常规思维的信息。

前端设计 Skill 就是一个很好的例子——它由 Anthropic 的一位工程师通过与客户迭代改进 Claude 的设计品味而构建，避免了像 Inter 字体和紫色渐变这样的经典模式。

## 建立陷阱 (Gotchas) 部分

任何 Skill 中信号最强的内容是 Gotchas 部分。这些部分应该从 Claude 使用你的 Skill 时遇到的常见失败点建立起来。理想情况下，你会随着时间的推移更新你的 Skill 以捕获这些陷阱。

## 使用文件系统与渐进式披露

如前所述，Skill 是一个文件夹，而不仅仅是一个 Markdown 文件。你应该将整个文件系统视为一种上下文工程和渐进式披露的形式。告诉 Claude 你的 Skill 中有哪些文件，它会在适当的时候读取它们。

最简单的渐进式披露形式是指向其他 Markdown 文件供 Claude 使用。例如，你可以将详细的函数签名和使用示例拆分到 `references/api.md`。

另一个例子：如果你的最终输出是 Markdown 文件，你可能在 `assets/` 中包含一个模板文件供复制使用。

你可以有参考、脚本、示例等文件夹，帮助 Claude 更有效地工作。

## 避免过度限制 Claude

Claude 通常会尽量遵守你的指令，而且因为 Skills 可以如此重复使用，你需要小心不要使指令过于具体。给 Claude 它需要的信息，但给它适应情况的灵活性。

## 仔细考虑设置

有些 Skills 可能需要用户提供的上下文进行设置。例如，如果你正在创建一个将站会报告发布到 Slack 的 Skill，你可能希望 Claude 询问发布到哪个 Slack 频道。

一个好的模式是将这些设置信息存储在 Skill 目录中的 `config.json` 文件中（如上面的示例）。如果配置未设置，Agent 可以向用户询问信息。

如果你想让 Agent 提出结构化的多项选择题，你可以指示 Claude 使用 `AskUserQuestion` 工具。

## 描述字段是给模型看的

当 Claude Code 启动会话时，它会构建每个可用 Skill 及其描述的列表。这个列表是 Claude 扫描以决定"是否有针对此请求的 Skill？"的内容。这意味着描述字段不是摘要——它是**何时触发此 Skill 的描述**。

## 记忆与存储数据

有些 Skills 可以通过在其中存储数据来包含某种形式的记忆。你可以将数据存储在任何地方，从简单的仅追加文本日志文件或 JSON 文件，到复杂的 SQLite 数据库。

例如，`standup-post` Skill 可能会保留一个 `standups.log`，记录它写的每篇报告，这意味着下次运行它时，Claude 会读取自己的历史，并能告诉从昨天开始有什么变化。

存储在 Skill 目录中的数据在升级 Skill 时可能会被删除，所以你应该将其存储在稳定的文件夹中。截至目前，我们提供 `${CLAUDE_PLUGIN_DATA}` 作为每个插件存储数据的稳定文件夹。

## 存储脚本与生成代码

你能给 Claude 的最强大工具之一是代码。给 Claude 脚本和库可以让 Claude 把时间花在组合上，决定下一步做什么，而不是重建样板代码。

例如，在你的数据科学 Skill 中，你可能有一个从事件源获取数据的函数库。为了让 Claude 进行复杂分析，你可以给它一组辅助函数：

```python
def fetch_events(start_date, end_date):
    # 获取事件数据
    pass

def calculate_retention(cohort_id):
    # 计算留存率
    pass
```

然后 Claude 可以即时生成脚本来组合这些功能，对"周二发生了什么？"这样的提示进行更高级的分析。

## 按需 Hooks

Skills 可以包含仅在调用 Skill 时激活并在会话期间持续的 hooks。用于你不想一直运行但有时非常有用的更有主见的 hooks。

**示例：**

- `/careful` — 通过 PreToolUse 匹配器阻止 `rm -rf`、`DROP TABLE`、`force-push`、`kubectl delete`。只有在你确定要操作生产环境时才需要这个——一直开启会让你抓狂

- `/freeze` — 阻止任何不在特定目录中的 Edit/Write。调试时很有用："我想添加日志，但我一直不小心'修复'不相关的代码"

---

# 分发 Skills

Skills 的最大好处之一是你可以与团队的其他人分享它们。

有两种方式可以与他人分享 Skills：

1. **将 Skills 提交到你的仓库**（放在 `./.claude/skills` 下）
2. **创建一个插件**，拥有 Claude Code 插件市场，用户可以上传和安装插件

对于在相对较少的仓库中工作的小型团队，将 Skills 提交到仓库效果很好。但每个提交的 Skill 也会为模型的上下文增加一点内容。随着规模扩大，内部插件市场允许你分发 Skills 并让团队决定安装哪些。

## 管理市场

如何决定哪些 Skills 进入市场？人们如何提交它们？

我们没有集中团队来决定；相反，我们尝试有机地找到最有用的 Skills。如果你有一个想让人们尝试的 Skill，可以将其上传到 GitHub 的沙盒文件夹，并在 Slack 或其他论坛中指向它。

一旦 Skill 获得关注（由 Skill 所有者决定），他们可以提交 PR 将其移入市场。

**警告**：创建糟糕或冗余的 Skills 可能非常容易，所以在发布前确保你有某种策划方法很重要。

## 组合 Skills

你可能希望有相互依赖的 Skills。例如，你可能有一个上传文件的文件上传 Skill，以及一个生成 CSV 并上传的 CSV 生成 Skill。这种依赖管理尚未原生构建到市场或 Skills 中，但你可以按名称引用其他 Skills，如果已安装，模型将调用它们。

## 衡量 Skills

为了了解 Skill 的表现，我们使用 PreToolUse hook 来记录公司内的 Skill 使用情况（示例代码在此）。这意味着我们可以找到流行的 Skills，或与预期相比触发不足的 Skills。

---

# 总结

Skills 是极其强大、灵活的工具，但仍然处于早期阶段，我们都在摸索如何最好地使用它们。

把这更多地看作是一袋我们见过有效的有用技巧，而不是权威指南。理解 Skills 的最好方法是开始实验，看看什么对你有效。我们的大多数 Skills 都是从几行代码和一个陷阱开始的，随着 Claude 遇到新的边界情况，人们不断添加内容而变得更好。

希望这对你有帮助，有任何问题请告诉我。

---

**翻译时间**: 2026-03-18  
**分类**: AI 技术 / Agent Skills  
**标签**: #ClaudeCode #AgentSkills #AI #开发效率
