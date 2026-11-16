# MacOS: How to Change Joplin's Profile Location


<!--more-->

> Joplin's official GUI does not provide an option to change the storage location; it needs to be modified via startup arguments.

![Joplin storage location message](joplin-current-storage-location.png)

Since I purchased a "budget" Mac mini with only 256GB of storage, and my note content takes up a large amount of space, I wanted to change the storage path to a NAS network volume.

## Startup Command

```
open -a /Applications/Joplin.app --args --profile /Volumes/mac_data/joplin/note
```
**Parts to modify:**
- `/Applications/Joplin.app`: Replace with your Joplin application's path.
- `/Volumes/mac_data/joplin/note`: Replace with the storage path you want to use.

Enter the modified command in your terminal and execute it. Joplin will launch using the new storage path.

## Creating a Launch Application

Open Mac's built-in `Automator` app.

![macOS Automator icon](macos-automator-icon.png)
Select `Application`.
![Selecting 'Application' in Automator](macos-automator-select-application.png)
In the action list, find and select `Run Shell Script`.
![Selecting 'Run Shell Script'](macos-automator-select-run-shell-script.png)
Paste your startup command into the script area on the right.
![Pasting the command into Automator](macos-automator-paste-command.png)
Go to `File > Save` (or press `Cmd+S`).
![Automator save dialog](macos-automator-save-dialog.png)
Give your new application a name (e.g., "Joplin Custom") and save it in your `Applications` folder.
![Saving the Automator script as an Application](macos-automator-save-as-application.png)
You will now see your new custom launcher in `Launchpad`!
![The new application in Launchpad](macos-launchpad-new-joplin-app.png)
Click on it to make sure it launches Joplin as expected.

## Modifying the Launch Application Icon

In `Finder`, go to your `Applications` folder and find the app you just created.
Right-click the application and select `Get Info`.
![The 'Get Info' window in Finder](macos-finder-get-info.png)
Drag your desired icon file (e.g., a `.png` or `.icns` file) and drop it directly onto the small robot icon at the top-left of the 'Get Info' window.
![Dragging the new icon into the 'Get Info' window](macos-get-info-drag-icon.png)
![The 'Get Info' window with the new icon](macos-get-info-new-icon.png)

### Here is the Joplin logo for your convenience:

![Joplin Logo](joplin-logo.png)


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/mac_version_joplin_note_and_configuration_storage_change/  

