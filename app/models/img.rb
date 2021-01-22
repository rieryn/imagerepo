class Img < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_one_attached :image_file
  validates :image, {
    presence: true
  }
  def get_image_url
    url_for(self.image)
  end
end
