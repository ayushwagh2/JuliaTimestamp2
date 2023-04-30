module CreateTableMessagings

import SearchLight.Migrations: create_table, column, columns, pk, add_index, drop_table, add_indices

function up()
  create_table(:messagings) do
    [
      pk()
      column(:msg, :string)
      column(:Sid, :integer)
      column(:Rid, :integer)
      column(:time, :datetime)
    ]
  end
 
end

function down()
  drop_table(:messagings)
end

end

