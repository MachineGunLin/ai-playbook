# Learning

## 10 秒速查

1. 永远让 AI 提问，自己输出；直接要答案等于没学。
2. 讲出来才算懂：复述 → 被追问 → 补漏 → 变式题验收。
3. 一次只啃一个概念，学完立刻自测，不要连续输入。
4. 感觉懂了≠懂了：用“能否讲给新手+做对变式题”双标准验收。
5. 学完落盘：概念卡 + 错题 + 联系旧知识，进长期结构。

## 默认工作流

```
定目标（学完能做什么题/讲清什么）→ 输入材料（教材/论文/视频稿贴给 AI）
→ AI 提问，自己答 → Feynman 自测（讲一遍）→ 变式题验收 → 落盘成卡片
```

## 常见场景

- 啃教材/论文：分节喂，每节让 AI 出 3 个问题，答完再下一节。
- 备考/面试：AI 出题→计时做→逐题复盘→错题重出变式。
- 补基础：先让 AI 画概念地图（前置知识→当前→延伸），按图索骥。
- 看视频：把 transcript 贴给 AI，当文本材料用，别只看不练。

## 最佳实践

**研究证据（RCT/对照实验，不是观点）：**

- 精心设计的 AI 家教（主动提问+认知负荷管理+成长型话术+分步脚手架+自带标准解）让学生学得更多、用时更少，显著超过同等内容的主动学习课堂（Harvard 物理课 RCT，N=194，2025）。关键：裸聊无效， pedagogy 写进 system prompt 才有效。
- Feynman Bot 组比被动重看组增益更高、开放题答得更展开（对照实验，N=14）。机制：被迫用自己的话+案例讲出来。
- Socratic AI（Study Mode 类）在 K-12 RCT 中显著提升科学论证和批判性思维（N=90）。机制：追问假设、证据和反例，而不是给答案。
- ICAP 框架：互动（共建）> 建构（自己解释/举例）> 主动（复述划线）> 被动（重看重听）。凡是把你推向“被动接收”的用法都在浪费时间。

**可照做的规则：**

- 开场就锁规则：不给答案、只提问；答错先分类（概念错/推理错/计算错）再给更小提示。
- 学生输入越模糊，AI 越退化成讲解机——所以你的回答要具体、要展开，哪怕是错的。
- 每 3 轮强制小结“已掌握/未掌握”，防止一路聊下来全是幻觉掌握。
- 结束必须有变式题：原题做对不算，会做变形才算。

## 常见错误

- 把 AI 当答案机：作业写完、脑子没留下。
- 一次喂整本书：输入过载，问答浮于表面。切片喂。
- 只复述术语：术语糊弄过去的地方就是漏洞，当场点名。
- 无验收结束对话：“懂了”是最不可靠的信号。
- 从不复习：学完不落卡片、不重测，等于没学（间隔重复另起工具管）。

## AI / 模型选择

家教对话：Claude（追问质量稳）、GPT-6 系。都不挑模型，挑 prompt 规则。
需要引用教材原文：PDF/长文档强档（Claude/Gemini）。详见 [ai-agents.md](../01-tools/ai-agents.md)。

## Prompt

[`05-prompts/prompt-library.md`](../05-prompts/prompt-library.md) → Socratic 家教、Feynman 自测。

## Sources

- [Harvard AI 家教 RCT（2025，N=194）](https://pmc.ncbi.nlm.nih.gov/articles/PMC12179260/)
- [Feynman Bot 对照实验（IEEE）](https://arxiv.org/pdf/2506.09055)
- [GAI 辅助 Feynman 复习 SoTL 研究（2025）](https://aclanthology.org/2025.aimecon-wip.14.pdf)
- [Socratic AI K-12 RCT（2025，N=90）](https://www.researchgate.net/publication/398686102_Socratic_AI_in_K-12_Science_Classrooms_Effects_on_Critical_Thinking_Motivation_and_Self-Regulation_in_a_Randomized_Controlled_Trial)

Last reviewed: 2026-10-01
