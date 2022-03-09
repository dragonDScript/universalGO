echo "Name the application"
read OUTPUT

rm ./app -rf
mkdir ./app

mkdir ./app/windows
mkdir ./app/windows/amd64
mkdir ./app/windows/arm64
mkdir ./app/windows/386
mkdir ./app/darwin/
mkdir ./app/darwin/amd64
mkdir ./app/darwin/arm64
mkdir ./app/linux/
mkdir ./app/linux/amd64
mkdir ./app/linux/386
mkdir ./app/linux/arm64

# 64 bits
GOOS=windows GOARCH=amd64 go build -o ./app/windows/amd64/windows.exe ugo.go
# 32 bits
GOOS=windows GOARCH=386 go build -o ./app/windows/386/windows.exe ugo.go
# ARM
GOOS=windows GOARCH=arm64 go build -o ./app/windows/arm64/windows.exe ugo.go

# 64 bits
GOOS=linux GOARCH=amd64 go build -o ./app/linux/amd64/linux ugo.go
# ARM
GOOS=linux GOARCH=arm64 go build -o ./app/linux/arm64/linux ugo.go
# 32 bits
GOOS=linux GOARCH=386 go build -o ./app/linux/386/linux ugo.go

# Intel
GOOS=darwin GOARCH=amd64 go build -o ./app/darwin/amd64/darwin ugo.go
# Apple Silicon
GOOS=darwin GOARCH=arm64 go build -o ./app/darwin/arm64/darwin ugo.go

zip -q -r ./$OUTPUT.ugo ./app/*

echo 🥳 Done!