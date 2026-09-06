---
name: repository-development
description: 仓库级软件开发总控技能。任何新增功能、Bug 修复、前后端开发、数据库/API 修改、重构、测试、CI、依赖升级、性能优化或代码交付任务都必须使用；先理解现有代码，再按 AI_SKILLS.md 选择专业技能，验证完成后直接 commit 并 push 到 origin 默认分支。
metadata:
  version: "2.0.0"
  language: zh-CN
---

# Repository Development Controller

## 目标

把每次仓库开发变成“先理解 → 选择技能 → 实施 → 验证 → 直接推送默认分支”的闭环，而不是拿到任务后立即猜代码。

## 启动时必须做

1. 读取仓库根目录 `AGENTS.md`。
2. 读取根目录 `AI_SKILLS.md` 的“技能路由表”。
3. 根据任务选择对应专业章节；不要把全部技能机械执行一遍。
4. 第一次进入仓库或影响范围未知时，Codebase Analysis 是强制步骤。
5. 查看 `git status`，保护用户已有修改。
6. 确认技术栈、构建/测试命令、默认分支及远端状态。

## 任务分级

- S：单文件、低风险、行为明确。分析 → 修改 → 验证即可。
- M：多文件或单模块。必须有简短实施计划。
- L：跨前后端、数据库/API、权限或数据流。必须做影响分析和完整计划。
- XL：架构级、迁移、大范围兼容性变化。必须先方案设计、风险和回滚计划。

## 技能路由

始终：Codebase Analysis + Verification Before Completion + Default Branch Delivery。

按需：

- 需求模糊/业务规则复杂 → Requirement Analysis
- 跨模块/新边界 → Architecture Design
- M/L/XL → Implementation Planning
- 页面/组件/状态/交互 → Frontend Development
- Controller/Service/Domain/Job → Backend Development
- Schema/SQL/ORM/迁移 → Database Development
- HTTP/RPC/Webhook/契约 → API Development
- 新核心逻辑/回归 → Test Driven Development
- 报错/异常/线上问题 → Systematic Debugging
- 真实页面流程 → Webapp Testing
- 完成实现 → Code Review
- 权限/认证/输入/敏感数据 → Security Review
- 结构改进且行为不变 → Refactoring
- 慢查询/慢接口/资源异常 → Performance Optimization
- 包版本升级 → Dependency Upgrade
- Actions/流水线失败 → CI/CD Debugging
- 日志/指标/trace → Observability Development
- 上线/迁移/回滚 → Release Delivery

各技能完整操作规范见 `AI_SKILLS.md`。

## 实施原则

1. 从用户可见行为和验收条件出发。
2. 优先复用项目既有实现，不平行造第二套架构。
3. 一次完成一个可验证切片。
4. 修改公共接口前追踪调用方。
5. 数据变更考虑旧数据、迁移、索引、事务、回滚。
6. 安全边界默认服务端校验，不能只依赖前端。
7. 不为了“看起来完整”添加用户未要求的无关功能。

## 完成前强制门禁

在说“完成”之前：

1. 运行与改动匹配的测试。
2. 运行项目适用的 build/typecheck/lint。
3. 查看最终 diff。
4. 检查日志/secret/调试代码/临时文件。
5. 对 Bug 执行原始复现或回归测试。
6. 对 UI 改动尽可能执行真实页面/交互验证。
7. 对 DB/API 改动检查兼容与迁移。

无法运行的命令必须写明原因，不能虚构成功。

## 默认分支直接交付

除非用户明确要求分支或 PR，否则：

1. 获取 `origin` 的真实默认分支。
2. 不创建 feature branch。
3. fetch 最新远端状态。
4. 验证通过后只 stage 本任务变更。
5. commit。
6. 如果远端默认分支有新提交，安全同步/rebase并重新验证。
7. 直接 `git push origin HEAD:<default-branch>`。
8. 确认 push 成功后才向用户报告完成。

禁止 force push。若 branch protection 或权限阻止直推，报告阻塞，不绕过。

## 最终交付格式

- 完成内容
- 关键文件/模块
- 验证命令与实际结果
- commit SHA
- 默认分支名
- push 结果
- 风险/未验证项
