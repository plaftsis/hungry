class AddSearchableColumnToIngredients < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
    ALTER TABLE ingredients
    ADD COLUMN searchable tsvector GENERATED ALWAYS AS (
      to_tsvector('french', name)
    ) STORED;
    SQL
  end

  def down
    remove_column :ingredients, :searchable
  end
end
