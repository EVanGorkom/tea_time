require 'rails_helper'

RSpec.describe Subscription do
  it "Can Create new subscription for a customer" do
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
end