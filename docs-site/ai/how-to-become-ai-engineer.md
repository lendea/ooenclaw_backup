# 如何在 6 个月内成为 AI 工程师（学习资源）

> **原文**: How to become an AI Engineer in 6 months (RESOURCES)  
> **作者**: Ronin (@DeRonin_)  
> **翻译**: 雷宛毓  
> **发布时间**: 2026-03-16  
> **原文链接**: https://x.com/DeRonin_/status/2033587293064204349  
> **互动数据**: ❤️ 5,094 | 🔁 773 | 👀 2.43M | 🔖 19,190

---

AI 工程已迅速成为科技领域最有价值的技能组合之一

问题在于，大多数初学者不清楚他们到底应该学什么

有些人从机器学习理论开始

有些人无休止地看教程陷入困境

还有些人直接跳进提示词和 agent，却不理解 API、后端基础或真实产品是如何构建的

结果通常都一样：非常困惑，实际技能很少

如果你的目标是成为 AI 工程师，你不需要掌握人工智能的每个领域

你需要学习如何在现实世界中构建有用的 AI 系统

这意味着学习如何：

- 使用 LLM 构建端到端的应用程序
- 使用 OpenAI 和 Anthropic 等模型 API
- 正确设计提示词和上下文
- 使用结构化输出和工具调用
- 在需要时添加检索
- 部署项目让人们真正可以使用

本指南旨在为你提供实用的 6 个月路线图

文章超过 **10,000 词**，阅读可能需要几个小时甚至更长时间

但它的真正价值在于，对于你需要学习的每项技能，都有资源和清晰的解释说明该做什么

这样，在六个月内你可以达到 AI 工程师的水平，并在前 1-2 个月内就开始为自己使用

写这篇文章花了 **40 多个小时**，我和我的朋友 @andy_ai0 一起完成

---

## AI 工程师实际做什么

很多人听到"AI 工程师"这个词，会想象从头开始训练巨型模型的人

实际上，大多数现代 AI 工程师做的事情要实用得多

他们基于现有模型构建产品和系统

这通常包括：

- 连接 LLM API
- 设计提示词和上下文流
- 构建聊天、搜索或自动化系统
- 集成工具、数据库和外部 API
- 处理结构化输出
- 提高可靠性、成本和延迟
- 将 AI 功能部署到真实应用程序中

所以在实践中，AI 工程师通常坐在以下位置之间：

- 软件工程
- 产品工程
- 自动化
- 应用 AI

这就是为什么这个角色增长如此之快

公司不仅需要研究人员，他们需要能够将模型转化为有用产品的人

这也是为什么本路线图较少关注重理论，更多关注实际执行

如果你能构建真实的 LLM 应用、检索系统、自动化和生产就绪的工作流，你已经比大多数初学者更接近可雇佣的水平

---

## 第 1 个月：扎实掌握编码和基础

**本月目标**：成为一名功能齐全的 Python 开发者

你不需要成为专家，你只需要停止谷歌搜索基础语法，能够自信地构建简单程序

AI 工程首先是软件工程

后面几个月的所有内容都假设你能编写干净的 Python、使用终端、调用 API 和管理代码库

### 1. Python

Python 是 AI 工程的语言，没有例外

**学习资源：**

1. **Python for Everybody** (Coursera, 免费旁听)
   - 链接：https://www.coursera.org/specializations/python
   - 最适合绝对初学者的起点

2. **freeCodeCamp Python Course** (YouTube, 免费)
   - 链接：https://www.youtube.com/watch?v=rfscVS0vtbw
   - 4 小时综合视频，涵盖所有基础知识

3. **CS50P: Introduction to Programming with Python** (Harvard, 免费)
   - 链接：https://cs50.harvard.edu/python/
   - 更严格，包含作业和最终项目

**重点学习：**
- 变量、数据类型、循环、条件、函数
- 列表、字典、集合、元组
- 文件 I/O 和使用 JSON
- 类和基础 OOP（足够理解阅读内容）
- 使用 try/except 进行错误处理
- 虚拟环境 (venv) 和 pip
- 包管理 – 理解 requirements.txt

**练习项目**：用 Python 构建一个简单的 CLI 工具。比如个人支出追踪器（读写 JSON 文件），或调用公共 API（如天气 API）并打印格式化结果的脚本

### 2. Git 和 GitHub

Git 是专业开发者保存和分享代码的方式

**学习资源：**

1. **GitHub Skills** (免费，互动)
   - 链接：https://skills.github.com/

