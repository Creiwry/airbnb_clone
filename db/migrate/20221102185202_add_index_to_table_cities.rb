class AddIndexToTableCities < ActiveRecord::Migration[7.0]
  def change
#    add_column :table_cities, :zip_code, :string
    add_index :cities, :zip_code, unique: true
  end
end
