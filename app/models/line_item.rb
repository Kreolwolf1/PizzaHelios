class LineItem < ActiveRecord::Base
	belongs_to :pizza
	belongs_to :cart


	def total_price
	  if pizza.present? 	
		(pizza.cost.to_f * count).round(2) 
	  end
	end

end
