class Pic < ActiveRecord::Base
	attr_accessible :image, :crop_x, :crop_y, :crop_w, :crop_h
    has_attached_file :image,
                    :styles => {
                      :thumb => ["100x100#", :jpg]
                    },
                    :processors => [:cropper],
                    :default_style => :pagesize,
					:url  => "/assets/products/:id/:style/:basename.:extension",
					:path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
	validates_attachment_presence :image
	validates_attachment_size :image, :less_than => 3.megabytes
	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
  
 #  after_update :reprocess_image, :if => :cropping?

    def cropping?
      !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
    end
    
    def image_geometry(style = :original)
      @geometry ||= {}
      @geometry[style] ||= Paperclip::Geometry.from_file(image.path(style))
    end

end
