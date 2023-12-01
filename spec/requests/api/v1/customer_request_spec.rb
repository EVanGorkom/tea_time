require 'rails_helper'

RSpec.describe Customer do
  describe "#create" do 
  it "creates a new customer" do
      customer_data = {
        "first_name": "Gyshal Greens", 
        "last_name": 3, 
        "email": 3, 
        "address": "active"
      } 

      post "/api/v1/customers", params: customer_data, as: :json

      expect(response).to have_http_status(201)

      json_response = JSON.parse(response.body)

      expect(json_response).to be_a Hash
      expect(json_response['success']).to eq("Account created successfully")
    end
  end
end