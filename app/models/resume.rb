class Resume < ApplicationRecord
  mount_uploader :past_project_image1, ImageUploader
  mount_uploader :past_project_image2, ImageUploader
  mount_uploader :past_project_image3, ImageUploader
  belongs_to :user, foreign_key: :user_id
end