2. **Learn Git Branching** (免费，互动)
   - 链接：https://learngitbranching.js.org/
   - 理解分支和合并的最佳可视化工具

3. **Pro Git Book** (免费在线书籍)
   - 链接：https://git-scm.com/book/en/v2

**重点学习：**
- git init, add, commit, push, pull
- 分支和合并
- 理解 .gitignore
- 在 GitHub 上创建仓库并推送本地项目
- 读写基础 README 文件

**练习**：从现在开始，你构建的每个项目（即使是很小的脚本）都应该放在 GitHub 仓库中

### 3. CLI / 终端基础

作为 AI 工程师，你将完全从命令行运行脚本、安装包、管理服务器和导航文件

**学习资源：**

1. **The 50 most popular Linux & Terminal commands** (YouTube)
   - 链接：https://www.youtube.com/watch?v=ZtqBQ68cfJc

2. **The Missing Semester of Your CS Education** (MIT, 免费)
   - 链接：https://missing.csail.mit.edu/

**重点学习：**
- 导航：cd, ls, pwd, mkdir, rm
- 读取文件：cat, less, grep
- 从终端运行 Python 脚本
- 环境变量
- 基础理解 PATH

### 4. JSON, APIs, HTTP, 和 Async 基础

你将从第 2 个月第一天开始调用 LLM API

**学习资源：**

1. **HTTP basics – MDN Web Docs** (免费)
   - 链接：https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview

2. **REST API Tutorial**
   - 链接：https://restfulapi.net/

3. **Python requests library docs**
   - 链接：https://requests.readthedocs.io/en/latest/

4. **Python async/await** (免费)
   - 链接：https://realpython.com/async-io-python/

**重点学习：**
- GET, POST 请求 – 是什么以及如何在 Python 中发出
- 读写 JSON
- HTTP 状态码（200, 400, 401, 404, 500 – 每个的含义）
- API key 是什么以及基础认证模式
- async def 和 await 的作用以及为什么存在

**练习项目**：编写一个 Python 脚本，调用免费的公共 API（如 Open-Meteo 天气数据 – 不需要 API key），并将结果格式化为干净的 JSON 输出

### 5. 基础 SQL 和 Pandas

你不需要成为数据科学家，但你需要定期检查、查询和操作数据

**学习资源：**

1. **SQLBolt** (免费，互动)
   - 链接：https://sqlbolt.com/

2. **Pandas official getting started guide**
   - 链接：https://pandas.pydata.org/docs/getting_started/index.html

3. **Kaggle Pandas course** (免费)
   - 链接：https://www.kaggle.com/learn/pandas

**重点学习：**
- SQL: SELECT, WHERE, GROUP BY, JOIN, ORDER BY
- Pandas: 加载 CSV、过滤行、选择列、基础聚合

### 6. FastAPI

**学习资源：**

1. **FastAPI Official Tutorial** (免费)
   - 链接：https://fastapi.tiangolo.com/tutorial/

2. **Python API Development** (19 小时课程，freeCodeCamp, YouTube)
   - 链接：https://www.youtube.com/watch?v=ZtqBQ68cfJc

**重点学习：** 创建 GET 和 POST 端点、路径和查询参数、使用 Pydantic 的请求体、运行 uvicorn、使用 FastAPI 内置的 /docs 接口测试 API

---

## 第 1 个月里程碑

到这个月结束时，你应该能够：

- ✅ 编写读写文件、调用 API 和处理错误的 Python 程序
- ✅ 使用 Git 版本控制并将项目推送到 GitHub
- ✅ 毫不犹豫地导航终端
- ✅ 理解什么是 HTTP 请求并在 Python 中发出请求
- ✅ 使用基础 SQL 查询 SQLite 数据库
- ✅ 构建并在本地运行简单的 FastAPI 应用

---

## 第 2 个月：掌握 LLM 应用开发

**本月目标**：使用 OpenAI 和 Anthropic API 构建真实的 AI 驱动应用程序

### 1. 提示词基础

提示词不仅仅是礼貌地提问。它是一门编写能够产生一致、可靠输出的指令的艺术

**学习资源：**

1. **Anthropic's Interactive Prompt Engineering Tutorial** (免费，GitHub)
   - 链接：https://github.com/anthropics/prompt-eng-interactive-tutorial

2. **Anthropic Prompt Engineering Docs** (免费)
   - 链接：https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/overview

3. **OpenAI Prompt Engineering Guide** (免费)
   - 链接：https://platform.openai.com/docs/guides/prompt-engineering

