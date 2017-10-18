class PagesController < ApplicationController
  def cart
    @cart = Cart.all
  end
end
