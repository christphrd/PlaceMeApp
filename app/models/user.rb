class User < ApplicationRecord
  has_many :user_places
  has_many :places, through: :user_places
  has_many :comments



  accepts_nested_attributes_for :places
  has_secure_password
  # validates :email, uniqueness: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :email, :password, :first_name, :last_name, presence: true
  validates :email, 'valid_email_2/email': { mx: true, disposable: true, disallow_subaddressing: true}

  def full_name
    "#{first_name} #{last_name}"
  end

  def visited_places
    self.user_places.select do |user_place|
      user_place[:future] == false
    end.map {|user_place| user_place.place}
  end

  def will_go_to_someday
    self.user_places.select do |user_place|
      user_place[:future] == true
    end.map {|user_place| user_place.place}
  end
end
