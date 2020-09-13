package main

import (
	"github.com/spf13/cobra"
)

func main() {
	cmdRoot := &cobra.Command{Use: "testnoaway", Version: "0.1.5"}
	cmdRoot.Execute()
}
