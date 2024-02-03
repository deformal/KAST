package accounts

import (
	"encoding/json"
	"kast/src/dto"
	"kast/src/utils"
	"log"
	"net/http"
)

func Signup(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Route Does not exists", http.StatusMethodNotAllowed)
		return
	}

	payload := utils.GetRequestPayload(r)

	var newUserInput dto.NewAccountDTO
	argsJSON, err := json.Marshal(payload.Input.Args)
	if err != nil {
		log.Fatal(err)
		panic(err)
	}

	err = json.Unmarshal(argsJSON, &newUserInput)
	if err != nil {
		log.Fatal(err)
		panic(err)
	}

	response := dto.NewAccountResponseBody{
		AccessToken: "hello",
	}

	responseJSON, err := json.Marshal(response)
	if err != nil {
		http.Error(w, "Error encoding response body", http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")

	w.Write(responseJSON)
}
