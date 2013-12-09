Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id
      Integer :role_id, null: false
      String :username, null: false
      String :encrypted_password, null: false
      String :auth_token, null: false
    end
  end

  down do
    drop_table(:users)
  end
end