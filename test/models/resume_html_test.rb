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

require 'test_helper'

class ResumeHtmlTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
