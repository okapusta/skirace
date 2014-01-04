Sequel.migration do
  up do
    create_table(:settings) do
      Boolean :multi_contest
      Float   :time_interval
    end
  end

  down do
    drop_table(:settings)
  end
end