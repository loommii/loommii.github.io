---
date: '2025-04-11T21:58:44+08:00'
draft: false
title: 'mac版本 Joplin 笔记与配置信息存储更改'
---

>Joplin 的官方 GUI 并未提供修改存储位置的选项，需要通过启动参数来进行修改。

![alt text](image.png)

由于笔者购买的是存储仅为 256GB 的”丐版“” Mac mini，而笔记内容占用的空间较大，因此希望将存储路径更改为 NAS 网络卷。

## 启动命令

```
open -a /Applications/Joplin.app --args --profile /Volumes/mac_data/joplin/note
```
**需要修改的部分：**
- /Applications/Joplin.app：替换为你自己的 Joplin 应用程序路径。
- /Volumes/mac_data/joplin/note：替换为你希望使用的存储路径。

在 Mac 的终端中输入修改后的命令并执行时，你会看到它会尝试启动 Joplin 应用并使用指定的存储路径。

## 创建启动程序

打开Mac自带的`自动操作`程序

![alt text](image-1.png)
选择`应用程序`
![alt text](image-2.png)
在操作中选择`运行Shell脚本`
![alt text](image-3.png)
将启动命令输入右侧输入框
![alt text](image-4.png)
点击左上角存储
![alt text](image-5.png)
修改程序名称并存储到`应用程序`
![alt text](image-6.png)
到这里你将看到`启动台`中多了刚刚保存的应用程序!![alt text](image-7.png)
点击程序验证一下效果

## 修改启动程序图标

在`访达` -> 应用程序 中找到刚刚创建的`启动程序`
右键 -> 显示简介
![alt text](image-8.png)
将下载的图标拖入替代老的机器人图标
![alt text](image-9.png)
![alt text](image-10.png)

### 下面是Joplin的LOGO

![alt text](image-11.png)