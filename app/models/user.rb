class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :user_profile, inverse_of: :user, dependent: :destroy
  has_many :properties, dependent: :destroy

  validates :user_profile, presence: true, on: :update

  delegate :role, to: :user_profile, allow_nil: true

  alias_method :profile, :user_profile

  def has_profile?
    user_profile.present?
  end

  def agent?
    role == 'Comisionista'
  end

  def owner?
    role == 'Propietario'
  end

  def investment?
    role == 'Inversionista'
  end

end
