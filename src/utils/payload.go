package utils

import (
	"encoding/json"
	"io"
	"kast/src/dto"
	"log"
	"net/http"
)

func GetRequestPayload(r *http.Request) dto.RequestPayload {
	var payload dto.RequestPayload

	body, err := io.ReadAll(r.Body)
	if err != nil {
		log.Fatal(err.Error())
	}

	defer r.Body.Close()

	err = json.Unmarshal(body, &payload)
	if err != nil {
		log.Fatal(err.Error())

	}

	return payload
}
