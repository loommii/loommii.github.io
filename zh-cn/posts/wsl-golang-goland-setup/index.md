# Windows下使用WSL配置Go开发环境完整指南


在Windows平台上进行Go语言开发时，使用WSL（Windows Subsystem for Linux）可以获得接近原生Linux的开发体验。本文将详细介绍如何在WSL中安装配置Go环境，并与Goland IDE集成，打造高效的Go语言开发工作流。

<!--more-->

## 1. WSL中安装Golang

### 安装包下载

前往Go官方网站下载页面：[https://go.dev/dl/](https://go.dev/dl/)，选择适合Linux系统的安装包。由于WSL本质上是Linux环境，所以需要选择Linux版本，根据你的CPU架构选择对应的安装包。

例如，选择 `Arch -> x86-64`, `OS -> Linux` 对应的安装包。

{{< admonition info >}}
**小贴士**: 选择与你的处理器架构匹配的版本，通常是 `x86-64` (AMD64) 或 `arm64`。
{{< /admonition >}}

### 下载方式

**方式一：在WSL内直接下载**

右键复制下载地址，使用wget命令下载：

```bash
wget https://go.dev/dl/go1.25.5.linux-amd64.tar.gz
```

**方式二：Windows下载后复制到WSL**

在Windows中下载完成后，可以通过以下路径访问Windows文件：
```bash
$ ls /mnt/
c  d  wsl  wslg
# 使用mv命令将文件移动到WSL环境内
```

### 安装Go

将下载的二进制包解压至 `/usr/local` 目录：
```bash
$ sudo tar -C /usr/local -xzf go1.25.5.linux-amd64.tar.gz
# 提示输入你root密码
```

### 配置环境变量

将 `/usr/local/go/bin` 目录添加至PATH环境变量，并在当前终端会话中生效：
```bash
$ echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
$ source ~/.bashrc
```

### 验证安装

执行以下命令验证Go是否安装成功：
```bash
$ go version
go version go1.25.5 linux/amd64
```

{{< admonition success >}}
**验证成功**: 如果看到类似输出，说明Go已成功安装。
{{< /admonition >}}

## 2. Go环境设置

### 配置Go模块代理

为提高依赖下载速度，建议配置国内代理：
```bash
$ go env -w GO111MODULE=on
$ go env -w GOPROXY=https://goproxy.cn,direct
```

至此，WSL中Go的环境已经配置完成！

## 3. Goland与WSL集成

### 在Goland中创建项目

Goland IDE无需额外配置远程解释器。在创建新项目时：

1. 打开Goland，点击 `File` → `New` → `Project`
2. 在项目位置（Location）字段，选择WSL内的路径，例如：
   ```
   \\wsl.localhost\Ubuntu\home\linjjj\project\go_demo
   ```
3. 在GOROOT字段，点击右侧的 `+` 号，选择本地路径，同样选择WSL内的Go安装路径：
   ```
   \\wsl.localhost\Ubuntu\usr\local\go
   ```
4. Goland会自动识别并配置WSL环境

{{< image src="image.png" caption="Goland WSL配置示例1" >}}
{{< image src="image-1.png" caption="Goland WSL配置示例2" >}}
{{< image src="image-2.png" caption="Goland WSL配置示例3" >}}

## 总结

通过以上步骤，我们成功在WSL中配置了Go开发环境，并将其与Goland IDE集成。这种方式结合了Windows的便利性和Linux开发环境的优势，为Go语言开发者提供了一个高效的开发工作流。

{{< admonition quote >}}
**WSL进行Go开发的主要优势**：
- 接近原生Linux的开发体验
- 与Windows生态系统的良好集成
- 高效的文件系统访问
- 丰富的Linux开发工具支持
{{< /admonition >}}

希望这份指南能帮助你在Windows环境下顺利开始Go语言开发之旅！

{{< admonition tip >}}
**进阶建议**: 你还可以配置VSCode的Remote-WSL插件，获得另一种在WSL中开发Go的优秀体验。
{{< /admonition >}}

---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/posts/wsl-golang-goland-setup/  

