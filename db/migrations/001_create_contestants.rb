Sequel.migration do
  up do
    create_table(:contestants) do
      primary_key :id
      String :first_name, null: false
      String :last_name, null: false
      DateTime :start_time_at, null: false
      DateTime :end_time_at
      DateTime :end_time
    end
  end

  down do
    drop_table(:contestants)
  end
end