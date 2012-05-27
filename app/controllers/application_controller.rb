class ApplicationController < ActionController::Base
  protect_from_forgery

  private
	def current_cart
		puts "----#{session[:cart_id]}----"
		Cart.find(session[:cart_id])


	rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		puts "+++#{session[:cart_id]}+++"
		cart
	end

end
