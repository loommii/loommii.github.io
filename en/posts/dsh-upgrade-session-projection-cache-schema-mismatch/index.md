# DSH Upgrade Failure: Session-Projection-Cache Schema Incompatibility Troubleshooting and Fix


<!--more-->

## Background

On 2026-09-02, after upgrading DSH (DeepSeek Harness) from `v0.1.1-rc.2` to `v0.1.2-alpha.4`, `dsh web` failed on startup.

## Error Symptoms

```
Error: dsh: plugin tree failed to load: failed to apply loader entry include (cordis:include):
failed to apply loader entry session-projection-cache (@deepseek-ai/dsh-session-projection-cache):
domain 'session_projcache': stored record '70a4ea7c-4901-463d-ae23-a95e512dc090'
in table 'sessions' does not match its schema
```

Zod validation error:

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

## Solution

Backup and remove `~/.dsh/storages/` to let DSH rebuild the cache index:

```bash
DSH_HOME="${DSH_HOME:-$HOME/.dsh}"

mv "$DSH_HOME/storages" \
   "$DSH_HOME/storages.bak.$(date +%Y%m%d%H%M%S)"

dsh web
```

**Note**: This clears the cache index only. Conversation records (`~/.dsh/sessions/`) are unaffected.

## Root Cause Analysis

### DSH Storage Architecture

| Layer | Path | Content |
|-------|------|---------|
| **Real Data** | `~/.dsh/sessions/` | Full conversation logs (`.jsonl.zstd`) |
| **Cache/Index** | `~/.dsh/storages/` | Projection cache, workspace metadata |

### Schema Change

The `session-projection-cache` plugin's `checkpointIdentity` schema added two required fields:

```typescript
export const checkpointIdentity = z.object({
  createdAt: z.number(),
  cwd: z.string().optional(),
  isSeeded: z.boolean(),        // ← NEW required
  inheritedEventCount: z.number(), // ← NEW required
});
```

| Field | Type | Description |
|-------|------|-------------|
| `isSeeded` | `boolean` | Whether the session has been seeded from logs |
| `inheritedEventCount` | `number` | Event count inherited from parent session |

Old cached data lacks these fields, so the deserialized values are `undefined`. In Zod strict mode, `z.boolean()` and `z.number()` reject `undefined`, causing the plugin to fail to load and ultimately preventing `dsh web` from starting.

## Verification

After applying the solution, run `dsh web` and observe the startup log:

```bash
dsh web
```

Expected output should include `Local: http://127.0.0.1:xxxxx` with no `does not match its schema` error.

---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/dsh-upgrade-session-projection-cache-schema-mismatch/  

