class Series < ApplicationRecord
  has_many :sermons
  validates :title, presence: true,
                    length: {minimum: 3, maximum: 200}

  has_attached_file :image, styles: { thumb: "200x200>", medium: "500x500>" }, default_url: "missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
