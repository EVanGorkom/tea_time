class Api::V1::CustomersController < ApplicationController
  def create
    customer = Customer.new(customer_params)

    if customer.save
      render json: { success: "Account created successfully" }, status: 201
    else
      render json: { error: "A problem occured, please try again" }, status: 401
    end
  end
end

private

def customer_params
  params.permit(:first_name, :last_name, :email, :address)
end