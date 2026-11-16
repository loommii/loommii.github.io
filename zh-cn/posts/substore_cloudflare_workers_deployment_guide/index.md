# 零服务器部署 Sub-Store：Cloudflare Workers 免费方案实战


## 前言

Sub-Store 是代理圈最流行的订阅管理工具，支持 Clash / Surge / QX / Loon / sing-box 等几乎所有格式的转换、节点管理、固定订阅链接等功能。

但它传统上跑在本地 / NAS / 软路由上。如果你没有一直开机的服务器、不想为一个小工具买 VPS，那么 **Cloudflare Workers 免费版** 是最理想的归宿：免费额度充足（10 万请求/天）、边缘网络速度快、国内走 CDN 可直连。

本文介绍如何用 `Yu9191/sub-store-workers` 这个项目，在 Cloudflare 上免费部署一个完整可用的 Sub-Store。

<!--more-->

## 项目简介

`Yu9191/sub-store-workers` 是 **Sub-Store 后端的 Cloudflare Workers/Pages 移植版**。它只写了约 9 个平台适配文件，直接打包复用原始 Sub-Store（50k+ ⭐）的全部业务逻辑：

- **KV 持久化**：数据存在 Cloudflare KV，纯读请求零 KV 写入，不会超免费额度
- **脚本沙箱**：用 QuickJS WASM 在 Workers 上安全执行用户自定义脚本（Workers 禁止 `eval`）
- **内置鉴权**：路径前缀密码，防公开管理
- **Cron 定时**：每天自动同步订阅到 Gist

> 因为构建时要读取 `../Sub-Store/backend/src` 的核心源码，所以部署需要**两个仓库并排克隆**，这也是它不能像其他项目那样一键部署的原因。

## 部署实战：从零到上线

### 前置准备

- 一个 **Cloudflare 账号**（免费）
- 本机 Node.js 18+（我用的是 22）
- 可选：一个托管在 Cloudflare 的域名（国内访问更稳）

### 1. 克隆仓库（必须两个并排）

```bash
# 目录结构必须如下：
# parent/
#   ├── Sub-Store/          ← 原始后端源码
#   └── sub-store-workers/  ← 本项目

git clone https://github.com/sub-store-org/Sub-Store.git
git clone https://github.com/Yu9191/sub-store-workers.git

cd sub-store-workers
npm install
```

### 2. 登录 Cloudflare

```bash
npx wrangler login
```

浏览器会弹出 OAuth 授权，允许即可。

### 3. 创建 KV 命名空间

```bash
npx wrangler kv namespace create SUB_STORE_DATA
```

把返回的 `id` 填入 `wrangler.toml`：

```toml
[[kv_namespaces]]
binding = "SUB_STORE_DATA"
id = "你的KV命名空间ID"
```

### 4. 构建 & 部署 Worker

```bash
npm run build          # esbuild 打包 → dist/worker.js
npm run deploy         # 部署 Worker + 注册 Cron
```

部署成功后看到：

```
Uploaded sub-store-workers
Deployed sub-store-workers triggers
  https://sub-store-workers.xxxxxxxx.workers.dev
  schedule: 55 15 * * *
```

### 5. 设置访问密码（必做！）

不设密码 = 任何人都能管理你的订阅数据。

```bash
npm run rotate-secret:sh
```

脚本会生成 32 位随机密码，自动写入 Worker Secret，并复制到剪贴板。

> 如果本机配置了 HTTP 代理环境变量导致脚本报错，先 `unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY all_proxy ALL_PROXY` 再运行。
> 记录下这个密码，后面连接前端要用。

### 6. 部署 Pages（国内可直连）

`*.workers.dev` 在国内被 GFW 封锁，但 `*.pages.dev` 走 Cloudflare CDN 通常可直连：

```bash
npx wrangler pages project create sub-store --production-branch main
npm run deploy:pages
```

### 7. 给 Pages 绑定 KV 和密码

> ⚠️ `wrangler.toml` 里的 `[[kv_namespaces]]` 只对 Worker 生效，**Pages 必须在 Dashboard 手动绑定**，否则 API 会报 500。

在 Cloudflare Dashboard：

1. **Workers 和 Pages → sub-store → 设置 → 绑定** → 添加 KV 命名空间
   - 变量名：`SUB_STORE_DATA`
   - 选择之前创建的 KV
2. **设置 → 变量和密钥** → 添加密钥
   - 变量名：`SUB_STORE_FRONTEND_BACKEND_PATH`
   - 值：`/你的密码`（必须带 `/` 开头，类型选 Secret）
3. **保存后必须重新部署**：`npm run deploy:pages`

### 8. 绑定自定义域名（可选但推荐）

有域名且托管在 Cloudflare 的话，给 Pages 绑一个子域名，彻底摆脱被墙风险：

```
Workers 和 Pages → sub-store → 自定义域 → 设置自定义域
输入：substore.example.com
```

注意事项：

- 同一个域名不能同时绑 Worker 和 Pages。Worker 负责 Cron，Pages 负责对外 API，绑 Pages 即可
- 免费 SSL 证书只覆盖一级子域名：`substore.example.com` ✅；`a.b.example.com` ❌ 会 `ERR_CONNECTION_CLOSED`
- 域名 SSL/TLS 加密模式记得设为 **Full**

### 9. 连接前端

打开官方前端 [sub-store.vercel.app](https://sub-store.vercel.app)，后端地址填：

```
https://substore.example.com/你的密码
```

> 末尾的 `/密码` 不能省略，否则所有 API 返回 401。

连接成功后，就能像完整版 Sub-Store 一样：添加订阅、勾选节点、生成**固定订阅链接**（链接不变，随时改节点）、多格式转换、定时同步。

## 成果验收

部署完成后，用 `worker-status` 接口验证：

```bash
curl https://substore.example.com/你的密码/api/utils/worker-status
```

应返回：

```json
{
  "status": "success",
  "data": {
    "runtime": "Cloudflare Workers",
    "kv": { "bound": true },
    "auth": { "backendPathConfigured": true, "managementApiPublic": false },
    "capabilities": {
      "scriptOperator": { "supported": true, "engine": "quickjs" },
      "cron": true
    }
  }
}
```

- `kv.bound: true` → KV 正常
- `managementApiPublic: false` → 鉴权生效
- 无密码访问 `/api/*` → 返回 **401**

## 总结

| 维度 | 结论 |
|:--|:--|
| 成本 | **0 元**（Cloudflare 免费额度足够个人使用）|
| 功能 | 等于完整版 Sub-Store（复用 50k+ ⭐ 项目）|
| 部署时间 | 熟练后 15 分钟 |
| 稳定性 | KV 读写优化 + 边缘缓存，不会超免费配额 |
| 国内访问 | 自定义域名 / pages.dev 均可直连 |

**最大的收益**：把订阅管理从"本地工具"变成"云服务"，手机、电脑、任何地方随时管理，链接稳定不变。

如果不想用官方前端，也可以直接用 `substore.example.com/你的密码/api/sub/...` 的 REST API 配合脚本自动化。


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/posts/substore_cloudflare_workers_deployment_guide/  

