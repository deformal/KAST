alter table "accounts"."Accounts"
  add constraint "Accounts_role_id_fkey"
  foreign key ("role_id")
  references "accounts"."Role"
  ("id") on update cascade on delete cascade;
