package main

import (
	"fmt"
	"os"
	"path/filepath"
	"runtime"
)

func main() {
	fmt.Println(runtime.GOOS, runtime.GOARCH)
	wd, err := os.Getwd()
	if err != nil {
		panic(err)
	}
	f, err := os.ReadFile(filepath.Join(wd, "file.txt"))
	if err != nil {
		panic(err)
	}
	fmt.Println("Reading a file:", f)
}
