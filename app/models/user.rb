class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :user_profile, inverse_of: :user

  validates :user_profile, presence: true, on: :update

  alias_method :profile, :user_profile

  def has_profile?
    user_profile.present?
  end

end
