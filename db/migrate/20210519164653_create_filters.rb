class CreateFilters < ActiveRecord::Migration[6.1]
  def change
    create_table :filters do |t|
      t.integer :size
      t.string :game
      t.integer :user_id
      t.timestamps
    end
  end
end
