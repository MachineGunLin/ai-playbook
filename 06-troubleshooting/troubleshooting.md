# 排障记录

> 只记复现过或高概率重复的，不写通用 FAQ。格式：`日期｜工具｜现象｜定位｜解法`。

- 2026-10-02｜DeepSeek Harness｜text-only route 发图片被拒｜是否收图看当前 catalog/route 的 input modalities（如 deepseek-v4-pro 拒收）｜切到声明 image 的模型（如 deepseek-flash，按 `/model` 当前 catalog 实查）
- 2026-10-01｜Claude Code｜切模型弹缓存警告｜换模型导致缓存失效｜确认后继续，非故障
- 通用｜发布工具｜报“未登录”｜读到用户日常 Chrome 而非隔离窗口｜先确认走 CDP + 专属 profile/端口，真登录态丢失才重登

Last reviewed: 2026-10-02
