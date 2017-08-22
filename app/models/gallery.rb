class Gallery < ApplicationRecord
  mount_uploader :image, ImageUploader
  paginates_per 5

  validates_uniqueness_of :name

  def self.import(file)
  	CSV.foreach(file.path, headers: true) do |row|
      g = Gallery.new 
      g.name = row.to_hash["name"]
      g.remote_image_url = row.to_hash["image"]
      g.save
  	end
  end
end
