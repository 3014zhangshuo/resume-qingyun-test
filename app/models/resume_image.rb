# == Schema Information
#
# Table name: resume_images
#
#  id         :integer          not null, primary key
#  resume_id  :integer
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ResumeImage < ApplicationRecord
	belongs_to :resume
	mount_uploader :content, ImageUploader
end
