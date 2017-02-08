# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean          default(FALSE)
#

class User < ApplicationRecord
  #before_create :create_user_code
  before_update :create_user_code

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

	has_many :resumes
  #attr_accessor :user_code
  #validate :create_user_code, :on => :create

	def admin?
	  is_admin
	end

  def confirm?
    is_confirmed
  end

	def admin!
	  self.is_admin = true
	  self.save
	end

	def user!
	  self.is_admin = false
	  self.save
	end

  private

  def create_user_code
    if self.user_code.blank?
       self.user_code = SecureRandom.hex
       self.save!
    end
  end
  
end
