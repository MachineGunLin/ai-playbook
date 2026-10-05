# 工具能力与操作参考

> 回答“这个工具有什么能力、具体怎么操作？”。
> 方法论和流程不在这里，去 [02-playbooks/](../02-playbooks/)。可直接复用的话术去 [05-prompts/prompt-library.md](../05-prompts/prompt-library.md)。

## 能力矩阵（按工具实际可用性）

> ✅=直接能做，⚠️=有条件/降级（看备注），❌=做不了，?=未确认。
> 数据截至 2026-10-02；工具迭代快，关键结论以官方文档为准，`?` 项不要凭记忆补。

| 工具（实际入口） | 图片 | PDF/文档 | 普通文件/代码 | 视频 | 音频 | 联网搜索 | 深度调研 | 本地仓库 | 备注 |
|---|---|---|---|---|---|---|---|---|---|
| ChatGPT（网页/桌面 App） | ✅ | ✅ | ✅ | ⚠️ | ✅ | ✅ | ✅ | ❌ | 视频多为抽帧理解；音频走语音/STT；无本地执行，仓库活交 Codex |
| Codex（VS Code 插件/CLI） | ✅ | ⚠️ | ✅ | ❌ | ❌ | ⚠️ | ⚠️ | ✅ | 图片靠模型原生；PDF 走工具链；联网默认 cached，`--search` 切 live；仓库强项（worktree/Handoff） |
| Claude（网页/桌面 App） | ✅ | ✅ | ✅ | ⚠️ | ⚠️ | ✅ | ✅ | ❌ | PDF 原生视觉精读；视频按抽帧/多图理解；DR 靠 Research 功能；仓库用 Claude Code |
| Claude Code（VS Code 插件/CLI） | ✅ | ✅ | ✅ | ❌ | ❌ | ⚠️ | ⚠️ | ✅ | 联网经工具/MCP 编排；`/deep-research` 工作流+人工编排；仓库强项 |
| Antigravity | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | 唯一真原生视频/音频（Gemini）；`ctrl+v` 贴截图/视频；`/browser` 子智能体调研 |
| OpenCode（VS Code 插件/TUI） | ✅ | ✅ | ✅ | ✅ | ✅ | ⚠️ | ⚠️ | ✅ | 前提：选对模型（`/models` 实查）；联网看 MCP 配置；DR 靠 subagent 编排 |
| Grok / Grok Build（终端 TUI） | ✅ | ⚠️ | ✅ | ⚠️ | ❌ | ✅ | ✅ | ✅ | 图片主模型原生（Build 专用版按❌）；PDF 走 file_search（RAG 式）；`/deep-research` 内置；Web+X 双工具是强项 |
| DeepSeek Harness（终端 TUI） | ⚠️ | ❌ | ✅ | ❌ | ❌ | ⚠️ | ⚠️ | ✅ | 图片看当前 catalog/route 的 input modalities（如 deepseek-flash 声明 text+image 可发图，text-only 会拒）；联网靠 Harness web 工具；便宜大 context 纯文本是强项 |

## 该用哪个工具？

| 任务 | 优先考虑 | 备选 | 避免使用 |
|---|---|---|---|
| 纯文本写作 | Claude、GPT-6.1 Sol（API / Codex 起 Pro 可用；旧入口按 `/model` 实查） | Gemini、Grok | 为写作单独切 DeepSeek |
| coding（单文件/小改） | Codex、Claude Code、Grok Build | OpenCode + coding 模型 | 无图还行；DeepSeek 工具链弱 |
| repo 级别修改 | Codex、Claude Code | Grok Build、OpenCode + 强模型 | 纯 API 对话框（无 Harness 的裸模型） |
| 图片理解 / UI 截图分析 | Gemini、Claude 5 系、GPT-6 | Muse Spark、Grok 主模型、DeepSeek image-capable 模型（按当前 catalog） | DeepSeek text-only route、Grok Build 专用版 |
| PDF 阅读 | Claude、Gemini | GPT-6（产品侧工具）、Muse Spark | DeepSeek 全系（API 无原生 PDF） |
| 视频 / 音频理解 | Gemini（唯一原生） | Muse Spark；音频先转文字再发任意模型 | OpenAI/Claude/Grok/DeepSeek 主模型 |
| Web search（新鲜信息） | Grok（Web+X）、Gemini、ChatGPT/Codex | Claude 产品侧工具 | DeepSeek 裸调（走 Harness web 工具可补） |
| 深度调研（多步骤） | 各家产品侧 Deep Research | Grok `/deep-research`、Claude/Grok 自搭流程 | 指望 API 模型一次答完 |
| 大 context | Claude / Gemini / Muse / DeepSeek（1M） | Grok（500K） | OpenAI GPT-6 系 1.05M（官方 models 页，2026-10-02） |
| 长时间 Agent | Claude Opus、Codex、Muse Spark | Grok Build、Gemini | 纯文本小模型、无 Harness 的裸 API |
| 快速便宜任务 | GPT-6 Luna、GPT-5.6 Terra/Luna、DeepSeek Flash | Gemini Flash-Lite、Haiku | Astra/Opus/Pro 大档 |

