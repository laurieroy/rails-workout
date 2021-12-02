class Exercise < ApplicationRecord
  belongs_to :user

  alias_attribute :workout_details, :workout

  default_scope {where('workout_date > ?', 7.days.ago)
                 .order(workout_date: :desc)
  }

  validates :duration_in_min, numericality: {only_integer: true, greater_than: 0 }
  validates_presence_of :workout_details
  validates_presence_of :workout_date 
  # scope: user_id
end
