class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.text :content
      t.references :favorite_school

      t.timestamps
    end
  end
end
