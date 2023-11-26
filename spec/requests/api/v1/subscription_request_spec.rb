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

  describe "#Index" do
    it "Can fetch all of the subscriptions for a customer" do
      customer1 = Customer.create!(first_name: "Jill", last_name: "Warrick", email: "diamond_dust@gmail.com", address: "Castle Rosfield")
      subscription1 = Subscription.create(title: "Pheonix Pinion", price: 99, frequency: 12, status: "active", customer_id: customer1.id)
      subscription2 = Subscription.create(title: "Gyshal Greens", price: 5, frequency: 3, status: "active", customer_id: customer1.id)
      subscription3 = Subscription.create(title: "Elixir", price: 10, frequency: 3, status: "active", customer_id: customer1.id)

      get "/api/v1/subscriptions", params: { id: customer1.id }

      expect(response).to have_http_status(200)

      json_response = JSON.parse(response.body)
      expect(json_response).to be_a Array

      expect(json_response[0]["id"]).to eq(subscription1.id)
      expect(json_response[0]["title"]).to eq(subscription1.title)
      expect(json_response[0]["price"]).to eq(subscription1.price)
      expect(json_response[0]["frequency"]).to eq(subscription1.frequency)
      expect(json_response[0]["customer_id"]).to eq(subscription1.customer_id)

      expect(json_response[1]["id"]).to eq(subscription2.id)
      expect(json_response[1]["title"]).to eq(subscription2.title)
      expect(json_response[1]["price"]).to eq(subscription2.price)
      expect(json_response[1]["frequency"]).to eq(subscription2.frequency)
      expect(json_response[1]["customer_id"]).to eq(subscription2.customer_id)

      expect(json_response[2]["id"]).to eq(subscription3.id)
      expect(json_response[2]["title"]).to eq(subscription3.title)
      expect(json_response[2]["price"]).to eq(subscription3.price)
      expect(json_response[2]["frequency"]).to eq(subscription3.frequency)
      expect(json_response[2]["customer_id"]).to eq(subscription3.customer_id)
    end
  end
end