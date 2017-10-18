class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = 0
    item = []
    Cart.all.each do |thing|
      @amount = @amount + (thing.product.price * thing.qty)
      item.push(thing.product)
    end
    @amount = @amount * 100
    @amount = @amount.to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    PaymentMailer.payment_notification(@item, @amount).deliver_now

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
end
