require 'rails_helper'

RSpec.describe Exercise, type: :model do
  describe "validations" do
    it { should validate_presence_of(:workout_details) }
    it { should validate_presence_of(:workout_date) }
    it { should validate_numericality_of(:duration_in_min).only_integer.is_greater_than(0) }

  end
end
