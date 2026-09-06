# 全栈软件开发 Coding Skills — Web 版

这是 `fullstack-coding-skills-zh` 的**浏览器对话版**。它不依赖 `.agents/skills`、`.claude/skills` 或本地 Agent 自动加载机制，可以直接用于 ChatGPT、Claude、Gemini 等网页版。

## 推荐使用方式

1. 打开 `index.html`，点击“复制总控提示词”。
2. 把总控提示词粘贴到一个新的 AI 开发对话。
3. 填写并粘贴 `PROJECT_CONTEXT_TEMPLATE.md`，再上传代码/文档/截图。
4. 日常复杂需求直接说：`执行完整开发流程：……`。
5. 某个阶段需要加强时，在网页中复制对应模块提示词继续粘贴。
6. 对话过长时使用 `HANDOFF_PROMPTS.md` 生成交接卡，再开新对话恢复。

## 目录

- `index.html`：单文件可视化网页版，支持搜索和一键复制。
- `WEB_MASTER_PROMPT.md`：最重要的总控提示词。
- `PROJECT_CONTEXT_TEMPLATE.md`：项目上下文卡。
- `HANDOFF_PROMPTS.md`：长对话交接/恢复。
- `prompts/modules/`：22 个专业工作模式。
- `prompts/recipes/`：常用任务快捷模板。
- `FULL_WEB_PROMPT_PACK.md`：全部内容合并成一个 Markdown。

## 和 Agent Skills 版的区别

| Agent Skills 版 | Web 版 |
|---|---|
| AI 根据 description 自动加载 SKILL.md | 用户粘贴总控提示词，按需粘贴模块 |
| 能直接操作本地仓库/终端（取决于 Agent） | 是否能执行取决于网页版工具能力 |
| 适合持续工程执行 | 适合网页问答、上传文件、评审、规划、逐步编码 |
| 上下文可由 Agent 读取项目补充 | 通过“项目上下文卡 + 交接卡”保持连续性 |

### 最关键的防误报规则
网页版经常无法真实运行项目，因此本版本明确要求：**没有真实执行测试/构建，就不能声称测试通过或开发完成。**
