class Band < ApplicationRecord
  belongs_to :user
  has_many :gigs
  has_many :offers

  has_one_attached :photo

  validates :name, uniqueness: true
  validates :email, :website, :facebook, :instagram, :youtube, :soundcloud, :spotify, :city, :state, :country, presence: true
  validates :team, presence: true, numericality: { only_integer: true }

 include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [[ :name , 'A']],
    using: {
      tsearch: { prefix: true }
    }

end
