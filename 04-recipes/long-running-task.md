# Long-running Task：放手跑的正确姿势

1. 设目标：一条可验收的目标句 + 验证命令（Grok `/goal`、Claude `/goal [条件]`、或自主执行模板）。
2. 拆检查点：清单式，每项可独立验证；做完勾一项。
3. 定提交节奏：每过一个检查点就 commit（worktree 里跑，不污染主分支）。
4. 人只做三件事：中途加指令、看进度（`/goal status`、`/tasks`）、拍板分歧；不逐行盯。
5. 结束三动作：跑全量验证 → 审查（见 code-review.md）→ 写 handoff 落盘。

30 分钟以下的活别用这套，直接当面指挥更快。

Prompt：[`05-prompts/prompt-library.md`](../05-prompts/prompt-library.md) → 自主执行、最终验收。
