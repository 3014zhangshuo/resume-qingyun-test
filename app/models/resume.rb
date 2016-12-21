class Resume < ApplicationRecord
  #mount_uploader :answer00, ImageUploader
  belongs_to :user, foreign_key: :user_id
end
