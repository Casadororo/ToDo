class CreateBubbles < ActiveRecord::Migration[7.0]
  def change
    create_table :bubbles do |t|
      t.string :name
      t.string :description
      t.integer :priority

      t.timestamps
    end
  end
end
