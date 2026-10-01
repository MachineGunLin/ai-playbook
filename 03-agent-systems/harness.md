# Harness：模型决定上限，外壳决定下限

最终能做什么 = 模型能力 + Harness 能力 + 产品权限。

## 模型 vs 外壳

- 模型：吃进什么（文本/图/PDF/音视频）、吐出什么、context 多大、推理多强。
- Harness：文件读写、shell、浏览器、MCP、subagent、PDF 解析、视频抽帧、STT——模型不行壳再强也没用；模型行但壳没接通道同样做不了。
- 同一个模型换壳等于换能力（Codex / Claude Code / OpenCode 里的同一个 Claude 行为不同）。选型按“模型+壳”组合判断，见 [01-tools/ai-agents.md](../01-tools/ai-agents.md)。

## 好 Harness 的组成

| 部件 | 作用 | 配错的代价 |
|---|---|---|
| tools（读/写/shell/检索） | 让模型碰到真实世界 | 只能聊不能干 |
| context 管理 + compaction | 会话不胀死 | 长活中途失忆 |
| memory（仓库约定/记忆文件） | 跨会话知识 | 每回重复交代 |
| permission + sandbox | 分级放行 | 要么处处卡手，要么一次删库 |
| browser / MCP | 联网与外部系统 | 新鲜信息靠猜 |
| session 持久化 + resume/fork | 接回与分支 | 断一次重来一次 |
| subagent / workflows | 并行与隔离 | 主 context 被脏活淹没 |

## 落到自己身上

- 写死的：`AGENTS.md`/`CLAUDE.md`/`GEMINI.md`（构建测试命令、目录规矩）。写到哪里、沉淀什么见 [memory.md](memory.md)。
- 按需的：skills（见 [skills.md](skills.md)）、MCP（重服务每 turn 吃上万 token，不用就关）。
- 护栏：bash 白名单 + 密钥路径双 deny；`--yolo`/danger 档只进一次性沙箱。
- 习惯：compaction 开自动；关键结论落盘，不指望模型记住。止血细节见 [context.md](context.md)。

Last reviewed: 2026-10-01
