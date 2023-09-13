class AddPositionToBubbles < ActiveRecord::Migration[7.0]
  def change
    add_column :bubbles, :position, :integer
  end
end
