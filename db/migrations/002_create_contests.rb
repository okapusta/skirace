Sequel.migration do
  up do
    create_table(:contests) do
      primary_key :id
      String :name, null: false
      Boolean :public, default: false
    end
  end

  down do
    drop_table(:contests)
  end
end