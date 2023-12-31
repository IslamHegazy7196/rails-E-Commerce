class Instrument < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  mount_uploader :image, ImageUploader
  serialize :image, JSON
  belongs_to :user, optional: true
  has_many :line_items

  validates :title, :brand, :price, :model, presence: true
  validates :description, length: { maximum: 1000, too_long: '%<count>s characters is the maximum allowed.' }

  validates :title, length: { maximum: 140, too_long: '%<count>s characters is the maximum allowed' }
  validates :price, format: { with: /\A\d+(\.\d+)?\z/ }, length: { maximum: 7 }

  BRAND = %w[Fender Gibson Epiphone ESP Martin Dean Taylor Jackson PRS Ibanez Charvel Washburn]
  FINISH = %w[Black White Navy Blue Red Clear Satin Yellow Seafoam]
  CONDITION = %w[New Excellent Mint Used Fair Poor]

  def not_referenced_by_any_line_item
    return if line_items.empty?

    errors.add(:base, 'Line items present')
    throw :abort
  end
end
