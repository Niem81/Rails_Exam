class Song < ActiveRecord::Base
    belongs_to :user
    has_many :playlists, dependent: :destroy
    has_many :users, through: :playlists

    validates :title, :artist, presence: true
end