4. **PromptingGuide.ai** (免费)
   - 链接：https://www.promptingguide.ai/

**重点学习：** 系统消息和用户消息的区别、为什么具体性很重要、思维链提示（逐步思考）、在提示词中使用示例（few-shot）、小措辞变化如何显著影响输出质量

**练习**：选择一个真实任务（总结文档、从文本中提取关键信息、分类反馈），为它写 5 个不同的提示词。比较输出。

### 2. 结构化输出 / JSON Schema

在实际应用中，你几乎从不想要 LLM 的原始文本，你想要可以解析、存储和使用的结构化数据

**学习资源：**

1. **OpenAI Structured Outputs Guide** (官方文档，免费)
   - 链接：https://platform.openai.com/docs/guides/structured-outputs

2. **Instructor library** (免费，开源)
   - 链接：https://python.useinstructor.com/
   - 使用 Pydantic 模型从任何 LLM 提供商获取结构化输出的最干净方式

3. **OpenAI Cookbook: Structured Outputs Introduction** (免费)
   - 链接：https://developers.openai.com/cookbook/examples/structured_outputs_intro/

**重点学习：** 为数据定义 Pydantic 模型、将 schema 传递给 API、理解结构化输出和 JSON 模式的区别、优雅地处理拒绝

**练习项目**：构建发票或收据解析器。给它原始文本，让它返回带有字段的结构化 Python 对象

### 3. 函数 / 工具调用

工具调用是将 LLM 从文本生成器转变为可以采取行动的东西

**学习资源：**

1. **OpenAI Function Calling Guide** (官方文档，免费)
   - 链接：https://platform.openai.com/docs/guides/function-calling

2. **Anthropic Tool Use Docs** (免费)
   - 链接：https://docs.anthropic.com/en/docs/build-with-claude/tool-use

3. **OpenAI Cookbook: How to Call Functions with Chat Models** (免费，GitHub)
   - 链接：https://github.com/openai/openai-cookbook/blob/main/examples/How_to_call_functions_with_chat_models.ipynb

**重点学习：** 在 JSON Schema 中清晰描述函数、解析工具调用响应、执行函数并将结果反馈、处理不需要工具调用的情况、tool_choice: "auto" 的概念

**练习项目**：构建一个简单的助手，有三个工具：get_weather(city)、calculate(expression)、search_notes(query)

### 4. 流式响应

流式意味着在模型生成时逐字显示输出，而不是等待完整响应

**学习资源：**

1. **OpenAI Streaming Docs** (官方，免费)
   - 链接：https://platform.openai.com/docs/api-reference/streaming

2. **Anthropic Streaming Docs** (官方，免费)
   - 链接：https://docs.anthropic.com/en/api/messages-streaming

3. **How Streaming LLM APIs Work – Simon Willison** (免费)
   - 链接：https://til.simonwillison.net/llms/streaming-llm-apis

**重点学习：** 设置 stream=True、迭代 delta 块、从部分组装完整响应、使用 StreamingResponse 将流式连接到 FastAPI 端点

### 5. 对话状态

LLM 是无状态的 – 它们在调用之间没有记忆。对话历史是你通过每次请求发送完整消息列表来管理的

**学习资源：**

1. **OpenAI Chat Completions Guide, Managing Conversations** (官方，免费)
   - 链接：https://platform.openai.com/docs/guides/conversation-state

2. **Anthropic Messages API Docs** (官方，免费)
   - 链接：https://docs.anthropic.com/en/api/messages

**重点学习：** messages 数组结构、为什么追加用户和助手消息、上下文窗口限制以及超出时会发生什么、基础截断策略

**练习项目**：在终端中构建一个简单的多轮聊天机器人。每轮追加到消息列表。添加 /reset 命令清除历史

### 6. 成本、延迟和 Token 基础

**学习资源：**

1. **OpenAI Pricing Page** (官方)
   - 链接：https://openai.com/api/pricing

2. **Anthropic Pricing Page** (官方)
   - 链接：https://www.anthropic.com/pricing

3. **OpenAI Tokenizer Tool** (免费，互动)
   - 链接：https://platform.openai.com/tokenizer

4. **Tiktoken** (Python library, 免费)
   - 链接：https://github.com/openai/tiktoken

**重点学习：** 什么是 token（大约 4 个字符 / 3/4 个单词）、输入和输出 token 如何不同定价、上下文窗口大小如何影响你能做什么、较小较快模型和较大较智能模型之间的延迟权衡

