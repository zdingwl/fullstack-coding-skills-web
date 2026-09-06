# Repository-Native AI Development Skills

这套内容不是网页工具，而是**直接放进真实代码项目 Git 仓库**的 AI 开发规则与技能手册。

目标：Codex / Claude Code 进入仓库后自动读取项目规则，按任务自动选择需求分析、代码库分析、前后端、数据库、API、TDD、Debug、Review、安全、验收等技能，开发完成并验证通过后**直接 commit + push 到 origin 的真实默认分支**。

## 仓库内的关键结构

```text
AGENTS.md                         # Codex 自动读取的仓库规则
CLAUDE.md                         # Claude Code 仓库规则
AI_SKILLS.md                      # 完整专业技能手册 / 权威正文

.agents/skills/
├── repository-development/       # 所有代码任务的总控 Skill
├── fullstack-development/
├── requirement-analysis/
├── codebase-analysis/
├── architecture-design/
├── implementation-planning/
├── frontend-development/
├── backend-development/
├── database-development/
├── api-development/
├── test-driven-development/
├── systematic-debugging/
├── webapp-testing/
├── code-review/
├── security-review/
├── refactoring/
├── performance-optimization/
├── dependency-upgrade/
├── git-workflow/
├── ci-cd-debugging/
├── observability-development/
├── release-delivery/
├── verification-before-completion/
└── default-branch-delivery/

.claude/skills/                  # Claude 项目 Skills（本模板仓库用链接减少重复）
```

专业 Skill 的 `description` 用于自动匹配任务；技能正文统一路由到 `AI_SKILLS.md`，避免多份长手册维护后内容不一致。

## 为什么这样能自动读取

### Codex

Codex 会在工作开始前读取仓库 `AGENTS.md`，并自动发现仓库根目录 `.agents/skills/*/SKILL.md`。`AGENTS.md` 又强制规定：凡是代码修改任务必须先加载 `repository-development` 总控，再按任务使用专业 Skill。

### Claude Code

Claude Code 会发现项目级 `.claude/skills/*/SKILL.md`，并根据每个 Skill 的 `description` 判断何时自动加载。`CLAUDE.md` 同时规定仓库的统一开发和 Git 交付策略。

## 安装到真正的代码项目

最推荐的方式是把规则和 Skills **提交到每个目标项目仓库本身**，不要仅仅把本仓库当远程说明书，也不建议只做 Git submodule；项目根目录内置才能获得最稳定的自动发现行为。

### macOS / Linux

克隆本仓库，然后：

```bash
./install-to-project.sh /path/to/your-project
```

### Windows PowerShell

```powershell
.\install-to-project.ps1 -ProjectPath D:\path\to\your-project
```

安装器会把 `.agents/skills` 的完整技能集作为**物理文件**分别复制到目标项目的 `.agents/skills` 和 `.claude/skills`，因此 Windows 不依赖 symlink 支持。

然后把这些文件提交到目标项目的默认分支。

## 开发时 AI 的默认闭环

```text
进入项目仓库
  ↓
自动读取 AGENTS.md / CLAUDE.md
  ↓
加载 repository-development
  ↓
Codebase Analysis
  ↓
根据任务自动匹配专业 Skills
  ↓
实施代码修改
  ↓
TDD / Debug / Browser Test / Review / Security（按需）
  ↓
Verification Before Completion
  ↓
Default Branch Delivery
  ↓
确认 origin 默认分支
  ↓
fetch / 安全同步
  ↓
commit
  ↓
git push origin HEAD:<default-branch>
```

## Git 默认策略

- 不硬编码 `main` / `master`，读取 `origin` 的真实默认分支。
- 默认直接向默认分支交付。
- 默认不创建 feature branch、worktree 或 Pull Request。
- 推送前必须运行适用测试/构建/类型检查/lint并审阅最终 diff。
- 如果远端前进，fetch + 安全 rebase/同步后重新验证。
- 禁止 force push。
- 不能覆盖或混入用户与当前任务无关的修改。
- 如果 branch protection / 权限 / Git 凭证阻止直推，必须真实报告，不能绕过，也不能假装 push 成功。

> 技能可以强制 AI **尝试直接 push 默认分支**，但最终能否写入仍取决于执行 AI 的 Git 环境是否有该仓库的写权限和凭证，以及默认分支是否允许直接 push。

## 实际使用示例

在已经安装本套规则的项目根目录启动 Codex/Claude Code，然后只需要正常下需求：

```text
在现有订单系统增加询价单功能，复用普通采购单现有架构。
完成数据库、后端 API 和前端页面，并跑完相关测试。
```

AI 应按仓库规则自动分析现有代码、选择对应 Skills、实现和验证，最后直接提交并推送默认分支，而不是让你每次手工粘贴整套提示词。
