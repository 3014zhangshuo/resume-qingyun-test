# == Schema Information
#
# Table name: resumes
#
#  id                        :integer          not null, primary key
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  one_line_description      :string
#  self_description          :string
#  past_description1         :string
#  past_description2         :string
#  why_employer              :string
#  why_employee1             :string
#  why_employee2             :string
#  why_employee3             :string
#  past_project_title1       :string
#  past_project_title2       :string
#  past_project_title3       :string
#  past_project_description1 :string
#  past_project_description2 :string
#  past_project_description3 :string
#  past_project_image1       :string
#  past_project_image2       :string
#  past_project_image3       :string
#  contact_details1          :string
#  contact_details2          :string
#  contact_details3          :string
#  contact_details4          :string
#  name_resume               :string
#  resume_name               :string
#  answer23                  :string
#  answer24                  :string
#  answer25                  :string
#  answer26                  :string
#  answer27                  :string
#  answer28                  :string
#  answer29                  :string
#  answer30                  :string
#  answer31                  :string
#  answer32                  :string
#  answer33                  :string
#  answer34                  :string
#  answer35                  :string
#  answer36                  :string
#  answer37                  :string
#  answer38                  :string
#  answer39                  :string
#  answer40                  :string
#  answer41                  :string
#  answer42                  :string
#  answer43                  :string
#  answer44                  :string
#  answer45                  :string
#  answer46                  :string
#  answer47                  :string
#  answer48                  :string
#  answer49                  :string
#  answer50                  :string
#  answer51                  :string
#  answer52                  :string
#  answer53                  :string
#  answer54                  :string
#  answer55                  :string
#  answer56                  :string
#  answer57                  :string
#  answer58                  :string
#  answer59                  :string
#  user_id                   :integer
#

class Resume < ApplicationRecord

	has_one :order
	has_one :resume_html, dependent: :destroy
	has_many :resume_images, dependent: :destroy
	belongs_to :user
	mount_uploader :past_project_image1, ImageUploader
 	mount_uploader :past_project_image2, ImageUploader
 	mount_uploader :past_project_image3, ImageUploader
  scope :recent, -> {order("created_at DESC")}

	def paid?
		is_paid
	end

include AASM
 aasm do
	 state :drafting, initial: true
	 state :ordered
	 state :submit_one
	 state :edit_one
	 state :submit_two
	 state :edit_two
	 state :complete

	 event :user_order do
		 transitions from: :drafting, to: :ordered
	 end

	 event :user_start do
		 transitions from: :ordered, to: :submit_one
	 end

	 event :expert_first_start do
		 transitions from: :submit_one, to: :edit_one
	 end

	 event :user_second_start do
		 transitions from: :edit_one, to: :submit_two
	 end

	 event :expert_second_start do
		 transitions from: :submit_two, to: :edit_two
	 end

	 event :user_mark_complete do
		 transitions from: :edit_two, to: :complete
	 end
 end

end
