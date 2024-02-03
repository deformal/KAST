-- name: GetAllAccounts :one
SELECT * FROM public.accounts
WHERE id = $1 LIMIT 1;