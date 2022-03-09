package main

import (
	"archive/zip"
	"fmt"
	"io"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"runtime"
	"strings"

	"github.com/dragonDScript/universalGO/platform"
)

func execute(f string) {
	executable := filepath.Join(f, runtime.GOOS, runtime.GOARCH, platform.Filename)
	process := exec.Command(executable, strings.Join(os.Args[1:], " "))
	process.Stdout = os.Stdout
	process.Stderr = os.Stderr
	process.Dir = f
	err := process.Run()
	if err != nil {
		panic(err)
	}
}

func main() {
	if len(os.Args) < 2 {
		log.Println("not enough arguments")
		return
	}
	loc, err := filepath.Abs(os.Args[1])
	if err != nil {
		panic(err)
	}
	f, err := os.MkdirTemp("", "*")
	if err != nil {
		panic(err)
	}
	_, err = unzip(loc, f)
	if err != nil {
		panic(err)
	}
	if runtime.GOOS == "linux" || runtime.GOOS == "darwin" {
		// Make executable
		err = os.Chmod(filepath.Join(f, runtime.GOOS, runtime.GOARCH, platform.Filename), 0111)
		if err != nil {
			panic(err)
		}
	}
	execute(f)
}

// https://golangcode.com/unzip-files-in-go/
func unzip(src string, dest string) ([]string, error) {
	var filenames []string

	r, err := zip.OpenReader(src)
	if err != nil {
		return filenames, err
	}
	defer r.Close()

	for _, f := range r.File {

		// Store filename/path for returning and using later on
		fpath := filepath.Join(dest, f.Name)

		// Check for ZipSlip. More Info: http://bit.ly/2MsjAWE
		if !strings.HasPrefix(fpath, filepath.Clean(dest)+string(os.PathSeparator)) {
			return filenames, fmt.Errorf("%s: illegal file path", fpath)
		}

		filenames = append(filenames, fpath)

		if f.FileInfo().IsDir() {
			// Make Folder
			os.MkdirAll(fpath, os.ModePerm)
			continue
		}

		// Make File
		if err = os.MkdirAll(filepath.Dir(fpath), os.ModePerm); err != nil {
			return filenames, err
		}

		outFile, err := os.OpenFile(fpath, os.O_WRONLY|os.O_CREATE|os.O_TRUNC, f.Mode())
		if err != nil {
			return filenames, err
		}

		rc, err := f.Open()
		if err != nil {
			return filenames, err
		}

		_, err = io.Copy(outFile, rc)

		// Close the file without defer to close before next iteration of loop
		outFile.Close()
		rc.Close()

		if err != nil {
			return filenames, err
		}
	}
	return filenames, nil
}
