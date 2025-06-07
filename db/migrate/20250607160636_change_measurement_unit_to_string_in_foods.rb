class ChangeMeasurementUnitToStringInFoods < ActiveRecord::Migration[8.0]
  def change
    change_column :foods, :measurement_unit, :string
  end
end
