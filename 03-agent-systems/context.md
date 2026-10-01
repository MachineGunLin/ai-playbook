# Context：主会话保持干净，胀了就止血

> 上下文是工作区，落盘是记忆。压缩只是止血，跨会话知识必须进文件（见 [memory.md](memory.md)）。

## 什么吃 context

- 全文转述（subagent 回来倒全文、大段日志 dump）。
- 全仓漫游（上来就“看看这个 repo”，没点名文件）。
- 常驻重服务（MCP 重服务每 turn 吃上万 token，不用就关）。
- 同一问题开多 thread（推理链断了，每处重讲背景）。

## 铁律

- 脏活隔离：调查/验证类扔 subagent，主会话只做拆活和验收。
- 只收摘要：subagent 回来只收结论 + 文件:行号 + 证据链接，不收全文。
- 先点名再动手：先 `@` 点名文件，不要全仓漫游。
- 一个任务一个 thread：同问题留同 thread 保推理链，真分叉才 fork；胀了就 compact（Codex 官方）。
- 压缩是止血不是记忆：compaction 开自动 + 裁剪，但跨会话知识必须落盘（OpenCode 社区）。

## 各工具入口

上下文查看与压缩命令见 [01-tools/ai-agents.md](../01-tools/ai-agents.md) → 命令速查（`/status`、`/context`、`/compact` 等按工具查）。

## 相关

- 跨会话落盘见 [memory.md](memory.md)。
- 拆活边界见 [multi-agent.md](multi-agent.md)。
- 换会话/换工具交接见 [04-recipes/handoff.md](../04-recipes/handoff.md)。

Last reviewed: 2026-10-01
