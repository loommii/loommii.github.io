# Installing ESP32 Boards in Arduino IDE: Speeding Up With a Mirror


## Foreword: Solving ESP32 Board Package Download Failures in Arduino IDE

For developers in mainland China, installing the ESP32 board support package in the Arduino IDE often leads to slow downloads, timeouts, or even complete failures. This is typically caused by unstable international network connections, making it difficult to download from the official sources.

To address this pain point, this tutorial will guide you through configuring a domestic mirror source to achieve a fast and stable installation of the ESP32 board package. Say goodbye to long waits and repeated failures, and make your development process smoother.

## Step 1: Get the ESP32 Domestic Mirror URL

First, we need to get the URL for the board manager index file, which is hosted on a domestic server and provided by the officials. This information is clearly stated in the official ESP32 documentation, as shown in the screenshot below.

![Screenshot from the official ESP32 documentation](esp32-docs-china-mirror-link.png)

For your convenience, I've directly excerpted them from the [Installing - Arduino-ESP32](https://docs.espressif.com/projects/arduino-esp32/en/latest/installing.html) documentation below:

-   **Stable Version**: Contains tested versions recommended for most users.
    ```
    https://jihulab.com/esp-mirror/espressif/arduino-esp32/-/raw/gh-pages/package_esp32_index_cn.json
    ```

-   **Development Version**: Contains the latest features and code, which may be unstable. Suitable for developers who want to try new things.
    ```
    https://jihulab.com/esp-mirror/espressif/arduino-esp32/-/raw/gh-pages/package_esp32_dev_index_cn.json
    ```

For most development scenarios, **using the stable version link is highly recommended**.

## Step 2: Add the Mirror Source in Arduino IDE

Once you have the URL, you need to let the Arduino IDE know about this new download address.

1.  Open the Arduino IDE and click on **File** > **Preferences** in the top-left menu.

    ![Arduino IDE Menu - Preferences](arduino-ide-preferences-menu.png)

2.  In the "Preferences" window that pops up, find the **"Additional Boards Manager URLs"** input box.

    ![Arduino IDE Preferences - Additional Boards Manager URLs](arduino-ide-paste-mirror-url.png)

3.  Paste the **stable version URL** from Step 1 into this input box. If you already have other URLs, click the icon to the right of the input box and paste the new URL on a new line in the window that appears.

4.  Click **"OK"** to save the settings.

## Step 3: Install ESP32 via Boards Manager

With the configuration complete, we can now proceed with the actual installation.

1.  In the Arduino IDE, open the Boards Manager via **Tools** > **Board** > **Boards Manager...**.

2.  When the Boards Manager opens, it will first update the index, which may take a moment. Once the update is complete, type `ESP32` into the search box at the top.

3.  You will see `esp32 by Espressif Systems` appear in the search results. Click on it, and in the version selection dropdown on the right, you will be pleased to find versions with a `-cn` suffix.

    ![Selecting a version with the -cn suffix in the Boards Manager](arduino-ide-board-manager-cn-version.png)

    **These versions ending in `-cn` are provided through the domestic mirror source we configured.**

4.  Select the latest `-cn` version and click the **"Install"** button.

You will now notice a significant leap in download speed, free from the long waits and repeated failures.

## Conclusion

In three simple steps, we successfully switched the Arduino IDE's board download source to a domestic mirror, completely solving the installation issues for the ESP32 board package. This method is not only applicable to ESP32 but also to other boards that provide domestic mirrors (e.g., ESP8266).

**Key Takeaways:**
- **Find the Right Source**: Get the officially certified domestic mirror URL.
- **Configure the IDE**: Add the URL in "Preferences".
- **Choose the "-cn" Version**: Install the version with the `-cn` identifier in the "Boards Manager".

I hope this detailed guide helps you clear the obstacles in your learning and development path, allowing you to focus more on creating and realizing your ideas. Happy coding!


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/arduino-ide-esp32-mirror-install-guide/  

