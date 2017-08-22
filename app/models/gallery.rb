class Gallery < ApplicationRecord
  mount_uploader :image, ImageUploader
  paginates_per 5

  validates :name, presence: true, uniqueness: true
  validates :image, presence: true

  def self.import(file)
    if CSV.foreach(file.path).count == 0 || CSV.foreach(file.path, headers: true).count == 0
      return "No data found"
    else
      valid_rows = 0
      invalid_rows = 0

    	CSV.foreach(file.path, headers: true) do |row|
        name = row.to_hash["name"]
        image = row.to_hash["image"]

        if name.blank? || image.blank?
          invalid_rows += 1
        else
          valid_rows += 1
          Gallery.create(name: name, remote_image_url: image)
        end
    	end
      return "Data Imported. Valid Rows: #{valid_rows} Invalid Rows: #{invalid_rows}"
    end
  end
end
