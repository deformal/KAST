package dto

type Action struct {
	Name string `json:"name"`
}
type RequestPayload struct {
	Action Action `json:"action"`
	Input  struct {
		Args map[string]interface{} `json:"args"`
	} `json:"input"`
	RequestQuery     string `json:"request_query"`
	SessionVariables struct {
		Role string `json:"x-hasura-role"`
	} `json:"session_variables"`
}