## 快速决策树

```
有图片/截图？→ 只发 vision 行（Gemini / Claude / GPT-6 / Grok主模型 / DeepSeek image-capable 档 / Muse）
有 PDF？→ 优先 Claude / Gemini；DeepSeek 先查当前 route 是否收文档
有视频/音频？→ 优先 Gemini；其余默认不支持，音频先转文字
要最新资料？→ 必须走带 Web 工具的产品/Harness，裸 API 不行
纯 coding？→ Codex / Claude Code / Grok Build，别在聊天框里磨
DeepSeek？→ 先查当前 catalog/route 的 input modalities；text-only 发图会被拒
不确定？→ 按 ❌ 处理，别猜；能转成纯文本就转成纯文本再发
```

## 能力 ≠ 外壳

最终能做什么 = 模型能力 + Harness 能力 + 产品权限，三者缺一不可。详见 [harness.md](../03-agent-systems/harness.md)。

## 命令速查

> `?` = 未在官方页核验到，勿凭记忆补。

| 操作 | Codex | Claude Code | Antigravity | OpenCode | Grok Build | DeepSeek Harness（社区 TUI） |
|---|---|---|---|---|---|---|
| 启动 | 终端 `codex`；VS Code 插件侧边栏 | 终端 `claude`；VS Code 插件 | 桌面 App / VS Code 侧；CLI 启动命令 ? | 终端 `opencode`；VS Code 插件 | 终端 `grok`；脚本 `grok -p "…"` | 官方 `npx @deepseek-ai/dsh web`；社区 `dsh --profile tui` |
| 新会话 | 新起终端即新会话 | `/clear` | `⌘N` / `Ctrl+N` | `/new`（`ctrl+x n`） | `/new` | `/clear` |
| 接回 | `codex resume` / `codex fork` | `/resume` | `⌘K` 切会话；`/resume` | `/sessions`（`ctrl+x l`） | `/resume`；`/sessions` | `/resume [id]` |
| 模型 | `/model` | `/model`；`Meta+P` | 模型下拉 UI | `/models`（`ctrl+x m`） | `/model`（`/m`）；`-m` | `/model [模型] [effort]` |
| 推理档 | `/model` 内附 effort | `/effort`；`Meta+O` fast | `/boost`、`/teamwork-preview` | `ctrl+t` 切 variant | `/effort` | 并入 `/model` 参数 |
| 用量 | `/status` | `/usage` | ?（看网页账单） | ?（看网页账单） | `/usage` | ? |
| 上下文 | `/status` | `/context`；`/autocompact` | ? | ?（靠 `/compact`+`@`） | `/context`；`/session-info` | `/status`；`/trajectory` |
| 压缩 | `/compact` | `/compact [说明]` | ? | `/compact`（`ctrl+x c`） | `/compact` | `/compact` |
| 计划模式 | `/plan` | `/plan`；`Shift+Tab` | `/plan`；`/grill-me` | `plan` agent（Tab 切） | `/plan`；`/view-plan`；`/goal` | `/plan` |
| 子任务 | `/agent` · `/subagents`（切活动 subagent 线程） | `/subtask`；`/fork`；`/branch` | `/agents` 面板 | agents 配置 + `subtask` | `/tasks`；`/fork`；`/workflows` | 运行时支持；管理命令 ? |
| 权限 | `/permissions`；`--sandbox`；`--yolo` | `/permissions` | 默认先问；`y`/`n` | 见官方 Permissions 页 | `/always-approve`；`/auto` | `/permissions <preset>` 三档 |
| Shell | `!` 前缀 | `!` 开头 | 经 Agent 执行 | `!` 前缀 | 经 Agent 工具执行 | 经 Agent 执行 |
| 文件引用 | `@路径`；`/mention`；`-i` 贴图 | `@路径`；`Option+K` | `@路径`；`ctrl+v` 贴截图/视频 | `@文件` | `@路径` | ?（以实测为准） |
| 帮助/退出 | `/` 菜单实查；退出 ? | `/help`；`/exit`；`Ctrl+D` | `/keybindings`；`Ctrl+C`/`Ctrl+D` | `/help`；`/exit` | `/help`；`/quit` | `/help`；`/exit` |

## 各工具高频命令

### Codex

| 命令 | 作用 |
|---|---|
| `codex` / `codex resume` / `codex fork` | 启动 / 接回 / 分叉会话 |
| `codex exec "…"` | 非交互跑（进脚本/CI） |
| `/model` · `/plan` · `/compact` | 切模型 / 进计划模式 / 压缩 |
| `/review` + `/diff` | 审工作区改动 |
| `/mention <path>` / `@路径` / `-i` | 点名文件 / 贴图 |
| `/status` · `/permissions` · `/ps`·`/stop` | 用量 / 权限 / 后台终端 |
| `/agent` · `/subagents` | 切活动 subagent 线程，继续其工作 |
| worktree + Handoff | 官方标准隔离流程：并行会话各占 worktree，Handoff 在 Local 与 Worktree 间移动 |
| `!命令` | 跑本地 shell |

