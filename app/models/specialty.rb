class Specialty < ApplicationRecord
  belongs_to :service_specialties

  validates :name, presence: true
end
