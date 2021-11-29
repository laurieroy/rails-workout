class Exercise < ApplicationRecord
  belongs_to :user

  alias_attribute :workout_details, :workout

  validates :duration_in_min, numericality: {only_integer: true, greater_than: 0 }
  validates_presence_of :workout_details
  validates_presence_of :workout_date, comparison: { greater_than: (0) }
  # scope: user_id
end
