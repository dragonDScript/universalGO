# Universal GO

## ⚠️ WORK IN PROGRESS, YOU SHOULDN'T USE THIS

Universal GO is a tool to package Go applications for all platforms.

Try it by downloading ugo from [GitHub Releases](https://github.com/dragonDScript/universalGO/releases) and placing it in a familiar location. Then Check the below guide for opening .ugo files with ugo. Docs are WIP.

## How to run .ugo files directly

Download the repo and compile universal GO for your platform. Put it in a familiar place. Then open a .ugo file and click `Properties` on Windows:

![image](https://user-images.githubusercontent.com/46191980/157127805-236e74af-36a6-461e-8e13-237b2a40dcc9.png)

Click "Change..." and pick the ugo binary. Now you can run .ugo files from the explorer, taskbar or terminal directly!

![image](https://user-images.githubusercontent.com/46191980/157127907-7e08cb24-6c6b-40c9-8dcf-b500fc912bba.png)


## 📃 File format

The file format is a ZIP file.
```md
- windows
    - amd64
        - windows.exe
    - ...
- linux
    - amd64
        - linux
- darwin
    - amd64
        - darwin
- files
    - file1.png
    - file2.html
    - reference these files in your
    - app by concatenating
    - working directory and the file
```
