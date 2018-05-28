class UserPlace < ApplicationRecord
  belongs_to :user
  belongs_to :place
  # validate :one_place_to_one_user
  #
  # def one_place_to_one_user
  #   if UserPlace.find_by(place_id: place_id, user_id: user_id)
  #     self.errors[:name] << 'You already have this place on your list.'
  #   end
  # end
end
