# == Schema Information
#
# Table name: resume_htmls
#
#  id         :integer          not null, primary key
#  resume_id  :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ResumeHtml < ApplicationRecord
	belongs_to :resume
end
