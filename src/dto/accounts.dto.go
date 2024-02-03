package dto

type NewAccountDTO struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

type NewAccountResponseBody struct {
	Status  string `json:"status"`
	Message string `json:"message"`
}
