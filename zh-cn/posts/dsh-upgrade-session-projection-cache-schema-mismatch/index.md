# DSH 升级后 Session-Projection-Cache 启动失败：Schema 不兼容排查与修复


<!--more-->

## 背景

2026-09-02，在将 DSH（DeepSeek Harness）从 `v0.1.1-rc.2` 升级到 `v0.1.2-alpha.4` 后，`dsh web` 启动失败。

## 故障现象

```
Error: dsh: plugin tree failed to load: failed to apply loader entry include (cordis:include):
failed to apply loader entry session-projection-cache (@deepseek-ai/dsh-session-projection-cache):
domain 'session_projcache': stored record '70a4ea7c-4901-463d-ae23-a95e512dc090'
in table 'sessions' does not match its schema
```

Zod 验证错误：

```json
ZodError: [
  {
    "expected": "boolean",
    "code": "invalid_type",
    "path": ["identity", "isSeeded"],
    "message": "Invalid input: expected boolean, received undefined"
  },
  {
    "expected": "number",
    "code": "invalid_type",
    "path": ["identity", "inheritedEventCount"],
    "message": "Invalid input: expected number, received undefined"
  }
]
```

## 解决方案

备份并移除 `~/.dsh/storages/` 目录，让 DSH 重建缓存索引：

```bash
DSH_HOME="${DSH_HOME:-$HOME/.dsh}"

mv "$DSH_HOME/storages" \
   "$DSH_HOME/storages.bak.$(date +%Y%m%d%H%M%S)"

dsh web
```

**注意**：此操作清除的是缓存索引，对话记录（`~/.dsh/sessions/`）不受影响。

## 根因分析

### DSH 存储架构

| 层级 | 路径 | 内容 |
|------|------|------|
| **真实数据** | `~/.dsh/sessions/` | 完整对话日志（`.jsonl.zstd`） |
| **缓存/索引** | `~/.dsh/storages/` | 投影缓存、工作区元数据 |

### Schema 变更

`session-projection-cache` 插件的 `checkpointIdentity` schema 新增两个必填字段：

```typescript
export const checkpointIdentity = z.object({
  createdAt: z.number(),
  cwd: z.string().optional(),
  isSeeded: z.boolean(),        // ← 新增必填
  inheritedEventCount: z.number(), // ← 新增必填
});
```

| 字段 | 类型 | 说明 |
|------|------|------|
| `isSeeded` | `boolean` | 标识会话是否已从日志中种子化 |
| `inheritedEventCount` | `number` | 从父会话继承的事件计数 |

旧版本缓存数据不含这两个字段，反序列化后对应值为 `undefined`。Zod 严格模式下 `z.boolean()` 和 `z.number()` 不接受 `undefined`，校验失败导致插件加载异常，最终 `dsh web` 启动失败。

## 验证修复

执行上述方案后，运行 `dsh web` 并观察启动日志：

```bash
dsh web
```

预期输出应包含 `Local: http://127.0.0.1:xxxxx`，无 `does not match its schema` 报错。

---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/posts/dsh-upgrade-session-projection-cache-schema-mismatch/  

