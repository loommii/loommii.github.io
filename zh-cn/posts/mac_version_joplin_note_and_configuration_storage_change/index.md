# Mac版本 Joplin 笔记与配置信息存储更改


<!--more-->

>Joplin 的官方 GUI 并未提供修改存储位置的选项，需要通过启动参数来进行修改。

![Joplin 存储位置信息](joplin-current-storage-location.png)

由于笔者购买的是存储仅为 256GB 的"丐版" Mac mini，而笔记内容占用的空间较大，因此希望将存储路径更改为 NAS 网络卷。

## 启动命令

```
open -a /Applications/Joplin.app --args --profile /Volumes/mac_data/joplin/note
```
**需要修改的部分：**
- /Applications/Joplin.app：替换为你自己的 Joplin 应用程序路径。
- /Volumes/mac_data/joplin/note：替换为你希望使用的存储路径。

在 Mac 的终端中输入修改后的命令并执行时，你会看到它会尝试启动 Joplin 应用并使用指定的存储路径。

## 创建启动程序

打开Mac自带的`自动化`程序

![macOS 自动操作图标](macos-automator-icon.png)
选择`应用程序`
![在自动操作中选择“应用程序”](macos-automator-select-application.png)
在操作中选择`运行Shell脚本`
![选择“运行Shell脚本”](macos-automator-select-run-shell-script.png)
将启动命令输入右侧输入框
![将命令粘贴到输入框](macos-automator-paste-command.png)
点击左上角存储
![自动操作保存对话框](macos-automator-save-dialog.png)
修改程序名称并存储到`应用程序`
![另存为应用程序](macos-automator-save-as-application.png)
到这里你将在`启动台`中看到闪闪保存的应用程序!![启动台中的新应用程序](macos-launchpad-new-joplin-app.png)
点击程序验证一下效果

## 修改启动程序图标

在`访达` -> 应用程序 中找到闪闪创建的`启动程序`
右键 -> 显示简介
![访达中的“显示简介”选项](macos-finder-get-info.png)
将下载的图标拖入替代老的机器人图标
![拖动图标到简介窗口](macos-get-info-drag-icon.png)
![显示新图标的简介窗口](macos-get-info-new-icon.png)

### 下面是Joplin的LOGO

![Joplin Logo](joplin-logo.png)

---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/posts/mac_version_joplin_note_and_configuration_storage_change/  

