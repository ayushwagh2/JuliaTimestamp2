module CreateTablesaved
import SearchLight.Migrations: create_table, column, columns, pk, add_index, drop_table, add_indices

function up()
  create_table(:saved) do
    [
      pk()
      column(:name, :string)
      column(:lastname, :string)
      column(:counter, :integer)
      
    ]
  end
 
end

function down()
  drop_table(:saved)
end

end
