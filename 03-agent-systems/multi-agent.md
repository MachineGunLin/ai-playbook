# Multi-agent：拆活、隔离与协作

> 原 `subagents.md` 已并入本篇。拆活边界看第 1–2 节，分工模式看第 3 节，铁律看第 4 节。

## 1. 什么适合拆出去

- 调查类：全仓找调用链、读大量文件（读完只回摘要，主 context 不脏）。
- 验证类：写完代码另起新鲜视角审 diff（审查者看不到实现推理，只看结果）。
- 并行类：相互独立的多块任务（多目录重构、多模块调研）。

## 2. 什么不该拆

- 需要大量背景才能讲清的活（讲背景的 token 比省下的还多）。
- 强顺序依赖的活（B 等 A 的输出，拆了反而多一轮转述损耗）。
- 5 分钟能当面说完的小活。

## 3. 三种分工（按场景选一种）

- planner / worker：计划者只出方案（只读），执行者照单施工。大改、跨模块必备。
- executor / reviewer：做的人不审，审的人没参与做。合并前质量门。
- 并行 fan-out：独立小块同时开工，最后汇总成一份报告（审大 PR、全仓查一类 bug）。

## 4. 铁律

- 一块代码同一时间只属于一个写作者；并行写同一仓必须 worktree 隔离。
- 拆之前划边界：谁负责哪些文件/目录、输出格式是什么（清单 or diff or 报告一页）。
- 主会话只做拆活和验收；subagent 回来只收摘要（结论 + 文件:行号 + 证据链），不收全文转述。
- 交接用文件不用口头（见 `../../04-recipes/handoff.md`），聊天记录不跨会话。
- 两个 agent 结论冲突时，人拍板，不要让它们互相对话解决。

## 5. 各工具入口

Claude `/subtask`（回本会话）·`/fork`（后台）·`/batch`（仓库级扇出 worktree agent）· agent team；Codex worktree + Handoff；Grok 后台 subagent + worktree + workflows（上百 agent 后台跑）；Antigravity `/agents` 面板 + 流水线/扇出模式；OpenCode `subtask:true` 命令/只读 subagent；DSH 运行时 subagent。

## 6. 相关

- 上下文保持干净见 `context.md`，跨会话落盘见 `memory.md`。
- 合并前审查见 `../../04-recipes/code-review.md`，长任务见 `../../04-recipes/long-running-task.md`。

Last reviewed: 2026-10-01
