package main

import (
	"github.com/spf13/cobra"
)

func main() {
	cmdRoot := &cobra.Command{Use: "testnoaway", Version: "0.3.7"}
	cmdRoot.Execute()
}
