class CreateBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :budgets do |t|
      t.string :name, null: false, index: true

      t.timestamps
    end
  end
end
