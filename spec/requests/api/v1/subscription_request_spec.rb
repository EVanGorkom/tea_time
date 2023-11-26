require 'rails_helper'

RSpec.describe Subscription do
  describe "#create" do 
    it "Happy Path" do
      customer1 = Customer.create(first_name: "Jill", last_name: "Warrick", email: "diamond_dust@gmail.com", address: "Castle Rosfield")

      subscription_data = {
        "title": "Gyshal Greens", 
        "price": 3, 
        "frequency": 3, 
        "status": "active", 
        "customer_id": customer1.id
      } 

      post "/api/v1/subscriptions", params: subscription_data, as: :json

      expect(response).to have_http_status(201)

      json_response = JSON.parse(response.body)

      expect(json_response).to be_a Hash
      expect(json_response['success']).to eq("Subcription added successfully")
    end

    it "Sad Path" do
      customer1 = Customer.create(first_name: "Jill", last_name: "Warrick", email: "diamond_dust@gmail.com", address: "Castle Rosfield")

      # Bad customer id value
      subscription_data = {
        "title": "Gyshal Greens", 
        "price": 3, 
        "frequency": 3, 
        "status": "active", 
        "customer_id": 12312423412342134
      } 

      post "/api/v1/subscriptions", params: subscription_data, as: :json

      expect(response).to have_http_status(401)

      json_response = JSON.parse(response.body)

      expect(json_response).to be_a Hash
      expect(json_response['error']).to eq("A problem occured, please try again")
    end
  end

  describe "#Delete" do
    it "Can delete an existing subscription" do
      customer1 = Customer.create(first_name: "Jill", last_name: "Warrick", email: "diamond_dust@gmail.com", address: "Castle Rosfield")
      subscription1 = Subscription.create(title: "Pheonix Pinion", price: 99, frequency: 12, status: "active", customer_id: customer1.id)

      delete "/api/v1/subscriptions/#{subscription1.id}", params: { id: subscription1.id }

      expect(response).to have_http_status(204)
    end
  end
end