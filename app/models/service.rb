class Service < ApplicationRecord

  belongs_to :user

  has_many_attached :photos

  has_many :specialties, through: :service_specialties

  $craft = ["","Ceramics and glass", "Fibre and textile", "Flower", "Leatherwork", "Houseware", "Fashion", "Needlework", "Paper", "Wood and furniture", "Stone", "Metal"]

  validates :title, presence: true
  validates :address, presence: true
  validates :description, length: { in: 10..400 }
  validates :craft, presence: true
  validates :craft, inclusion: { in: $craft }


end
