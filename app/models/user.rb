class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :user_profile, inverse_of: :user, dependent: :destroy
  has_many :properties, dependent: :destroy

  has_and_belongs_to_many :contacts, join_table: :users_contacts, class_name: 'User', association_foreign_key: :contact_id

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

  def is_contact?(other_profile)
    other_user = other_profile.user
    other_user != self && contacts.include?(other_user)
  end


end
