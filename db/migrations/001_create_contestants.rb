Sequel.migration do
  up do
    create_table(:contestants) do
      primary_key :id
      Integer :contest_id
      String :first_name
      String :last_name
      DateTime :start_time_at
      DateTime :end_time_at
      String :end_time
    end
  end

  down do
    drop_table(:contestants)
  end
end