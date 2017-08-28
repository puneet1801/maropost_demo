module GalleriesHelper
	def get_galler_image(gallery)
		image_tag(gallery.image.url(:thumb)) unless gallery.image.url.nil?
	end
end