### 7. 失败处理

LLM API 会失败。速率限制被触发、响应超时、模型返回格式错误的 JSON

**学习资源：**

1. **OpenAI Error Codes Reference** (官方，免费)
   - 链接：https://platform.openai.com/docs/guides/error-codes

2. **Anthropic Error Handling Docs** (官方，免费)
   - 链接：https://docs.anthropic.com/en/api/errors

3. **Tenacity** (Python library, 免费)
   - 链接：https://tenacity.readthedocs.io/

**重点学习：** 速率限制错误 (429) 和指数退避、使用 httpx/requests 处理超时、在使用前验证模型输出、回退策略

### 8. 提示词注入意识

提示词注入是 LLM 应用中的头号安全风险

**学习资源：**

1. **OWASP Top 10 for LLM Apps – LLM01: Prompt Injection** (免费)
   - 链接：https://genai.owasp.org/llmrisk/llm01-prompt-injection/

2. **OWASP Prompt Injection Prevention Cheat Sheet** (免费)
   - 链接：https://cheatsheetseries.owasp.org/cheatsheets/LLM_Prompt_Injection_Prevention_Cheat_Sheet.html

3. **Evidently AI: What is Prompt Injection** (免费)
   - 链接：https://www.evidentlyai.com/llm-guide/prompt-injection-llm

**重点学习：** 直接注入和间接注入的区别、为什么系统提示不是真正"安全"的、工具访问的最小权限原则

---

## 第 2 个月里程碑

到这个月结束时，你应该能够：

- ✅ 编写产生一致、可靠输出的提示词
- ✅ 使用 Pydantic + Instructor 从任何模型获取结构化 JSON 数据
- ✅ 连接工具调用，让模型可以调用你的 Python 函数
- ✅ 通过 FastAPI 端点实时流式传输响应
- ✅ 正确管理多轮对话历史
- ✅ 在发送前估计请求的 token 成本
- ✅ 处理 API 错误、超时和坏输出而不崩溃
- ✅ 解释什么是提示词注入并应用基础防御

---

## 第 3 个月：正确学习 RAG

**本月目标**：构建让 LLM 能够从你的文档（而不仅仅是训练数据）回答问题的系统

### 1. Embeddings

文本嵌入是文本投影到高维向量空间中

**学习资源：**

1. **Stack Overflow Blog: An Intuitive Introduction to Text Embeddings** (免费)
   - 链接：https://stackoverflow.blog/2023/11/09/an-intuitive-introduction-to-text-embeddings/

2. **Google ML Crash Course: Embeddings** (免费)
   - 链接：https://developers.google.com/machine-learning/crash-course/embeddings

3. **HuggingFace: Getting Started With Embeddings** (免费)
   - 链接：https://huggingface.co/blog/getting-started-with-embeddings

4. **OpenAI Embeddings Guide** (官方文档，免费)
   - 链接：https://platform.openai.com/docs/guides/embeddings

**重点学习：** 向量在概念上是什么、为什么相似文本产生相似向量、余弦相似度如何工作、嵌入模型之间的区别

**练习**：取 20 个相关主题的句子，使用 OpenAI 或 sentence-transformers 嵌入它们，编写一个简单的最近邻搜索

### 2. Chunking

你的文档太大，无法整体嵌入

**学习资源：**

1. **Weaviate: Chunking Strategies for RAG** (免费)
   - 链接：https://weaviate.io/blog/chunking-strategies-for-rag

2. **Unstructured: Chunking for RAG Best Practices** (免费)
   - 链接：https://unstructured.io/blog/chunking-for-rag-best-practices

3. **LangChain Text Splitters Docs** (官方，免费)
   - 链接：https://python.langchain.com/docs/concepts/text_splitters/

**重点学习：** 带重叠的固定大小分块作为基线、结构化文档的递归分块、更好边界检测的语义分块

**初学者提示**：从 LangChain 的 RecursiveCharacterTextSplitter 开始，chunk_size=500，chunk_overlap=50

### 3. 向量数据库

**学习资源：**

1. **Chroma Official Docs** (免费)
   - 链接：https://docs.trychroma.com/

2. **Pinecone Learning Center** (免费)
   - 链接：https://www.pinecone.io/learn/

3. **Qdrant Documentation** (免费)
   - 链接：https://qdrant.tech/documentation/

4. **pgvector** (开源，免费)
   - 链接：https://github.com/pgvector/pgvector

