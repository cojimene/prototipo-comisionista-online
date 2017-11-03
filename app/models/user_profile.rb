class UserProfile < ApplicationRecord

  MAIN_CITIES = %w[Medellin Bogotá Cali Bucaramanga Armenia]

  belongs_to :user

  validates :user, :first_name, :last_name, :birthdate, :about, :experience, :city, :phone, presence: true
  validates :user_id, uniqueness: true

  delegate :email, to: :user

end



