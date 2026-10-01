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

**社区（值得学）：**

- 先让 AI 出=>[ ] 清单式审稿意见（结构/论证/例子/节奏），再逐条改，比“直接润色”质量高。
- 定稿前做一次“观点剥离测试”：遮住署名还能认出是自己写的，才算保住 voice。

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

Last reviewed: 2026-10-01
