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
<<<<<<< HEAD
  validates :craft, inclusion: { in: ["Ceramics and glass", "Fibre and textile", "Flower", "Leatherwork", "Houseware", "Fashion", "Needlework", "Paper", "Wood and furniture", "Stone", "Metal"]}

  acts_as_taggable_on :specialities
=======
  validates :craft, inclusion: { in: ["Ceramics and glass", "Fibre and textile", "Flower", "Leatherwork", "Houseware", "Fashion", "Needlework", "Paper", "Wood and furniture", "Stone", "Metal"] }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
>>>>>>> 641de06f02bb80d6fca640ab676635ae6433e134
end
