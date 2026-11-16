# Complete Guide: Configuring Go Development Environment With WSL on Windows


When developing Go applications on the Windows platform, using WSL (Windows Subsystem for Linux) provides a development experience close to native Linux. This article will detail how to install and configure the Go environment in WSL and integrate it with the Goland IDE to create an efficient Go language development workflow.

<!--more-->

## 1. Installing Golang in WSL

### Downloading the Installation Package

Go to the official Go download page: [https://go.dev/dl/](https://go.dev/dl/) and select the installation package suitable for the Linux system. Since WSL is essentially a Linux environment, you need to choose the Linux version and select the corresponding package based on your CPU architecture.

For example, select the package corresponding to `Arch -> x86-64`, `OS -> Linux`.

{{< admonition info >}}
**Tip**: Choose the version that matches your processor architecture, usually `x86-64` (AMD64) or `arm64`.
{{< /admonition >}}

### Download Methods

**Method 1: Download directly within WSL**

Right-click to copy the download link and use the wget command to download:

```bash
wget https://go.dev/dl/go1.25.5.linux-amd64.tar.gz
```

**Method 2: Download in Windows and copy to WSL**

After downloading in Windows, you can access Windows files via the following path:
```bash
$ ls /mnt/
c  d  wsl  wslg
# Use the mv command to move the file into the WSL environment
```

### Installing Go

Extract the downloaded binary package to the `/usr/local` directory:
```bash
$ sudo tar -C /usr/local -xzf go1.25.5.linux-amd64.tar.gz
# Prompted to enter your root password
```

### Configuring Environment Variables

Add the `/usr/local/go/bin` directory to the PATH environment variable and apply it in the current terminal session:
```bash
$ echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
$ source ~/.bashrc
```

### Verifying the Installation

Execute the following command to verify if Go is installed successfully:
```bash
$ go version
go version go1.25.5 linux/amd64
```

{{< admonition success >}}
**Verification Successful**: If you see similar output, it indicates that Go has been successfully installed.
{{< /admonition >}}

## 2. Go Environment Setup

### Configuring Go Module Proxy

To improve dependency download speed, it's recommended to configure a domestic proxy:
```bash
$ go env -w GO111MODULE=on
$ go env -w GOPROXY=https://goproxy.cn,direct
```

So far, the Go environment in WSL has been configured!

## 3. Integrating Goland with WSL

### Creating a Project in Goland

The Goland IDE does not require additional configuration for a remote interpreter. When creating a new project:

1. Open Goland, click `File` → `New` → `Project`
2. In the Location field, select a path within WSL, for example:
   ```
   \\wsl.localhost\Ubuntu\home\linjjj\project\go_demo
   ```
3. In the GOROOT field, click the `+` sign on the right, select Local Path, and choose the Go installation path within WSL:
   ```
   \\wsl.localhost\Ubuntu\usr\local\go
   ```
4. Goland will automatically recognize and configure the WSL environment

{{< image src="image.png" caption="Goland WSL Configuration Example 1" >}}
{{< image src="image-1.png" caption="Goland WSL Configuration Example 2" >}}
{{< image src="image-2.png" caption="Goland WSL Configuration Example 3" >}}

## Summary

Through the above steps, we have successfully configured the Go development environment in WSL and integrated it with the Goland IDE. This approach combines the convenience of Windows with the advantages of the Linux development environment, providing Go developers with an efficient development workflow.

{{< admonition quote >}}
**Main Advantages of Go Development with WSL**:
- A development experience close to native Linux
- Good integration with the Windows ecosystem
- Efficient file system access
- Rich support for Linux development tools
{{< /admonition >}}

Hope this guide helps you start your Go language development journey smoothly in a Windows environment!

{{< admonition tip >}}
**Advanced Suggestion**: You can also configure VSCode's Remote-WSL plugin to get another excellent experience for developing Go in WSL.
{{< /admonition >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/wsl-golang-goland-setup/  

