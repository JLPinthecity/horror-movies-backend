class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :username
  has_many :horror_movies, serializer: HorrorMovieSerializer
end
