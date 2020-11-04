class Band < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :name, uniqueness: true
  validates :website, :facebook, :instagram, :youtube, :soundcloud, :spotify, :local, presence: true
  validates :email, format: { with: /^(.+)@(.+)$/, message: "Email invalid"  }
  validates :team, presence: true, numericality: { only_integer: true }
  validates :availability, presence: true, :inclusion => { :in => [true, false] }
end
