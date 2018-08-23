class CreateBaseConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :base_conditions do |t|
      t.string :name
      t.float :min_temp, default: 85
      t.integer :min_flow, default: 40
      t.float :max_flow, default: 300
      t.string :acceptable_clouds, array: true
      t.timestamps
    end
  end
end
