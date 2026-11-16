# Integrating the Giscus Comment System With Your HUGO Blog


## Introduction

For any personal blog, a comment system is a vital bridge for connecting with readers, gathering feedback, and fostering discussion. An active comment section not only enhances site interactivity but also provides a powerful source of motivation for content creators.

While many comment systems exist—such as the veteran Disqus or GitHub Issues-based tools like Gitalk and Utterances—they often come with drawbacks. Disqus, for instance, is known for ads and privacy-invading trackers, while Gitalk and Utterances can "pollute" your repository's Issues section.

This article introduces a more ideal alternative: **Giscus**.

**Giscus** is a modern comment system powered by **GitHub Discussions**. It's open-source, free, ad-free, and privacy-focused. Crucially, it keeps comments neatly separated from your codebase's Issues, making it a perfect fit for technical blogs.

Next, I'll walk you through the entire process of integrating Giscus into your HUGO blog, using the LoveIt theme as an example.

## Prerequisites

Before you begin, please ensure you have the following:

1.  A functioning HUGO-based personal blog.
2.  Your blog's source code hosted in a **public** GitHub repository.
3.  A GitHub account.

## Step 1: Configure Your GitHub Repository and the Giscus App

Giscus uses your repository's Discussions feature to store comments and requires permission via a GitHub App to post on your behalf.

### 1.1 Enable GitHub Discussions

Your comment data will live in your repository's Discussions, so you first need to activate this feature.

1.  Navigate to your blog's source code repository on GitHub.
2.  Click the **Settings** tab in the upper-right corner.
3.  On the **General** settings page, find the **Features** section.
4.  Check the **Discussions** box to enable it.

![alt text](github-repo-settings-enable-discussions-1.png)
![alt text](github-repo-settings-enable-discussions-2.png)

For better organization, it's a good idea to create a dedicated category for blog comments:

1.  Switch to your repository's **Discussions** tab.
2.  Click the small pencil icon next to **Categories** on the right to edit them.
3.  Click **New category**, give it a name (e.g., `Comments`), and make sure to select **"This category is for announcements."** so that Giscus can use it properly.

### 1.2 Install the Giscus GitHub App

Giscus needs access to your repository through a GitHub App.

