-- name: GetAllAccounts :one
SELECT
    *
FROM
    "accounts"."Accounts";

-- name: CreateNewAccount :one
INSERT INTO
    "accounts"."Accounts"(
        email,
        password,
        role_id,
        active,
        verified
    )
VALUES
    ($1, $2, $3, $4, $5)

RETURNING *;

-- name: GetAdminRoleId :one
SELECT
    *
from
    "accounts"."Role"
where
    name = 'ADMIN';