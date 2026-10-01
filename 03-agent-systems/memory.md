# Memory：只沉淀会复用的

> 当次任务的临时结论留会话里，用完即弃；一周会用两次以上、或下次还会踩的，才落盘。

## 沉淀什么 / 不沉淀什么

- 沉淀：构建/测试命令、代码规矩、发布 checklist、踩过的坑、拍板过的分歧。
- 不沉淀：当次任务的临时结论、日志 dump、猜测——留在会话里，用完即弃。

## 写到哪里

| 内容 | 写到 | 说明 |
|---|---|---|
| 通用规则（200 行内） | `AGENTS.md` / `CLAUDE.md` / `GEMINI.md` | 只放通用规则，领域知识做 skills 按需加载（Claude 官方） |
| 领域知识/重复流程 | skill（`skills.md`） | description 写成触发句，一事一 skill，常驻 skill 求短 |
| 确定性动作 | hooks | lint、禁写目录、收尾检查写死，不要赌模型自觉（Claude 官方） |
| 跨会话交接 | handoff 包 | 见 `../../04-recipes/handoff.md`，聊天记录不跨会话 |
| 真踩过的坑 | `../../06-troubleshooting/troubleshooting.md` | 只记复现过或高概率重复的 |
| 可复制话术 | `../../05-prompts/prompt-library.md` | 全库唯一出处，别处只链接 |

## 落盘时机

- compact / 换会话前：关键结论先落盘，再压缩。
- 长任务检查点：每过一个检查点就 commit + 更新 handoff 包。
- 踩坑当场：复现过的坑按 `日期｜工具｜现象｜定位｜解法` 记一条。

## 相关

- 上下文止血见 `context.md`。
- 什么值得做成 skill 见 `skills.md`。

Last reviewed: 2026-10-01