1.  Go to the [Giscus GitHub App page](https://github.com/apps/giscus).
2.  Click the **Install** button.

![alt text](giscus-app-install-button.png)

3.  Select the repository for your blog where you want to enable Giscus, then click **Install**.

![alt text](giscus-app-select-repo-and-install.png)

## Step 2: Configure Giscus and Get Parameters

Next, we'll generate the necessary configuration details on the official Giscus website.

1.  Visit [giscus.app](https://giscus.app/).
2.  Scroll down to the configuration section.

![alt text](giscus-website-config-section-overview.png)

3.  **Repository**: Enter your GitHub repository path in the `username/repo` format.

![alt text](giscus-website-config-enter-repo.png)

4.  **Page ↔️ Discussion Mapping**: This is a core Giscus feature. To ensure the same comment thread appears on a post across multiple deployments (e.g., GitHub Pages and Cloudflare Pages), it is highly recommended to choose **"Discussion title contains page `<title>`"**.
5.  **Discussion Category**: Select the category you created in the previous step (e.g., `Comments` or `Announcements`).
6.  **Features**: Enable features as needed, such as loading comments on demand.
7.  **Theme**: We recommend selecting `preferred_color_scheme`, which allows the Giscus widget to automatically switch between light and dark modes based on the visitor's system settings.

After completing these steps, the site will automatically generate a `<script>` tag.

![alt text](giscus-website-config-generated-script.png)

However, for a well-integrated theme like LoveIt, you **do not** need to copy the entire script. You only need to extract a couple of key pieces of information:

- `data-repo-id`
- `data-category-id`

Copy these two IDs; they are crucial for the next step.

### A Quick Note: Why Not Use the `<script>` Tag Directly?

An observant reader might ask: "If the Giscus site generates a full `<script>` tag, why go through the trouble of re-configuring it in `params.toml`?"

That's an excellent question, and the answer lies in a core design principle of modern web development: **separation of concerns** (specifically, separating configuration from view).

- **View (Layout)**: The theme's HTML template files, which define the structure of your web pages.
- **Configuration (Config)**: Files like `hugo.toml` and `params.toml`, which provide all the variable data and settings.

The LoveIt theme already includes the template logic (the view) to load Giscus. Our job is simply to provide the settings (the configuration) via `params.toml` to tell the theme *how* to generate the comment section.

The benefits of this approach are significant:
1.  **Easy Maintenance**: If you want to change your Giscus settings, you only need to edit one configuration file, not dig through complex HTML.
2.  **Clarity**: All your settings are managed in one central, easy-to-read location.
3.  **Seamless Upgrades**: When you update the LoveIt theme in the future, your personal configurations will remain untouched and continue to work.

The `data-*` attributes in the Giscus `<script>` tag map cleanly to the fields in `params.toml`:

| `data-*` Attribute | `params.toml` Key | Description |
| :--- | :--- | :--- |
| `data-repo` | `repo` | Repository path |
| `data-repo-id` | `repoId` | Repository ID |
| `data-category` | `category` | Category name |
| `data-category-id`| `categoryId` | Category ID |
| `data-mapping` | `mapping` | Mapping strategy |
| `data-lang` | `lang` | Display language |
| `data-theme` | `theme` | Widget theme |
| `...` | `...` | Other params follow the same pattern |

With this understanding, we're ready to update our configuration.

## Step 3: Update the HUGO Configuration File

Now, let's add the Giscus settings to your blog's configuration.

1.  Open the `config/_default/params.toml` file in your project.
2.  Add the following block to the end of the file, filling it in with the information you just obtained:

```toml
# config/_default/params.toml

# Page comment system configuration
[page.comment]
  enable = true
  # Giscus comment system
  [page.comment.giscus]
    enable = true
    # Your GitHub repository, format: "username/repo"
    repo = "loommii/blog" # Replace with your repository
    # Your repository ID, obtained from the Giscus website
    repoId = "R_kgDOMf05fA" # Replace with your repo ID
    # The discussion category you created for comments
    category = "Announcements" # Replace with your category name
    # Your category ID, obtained from the Giscus website
    categoryId = "DIC_kwDOMf05fM4ChU0g" # Replace with your category ID
    # Page-to-discussion mapping, "title" is highly recommended
    mapping = "title"
    # Other configurations
    strict = "0"
    reactionsEnabled = "1"
    emitMetadata = "0"
    inputPosition = "bottom"
    # Widget language
    lang = "en"
    # Comment box theme, "preferred_color_scheme" auto-switches based on user's system settings
    theme = "preferred_color_scheme"
    loading = "lazy"
```

**Be sure to replace `repo`, `repoId`, `category`, and `categoryId` with your own information.**

## Step 4: Verify the Results

After saving the configuration file, restart the local HUGO server:

```bash
hugo server
```

Now, open any blog post and scroll to the bottom. If everything went well, you should see the Giscus comment box successfully loaded. It will prompt you to log in via GitHub to authorize the app, after which you can start commenting.

## Advanced: Solving Inconsistent Comments in a Multi-Language Setup

After publishing your article, you might switch between language versions and notice a major issue: **the comment sections for the Chinese and English articles are separate, and their data is not shared.** This defeats our goal of having a unified comment thread.

### Reproducing the Problem

For example, you might see that Giscus has created a separate Discussion for the Chinese version of the article based on its path:

![Separate comment section created by the Chinese article](multi-language-issue-chinese-comment-pool.png)

At the same time, it has created another, completely independent Discussion for the English version:

![Separate comment section created by the English article](multi-language-issue-english-comment-pool.png)

### Root Cause

The root of this problem lies in the `mapping` strategy within your Giscus configuration. If you use `mapping = "pathname"`, Giscus finds or creates a Discussion based on the page's URL path. In a multi-language site, the paths for the same article are different due to language prefixes (e.g., `/zh-cn/` and `/en/`), causing Giscus to mistakenly treat them as two different articles.

### The Solution: Use a Unique Identifier

To solve this, we need to provide a **unique and consistent identifier** for all language versions of the same article. Giscus's `specific` mapping mode is designed for exactly this purpose.

#### Step 1: Modify Front Matter

In the Front Matter of **both the Chinese (`index.md`) and English (`index.en.md`) versions** of your guide, add the same `giscus_id` field. The value of this ID can be any string that uniquely identifies this article.

```yaml
# --- Article Front Matter ---
title: "Integrating the Giscus Comment System with Your HUGO Blog"
giscus_id: "hugo-giscus-comments-guide" # Ensure this is identical across language versions
date: ...
# ...
---
```

#### Step 2: Modify the `params.toml` Configuration File

Next, update your Giscus configuration to use this new field as the mapping key.

```toml
# --- config/_default/params.toml ---
[page.comment.giscus]
  ...
  # Set mapping to "specific" and specify the Front Matter field name in 'term'
  mapping = "specific"
  term = "giscus_id"
  ...
```

After making these two changes, Giscus will use the unique ID `hugo-giscus-comments-guide` to link the comment section, a-giscus-comments-to-hugo-blognsuring that both the Chinese and English articles share the same comment pool.

## Conclusion

By following these steps, we have successfully integrated a powerful and privacy-respecting Giscus comment system into our HUGO blog. This not only enhances the interactive experience but also makes comment management incredibly straightforward.

Choosing Giscus is choosing a solution that aligns perfectly with the open-source spirit and the developer community. Hopefully, this guide has been helpful!

---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/add-giscus-comments-to-hugo-blog/  

