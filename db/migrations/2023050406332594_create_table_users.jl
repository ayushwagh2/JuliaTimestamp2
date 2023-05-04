module CreateTableUsers

import SearchLight.Migrations: create_table, column, columns, pk, add_index, drop_table, add_indices

function up()
  create_table(:users) do
    
    [
      pk()
   
      column(:hash, :string)
      column(:uid, :integer)
   
    ]
  end
 
end

function down()
  drop_table(:users)
end

end
