echo "Name the application"
read OUTPUT

echo "Target go file"
read GO_FILE

echo Creating some temporary folders...

rm ./windows -rf
rm ./linux -rf
rm ./darwin -rf

mkdir ./windows
mkdir ./windows/amd64
mkdir ./windows/arm64
mkdir ./windows/386
mkdir ./darwin/
mkdir ./darwin/amd64
mkdir ./darwin/arm64
mkdir ./linux/
mkdir ./linux/amd64
mkdir ./linux/386
mkdir ./linux/arm64

echo Created!

# 64 bits
echo Compiling for Windows 64-bits
GOOS=windows GOARCH=amd64 go build -o ./windows/amd64/windows.exe $GO_FILE
echo Done!
# 32 bits
echo Compiling for Windows 32-bits
GOOS=windows GOARCH=386 go build -o ./windows/386/windows.exe $GO_FILE
echo Done!
# ARM
echo Compiling for Windows ARM
GOOS=windows GOARCH=arm64 go build -o ./windows/arm64/windows.exe $GO_FILE
echo Done!

# 64 bits
echo Compiling for Linux amd64
GOOS=linux GOARCH=amd64 go build -o ./linux/amd64/linux $GO_FILE
echo Done!
# ARM
echo Compiling for Linux arm64
GOOS=linux GOARCH=arm64 go build -o ./linux/arm64/linux $GO_FILE
echo Done!
# 32 bits
echo Compiling for Linux i386
GOOS=linux GOARCH=386 go build -o ./linux/386/linux $GO_FILE
echo Done!

# Intel
echo Compiling for Mac Intel processors
GOOS=darwin GOARCH=amd64 go build -o ./darwin/amd64/darwin $GO_FILE
echo Done!
# Apple Silicon
echo Compiling for Apple Silicon computers
GOOS=darwin GOARCH=arm64 go build -o ./darwin/arm64/darwin $GO_FILE
echo Done!

echo Compressing...
zip -q -r ./$OUTPUT.ugo ./windows ./darwin ./linux 
echo Done!

echo Removing temporary folders...
rm ./windows -rf
rm ./linux -rf
rm ./darwin -rf
echo Done!

echo 🥳 Done!