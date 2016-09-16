class Comment < ApplicationRecord
  before_validation :convert_rumoji
  validates :body, presence: true

  def decode_body
    Rumoji.decode(self.body)
  end

  private

  def convert_rumoji
    self.body = Rumoji.encode(self.body)
  end
end
