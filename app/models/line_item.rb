class LineItem < ActiveRecord::Base
	belongs_to :pizza
	belongs_to :car

end
