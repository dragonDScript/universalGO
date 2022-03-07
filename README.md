# Universal GO

## ⚠️ WORK IN PROGRESS, YOU SHOULDN'T USE THIS

Universal GO is a tool to package Go applications for all platforms.

Try it by git cloning this repo, and running `go run main.go examples/minimalistic/app.zip`. Docs are WIP.

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