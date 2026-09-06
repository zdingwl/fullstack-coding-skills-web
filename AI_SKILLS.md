# AI Software Development Skills Manual

本文件是仓库内 AI 开发的专业技能手册。不要机械执行全部章节；先通过技能路由选择当前任务真正需要的部分。

## 0. 技能路由表

| 任务 | 必须/建议技能 |
|---|---|
| 任意已有项目开发 | Codebase Analysis、Verification、Default Branch Delivery |
| 新功能 | Requirement Analysis、Implementation Planning、对应领域开发、TDD、Code Review |
| 跨模块/复杂功能 | Architecture Design |
| Bug/异常 | Systematic Debugging、Regression Test |
| 前端/UI | Frontend Development、Webapp Testing |
| 后端业务 | Backend Development |
| DB/SQL/ORM | Database Development |
| API/Webhook | API Development |
| 重构 | Refactoring |
| 安全敏感 | Security Review |
| 性能问题 | Performance Optimization |
| 依赖升级 | Dependency Upgrade |
| CI 失败 | CI/CD Debugging |
| 日志/指标 | Observability Development |
| 上线/迁移 | Release Delivery |

---

## 1. Requirement Analysis｜需求分析

**使用时机**：需求模糊、角色/状态/异常较多、业务规则复杂、新模块。

### 流程
1. 提取用户目标和用户可见结果。
2. 明确范围内 / 范围外。
3. 明确角色、权限、状态、前置条件、主流程、异常流程。
4. 把模糊描述转换成可测试的验收标准。
5. 标出必须从代码/数据确认的未知项，不凭空补业务规则。

### 输出
目标、范围、业务规则、异常/边界、验收标准、待确认项。

---

## 2. Codebase Analysis｜代码库分析

**任何陌生项目或中大型改动的强制技能。**

### 流程
1. 读取 README、包管理、构建配置、环境配置和目录结构。
2. 识别框架、语言、依赖、启动/测试/build/typecheck/lint 命令。
3. 从 route/page/controller/handler/service/model/repository 等入口追真实调用链。
4. 找 1–3 个相似已实现功能，学习项目既有模式。
5. 追踪输入 → 校验 → 业务逻辑 → 持久化 → 输出的数据流。
6. 列直接修改点、间接依赖、公共契约、数据库、缓存、消息、配置和测试影响。

### 禁止
只凭文件名猜架构；没读调用方就改公共接口；重新发明仓库已有模式。

---

## 3. Architecture Design｜架构设计

**使用时机**：跨模块、新边界、大数据变更、同步/异步选择、长期扩展点。

### 流程
1. 写清约束和非目标。
2. 给出最小可行方案，必要时比较 2–3 个方案。
3. 明确模块职责、数据拥有权、同步/异步边界、接口契约。
4. 分析一致性、幂等、重试、失败恢复、安全和可观测性。
5. 说明迁移、兼容、回滚策略。

优先与现有架构一致，不因“理论更漂亮”引入无必要的新层/新服务。

---

## 4. Implementation Planning｜实施计划

**M/L/XL 任务必须使用。**

每一步至少写：目标、具体文件/符号、修改内容、依赖关系、验证方式。

顺序优先按可验证切片，而不是“先把所有后端写完再做前端”。计划要足够具体到另一个工程师可以执行。

---

## 5. Frontend Development｜前端开发

1. 先找项目已有页面、组件、设计 token、请求封装和状态管理模式。
2. 区分 server state / client state / URL state，避免复制状态源。
3. 覆盖 loading、empty、error、disabled、success 等真实状态。
4. 表单明确校验时机、提交中状态、防重复提交和服务端错误映射。
5. 复用现有组件，避免同项目内第二套 UI 体系。
6. 考虑响应式、键盘操作、焦点、语义标签和基本可访问性。
7. UI 改动尽可能做真实浏览器验证。

---

## 6. Backend Development｜后端开发

1. 从真实 handler/controller 追到 service/domain/repository。
2. 权限、业务校验、状态转换放在可信服务端边界。
3. 事务覆盖完整原子业务单元，避免事务内慢外部 I/O。
4. 明确 idempotency、重试、并发和状态机规则。
5. 错误类型与 HTTP/RPC 映射遵循项目惯例。
6. 日志包含必要上下文，但不得输出 token/password/敏感数据。
7. 核心规则必须有测试或可重复验证。

---

