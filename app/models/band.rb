class Band < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :name, uniqueness: true
  validates :email, :website, :facebook, :instagram, :youtube, :soundcloud, :spotify, :local, presence: true
  validates :team, presence: true, numericality: { only_integer: true }

end
