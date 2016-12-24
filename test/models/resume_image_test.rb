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

require 'test_helper'

class ResumeImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
