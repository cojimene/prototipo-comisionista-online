class Message < ApplicationRecord
  belongs_to :user
  belongs_to :recipient, class_name: 'User'

  validates :user, :recipient, :subject, :content, presence: true

end
