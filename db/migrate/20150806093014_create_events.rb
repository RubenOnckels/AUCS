class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :text
      t.string :date
      t.string :time
      t.string :venue

      t.timestamps
    end
  end
end
