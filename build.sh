echo "Name the application"
read OUTPUT

echo "Target go file"
read GO_FILE

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

# 64 bits
GOOS=windows GOARCH=amd64 go build -o ./windows/amd64/windows.exe $GO_FILE
# 32 bits
GOOS=windows GOARCH=386 go build -o ./windows/386/windows.exe $GO_FILE
# ARM
GOOS=windows GOARCH=arm64 go build -o ./windows/arm64/windows.exe $GO_FILE

# 64 bits
GOOS=linux GOARCH=amd64 go build -o ./linux/amd64/linux $GO_FILE
# ARM
GOOS=linux GOARCH=arm64 go build -o ./linux/arm64/linux $GO_FILE
# 32 bits
GOOS=linux GOARCH=386 go build -o ./linux/386/linux $GO_FILE

# Intel
GOOS=darwin GOARCH=amd64 go build -o ./darwin/amd64/darwin $GO_FILE
# Apple Silicon
GOOS=darwin GOARCH=arm64 go build -o ./darwin/arm64/darwin $GO_FILE

zip -q -r ./$OUTPUT.ugo ./windows ./darwin ./linux 

rm ./windows -rf
rm ./linux -rf
rm ./darwin -rf

echo 🥳 Done!