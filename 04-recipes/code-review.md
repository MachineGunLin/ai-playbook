# Code Review：实现与审查分离

1. 实现者在自己会话里改完、自测通过。
2. 另起审查视角（新会话 / 新鲜 subagent / `/code-review`），只给 diff + 验收标准，不给实现过程。
3. 审查只输出：bug（文件:行号+原因）、边界遗漏、安全问题，按严重度排序；没问题就说通过。
4. 实现者修完逐条回复，修不掉的写原因；大分歧人拍板。
5. 合并前重跑测试。

核心：审查者看不到实现者的推理，只看结果。自己审自己的代码等于没审。

Prompt：[`05-prompts/prompt-library.md`](../05-prompts/prompt-library.md) → Code Review。
