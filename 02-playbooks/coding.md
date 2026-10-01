# Coding

## 10 秒速查

1. 大改先 plan 再动手，小改直接说。
2. 脏活（调查/验证）丢 subagent，主会话保持干净。
3. 实现和审查必须是两个视角。
4. 并行写同一仓 → worktree 隔离。
5. 每步都要有验证命令；没验证的不算完。

## 默认工作流

```
spec（一句话目标+验收）→ plan（只读，审计划）→ implement（worktree/分支）
→ verify（测试+lint）→ review（新鲜视角）→ commit → handoff 落盘
```

- 30 分钟内：当面指挥，一个会话走完。
- 30 分钟以上：放手跑（Grok `/goal` / Claude `/goal` / 自主执行模板），人只看进度和拍板。
- 大到装不下：拆独立小块 fan-out，最后汇总。

## 常见场景

- 修 bug → `04-recipes/debugging.md`（复现→假设→验证→修复→回归）。
- 合并前 → `04-recipes/code-review.md`（实现与审查分离）。
- 换会话/换工具 → `04-recipes/handoff.md`（交接包落盘）。
- 长任务 → `04-recipes/long-running-task.md`。
- 全仓找东西 → 先让只读 subagent（explore）啃，回来只收文件清单+结论。
- 迁移/重构 → `/batch` 类扇出（Claude）或 workflows（Grok），每块独立 worktree、独立 PR。

## 最佳实践

**官方（可直接照做）：**

- 一个任务一个 thread，同问题留同 thread 保推理链，真分叉才 fork；胀了就 compact（Codex 官方最佳实践）。
- 先探索再计划：调研→计划→执行三段，调查类扔 subagent 保主 context 干净（Claude 官方最佳实践）。
- `CLAUDE.md`/`AGENTS.md` 只放通用规则（200 行内），领域知识做 skills 按需加载（Claude 官方）。
- 确定性动作写 hooks（lint、禁写目录、收尾检查），常用安全命令预放行入库，不要赌模型自觉（Claude 官方）。
- 开工先立验证环：没测试先让它写测试块，再改再跑，盯着测试输出迭代（Antigravity 官方：最有效的一招）。
- 便宜 subagent + 贵主 agent：只读探索用小模型，执行用强模型（OpenCode 社区验证模式）。
- 大扫荡描述一句话扇出上百 agent，后台跑完回一份总报告；跑顺存成团队 slash（Grok workflows 官方）。

**社区（多人验证过，值得学）：**

- 审查前置到写法里：`PLANS.md` 当执行单，每阶段写清验收和证据再开工（OpenAI cookbook 的 harness 模式）。
- 压缩是止血不是记忆：compaction 开自动 + 裁剪，但跨会话知识必须落盘（OpenCode 社区）。
- MCP 按需开：重服务每 turn 吃上万 token，不用就关（OpenCode 社区实测）。

## 常见错误

- 全仓漫游：上来就让 agent“看看这个 repo”，几万 token 烧掉还没结论。先 `@` 点名文件。
- 自己审自己：实现会话里顺手说“顺便检查下”，等于没审。
- 同一 checkout 开两个写作者：互相覆盖、测试打架。
- 无限调查：查了 40 分钟没产出——先出 deliverable 形状（draft 优先），缺什么再补查。
- 权限全开图省事：`--yolo`/danger 档只进一次性沙箱。

## AI / 模型选择

repo 级：Codex、Claude Code（Opus 系）→ Grok Build、OpenCode+强模型。
有截图：vision 档（Gemini/Claude/GPT-6/Grok 主模型/DeepSeek Vision 版）。
便宜大 context 纯文本：DeepSeek Harness。详见 `01-tools/ai-agents.md`。

## Prompt

[`05-prompts/prompt-library.md`](../05-prompts/prompt-library.md) → 先提问、先调查、自主执行、Debug、Code Review、接手、最终验收。

## Sources

- [Codex 最佳实践（官方）](https://developers.openai.com/codex/learn/best-practices)
- [Claude Code 最佳实践（官方）](https://code.claude.com/docs/en/best-practices)
- [Anthropic Claude Code 进阶模式（官方 PDF）](https://resources.anthropic.com/hubfs/Claude%20Code%20Advanced%20Patterns%5F%20Subagents%2C%20MCP%2C%20and%20Scaling%20to%20Real%20Codebases.pdf)
- [Antigravity CLI 最佳实践（官方）](https://antigravity.google/docs/cli/best-practices/)
- [OpenCode Agents（官方）](https://opencode.ai/docs/agents/)
- [Grok Workflows（官方博客）](https://x.ai/news/workflows)

Last reviewed: 2026-10-01
