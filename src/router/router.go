package router

import (
	"kast/src/handlers/accounts"
	"kast/src/middlewares"
	"net/http"
)

func Router() http.ServeMux {
	router := http.NewServeMux()
	router.Handle("/api/signup", middlewares.Auth((http.HandlerFunc(accounts.Signup))))

	return *router
}
