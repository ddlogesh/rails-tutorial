class Micropost < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size

  default_scope -> { order(created_at: :desc)}

  private
  def picture_size
    if picture.size > 1.megabyte
      errors.add(:picture, "should be less than 1MB")
    end
  end
end
