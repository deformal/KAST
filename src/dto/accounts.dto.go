package dto

type NewAccountDTO struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

type NewAccountResponseBody struct {
	AccessToken string `json:"accessToken"`
}
