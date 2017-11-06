class Image < ApplicationRecord
  belongs_to :imageable

  has_attached_file :attachment, styles: { large: "950x400#", medium: "300x200>" }, default_url: "missing_:style.png"
  validates_attachment :attachment, presence: true, content_type: { content_type: %w[image/jpeg image/png image/gif] }, size: { in: 0..5.megabytes }

end