**重点学习：** 创建集合、插入带元数据的嵌入、按相似度查询 top_k、按元数据过滤

**练习项目**：将 50-100 页公共文档索引到 Chroma

### 4. 元数据过滤

**学习资源：**

1. **Pinecone: Metadata Filtering Guide** (免费)
   - 链接：https://docs.pinecone.io/guides/data/filter-with-metadata

2. **LlamaIndex: Metadata Filters Guide** (官方文档，免费)
   - 链接：https://docs.llamaindex.ai/en/stable/module_guides/querying/node_postprocessors/node_postprocessors/

**重点学习：** 在摄入时为每个块标记相关元数据、在查询时使用这些字段过滤结果

### 5. 重排序

**学习资源：**

1. **Cohere Reranking Docs** (官方，免费)
   - 链接：https://docs.cohere.com/docs/reranking-with-cohere

2. **LangChain: Cohere Reranker Integration** (官方文档，免费)
   - 链接：https://python.langchain.com/docs/integrations/retrievers/cohere-reranker/

**重点学习：** 两阶段检索 - 然后 - 重排序模式、双编码器（用于第一阶段嵌入搜索）和交叉编码器（用于重排序）之间的区别

### 6. 检索质量问题

**学习资源：**

1. **LangChain: Query Transformations** (免费)
   - 链接：https://python.langchain.com/docs/how_to/#query-analysis

2. **Pinecone: Improving Retrieval Quality** (免费)
   - 链接：https://www.pinecone.io/learn/retrieval-augmented-generation/#retrieval-quality

### 7. 减少幻觉

**学习资源：**

1. **Zep: Reducing LLM Hallucinations – A Developer's Guide** (免费)
   - 链接：https://www.getzep.com/ai-agents/reducing-llm-hallucinations/

2. **Voiceflow: 5 Ways to Reduce LLM Hallucinations** (免费)
   - 链接：https://www.voiceflow.com/blog/prevent-llm-hallucinations

**重点学习：** 提示模型仅从提供的上下文回答（当答案不存在时说"我不知道"）、在提供响应前添加置信度阈值

### 8. 引用和基础

**学习资源：**

1. **Anthropic: Giving Claude Sources** (文档，免费)
   - 链接：https://docs.anthropic.com/en/docs/build-with-claude/citations

2. **LangChain: RAG with Sources** (免费)
   - 链接：https://python.langchain.com/docs/how_to/qa_sources/

**重点学习：** 将块元数据传递到提示上下文、指示模型在答案中引用来源

### 9. 你的 RAG 框架：LangChain 或 LlamaIndex

**学习资源：**

1. **LlamaIndex: Introduction to RAG** (官方文档，免费)
   - 链接：https://developers.llamaindex.ai/python/framework/understanding/rag/

2. **LlamaIndex Starter Tutorial** (官方文档，免费)
   - 链接：https://developers.llamaindex.ai/python/framework/getting_started/starter_example/

3. **LangChain: Build a RAG Agent** (官方文档，免费)
   - 链接：https://docs.langchain.com/oss/python/langchain/rag

**练习项目**：构建"与你的文档聊天"应用

---

## 第 3 个月里程碑

到这个月结束时，你应该能够：

- ✅ 解释什么是嵌入以及为什么相似文本产生相似向量
- ✅ 使用适当的策略智能地分块任何文档
- ✅ 在向量数据库中存储和查询带元数据过滤的嵌入
- ✅ 添加重排序步骤以提高检索质量
- ✅ 系统地调试常见检索故障
- ✅ 使用 LlamaIndex 或 LangChain 构建完整的端到端 RAG 管道

---

## 第 4 个月：Agent、工具、工作流和评估

**本月目标**：构建可以自主采取一系列行动的 AI 系统

### 1. Agent 循环

Agent 不是魔法，它是一个惊人的简单模式

**学习资源：**

1. **Anthropic: Building Effective Agents** (官方，免费)
   - 链接：https://www.anthropic.com/research/building-effective-agents

2. **OpenAI: A Practical Guide to Building Agents** (官方 PDF, 免费)
   - 链接：https://cdn.openai.com/business-guides-and-resources/a-practical-guide-to-building-agents.pdf

3. **freeCodeCamp: The Open Source LLM Agent Handbook** (免费)
   - 链接：https://www.freecodecamp.org/news/the-open-source-llm-agent-handbook/

4. **LangChain Academy: Introduction to LangGraph** (免费课程)
   - 链接：https://academy.langchain.com/courses/intro-to-langgraph

