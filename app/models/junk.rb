class Junk < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :address, presence: true
  validates :description, length: { in: 10..400 }
  validates :category, presence: true
  validates :category, inclusion: { in: ["Materials", "Furniture", "Electronics / Appliance", "Toys", "Clothing", "Plastics", "Décor", "Arts", "Others"] }
end
