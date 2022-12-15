class Service < ApplicationRecord

  belongs_to :user

  has_many_attached :photos

  has_many :specialties, through: :service_specialties

  # array is used as this is the quickest way to implement the tag using tagable gem.
  $crafts = ["","Ceramics and glass", "Fibre and textile", "Flower & Gardening", "Leatherwork", "Houseware", "Paper", "Wood and furniture", "Stone", "Metal"]
  $specialities = ["Fence", "Chair", "Table", "Sofa", "Windows", "Structure", "Outfits", "Fashion", "Children"]
  $ceramics = ["Azulejo","Cameo glass","Earthenware","Glass and glass art","Bubblegram","Fabrication","Glass beadmaking","Glass etching","Glassblowing","Glassmaking","Stained glass","Glassware","Mosaic","Porcelain","Bone china","Pottery"]
  $fibres = ["Bobbin lace","Felting","Knotting","Chinese knotting","Macramé","Rope-making","Rug making","Spinning","Stitch","Tatting","Weaving","Fashion","Cloth","Dyeing and Printing","Batik","Jewelry","Beadwork","Needlework","Applique","Crochet","Embroidery","Canvas work","Bargello","Berlin wool work","Needlepoint","Counted-thread","Blackwork","Cross-stitch","Whitework","Surface embroidery","Brazilian embroidery","Candlewicking","Couching","Crewel embroidery","Goldwork","Ribbon embroidery","Sashiko","Stumpwork","Knitting","Nålebinding","Needlelace","Patchwork","Quilting","Broderie perse","English paper piecing","Trapunto","Sewing"]
  $flowers = ["Bouquet","Floral Design"]
  $leatherworks = ["Boiled leather making","Leather carving","Leather crafting","dyeing","painting", "Basket weaving"]
  $papers = ["Bookbinding","Calligraphy","Cast paper","Decoupage","Iris folding","Origami (paper folding)","Paper embossing","Paper marbling","Paper model","Papercutting","Papermaking","Papier-mâche","Parchment craft","Quilling"]
  $woods = ["Cabinet making","Carpentry","Intarsia","Kumiko","Lacquer art","Marquetry","Spoon carving","Timber framing","Upholstery","Wood burning","Wood carving","Woodturning","Woodworking"]
  $stones = ["Flintknapping","Letter carving on stone.","Mosaics and inlaying","Stone carving"]
  $metals = ["Blacksmithing","Casting","Clockmaking","Cloisonné","Coppersmith","Enamelling","Farrier","Jewellery","Goldsmith","Lapidary","Knife making","Locksmithing","Metalworking","Pewter","Silversmith","Tinware - tinsmith","Watchmaking","Weaponsmith","sword making","armorer","gunsmith"]




  validates :title, presence: true
  validates :title, length: { in: 10..125 }
  validates :address, presence: true
  validates :description, length: { in: 10..400 }
  validates :craft, presence: true
  validates :craft, inclusion: { in: ["Ceramics and glass", "Fibre and textile", "Flower & Gardening", "Leatherwork", "Houseware", "Paper", "Wood and furniture", "Stone", "Metal"] }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  acts_as_taggable_on :specialities
end
