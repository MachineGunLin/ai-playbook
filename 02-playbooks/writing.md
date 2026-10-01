# Writing

## 10 秒速查

1. 观点和结构是人的活，AI 只做执行层。
2. 让 AI 当 editor（审、改、收紧），不当 ghostwriter（代笔）。
3. 先有大纲再动笔；长文分层写，不要一次拖出全文。
4. 每一版改动都要可审（diff/批注），不接受黑箱全文重写。
5. 事实核查独立于写作流程，最后单独过一遍。

## 默认工作流

```
选题/论点（人）→ research（见 research.md）→ outline（AI 展开、人拍板）
→ draft（分节写）→ edit（收紧、去 AI 味）→ fact check → 定稿
```

## 角色分工（8阶段：谁动手、谁拍板）

| 阶段 | AI 扮演 | 人拍板 | 能否放手 |
|---|---|---|---|
| 选题/角度 | 发散选项 + 唱反调 | 选题、立场、目标读者 | 不放手（voice 来源） |
| 调研 | 并行搜 + 整理成清单 | 来源偏好、验收标准 | 半放手（见 research.md） |
| 大纲 | 出 2～3 版结构备选 | 拍板一版再动笔 | 不放手 |
| 初稿 | 按种子句分节扩写 | 每节种子句 + 逐节审 | 半放手 |
| 改稿 | 当 editor：清单式意见 + reviewable diff | 逐条接受/拒绝 | 半放手 |
| 事实核查 | 逐条溯源 + 标不确定 | 终稿前独立复核 | 不放手（单独一遍） |
| 标题 | 出 10 个选项 | 挑 + 亲手改 | 生成可放手，拍板不放 |
| 发布 | 按平台改写 + 排版检查 | 终读一遍 | 执行可放手 |

## 标准 workflow（照着走）

```
0. voice capture（5～15 分钟口述，不打字）→ 转文字轻清洗
1. brief（人写：读者 + 论点 + 范文 3 段 + 禁用词）
2. outline（AI 出 2 版 → 人拍 1 版）
3. seed draft（人写每节种子句 → AI 分节扩写，一节一审）
4. edit（三遍分开：voice 遍 → 结构遍 → 文字遍，不混着改）
5. fact check（独立一遍，数字逐条溯源）
6. 定稿发布（标题 10 选 1；多平台改写后终读）
```

- 短文（<1500 字）：可全文一遍出，但仍要种子句 + 两遍 edit（voice + 事实）。
- 长文：必须分节 + 维护术语表 + 上层改动传导到子节。
- 社媒：先出口语稿/长文再压缩改写；不直接生成短版（细节先丢）。

## 常见场景

- 卡开头：给 AI 三个论点+目标读者，让它各出一版开头，人挑一个接着写。
- 初稿：按小节分别生成，每节审完再下一节；全文一次生成只适合短内容。
- 改稿：选中段落提具体要求（收紧 20%、换语气、加例子），逐段接受/拒绝。
- 长文一致性：维护一份“事实/人名/术语表”，每写完一节让 AI 对照检查。
- 去 AI 味：禁用模板词（首先/其次/综上所述等）、短段落、关键句独立成段、配具体例子。

## 最佳实践

**产品/研究（有实证或成体系）：**

- editor 隐喻：一切产出以 pending draft / reviewable diff 回来，人逐条接受才落地；要的是“读完全文告诉我哪里 sag、收紧”，不是代笔（Pinery Prose 官方工作流）。
- 结构先行：大纲、论点、受众定位先定，AI 只给选项不给终稿；成稿后用 AI 查冗余断层，但不动 voice（Manuscripts 方法论）。
- 分层写作：大纲树和正文分开维护，改上层论点后让 AI 把变化传导到子节，保持一致（TreeWriter，arXiv 2601.12740，受试者作者控制感显著更高）。
- 人在环路：专家定大纲→AI 按节生成→人逐句改→引用逐条溯源，长书/论文都走这套（CoAuthorAI，Springer 已出版实例）。
- AI 味的本质是“流畅但无观点”：保留自己的判断句、反常识钩子、具体经历，删掉 AI 的升华结尾和排比。

**社区/实战（值得学）：**

- 先让 AI 出=>[ ] 清单式审稿意见（结构/论证/例子/节奏），再逐条改，比“直接润色”质量高。
- 定稿前做一次“观点剥离测试”：遮住署名还能认出是自己写的，才算保住 voice。
- voice-first 输入：动笔前先口述 10～15 分钟粗糙想法转文字，让模型在你的推理上组织而不是替你发明观点；去 LLM 腔是独立的一遍（MindStudio 实战、Ryan Shrott）。
- 严格 brief 才有可用初稿：范文 3 段 + 禁用词表 + 每篇必含四元素（亲历/具名例子/反常识/具体数字），缺一个亲手补（theStacc 混合写作环、Fyker 内容运营）。
- 三权分立审稿：voice 遍、事实遍、编辑合成拆成独立 pass，写手不见原始反馈只收合成意见；配持续增长的 banned-phrase 表（Fyker/Peter Wong）。

## 常见错误

- 空手套全文：“写一篇 XX”一次生成，结构散、观点水、AI 味浓。
- 先写后想：没大纲直接扩写，写到一半逻辑崩。
- 黑箱接受全文重写：改了什么不知道，voice 被抹平。
- 事实和文笔混在一起改：先定事实，再修文字；两件事分开过。

## AI / 模型选择

长文/中文写作：Claude（App 或 Code），备选 GPT-6 Sol。
联网查资料边写：Grok、Gemini。详见 `01-tools/ai-agents.md`。

## Prompt

[`05-prompts/prompt-library.md`](../05-prompts/prompt-library.md) → 先提问、Web Research、最终验收（事实核查用）。

## Sources

- [Pinery：editor, not ghostwriter（产品方法论）](https://pinery.app/help/prose/write-a-book-with-ai)
- [TreeWriter（arXiv 2601.12740，层级写作+实证）](https://arxiv.org/html/2601.12740)
- [CoAuthorAI（arXiv 2604.19772，人在环路长文写作）](https://arxiv.org/abs/2604.19772)
- [theStacc：Human + AI 混合写作环（实战流程）](https://thestacc.com/blog/human-ai-writing-hybrid)
- [Lorka：Human-in-the-loop 5 步（实战流程）](https://www.lorka.ai/knowledge-hub/how-to-use-ai-for-better-writing)
- [MindStudio：voice-first 防 AI 味（实战流程）](https://www.mindstudio.ai/blog/writing-with-ai-without-losing-voice)
- [Fyker：AI 内容运营——自动化与人工的分工（实战）](https://www.fyxer.com/blog/ai-content-operations)

Last reviewed: 2026-10-01
