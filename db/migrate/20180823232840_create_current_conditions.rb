class CreateCurrentConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :current_conditions do |t|
      t.string :name
      t.belongs_to :base_condition, index: true
      t.float :current_temp
      t.float :current_flow
      t.string :current_clouds
      t.timestamps
    end
  end
end
