class Flat < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings
  validates :short_description, presence: true
  validates :room_count, presence: true
  validates :property_type, presence: true
  validates :price, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :zipcode, presence: true

  mount_uploader :picture, PictureUploader

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    [street, city, country].compact.join(', ')
  end

end

