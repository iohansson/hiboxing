class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.integer :sort_order
      t.boolean :is_published

      t.timestamps
    end
  end
end
