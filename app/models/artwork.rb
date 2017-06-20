class Artwork < ApplicationRecord
  validates :title, presence: true, uniqueness: {scope: :artist_id, message: "A single artist cannot create artworks by the same name"}
  validates :image_url, presence: true
  validates :artist_id, presence: true

  has_many :shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :shared_viewers,
    through: :shares,
    source: :viewer

  def self.all_user_artwork(user_id)
    join_condition = <<-SQL
      LEFT OUTER JOIN artwork_shares ON artwork_shares.artwork_id = artworks.id
    SQL
    where_condition = <<-SQL
      artworks.artist_id = :user_id OR artwork_shares.viewer_id = :user_id
    SQL

    Artwork
      .joins(join_condition)
      .where(where_condition, user_id: user_id)

  end
end
