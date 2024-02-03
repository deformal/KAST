package accounts

import (
	"encoding/json"
	"fmt"
	"io"
	"kast/src/dto"
	"net/http"
)

func Signup(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Only POST requests are allowed", http.StatusMethodNotAllowed)
		return
	}

	body, err := io.ReadAll(r.Body)
	if err != nil {
		http.Error(w, "Error reading request body", http.StatusInternalServerError)
		return
	}

	defer r.Body.Close()

	response := dto.NewAccountResponseBody{
		Status:  "success",
		Message: "Received request successfully",
	}

	responseJSON, err := json.Marshal(response)
	if err != nil {
		http.Error(w, "Error encoding response body", http.StatusInternalServerError)
		return
	}

	fmt.Println("Received request body:", string(body))

	w.Header().Set("Content-Type", "application/json")

	w.Write(responseJSON)
}
