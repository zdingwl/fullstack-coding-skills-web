# Repository AI Development Skills

这不是一个网页项目，而是一套**直接放进开发项目 Git 仓库**的 AI 开发技能与仓库规则。

目标：AI 打开/克隆项目仓库后，自动读取仓库内的开发规范和技能手册，按统一软件工程流程完成开发，并在验证通过后**直接提交并推送到仓库默认分支**。

## 支持的自动读取方式

### OpenAI Codex

Codex 会自动读取仓库根目录的 `AGENTS.md`，并发现：

```text
.agents/skills/<skill-name>/SKILL.md
```

本仓库已提供：

```text
AGENTS.md
.agents/skills/repository-development/SKILL.md
AI_SKILLS.md
```

### Claude Code

Claude Code 会发现项目级：

```text
.claude/skills/<skill-name>/SKILL.md
```

本仓库同时提供：

```text
CLAUDE.md
.claude/skills/repository-development/SKILL.md
AI_SKILLS.md
```

## 正确用法

把以下内容复制到**真正需要开发的项目仓库根目录**：

```text
AGENTS.md
CLAUDE.md
AI_SKILLS.md
.agents/
.claude/
```

或者克隆本仓库后运行安装脚本：

### macOS / Linux

```bash
./install-to-project.sh /path/to/your-project
```

### Windows PowerShell

```powershell
./install-to-project.ps1 -ProjectPath D:\path\to\your-project
```

然后在目标项目根目录启动 Codex / Claude Code。

## AI 默认开发流程

```text
读取仓库规则
  ↓
加载 repository-development Skill
  ↓
分析代码库与现有实现
  ↓
根据任务选择 AI_SKILLS.md 中的专业技能
  ↓
制定最小充分实施计划
  ↓
编码 / 数据库 / API / 前端
  ↓
测试 / Debug / Review / Security
  ↓
完成前验证
  ↓
确认 origin 默认分支
  ↓
commit
  ↓
git push origin <default-branch>
```

## 默认 Git 策略

- 默认直接在仓库**默认分支**完成交付。
- 不默认创建 feature branch。
- 不默认创建 Pull Request。
- 禁止 force push。
- 推送前必须运行与改动匹配的测试/构建/检查。
- 如果远端有新提交，先 fetch/rebase，重新验证后再推送。
- 如果 branch protection 阻止直推，停止并明确报告，不绕过保护规则。
- 永远不得覆盖用户已有、与当前任务无关的未提交修改。

> 注意：技能手册可以要求 AI 执行 `git push`，但真正能否推送仍取决于 AI 运行环境是否具有 GitHub 写权限/凭证，以及默认分支是否允许直接推送。

## 技能体系

`AI_SKILLS.md` 内置 22 类工程能力：需求分析、代码库分析、架构、实施计划、前端、后端、数据库、API、TDD、系统调试、浏览器测试、代码审查、安全审查、重构、性能、依赖升级、Git、CI/CD、可观测性、发布交付和完成前验证等。

仓库级 `repository-development` Skill 负责自动选择并串联这些能力。
