class ChangeRatingTypeToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :rating, 'integer USING CAST(rating AS integer)'
  end
end
