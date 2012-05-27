class MainController < ApplicationController
  def index
  	@pizzas = Pizza.all
  	if !session["cart_id"].nil?
  		@cart = current_cart
  	end 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pizzas }
    end
  end

  def show

  end	

end
