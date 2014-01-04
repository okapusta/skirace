Sequel.migration do
  up do
    create_table(:settings) do
      primary_key :id
      Boolean :public_contest
      Boolean :multi_contest
      Integer :public_contest_id
      Float   :time_interval
    end
  end

  down do
    drop_table(:settings)
  end
end