class HorrorMovie < ApplicationRecord
    has_many :horror_movie_genres
    has_many :genres, through: :horror_movie_genres

    has_many :reviews
    has_many :users, through: :reviews, dependent: :destroy

    validates :title, :director, presence: true

    before_create :slugify

    def slugify
        self.slug = self.title.parameterize
    end

    def avg_score
        return 0 unless self.reviews.count.positive?
        self.reviews.average(:rating).round(0).to_f
    end

    #first portion returns 

end