**重点学习：** perceive → plan → act → observe 循环、agent 循环如何终止、工具调用失败时会发生什么

**练习**：不使用任何框架从头开始构建 agent

### 2. 工具选择

**学习资源：**

1. **OpenAI: Function Calling Best Practices** (官方文档，免费)
   - 链接：https://platform.openai.com/docs/guides/function-calling/best-practices

2. **Anthropic: Tool Use Best Practices** (官方文档，免费)
   - 链接：https://docs.anthropic.com/en/docs/build-with-claude/tool-use/implement-tool-use#best-practices-for-tool-definitions

**重点学习：** 编写不言自明的动词工具名称、编写解释何时调用工具的说明

### 3. 状态管理

**学习资源：**

1. **LangGraph Official Docs: State Management** (免费)
   - 链接：https://langchain-ai.github.io/langgraph/concepts/low_level/#state

2. **DataCamp: LangGraph Agents Tutorial** (免费)
   - 链接：https://www.datacamp.com/tutorial/langgraph-agents

3. **Real Python: LangGraph in Python** (免费)
   - 链接：https://realpython.com/langgraph-python/

**重点学习：** 使用 TypedDict 定义状态 schema、reducer 如何工作、内存状态和持久化检查点之间的区别

### 4. Agent 中的重试和失败处理

**学习资源：**

1. **LangGraph: Error Handling and Retries** (官方文档，免费)
   - 链接：https://langchain-ai.github.io/langgraph/how-tos/autofill-tool-errors/

2. **OpenAI Practical Agents Guide: Guardrails section** (免费)
   - 链接：https://cdn.openai.com/business-guides-and-resources/a-practical-guide-to-building-agents.pdf

**重点学习：** 防止无限循环的最大迭代限制、带指数退避的每工具重试

### 5. 何时不使用 Agent

**学习资源：**

1. **Anthropic: Building effective agents, when to use agents** (官方，免费)
   - 链接：https://www.anthropic.com/research/building-effective-agents

2. **Simon Willison: Designing Agentic Loops** (免费)
   - 链接：https://simonwillison.net/2025/Sep/30/designing-agentic-loops/

**需要记住：** 3 个固定 LLM 调用的链条总是比可能进行 3 次调用的 agent 更快、更便宜、更可调试

### 6. 多步工作流

**学习资源：**

1. **Anthropic: Workflow Patterns** (官方，免费)
   - 链接：https://www.anthropic.com/research/building-effective-agents#workflow-patterns

2. **LangGraph: Multi-Agent Networks** (官方文档，免费)
   - 链接：https://langchain-ai.github.io/langgraph/concepts/multi_agent/

**练习项目**：构建一个 3 步内容管道

### 7. 评估框架

**学习资源：**

1. **DeepEval** (开源，免费)
   - 链接：https://deepeval.com/docs/getting-started

2. **Promptfoo** (开源，免费)
   - 链接：https://github.com/promptfoo/promptfoo

3. **LangSmith** (免费层)
   - 链接：https://smith.langchain.com/

4. **Ragas** (开源，免费)
   - 链接：https://docs.ragas.io/

**重点学习：** 构建 20-50 个代表性输入的黄金测试集、编写确定性评分的评估函数

### 8. 任务成功指标

**学习资源：**

1. **Hamel Husain: Your AI Product Needs Evals** (免费)
   - 链接：https://hamel.dev/blog/posts/evals/

2. **OpenAI Evals Framework** (开源，免费)
   - 链接：https://github.com/openai/evals

**重点学习：** 过程指标和结果指标之间的区别、在构建任何东西之前定义清晰的成功标准

---

## 第 4 个月里程碑

到这个月结束时，你应该能够：

- ✅ 解释什么是 agent 循环并在没有框架的情况下实现一个
- ✅ 编写正确可靠选择的工具描述
- ✅ 使用 LangGraph 或等效工具正确管理 agent 状态
- ✅ 在 agent 循环中处理失败而不崩溃
- ✅ 自信地决定任务是否需要 agent、工作流或单个提示
- ✅ 构建链接、路由和并行化 LLM 调用的多步工作流
- ✅ 编写在更改提示或模型时捕获回归的自动化评估
- ✅ 为你构建的任何 AI 系统定义和衡量任务成功指标

---

## 第 5 个月：部署、产品思维和可靠性

**本月目标**：让你构建的一切都达到生产就绪状态

### 1. FastAPI 生产模式

**学习资源：**

