class Place < ApplicationRecord
  has_many :user_places
  has_many :users, through: :user_places
  has_many :comments
  has_many :photos
  validates :city, presence: true


  def people_who_been
    self.user_places.select do |user_place|
      user_place[:future] == false
    end.map {|user_place| user_place.user}
  end

  def people_wishlist
    self.user_places.select do |user_place|
      user_place[:future] == true
    end.map {|user_place| user_place.user}
  end

  def city_and_country
    "#{self.city} - #{self.country}"
  end

end