### Claude Code

| 命令 | 作用 |
|---|---|
| `/clear` · `/compact` · `/context` | 新局 / 压缩 / 看 context 占用 |
| `/model` · `/effort` | 切模型 / 调推理档 |
| `/plan` · `Shift+Tab` | 计划模式 / 轮切 permission mode |
| `/permissions` · `/usage` | 权限规则 / 花费 |
| `/diff` → `/code-review [--fix]` | 先看改动再审 |
| `/subtask` · `/fork` · `/batch` | 回本会话的子任务 / 后台分叉 / 仓库级扇出 |
| `@路径` · `!命令` | 文件引用 / shell 直跑 |

### Antigravity

| 命令 | 作用 |
|---|---|
| `/plan` · `/grill-me` · `/goal` | 出计划 / 先问后做 / 自主跑完 |
| `/browser` · `/btw` · `/schedule` | 浏览器子 agent / 旁问 / 定时跑 |
| `/agents` | Agent 管理面板（切 agent、杀/批 subagent） |
| `@路径` · `ctrl+v` | 路径联想 / 贴截图视频 |
| `⌘K`·`⌘P`·`⌘L`·`⌘N` | 会话 / 文件搜索 / 聚焦 / 新会话 |

### OpenCode

| 命令 | 作用 |
|---|---|
| `opencode` · `/models` · `/connect` | 启动 / 切模型（含 Zen） / 接 provider |
| `/new` · `/sessions` · `/compact` | 新会话 / 切换 / 压缩 |
| `Tab` 切 agent（plan/build） | 只读分析 ↔ 全权执行 |
| `@文件` · `!命令` | 文件引用 / shell |
| `/undo`·`/redo` · `/init` · `/share` | 撤回（含文件还原） / 生成 AGENTS.md / 分享 |

### Grok Build

| 命令 | 作用 |
|---|---|
| `grok` / `grok -p "…"` | 交互 / headless（`--output-format streaming-json` 进脚本） |
| `/model` · `/effort` · `/context` · `/compact` | 模型 / 推理档 / 用量 / 压缩 |
| `/plan` · `/goal`（`status`/`pause`/`resume`/`clear`） | 计划模式 / 长任务自主跑 |
| `/tasks` · `/workflows` · `/deep-research` | 后台任务 / 并行工作流 / 内置调研 |
| `grok inspect` | 看目录解析到的配置/技能/MCP |

### DeepSeek Harness（社区 TUI，出处见备注）

> `dsh web`/headless/`dsh plugin` 是官方 CLI；下表 slash 归社区 `dsh-tui`，不要混记。

| 命令 | 作用 |
|---|---|
| `dsh --profile tui` | 起社区 TUI |
| `/model [模型] [effort]` · `/resume [id]` | 切模型 / 接回会话 |
| `/permissions <preset>` | `read-only`·`workspace-write`·`danger-full-access` |
| `/plan` · `/compact` | 计划模式 / 压缩 |
| `/status`·`/trajectory`·`/settings` | 会话计数 / 事件线 / 一屏总览 |

## 官方文档入口

- Codex：[CLI slash](https://developers.openai.com/codex/cli/slash-commands) · [IDE slash](https://developers.openai.com/codex/ide/slash-commands) · [CLI 全命令](https://developers.openai.com/codex/cli/reference) · [最佳实践](https://developers.openai.com/codex/learn/best-practices) · [Git worktrees](https://developers.openai.com/codex/environments/git-worktrees)
- Claude Code：[Commands](https://code.claude.com/docs/en/commands) · [Interactive mode](https://code.claude.com/docs/en/interactive-mode) · [Keybindings](https://code.claude.com/docs/en/keybindings) · [CLI](https://code.claude.com/docs/en/cli-reference) · [最佳实践](https://code.claude.com/docs/en/best-practices)
- Antigravity：[Slash 总览](https://antigravity.google/docs/slash-commands/) · [CLI Reference](https://antigravity.google/docs/cli/reference/) · [最佳实践](https://antigravity.google/docs/cli/best-practices/) · [Rules](https://antigravity.google/docs/rules/)
- OpenCode：[TUI](https://opencode.ai/docs/tui/) · [Commands](https://opencode.ai/docs/commands/) · [Agents](https://opencode.ai/docs/agents/) · [Permissions](https://opencode.ai/docs/permissions/)
- Grok Build：[Overview](https://docs.x.ai/build/overview) · [Modes & Commands](https://docs.x.ai/build/modes-and-commands) · [Subagents](https://docs.x.ai/build/features/subagents)
- DeepSeek Harness：官方 [deepseek-harness](https://github.com/deepseek-ai/deepseek-harness) · 社区 [dsh-tui](https://github.com/nexlineai/dsh-tui)

Last reviewed: 2026-10-05
