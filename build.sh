# 64 bits
GOOS=windows GOARCH=amd64 go build -o windows.exe ugo.go
# 32 bits
GOOS=windows GOARCH=386 go build -o windows-32bit.exe ugo.go
# ARM
GOOS=windows GOARCH=arm64 go build -o windows-arm64.exe ugo.go

# 64 bits
GOOS=linux GOARCH=amd64 go build -o linux ugo.go
# ARM
GOOS=linux GOARCH=arm64 go build -o linux-arm64 ugo.go
# 32 bits
GOOS=linux GOARCH=386 go build -o linux-386 ugo.go

# Intel
GOOS=darwin GOARCH=amd64 go build -o darwin ugo.go
# Apple Silicon
GOOS=darwin GOARCH=arm64 go build -o darwin-arm64 ugo.go