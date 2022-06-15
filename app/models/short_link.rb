class ShortLink < ApplicationRecord
  validates :slug, presence: true, uniqueness: true
  validates :destination, presence: true
  validates :destination, url: true, if: -> { destination.presence }

  before_validation :lowercase

  def url
    "#{ENV['API_URL']}#{slug}"
  end

  private

  def lowercase
    self.slug = slug.to_s.downcase
    self.destination = destination.to_s.downcase
  end
end
