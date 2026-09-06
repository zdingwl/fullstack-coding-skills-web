# Claude Code Repository Development Policy

对本仓库执行任何代码修改时，必须使用项目技能：

```text
.claude/skills/repository-development/SKILL.md
```

并按任务读取根目录 `AI_SKILLS.md` 中对应专业章节。

## 强制流程

1. 先理解需求和代码库，再修改。
2. 找仓库已有相似实现并遵循既有架构/命名/错误处理/测试模式。
3. 中大型任务先形成可执行计划。
4. Bug 必须先定位根因；新核心逻辑优先补测试。
5. 完成前运行真实测试/构建/类型检查/lint，并审阅 diff。
6. 未执行的验证不得声称已通过。

## Git 默认策略

用户未另行指定时：

- 确定 `origin` 的真实默认分支，不假设一定是 `main`。
- 默认直接向默认分支交付，不创建 feature branch，不创建 PR。
- 开始前检查并保护用户已有未提交修改。
- 推送前 fetch；远端前进时安全同步/rebase并重新验证。
- 只提交当前任务相关变更。
- 禁止 force push。
- 验证通过后直接执行 `git push origin HEAD:<default-branch>`。
- 如果分支保护/权限阻止直推，明确报告，不绕过保护。

详细规则以 `AI_SKILLS.md` 和 `repository-development` Skill 为准。
