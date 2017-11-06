class Property < ApplicationRecord

  PROPERTY_TYPES = %w[Apartamento Apartaestudio Casa Finca Lote]
  AVAILABILITY_TYPES = %w[Venta Arriendo]
  MAX_IMAGES = 10

  belongs_to :user
  has_many :images, as: :imageable, dependent: :destroy

  validates :property_type, :area, :price, :description, :neighborhood, :address, :city, :availability, presence: true
  validates :rooms, :bathrooms, :age, :stratum, :floor, :parkings, presence: true, unless: -> { property_type == 'Lote'}
  validates :price, numericality: { only_integer: true, less_than: 20000000000 }

  accepts_nested_attributes_for :images, allow_destroy: true

  def pretty_age
    age == 0 ? 'Nuevo' : "#{age} años de uso"
  end

  def default_image
    images.first || Image.new
  end

end


