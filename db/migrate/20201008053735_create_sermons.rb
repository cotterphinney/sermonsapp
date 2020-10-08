class CreateSermons < ActiveRecord::Migration[6.0]
  def change
    create_table :sermons do |t|
      t.string :title
      t.text :description
      t.datetime :date

      t.timestamps
    end
  end
end
