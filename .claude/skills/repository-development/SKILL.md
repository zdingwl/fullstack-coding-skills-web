---
name: repository-development
description: 仓库级软件开发总控技能。任何新增功能、Bug 修复、前后端开发、数据库/API 修改、重构、测试、CI、依赖升级、性能优化或代码交付任务都必须使用；先理解现有代码，再按 AI_SKILLS.md 选择专业技能，验证完成后直接 commit 并 push 到 origin 默认分支。
metadata:
  version: "2.0.0"
  language: zh-CN
---

# Repository Development Controller

对任何仓库代码修改，先读取根目录 `AI_SKILLS.md`，按其中技能路由选择对应专业流程。

## 强制顺序

1. 理解用户目标和验收条件。
2. 分析代码库、现有相似实现、调用链与测试方式。
3. 按任务规模制定最小充分计划。
4. 调用 `AI_SKILLS.md` 中对应技能实施。
5. 运行真实验证、审查最终 diff。
6. 确定 `origin` 默认分支。
7. 验证通过后 commit 并直接 push 默认分支。

始终使用：Codebase Analysis、Verification Before Completion、Default Branch Delivery。

按需使用：Requirement Analysis、Architecture、Planning、Frontend、Backend、Database、API、TDD、Systematic Debugging、Webapp Testing、Code Review、Security Review、Refactoring、Performance、Dependency Upgrade、CI/CD、Observability、Release Delivery。

## Git 交付

- 默认不创建 feature branch / PR。
- 不假设默认分支名，查询远端。
- 保护已有未提交工作。
- 推送前 fetch；远端前进则安全同步并重新验证。
- 只 stage 当前任务相关文件。
- 禁止 force push。
- 直接 `git push origin HEAD:<default-branch>`。
- 分支保护或权限阻止时明确报告，不绕过。

完整工程规则见根目录 `AI_SKILLS.md` 与 `CLAUDE.md`。
