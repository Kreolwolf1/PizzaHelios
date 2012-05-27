class MainController < ApplicationController
  def index
  	@pizzas = Pizza.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pizzas }
    end
  end

  def show

  end	

end