1. **FastAPI Deployment Docs** (官方，免费)
   - 链接：https://fastapi.tiangolo.com/deployment/

2. **FastAPI Production Deployment Guide** (CYS Docs, 免费)
   - 链接：https://craftyourstartup.com/cys-docs/fastapi-production-deployment/

3. **FastAPI Best Practices for Production** (FastLaunchAPI, 免费)
   - 链接：https://fastlaunchapi.dev/blog/fastapi-best-practices-production-2026

**重点学习：** 使用 Uvicorn worker 运行 Gunicorn、设置健康检查端点、添加 CORS 中间件

### 2. Docker

**学习资源：**

1. **Docker Official Getting Started Guide** (免费)
   - 链接：https://docs.docker.com/get-started/

2. **freeCodeCamp: How to Build and Deploy a Multi-Agent AI System with Python and Docker** (免费)
   - 链接：https://www.freecodecamp.org/news/build-and-deploy-multi-agent-ai-with-python-and-docker/

3. **DataCamp: Deploy LLM Applications Using Docker** (免费)
   - 链接：https://www.datacamp.com/tutorial/deploy-llm-applications-using-docker

**重点学习：** 为 Python/FastAPI 应用编写 Dockerfile、使用多阶段构建保持镜像小

**练习项目**：容器化你的 RAG 应用

### 3. 后台作业和队列

**学习资源：**

1. **Celery Official Getting Started Guide** (免费)
   - 链接：https://docs.celeryq.dev/en/stable/getting-started/introduction.html

2. **FastAPI Background Tasks Docs** (官方，免费)
   - 链接：https://fastapi.tiangolo.com/tutorial/background-tasks/

**重点学习：** 何时使用 FastAPI 的内置 BackgroundTasks 与真正的任务队列如 Celery

### 4. 认证和 API Key 安全

**学习资源：**

1. **FastAPI Security Docs** (官方，免费)
   - 链接：https://fastapi.tiangolo.com/tutorial/security/

2. **OWASP API Security Top 10** (免费)
   - 链接：https://owasp.org/API-Security/

3. **Auth0: API Auth Best Practices** (免费)
   - 链接：https://auth0.com/docs/get-started/authentication-and-authorization

**重点学习：** 用户认证的 JWT token、服务间通信的 API key 管理

### 5. 日志和可观测性

**学习资源：**

1. **Langfuse** (开源，免费层)
   - 链接：https://langfuse.com/docs/observability/overview

2. **LangSmith** (免费层)
   - 链接：https://smith.langchain.com/

3. **Python Structlog** (免费)
   - 链接：https://www.structlog.org/

**重点学习：** 追踪每个 LLM 调用、带 JSON 输出的结构化日志

### 6. 提示词和版本管理

**学习资源：**

1. **Langfuse Prompt Management** (免费)
   - 链接：https://langfuse.com/docs/prompts

2. **Anthropic Prompt Management Best Practices** (免费)
   - 链接：https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/overview

**重点学习：** 将提示词存储在应用代码之外、版本化每个提示词更改

### 7. 成本监控和速率限制

**学习资源：**

1. **OpenAI Usage Dashboard** (官方)
   - 链接：https://platform.openai.com/usage

2. **Anthropic Usage Dashboard** (官方)
   - 链接：https://console.anthropic.com/

3. **Helicone** (免费层)
   - 链接：https://www.helicone.ai/

4. **LiteLLM** (开源，免费)
   - 链接：https://github.com/BerriAI/litellm

**重点学习：** 设置每天/每月的硬性支出限制、在 API 中实现每用户速率限制

### 8. 缓存

**学习资源：**

1. **Redis Official Docs** (免费)
   - 链接：https://redis.io/docs/

2. **GPTCache** (开源，免费)
   - 链接：https://github.com/zilliztech/GPTCache

**重点学习：** 相同提示词的精确匹配缓存、相似查询的语义缓存

---

## 第 5 个月里程碑

到这个月结束时，你应该能够：

- ✅ 在 Docker 中部署带适当生产配置的 FastAPI + LLM 应用
- ✅ 使用后台作业和队列处理长时间运行的任务
- ✅ 使用认证、速率限制和 API key 管理保护 API
- ✅ 使用 Langfuse 或 LangSmith 追踪和调试 LLM 调用
- ✅ 使用版本控制和回滚能力管理提示词
- ✅ 实时监控成本并设置支出限制
- ✅ 缓存 LLM 响应以减少延迟和成本

---

