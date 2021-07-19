class CreateDivisions < ActiveRecord::Migration[6.1]
  def change
    create_table :divisions do |t|
      t.string :name
      t.references :parent, foreign_key: { to_table: :divisions }
      t.timestamps
    end
  end
end
