package dto

type Action struct {
	Name string `json:"name"`
}

type Input struct {
	Args any `json:"args"`
}

type SessionVariables struct {
	Role string `json:"x-hasura-role"`
}

type RequestPayload struct {
	Action           Action           `json:"action"`
	Input            Input            `json:"input"`
	RequestQuery     string           `json:"request_query"`
	SessionVariables SessionVariables `json:"session_variables"`
}