## 第 6 个月：专业化并变得可雇佣

### 方向 1：AI 产品工程师

**最适合**：想要快速获得初创公司工作

**重点：** LLM 应用、RAG、agent、部署、产品 UX

**学习资源：**

1. **Vercel AI SDK** (免费)
   - 链接：https://sdk.vercel.ai/docs

2. **Streamlit** (免费)
   - 链接：https://docs.streamlit.io/

3. **Gradio** (免费)
   - 链接：https://www.gradio.app/docs

4. **Google: People + AI Guidebook** (免费)
   - 链接：https://pair.withgoogle.com/guidebook/

5. **Nielsen Norman Group: AI UX Guidelines** (免费)
   - 链接：https://www.nngroup.com/topic/artificial-intelligence/

**重点学习：** 本月构建 2-3 个完整项目、如何构建流式 UI、处理加载状态

---

### 方向 2：应用 ML / LLM 工程师

**最适合**：想要更深层次的技术角色

**重点：** 微调、何时微调 vs 提示词工程、评估、推理优化、开源模型、训练管道

**学习资源：**

1. **Google ML Crash Course: Fine-tuning, Distillation, and Prompt Engineering** (免费)
   - 链接：https://developers.google.com/machine-learning/crash-course/llm/tuning

2. **Codecademy: Prompt Engineering vs Fine-Tuning** (免费)
   - 链接：https://www.codecademy.com/article/prompt-engineering-vs-fine-tuning

3. **OpenAI Fine-tuning Guide** (官方，免费)
   - 链接：https://platform.openai.com/docs/guides/fine-tuning

4. **HuggingFace Transformers Fine-tuning Tutorial** (免费)
   - 链接：https://huggingface.co/docs/transformers/training

5. **Unsloth** (开源，免费)
   - 链接：https://github.com/unslothai/unsloth

6. **LLaMA-Factory** (开源，免费)
   - 链接：https://github.com/hiyouga/LLaMA-Factory

7. **Ollama** (免费)
   - 链接：https://ollama.ai/

8. **HuggingFace Model Hub** (免费)
   - 链接：https://huggingface.co/models

9. **vLLM** (开源，免费)
   - 链接：https://github.com/vllm-project/vllm

**决策框架：**
1. 从提示词工程开始（最便宜、最快）
2. 如果模型需要访问特定数据，添加 RAG
3. 仅当提示词 + RAG 无法达到所需质量时才微调

---

### 方向 3：AI 自动化工程师

**最适合**：想要立即为企业构建

**重点：** 工作流编排、业务流程自动化、多工具系统、CRM/文档/邮件/支持/运营用例

**学习资源：**

1. **n8n** (开源，免费自托管)
   - 链接：https://docs.n8n.io/

2. **LangGraph: Multi-Agent Workflows** (免费)
   - 链接：https://langchain-ai.github.io/langgraph/concepts/multi_agent/

3. **Temporal** (开源，免费)
   - 链接：https://docs.temporal.io/

4. **Zapier AI Actions** (免费层)
   - 链接：https://zapier.com/ai

5. **Make (Integromat)** (免费层)
   - 链接：https://www.make.com/

**练习项目**：构建端到端潜在客户资格系统

---

## 结论

### 薪资数据（2026 年）

**美国全职：**
- 初级 AI 工程师：$90,000-$130,000
- 中级 (3-5 年)：$155,000-$200,000
- 高级：$195,000-$350,000+
- 平均：$184,757 (Glassdoor, 2026 年 3 月)

**自由职业：**
- AI agent 开发：$175-$300/小时
- RAG 实施：$150-$250/小时
- LLM 集成：$125-$200/小时

**咨询：**
- 为企业设置 AI agent：$300-$5,000
- AI 内容管理：$500-$2,000/月
- 自动化客户支持：$1,000-$4,000
- 冷启动外展设置：$500-$2,000

### 关键建议

1. **从每个月选择一个项目并构建它**。不是阅读，不是看教程。构建它、破坏它、修复它、部署它、放到 GitHub 上

2. **开始分享你学到的东西**。在 X、LinkedIn 或其他地方写出来。教学是学习的最快方式

3. **不要等到你感觉准备好了**。你永远不会感觉准备好。市场不奖励完美，它奖励能够交付的人

**6 个月足以改变一切，只要你真正投入工作**

---

**翻译时间**: 2026-03-18  
**分类**: AI 技术 / 学习路线  
**标签**: #AI 工程师 #学习路线 #LLM #RAG #Agent
