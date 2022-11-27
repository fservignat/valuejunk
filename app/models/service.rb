class Service < ApplicationRecord

  belongs_to :user

  has_many_attached :photos

  has_many :specialties, through: :service_specialties

  $crafts = ["","Ceramics and glass", "Fibre and textile", "Flower", "Leatherwork", "Houseware", "Fashion", "Needlework", "Paper", "Wood and furniture", "Stone", "Metal"]
  $specialities = ["Fence", "Chair", "Table", "Sofa", "Windows", "Structure", "Outfits", "Fashion", "Children"]

  validates :title, presence: true
  validates :address, presence: true
  validates :description, length: { in: 10..400 }
  validates :craft, presence: true
  validates :craft, inclusion: { in: ["Ceramics and glass", "Fibre and textile", "Flower", "Leatherwork", "Houseware", "Fashion", "Needlework", "Paper", "Wood and furniture", "Stone", "Metal"]}

  acts_as_taggable_on :specialities
end
