class Service < ApplicationRecord

  belongs_to :user

  has_many_attached :photos

  has_many :specialties, through: :service_specialties

  $crafts = ["","Ceramics and glass", "Fibre and textile", "Flower & Gardening", "Leatherwork", "Houseware", "Paper", "Wood and furniture", "Stone", "Metal"]
  $specialities = ["Fence", "Chair", "Table", "Sofa", "Windows", "Structure", "Outfits", "Fashion", "Children"]
  $ceramics = ["Azulejo","Cameo glass","Earthenware","Glass and glass art","Bubblegram","Fabrication","Glass beadmaking","Glass etching","Glassblowing","Glassmaking","Stained glass","Glassware","Mosaic","Porcelain","Bone china","Pottery"]
  $fibres = ["Bobbin lace","Felting","Knotting","Chinese knotting","Macramé","Rope-making","Rug making","Spinning","Stitch","Tatting","Weaving","Fashion","Cloth","Dyeing and Printing","Batik","Jewelry","Beadwork","Needlework","Applique","Crochet","Embroidery","Canvas work","Bargello","Berlin wool work","Needlepoint","Counted-thread","Blackwork","Cross-stitch","Whitework","Surface embroidery","Brazilian embroidery","Candlewicking","Couching","Crewel embroidery","Goldwork","Ribbon embroidery","Sashiko","Stumpwork","Knitting","Nålebinding","Needlelace","Patchwork","Quilting","Broderie perse","English paper piecing","Trapunto","Sewing"]


  validates :title, presence: true
  validates :address, presence: true
  validates :description, length: { in: 10..400 }
  validates :craft, presence: true
  validates :craft, inclusion: { in: ["Ceramics and glass", "Fibre and textile", "Flower & Gardening", "Leatherwork", "Houseware", "Paper", "Wood and furniture", "Stone", "Metal"] }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  acts_as_taggable_on :specialities
end
