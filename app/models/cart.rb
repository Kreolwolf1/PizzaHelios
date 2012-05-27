class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def total_price
		if line_items.present?
			
			@total = line_items.map {|item|
				item.count * item.pizza.cost.to_f 
			}
			return @total.sum.round(2)
		end
		
	end

end
