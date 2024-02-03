// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.25.0
// source: query.sql

package db

import (
	"context"

	"github.com/jackc/pgx/v5/pgtype"
)

const createNewAccount = `-- name: CreateNewAccount :one
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

RETURNING id, created_at, updated_at, email, password, role_id, active, verified
`

type CreateNewAccountParams struct {
	Email    string
	Password string
	RoleID   pgtype.UUID
	Active   bool
	Verified bool
}

func (q *Queries) CreateNewAccount(ctx context.Context, arg CreateNewAccountParams) (AccountsAccount, error) {
	row := q.db.QueryRow(ctx, createNewAccount,
		arg.Email,
		arg.Password,
		arg.RoleID,
		arg.Active,
		arg.Verified,
	)
	var i AccountsAccount
	err := row.Scan(
		&i.ID,
		&i.CreatedAt,
		&i.UpdatedAt,
		&i.Email,
		&i.Password,
		&i.RoleID,
		&i.Active,
		&i.Verified,
	)
	return i, err
}

const getAdminRoleId = `-- name: GetAdminRoleId :one
SELECT
    id, name
from
    "accounts"."Role"
where
    name = 'ADMIN'
`

func (q *Queries) GetAdminRoleId(ctx context.Context) (AccountsRole, error) {
	row := q.db.QueryRow(ctx, getAdminRoleId)
	var i AccountsRole
	err := row.Scan(&i.ID, &i.Name)
	return i, err
}

const getAllAccounts = `-- name: GetAllAccounts :one
SELECT
    id, created_at, updated_at, email, password, role_id, active, verified
FROM
    "accounts"."Accounts"
`

func (q *Queries) GetAllAccounts(ctx context.Context) (AccountsAccount, error) {
	row := q.db.QueryRow(ctx, getAllAccounts)
	var i AccountsAccount
	err := row.Scan(
		&i.ID,
		&i.CreatedAt,
		&i.UpdatedAt,
		&i.Email,
		&i.Password,
		&i.RoleID,
		&i.Active,
		&i.Verified,
	)
	return i, err
}
