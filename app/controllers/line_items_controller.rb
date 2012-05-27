class LineItemsController < ApplicationController


  # GET /line_items/1/edit
#  def edit
#    @line_item = LineItem.find(params[:id])
#  end

  # POST /line_items
  def create
    @cart = current_cart
    if @line_item = LineItem.where(:pizza_id => params[:pizza_id], :cart_id => @cart.id).first  
      @line_item.count += params[:count].to_i
      @line_item.save
    else
      pizza = Pizza.find(params[:pizza_id])
      @line_item = @cart.line_items.build(pizza: pizza, count: params[:count])
    end
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to main_index_path, notice: "Item was successfully created." }
        format.json { render json: @line_item, status: :created, location: @line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /line_items/1
  # DELETE /line_items/1.xml
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
     if current_cart.line_items.count == 0 
      format.html { redirect_to root_path }
     else 
      format.html { redirect_to current_cart }
     end
    end
  end
end
