class AddRatingToFoods < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :rating, :integer
  end
end
