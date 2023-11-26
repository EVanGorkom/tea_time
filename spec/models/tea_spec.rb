require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe "validations" do
    it { validate_presence_of(:title)}
    it { validate_presence_of(:description)}
    it { validate_presence_of(:temperature)}
    it { validate_presence_of(:brew_time)}
  end

  describe "relationships" do
    it { should have_many(:tea_subscriptions)}
    it { should have_many(:subscriptions).through(:tea_subscriptions)}
  end
end
