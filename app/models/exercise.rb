class Exercise < ApplicationRecord
  belongs_to :user

  alias_attribute :workout_details, :workout

  scope :past_week, -> { where('workout_date > ?', 7.days.ago)}
  scope :desc, -> { order(workout_date: :desc)}
  scope :asc,  -> { order(workout_date: :asc)}
  # past_week, -> {where(Time.zone.now.at_beginning_of_week..Time.zone.now.at_end_of_week)}
  # {where('workout_date < ?', 7.days.ago)
    # where(:purchase_date => Date.today.beginning_of_week..Date.today.end_of_week)
                #  .order(workout_date: :desc)
                # def self.last_month_range
                #   Time.now.utc.prev_month.beginning_of_month..Time.now.utc.prev_month.end_of_month
                # end
    # DATE_RANGE = {
    #   last_week: 
    #   last_month: Date.prev_month
    #   last_6_months: Date.prev_month(6)


  validates :duration_in_min, numericality: {only_integer: true, greater_than: 0 }
  validates_presence_of :workout_details
  validates_presence_of :workout_date 
  # scope: user_id
end
