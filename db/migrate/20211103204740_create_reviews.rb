class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :description
      t.integer :rating
      t.belongs_to :user, foreign_key: true
      t.belongs_to :horror_movie, foreign_key: true

      t.timestamps
    end
  end
end
