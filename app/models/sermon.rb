class Sermon < ApplicationRecord
  validates :title, presence: true,
                    length: {maximum: 150}

end
