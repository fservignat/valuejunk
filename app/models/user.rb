class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :junks
  has_many :services
  has_many :projects
  has_many :specialties, through: :services
  has_many :messages, through: :junks
  has_many :messages, through: :services
  has_many :messages, through: :projects

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { in: 6..14 }

  validates :email, uniqueness: true, on: :create

  validates :address, presence: true

  validates :bio, length: { in: 50..400 }

end
