class Pizza < ActiveRecord::Base
	has_attached_file :photo, :styles => { :small => "150x150>", :normal => "200x200>"}

    validates :name,  :presence => true, 
                      :length => {:minimum => 1, :maximum => 254} 
    validates :mass, :numericality => true
    validates :diameter, :numericality => true
    validates :cost, :numericality => true


	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image.png'] 

	has_many :line_items
	before_destroy :delete_all_depends

	private


		def delete_all_depends
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line Items present')
				return false
			end
		end



end
