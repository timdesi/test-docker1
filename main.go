package main

import (
	"fmt"
	"os"
)

func main() {
	fmt.Println("hello world")
	fmt.Println("FOO:", os.Getenv("FOO"))
}