## 7. Database Development｜数据库开发

1. 先读现有 schema、migration、ORM model、索引和查询路径。
2. 设计列类型、NULL/default、约束、唯一性、外键和索引。
3. migration 同时考虑新库和已有生产数据。
4. 大表操作评估锁表、回填、批处理和在线变更风险。
5. 查询从访问模式出发，避免 N+1、无界列表和错误索引。
6. 关键写操作考虑事务、一致性、并发和幂等。
7. destructive migration 必须有备份/回滚或明确不可逆说明。

---

## 8. API Development｜接口开发

1. 先读项目现有 envelope、错误码、分页、鉴权和版本策略。
2. 明确 method/path、request/response schema、状态码和错误模型。
3. 服务端严格校验类型、格式、范围、枚举、权限和资源归属。
4. 更新接口明确 PUT/PATCH 语义和 omitted/null/empty 的差异。
5. 重试可能发生的写接口考虑幂等。
6. 修改已有 contract 前搜索全部调用方并评估兼容性。
7. 同步更新测试、类型、schema/OpenAPI（项目存在时）。

---

## 9. Test Driven Development｜测试驱动

核心循环：RED → GREEN → REFACTOR。

1. 先写一个描述行为的最小测试。
2. 运行并确认它因预期原因失败。
3. 写最少实现使其通过。
4. 运行相关测试。
5. 在绿色状态下重构。
6. 再运行局部和适当范围回归。

Bug 修复至少应有能复现原问题的回归测试（可测试时）。避免只测 mock 调用次数而不测行为。

---

## 10. Systematic Debugging｜系统化调试

**铁律：没找到根因，不开始随机修。**

1. 稳定复现并记录输入、环境、预期/实际结果。
2. 收集 stack trace、日志、网络、SQL、状态和最近变更证据。
3. 沿数据/调用链找“最后正确点”和“第一个错误点”。
4. 形成可证伪假设，一次只验证一个变量。
5. 找到 root cause 后设计最小修复。
6. 修复后跑原始复现 + 回归测试 + 相关检查。

禁止通过吞异常、删除断言、增加任意 sleep 等方式掩盖根因。

---

## 11. Webapp Testing｜Web 应用测试

1. 用真实运行环境打开目标页面。
2. 检查首屏、loading、empty、error 和核心数据。
3. 按真实用户路径操作：导航、表单、弹窗、提交、刷新、返回。
4. 检查 Console、Network、失败请求和明显运行时异常。
5. 覆盖关键 viewport 和键盘/焦点交互（适用时）。
6. Bug 修复后必须重走原复现路径。

没有真的打开页面就不能说“浏览器测试通过”。

---

## 12. Code Review｜代码审查

按高风险优先：

1. Correctness：行为、边界、状态、空值、并发、时序。
2. Security：鉴权、授权、输入、注入、secret、敏感数据。
3. Data：事务、一致性、迁移、索引、N+1。
4. API：兼容、错误语义、幂等、调用方。
5. Reliability：超时、重试、错误处理、资源释放。
6. Maintainability：重复、耦合、命名、与项目模式冲突。
7. Tests：关键路径是否真的覆盖。

发现问题时给文件/符号、触发条件、影响和最小修复方向；不要为了凑数量挑纯风格问题。

---

## 13. Security Review｜安全审查

重点追踪：外部输入 → 校验 → 权限 → 敏感操作/数据。

检查：认证绕过、IDOR/资源归属、SQL/command/template injection、XSS、SSRF、路径穿越、上传风险、CSRF/CORS（适用时）、secret 泄露、敏感日志、弱随机数、危险反序列化、依赖风险。

每个 finding 说明可达路径、前置条件、影响和修复；没有证据不要夸大。

---

## 14. Refactoring｜重构

目标是**改变结构，不改变外部可观察行为**。

1. 先定义行为边界并建立测试护栏。
2. 识别真实 smell，而不是凭偏好重写。
3. 每次做小而可逆的结构变化。
4. 每步运行测试。
5. 不在重构提交里混入新功能/语义改变；确需改变时明确拆分。

---

## 15. Performance Optimization｜性能优化

先测量后优化：

1. 定义指标和基线（p95/p99、吞吐、内存、CPU、查询数、bundle 等）。
2. profile 找真正瓶颈。
3. 建立单一主要假设。
4. 做最小优化。
5. 用相同负载复测并比较 before/after。
6. 检查正确性、资源和成本回归。

