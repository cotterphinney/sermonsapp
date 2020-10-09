class CreateSermons < ActiveRecord::Migration[6.0]
  def change
    create_table :sermons do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.references :series, null: false, foreign_key: true

      t.timestamps
    end
  end
end
