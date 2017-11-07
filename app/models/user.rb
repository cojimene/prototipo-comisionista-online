class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :user_profile, inverse_of: :user, dependent: :destroy
  has_many :properties, dependent: :destroy

  validates :user_profile, presence: true, on: :update

  delegate :role, to: :user_profile

  alias_method :profile, :user_profile

  def has_profile?
    user_profile.present? && user_profile.persisted?
  end

  def agent?
    has_profile? && role == 'Comisionista'
  end

  def owner?
    has_profile? && role == 'Propietario'
  end

  def investment?
    has_profile? && role == 'Inversionista'
  end


end
