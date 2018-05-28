class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :place

  def updated_in_day_date_est_time
    est_updated = self.updated_at.in_time_zone('EST')
    "#{est_updated.strftime('%A')}, #{est_updated.strftime("%B")} #{est_updated.strftime("%y")}, #{est_updated.strftime("%Y")} at #{est_updated.strftime('%r')} EST"
  end
end
