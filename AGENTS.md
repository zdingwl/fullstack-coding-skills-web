# AI Repository Development Policy

本文件是仓库级强制开发规则。Codex 在任何工作开始前会读取本文件。

## 指令优先级

1. 用户当前明确指令最高优先级。
2. 本文件定义默认仓库开发与交付方式。
3. `.agents/skills/repository-development/SKILL.md` 定义具体软件工程流程。
4. `AI_SKILLS.md` 提供各专业技能细则。

如果用户明确要求不同的 Git 策略、测试范围或交付方式，以用户要求为准。

## 每个代码任务必须执行

凡涉及代码、配置、数据库、接口、测试、构建、CI、依赖或运行行为的修改：

1. 必须加载并遵循 `.agents/skills/repository-development/SKILL.md`。
2. 必须读取 `AI_SKILLS.md` 中与当前任务对应的技能章节。
3. 陌生仓库或影响范围不明确时，先做代码库分析，不得直接批量修改。
4. 优先寻找仓库已有的相似实现、命名、组件、Service、Repository、测试和错误处理模式。
5. 修改遵循“最小充分范围”，禁止顺手重构无关模块。
6. 完成前必须运行真实验证命令；没有执行的测试不得声称通过。

## 默认技能选择

所有开发任务至少使用：

- Codebase Analysis
- Implementation Planning（中大型任务）
- Verification Before Completion
- Git / Default Branch Delivery

按任务补充：

- 新功能：Requirement Analysis + Architecture（复杂时）+ TDD
- Bug：Systematic Debugging + Regression Test
- 前端：Frontend Development + Webapp Testing
- 后端：Backend Development
- 数据变更：Database Development
- 接口：API Development
- 安全敏感：Security Review
- 性能：Performance Optimization
- 重构：Refactoring
- CI 失败：CI/CD Debugging
- 依赖升级：Dependency Upgrade

## 默认 Git 交付策略：直接推送默认分支

这是本仓库的明确默认策略。

### 开始工作

1. 运行 `git status`，识别用户已有未提交修改；不得覆盖、删除或混入无关修改。
2. 通过远端信息确定默认分支，**不要硬编码为 main/master**。优先使用 `refs/remotes/origin/HEAD` 或 `git remote show origin`。
3. 如果工作区安全，执行 `git fetch origin`，确保基于最新默认分支开发。
4. 默认不要创建 feature branch、worktree 或 Pull Request，除非用户明确要求。

### 完成工作

只有满足以下条件才允许推送：

- 用户目标已有实际实现，不是占位代码。
- 与改动匹配的测试/构建/类型检查/lint 已执行并通过，或已明确记录环境无法执行的项目。
- 已查看 `git diff` / staged diff，没有 secret、调试垃圾、无关改动或意外生成文件。
- 数据库/API breaking change 已明确处理迁移或兼容性。

随后：

1. 确认当前提交目标是远端默认分支。
2. `git fetch origin`。
3. 如果远端默认分支前进，安全地 rebase/同步；冲突必须理解双方语义后处理，禁止粗暴 ours/theirs。
4. 重新运行受影响验证。
5. 只 stage 当前任务相关文件。
6. 创建清晰 commit；提交信息说明实际变更，不写 AI 流水账。
7. 直接 `git push origin HEAD:<default-branch>`。
8. 推送后确认远端提交成功，再声明完成。

## 禁止事项

- 禁止 `git push --force` / `--force-with-lease`，除非用户明确授权且已说明风险。
- 禁止 reset/clean 删除用户工作。
- 禁止为了通过测试而删除/跳过有效测试。
- 禁止伪造命令、测试、构建、浏览器或部署结果。
- 禁止自动创建 PR 代替用户要求的默认分支直推。
- 如果 branch protection、权限或凭证阻止直推，停止并明确报告真实阻塞原因，不尝试绕过仓库安全策略。

## 最终回复必须包含

- 实现了什么
- 关键修改文件/模块
- 实际运行的验证及结果
- commit SHA（可获得时）
- 推送到哪个默认分支，以及 push 是否成功
- 仍存在的风险或未执行验证（如有）
