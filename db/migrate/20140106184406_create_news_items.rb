class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
