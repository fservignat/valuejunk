class Junk < ApplicationRecord
  belongs_to :user

  has_many_attached :photos

  validates :title, presence: true
  validates :address, presence: true
  validates :description, length: { in: 10..400 }
  validates :category, presence: true
  validates :category, inclusion: { in: ["Materials", "Furniture", "Electronics / Appliance", "Toys", "Clothing", "Plastics", "Décor", "Arts", "Others"] }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
