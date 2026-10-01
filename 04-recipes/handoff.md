# Handoff：把会话交接写成文件

交接包（落盘成 markdown，聊天记录不跨工具）：

```markdown
# Handoff YYYY-MM-DD-任务名
- 目标：
- 已完成：
- 已验证（命令+结果）：
- 未完成/卡点：
- 相关文件：
- 下一步（一条）：
```

1. 交出前跑 `git status` / `git diff --stat`，未提交的改动说清楚。
2. 已验证的不重复验证；没验证的不写“已完成”。
3. 接收方先复述理解再动手（见接手模板）。
4. 跨工具交接：前者 `/export` 或落盘，后者 `@` 读入。

Prompt：[`05-prompts/prompt-library.md`](../05-prompts/prompt-library.md) → 接手上一个 Agent。
