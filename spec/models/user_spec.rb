require 'rails_helper'

RSpec.describe User, type: :model do
  it "returns the full_name for an user" do
    user = build :user, first_name: "Jane", last_name: "Doe"

    expect(user.full_name).to eq("Jane Doe")
  end
end
