class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :junks, dependent: :destroy
  has_many :services, dependent: :destroy
  # has_many :projects, dependent: :destroy

  # has_many :specialties, through: :services

  has_many :messages, through: :junks
  has_many :messages, through: :services
  has_many :messages, through: :projects

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { in: 5..14 }

  validates :email, uniqueness: true, on: :create

  validates :address, presence: true

  validates :bio, length: { in: 10..400 }

end
