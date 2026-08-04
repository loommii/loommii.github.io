# Deploying Sub-Store on Cloudflare Workers: A Zero-Server Guide


## Introduction

Sub-Store is the most popular subscription manager in the proxy community. It supports conversion to almost every client format — Clash / Surge / QX / Loon / sing-box — plus node management and stable subscription links.

Traditionally it runs as a Node.js app on a local machine, NAS, or router. If you have no always-on server and don't want to buy a VPS for a small tool, the **Cloudflare Workers free tier** is the ideal destination: generous free quota (100k requests/day), fast edge network, and direct access from mainland China via CDN.

This article explains how to deploy a fully functional Sub-Store for free on Cloudflare using the `Yu9191/sub-store-workers` project.

<!--more-->

## About the Project

`Yu9191/sub-store-workers` is **a Cloudflare Workers/Pages port of the Sub-Store backend**. It writes only ~9 platform adaptation files and bundles all the business logic of the original Sub-Store (50k+ ⭐) with zero modification:

- **KV persistence**: data stored in Cloudflare KV; pure read requests perform zero KV writes, so the free quota is never exceeded
- **Script sandbox**: runs user custom scripts safely on Workers via QuickJS WASM (Workers forbids `eval`)
- **Built-in auth**: path-prefix password to prevent public management
- **Cron scheduling**: automatically syncs subscriptions to Gist daily

> Because the build script reads core source from `../Sub-Store/backend/src`, deployment requires **cloning both repos side by side** — which is also why it can't be one-click deployed like other projects.

## Deployment Walkthrough: From Zero to Live

### Prerequisites

- A **Cloudflare account** (free)
- Node.js 18+ locally (I used 22)
- Optional: a domain hosted on Cloudflare (more stable access from China)

### 1. Clone the Repos (Both, Side by Side)

```bash
# Directory layout must be exactly:
# parent/
#   ├── Sub-Store/          ← original backend source
#   └── sub-store-workers/  ← this project

git clone https://github.com/sub-store-org/Sub-Store.git
git clone https://github.com/Yu9191/sub-store-workers.git

cd sub-store-workers
npm install
```

### 2. Log in to Cloudflare

```bash
npx wrangler login
```

A browser OAuth prompt will appear — just approve it.

### 3. Create the KV Namespace

```bash
npx wrangler kv namespace create SUB_STORE_DATA
```

Fill the returned `id` into `wrangler.toml`:

```toml
[[kv_namespaces]]
binding = "SUB_STORE_DATA"
id = "YOUR_KV_NAMESPACE_ID"
```

### 4. Build & Deploy the Worker

```bash
npm run build          # esbuild → dist/worker.js
npm run deploy         # deploy Worker + register Cron
```

On success you'll see:

```
Uploaded sub-store-workers
Deployed sub-store-workers triggers
  https://sub-store-workers.xxxxxxxx.workers.dev
  schedule: 55 15 * * *
```

### 5. Set an Access Password (Mandatory!)

Without a password, anyone can manage your subscription data.

```bash
npm run rotate-secret:sh
```

The script generates a 32-char random password, writes it to the Worker Secret, and copies it to the clipboard.

> If your machine has HTTP proxy environment variables and the script fails, first run `unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY all_proxy ALL_PROXY`.
> Save this password — you'll need it to connect the frontend.

### 6. Deploy Pages (Directly Accessible from China)

`*.workers.dev` is blocked by the GFW in mainland China, but `*.pages.dev` goes through the Cloudflare CDN and is usually reachable directly:

```bash
npx wrangler pages project create sub-store --production-branch main
npm run deploy:pages
```

### 7. Bind KV and Password to Pages

> ⚠️ The `[[kv_namespaces]]` in `wrangler.toml` only applies to the Worker. **Pages must be bound manually in the Dashboard**, or the API returns 500.

In the Cloudflare Dashboard:

1. **Workers and Pages → sub-store → Settings → Bindings** → Add a KV namespace
   - Variable name: `SUB_STORE_DATA`
   - Select the KV you created earlier
2. **Settings → Variables and Secrets** → Add a secret
   - Variable name: `SUB_STORE_FRONTEND_BACKEND_PATH`
   - Value: `/YOUR_PASSWORD` (must start with `/`, type: Secret)
3. **After saving you MUST redeploy**: `npm run deploy:pages`

### 8. Bind a Custom Domain (Optional but Recommended)

If you have a domain hosted on Cloudflare, bind a subdomain to Pages to fully escape the GFW block:

```
Workers and Pages → sub-store → Custom domains → Set up a custom domain
Enter: substore.example.com
```

Notes:

- The same domain cannot be bound to both Worker and Pages simultaneously. The Worker handles Cron; Pages handles the public API. Bind Pages only.
- Free SSL certs only cover one-level subdomains: `substore.example.com` ✅; `a.b.example.com` ❌ throws `ERR_CONNECTION_CLOSED`.
- Remember to set the domain's SSL/TLS encryption mode to **Full**.

### 9. Connect the Frontend

Open the official frontend [sub-store.vercel.app](https://sub-store.vercel.app) and enter the backend address:

```
https://substore.example.com/YOUR_PASSWORD
```

> The trailing `/password` cannot be omitted, or every API returns 401.

Once connected, you can do everything the full Sub-Store offers: add subscriptions, select nodes, generate **stable subscription links** (link stays the same while nodes change), multi-format conversion, and scheduled sync.

## Verification

After deployment, verify with the `worker-status` endpoint:

```bash
curl https://substore.example.com/YOUR_PASSWORD/api/utils/worker-status
```

Expected response:

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

- `kv.bound: true` → KV is OK
- `managementApiPublic: false` → auth is active
- Accessing `/api/*` without the password → returns **401**

## Summary

| Dimension | Conclusion |
|:--|:--|
| Cost | **$0** (Cloudflare free tier is enough for personal use) |
| Features | Equivalent to full Sub-Store (reuses a 50k+ ⭐ project) |
| Deployment time | ~15 minutes once familiar |
| Stability | KV write optimization + edge caching, never hits the free quota |
| China access | Custom domain / pages.dev both reachable directly |

**The biggest win**: turning subscription management from a "local tool" into a "cloud service" — manageable from your phone, laptop, anywhere, with stable links that never change.

If you'd rather not use the official frontend, you can also script against the REST API directly: `substore.example.com/YOUR_PASSWORD/api/sub/...`.


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/substore_cloudflare_workers_deployment_guide/  