禁止没有 profile 就大规模“性能重构”。

---

## 16. Dependency Upgrade｜依赖升级

1. 记录当前版本和目标版本，确认升级原因。
2. 阅读 changelog/migration guide（可访问时）。
3. 搜索受 breaking change 影响的用法。
4. 优先小步升级，避免一次混入大量无关包。
5. 更新 lockfile 后执行安装、build、typecheck、lint、tests。
6. 检查运行时行为和安全公告（适用时）。

禁止盲目升级所有依赖只为“保持最新”。

---

## 17. Git Workflow｜Git 安全工作流

1. 先 `git status` / diff，保护用户未提交工作。
2. 不回滚、覆盖、stage 与任务无关的修改。
3. commit 按逻辑边界，信息描述实际变化。
4. 冲突处理必须理解两边意图。
5. 禁止 reset/clean/force push 破坏用户工作。

本仓库额外规定：默认**直接向 origin 默认分支交付**，详见第 22 节。

---

## 18. CI/CD Debugging｜流水线调试

1. 找第一个真正失败的 job/step，不被后续连锁失败干扰。
2. 对比本地/CI 的 OS、runtime、依赖、env、工作目录、缓存和权限。
3. 先复现失败命令，再验证单一假设。
4. 修根因，不用跳过测试、无限重试或关闭检查掩盖。
5. 重新运行相同 job；随后检查依赖它的下游 job。

---

## 19. Observability Development｜可观测性

围绕用户关键路径设计日志/指标/trace，而不是到处 print。

- Log：结构化，包含 request/job/order 等关联 ID；不记录 secret。
- Metrics：少量稳定指标，避免 user_id/order_id 等高基数 label。
- Trace：跨服务/队列/外部请求传播 context。
- Alert：基于用户影响和 SLO，避免瞬时噪声。

---

## 20. Release Delivery｜发布交付

1. 明确 release 内容、依赖、migration、feature flag 和配置变化。
2. 发布前确认 build/test/security/DB 兼容。
3. 数据迁移安排顺序与回滚路径。
4. 上线后检查 health、error rate、latency、关键业务指标。
5. 出现异常按预定义条件回滚或关闭 feature flag。

---

## 21. Verification Before Completion｜完成前验证

**“应该能工作”不是验证。**

在声明完成前：

1. 把用户需求逐条映射到实现。
2. 运行自动测试。
3. 运行适用的 build/typecheck/lint/static checks。
4. Bug 运行原始复现/回归。
5. UI 尽可能运行真实页面流程。
6. 查看最终 `git diff` 和 `git status`。
7. 检查 secret、debug、TODO 占位、生成垃圾和无关修改。
8. 记录命令、退出状态/关键输出、未覆盖项。

无法验证的项目标记为 `NOT RUN`，说明原因。

---

## 22. Default Branch Delivery｜默认分支直接交付

这是当前仓库的默认最终交付技能，每个代码任务都要执行。

### A. 确定默认分支

不要假定 `main` 或 `master`。从 `origin/HEAD` / remote metadata 获取真实默认分支。

### B. 推送前同步

1. `git status`：确认无意外修改。
2. `git fetch origin`。
3. 对比本地 HEAD 与 `origin/<default-branch>`。
4. 如果远端前进，安全 rebase/同步；冲突逐项理解后处理。
5. 同步后重新执行受影响验证。

### C. Commit

- 只 stage 本任务文件。
- 审阅 staged diff。
- commit message 简洁说明功能/修复。
- 不把 secret、临时文件、调试产物带入提交。

### D. 直接 Push

默认执行：

```bash
git push origin HEAD:<default-branch>
```

成功后确认远端包含新 commit，再报告完成。

### E. 失败处理

- non-fast-forward：fetch/rebase → resolve → verify → retry。
- tests fail：修复后再 push，不推已知失败代码。
- branch protection / permission denied：停止并报告真实原因。
- **禁止 force push，禁止偷偷改成 PR 流程，除非用户明确要求。**

---

# 总完成标准

一个任务只有同时满足以下条件才算完成：

- 用户目标已有实际代码实现。
- 必要边界/异常已处理。
- 相关验证有真实证据。
- 最终 diff 已审阅，无无关/危险改动。
- commit 已创建。
- 已成功推送到远端默认分支；若仓库规则客观阻止直推，则明确报告阻塞而不是声称完成。
