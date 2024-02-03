package main

import (
	"fmt"
	"kast/src/router"
	"net/http"
)

const (
	port = 3000
)

func main() {

	router := router.Router()
	fmt.Printf("Server running on http://lcoalhost:%d/api", port)
	err := http.ListenAndServe(fmt.Sprintf(":%d", port), &router)
	if err != nil {
		fmt.Println("Error starting server:", err)
	}
}
