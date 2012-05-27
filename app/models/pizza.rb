class Pizza < ActiveRecord::Base
	has_attached_file :photo, :styles => { :small => "150x150>", :normal => "200x200>"}

    validates :name,  :presence => true, 
                      :length => {:minimum => 1, :maximum => 254} 
    validates :mass, :numericality => true
    validates :diameter, :numericality => true
    validates :cost, :numericality => true


	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image.png'] 
end
