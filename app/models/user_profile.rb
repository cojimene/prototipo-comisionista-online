class UserProfile < ApplicationRecord

  MAIN_CITIES = %w[Medellin Bogotá Cali Bucaramanga Armenia]
  ROLES = %w[Comisionista Propietario Inversionista]

  belongs_to :user

  has_attached_file :avatar, styles: { medium: "300x200>", thumb: "100x65>" }, default_url: "/images/missing_:style.png"
  validates_attachment :avatar, presence: true, content_type: { content_type: %w[image/jpeg image/png image/gif] }, size: { in: 0..5.megabytes }

  validates :user, :first_name, :last_name, :birthdate, :about, :city, :phone, :role, presence: true
  validates :role, inclusion: { in: ROLES, allow_blank: true }
  validates :city, inclusion: { in: MAIN_CITIES, allow_blank: true }
  validates :user_id, uniqueness: true

  delegate :email, to: :user

  def full_name
    "#{first_name} #{last_name}"
  end

end



