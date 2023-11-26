class Api::V1::SubscriptionsController < ApplicationController
  def create
    customer = Customer.find_by(id: params[:customer_id])

    if customer
      subscription = customer.subscriptions.create(sub_params)
      render json: { success: "Subcription added successfully" }, status: 201
    else
      render json: { error: "A problem occured, please try again" }, status: 401
    end
  end

  def destroy
    subscription = Subscription.find(params[:id])
    render json: { success: "Subscription cancelled successfully" }, status: 204
  end

  private

  def sub_params
    params.permit(:title, :price, :frequency, :status)
  end
end