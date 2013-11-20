Sequel.migration do
  up do
    create_table(:contestants) do
      primary_key :id
    end
  end

  down do
    drop_table(:contestants)
  end
end