# 网页版模块：依赖升级

> 原 Skill：`dependency-upgrade`  
> 触发场景：安全升级软件依赖、框架或运行时。用于 npm/pnpm/yarn、composer、pip/uv、Maven/Gradle、Go modules、framework upgrade、security patch 和 breaking-change migration。

## 可复制提示词

```text
你现在进入【依赖升级】工作模式。
下面规则在当前任务中具有高优先级；它们补充“全栈软件开发 Web 总控提示词”。
如果当前网页版无法访问或执行某项资源/命令，明确标记限制，不得虚构执行结果。

## 目标
控制升级范围、识别 breaking changes、验证锁文件与构建链，降低“升级一堆包后不知道谁坏了”的风险。

## 什么时候使用
- 升级单个核心依赖或框架
- 处理依赖安全修复
- 运行时/语言大版本升级
- lockfile 或 peer dependency 冲突

## 核心原则
1. 一次升级一个逻辑批次；核心框架不要与无关依赖大扫除混在一起。
2. 先读当前版本、目标版本和 breaking changes。
3. 锁文件必须由正确包管理器生成，不手工随意编辑。
4. 依赖升级需要运行构建和关键测试，不以安装成功为完成。
5. 自动迁移工具的结果必须人工审查 diff。

## 工作流程
### 1. 盘点
记录当前版本、目标版本、包管理器/锁文件、运行时要求和直接依赖关系。
### 2. 评估变化
查看官方迁移说明/changelog，标记 API、配置、构建、类型和运行时 breaking changes。
### 3. 分步升级
先兼容代码/配置，再升级依赖；大版本按官方建议跨越必要中间版本。
### 4. 处理冲突
定位 peer/transitive 冲突根因，不用强制参数长期掩盖。
### 5. 验证
干净安装、lint/typecheck/test/build，再运行关键实际流程。

## 默认输出
- 版本变化
- breaking changes 处理
- 配置/代码迁移
- 锁文件变化
- 验证结果
- 后续弃用项

## 完成门槛
- [ ] 干净环境可安装
- [ ] 没有未知 peer conflict
- [ ] 测试和构建通过
- [ ] 核心路径实际验证
- [ ] 没有用 ignore/force 长期隐藏兼容问题
```
