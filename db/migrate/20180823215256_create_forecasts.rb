class CreateForecasts < ActiveRecord::Migration[5.2]
  def change
    create_table :forecasts do |t|
      t.string :name
      t.float :min_temp, default: 85
      t.integer :min_flow, default: 40
      t.float :max_flow, default: 300
      t.integer :acceptable_clouds, default: 1
      t.float :current_temp
      t.float :current_flow
      t.string :current_clouds

      t.timestamps
    end
  end
end
