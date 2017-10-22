class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.integer :school_number
      t.string :name
      t.string :address
      t.string :zip_code
      t.string :phone
      t.string :principal
      t.string :grade_levels
      t.string :web_url
      t.string :description
      t.references :district, foreign_key: true

      t.timestamps
    end
  end
end
