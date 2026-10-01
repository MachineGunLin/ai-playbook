# Research

## 10 秒速查

1. 先定义问题（一句话 + 验收标准），再开查。
2. 官方文档/一手来源优先，社区内容只当线索。
3. 每个结论 ≥2 独立来源；单来源的标“未 corroborated”。
4. 引用先验存在性再验支撑度（链接能打开 ≠ 内容支持结论）。
5. 先出 deliverable 形状，缺什么再补查，不要无限检索。

## 默认工作流

```
research question（可验收）→ 来源分层检索（官方→论文→权威媒体→社区线索）
→ 并行多路查证 → 矛盾点单独对峙 → 合成（每句挂来源）
→ 引用审计（抽查 10% 链接+支撑度）→ 行动结论
```

## 快速 vs 深度（先选档，再开查）

|  | 快速研究 | 深度研究 |
|---|---|---|
| 适用 | 快速了解、找方向、做初步判断 | 投资/技术选型/重要决策、长文素材 |
| 时间 | 15～30 分钟，当场出结论 | 数小时～异步跑（含 2～30 分钟 agent 执行） |
| 来源 | 3～8 个，官方 + 2 篇实战即可 | 数十～上百，覆盖官方/论文/权威媒体/社区线索 |
| 验证 | 关键结论 2 来源互证即可 | 每句挂来源 + 10% 抽查 + 支撑度审计 |
| Agent | 单会话问答，加 1 个 Web 工具 | 多 agent 并行 + 独立合成者 + 引用审计 |
| 输出 | 半页结论 + 行动建议 | 结构化报告 + 来源清单 + 矛盾点单列 |
| 产品 | 普通搜索/对话 + 联网即可 | 各家 Deep Research / `/deep-research` |

快速流程（15～30 分钟）：

```
一句话问题 → 宽 query 摸全貌（3～5 个）→ 挑 3 个最好来源深读
→ 写半页结论（观点 + 证据 + 不确定）→ 不够再升级深度
```

深度流程：走顶部“默认工作流”全套（分层检索 → 并行查证 → 矛盾对峙 → 合成挂源 → 引用审计 → 行动结论）。

升级信号（出现一条就升级）：金额/风险大、各方说法矛盾、一手来源互相打架、结论要进长文或决策文档。

不值得开重型的：单事实查询（何时发布/某数多少）、总结手头已有单文档、头脑风暴找灵感——用对话 + 搜索更快更准（PromptForge 实践）。

## 常见场景

- 查工具/模型能力：官方文档 → release notes → GitHub；不确定写 Unknown，不猜。
- 时效性话题：限定近 3 个月来源；“曾经火过”≠“现在还热”。
- 观点对立：双方各找最强一手论据，单独列矛盾点，不要和稀泥。
- 转成判断：资料→“所以我应该做什么”必须显式写出来，资料本身不是结论。

## 最佳实践

**研究证据（硬数据）：**

- 引用 URL 3～13% 是编造的、5～18% 打不开；deep research agent 引得多但编造率更高（arXiv 2604.03173，10 模型 × 53k URL 实测）。对策：生成后跑 URL 存活检查（HEAD 请求 + Wayback 分类），可把坏链压到 1% 以下。
- 多 agent 传递会丢引用（“电话游戏”效应）：合成者应直接读原始片段而非上游摘要； orchestrator prompt 加“不用无引用信息”（arXiv 2608.24306）。
- 引用数是虚荣指标：500 个引用但 36% 未验证，不如 50 个全验过（innogath 方法论）。

**官方/高质量社区方法（可照做）：**

- 来源四档：官方文档/论文 > 官方工程博客/权威媒体 > 行业博客/教程（需佐证）> 社交媒体（只当线索）；终稿结论必须有 Tier1/2 支撑，否则标 unverified（社区 deep-research skill 实践）。
- 查之前先给 agent 来源偏好层级写进 prompt；检索后逐条过“作者可信？日期相关？一手还是二手？能否独立验证？”四问，不过两条即弃（同上）。
- 先宽后窄：短而宽的 query 先摸全貌，再收窄验证加深；检索到 plan 级别就迭代修正，不要一次发完所有 query（Perplexity/Anthropic 内部实践，转述自 hashbulla 报告）。
- 保留三层审计面：来源清单（何时从哪取）→ 合成映射（每句出自哪段）→ 交付物引用（编辑后不断链）。只留交付物层的报告看着光鲜、经不起查（innogath）。
- 先出 deliverable 形状：草稿先行，缺口驱动检索，而不是先堆资料（draft-first 纪律）。
- 开工前先选档： plausibly 超过 ~5 次工具调用、或人类做要 1 小时以上，才值得开深度研究；否则快速档（PromptForge 实践，非厂商口径）。
- 工作量按复杂度配：简单事实 1 agent + 3～10 次调用；直接对比 2～4 subagent 各 10～15 次；复杂调研 10+ subagent 且职责切分（Anthropic Research 系统官方）。
- 结论前设 decision gate：写出“什么证据出现就推进/转向”，防检索漂移（ChatGPT DR 实战流程）。

## 常见错误

- 数引用个数当质量：来源越多越可信是错觉。
- 链接能打开就当验证过：支撑度（claim-citation match）才是验证。
- 改稿改断引用链：编辑后引用和段落脱钩，看着有引用、实际 audit 全断。
- 用推理模型做时事检索、用检索模型做数学证明：模式错配，失败可预期。
- 查个没完不产出：检索是手段，deliverable 才是目的。

## AI / 模型选择

一键深度调研：ChatGPT / Gemini / Claude 产品侧 DR；Grok `/deep-research`（内置并行查证）。
自搭流程：Grok（Web+X）+ Claude/Gemini 合成；可疑引用人工抽查。
时效强、要 X 信号：Grok。详见 [ai-agents.md](../01-tools/ai-agents.md)。

## Prompt

[`05-prompts/prompt-library.md`](../05-prompts/prompt-library.md) → Web Research、先提问（定 research question 用）。

## Sources

- [引用 URL 有效性实测（arXiv 2604.03173）](https://arxiv.org/html/2604.03173v1)
- [多 Agent 引用丢失定位（arXiv 2608.24306）](https://arxiv.org/pdf/2608.24306v1)
- [Deep Research 方法论：taxonomy 与三层审计面（innogath）](https://innogath.com/learn/deep-research/)
- [hashbulla deep-research 报告（GitHub，来源分层+检索管线）](https://github.com/hashbulla/deep-research/blob/main/deep-research-report.md)
- [Nature：幻觉引用污染文献（2026-04，链接待验证）](https://www.nature.com/articles/d41586-026-00969-z)
- [PromptForge：Deep Research 最佳实践 2026（何时不该用 + 选档启发式）](https://github.com/mbagalman/PromptForge/blob/main/guides/deep-research-best-practices-2026.md)
- [Glukhov：Search vs Deep Search vs Deep Research（分档逻辑）](https://www.glukhov.org/rag/architecture/search-vs-deepsearch-vs-deep-research)
- [Anthropic：多 agent 研究系统是怎么建的（工作量配比官方）](https://www.anthropic.com/engineering/built-multi-agent-research-system)
- [Chernychko：ChatGPT Deep Research 可复用工作流（capture→决策门）](https://medium.com/@Chernukos/ai-use-case-8-using-chatgpt-as-a-research-and-discovery-co-pilot-3ccafdee3e13)

Last reviewed: 2026-10-01
