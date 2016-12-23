# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  answer00   :string
#  answer01   :string
#  answer02   :string
#  answer03   :string
#  answer04   :string
#  answer05   :string
#  answer06   :string
#  answer07   :string
#  answer08   :string
#  answer09   :string
#  answer10   :string
#  answer11   :string
#  answer12   :string
#  answer13   :string
#  answer14   :string
#  answer15   :string
#  answer16   :string
#  answer17   :string
#  answer18   :string
#  answer19   :string
#  answer20   :string
#  answer21   :string
#  answer22   :string
#  answer23   :string
#  answer24   :string
#  answer25   :string
#  answer26   :string
#  answer27   :string
#  answer28   :string
#  answer29   :string
#  answer30   :string
#  answer31   :string
#  answer32   :string
#  answer33   :string
#  answer34   :string
#  answer35   :string
#  answer36   :string
#  answer37   :string
#  answer38   :string
#  answer39   :string
#  answer40   :string
#  answer41   :string
#  answer42   :string
#  answer43   :string
#  answer44   :string
#  answer45   :string
#  answer46   :string
#  answer47   :string
#  answer48   :string
#  answer49   :string
#  answer50   :string
#  answer51   :string
#  answer52   :string
#  answer53   :string
#  answer54   :string
#  answer55   :string
#  answer56   :string
#  answer57   :string
#  answer58   :string
#  answer59   :string
#

class Resume < ApplicationRecord
	has_one :resume_html
	belongs_to :user
	mount_uploader :past_project_image1, ImageUploader
 	mount_uploader :past_project_image2, ImageUploader
 	mount_uploader :past_project_image3, ImageUploader
end
