# 全栈软件开发 Coding Skills — Web 版

这是面向 **ChatGPT、Claude、Gemini 等网页版 AI** 的软件开发 Skills 工作台。仓库采用模块化维护：总控提示词、22 个专业 Skill、7 个常用 Recipe 与网页 UI 分开存放，便于 Git diff、PR、审查和持续迭代。

## 当前能力

- 22 个软件工程专业工作模式
- 7 个常见开发任务快捷模板
- 总控 Prompt：从需求 → 代码分析 → 计划 → 实现 → 测试 → 审查 → 验收
- 项目上下文卡
- 长对话交接/恢复 Prompt
- Skill 搜索与分类筛选
- 在线预览、一键复制提示词
- 纯静态网页，无 npm / 构建依赖

## 本地运行

因为仓库版网页会通过 `fetch()` 动态读取 Markdown 模块，不建议直接双击 `file://index.html`。

在仓库目录执行：

```bash
python -m http.server 8080
```

然后浏览器打开：

```text
http://localhost:8080
```

也可以使用任意静态 Web Server 或部署到 GitHub Pages。

## 使用方式

1. 打开网页，先点“复制总控提示词”。
2. 粘贴到新的 AI 开发对话。
3. 再复制 `PROJECT_CONTEXT_TEMPLATE.md`，补充项目情况、技术栈和本次任务。
4. 普通复杂任务直接说：`执行完整开发流程：……`。
5. 某阶段需要强化时，在网页里搜索并复制对应 Skill。
6. 对话过长时使用 `HANDOFF_PROMPTS.md` 生成交接卡，在新对话继续。

## 目录

```text
.
├── index.html                     # 模块化网页版入口
├── catalog.json                   # Skill / Recipe 前端目录
├── WEB_MASTER_PROMPT.md           # Web 总控提示词
├── PROJECT_CONTEXT_TEMPLATE.md    # 项目上下文卡
├── HANDOFF_PROMPTS.md             # 长对话交接/恢复
├── manifest.json                  # 版本信息
└── prompts/
    ├── modules/                   # 22 个专业工作模式
    └── recipes/                   # 7 个快捷开发模板
```

## 新增或修改 Skill

修改已有 Skill：直接编辑 `prompts/modules/<skill>.md`，网页会自动读取最新内容。

新增 Skill 时：

1. 在 `prompts/modules/` 新建 Markdown 文件。
2. 保持“模块说明 + `## 可复制提示词` + `text` 代码块”的结构。
3. 在 `catalog.json` 增加对应条目。
4. 通过本地 HTTP Server 打开网页，验证搜索、预览和复制。
5. 提交独立 Commit / PR。

## 最关键的防误报规则

网页版经常不能真实执行本地命令，因此总控与各模块统一要求：**没有真实执行测试、构建、浏览器验证或其他质量门禁，就不能声称测试通过、构建成功或开发完成。**

## Git 开发约定

- `main`：稳定版本
- `feature/*`：功能开发
- `fix/*`：Bug 修复
- 中大型修改通过 PR 合并
- 不把无关重构混入功能 PR
- 合并前检查页面、Catalog 与 Markdown 路径一致
