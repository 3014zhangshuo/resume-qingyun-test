class Order < ApplicationRecord
  before_create :generate_token
  before_create :generate_pay_code
  belongs_to :resume
  belongs_to :user

private

 def generate_token
   self.token = SecureRandom.uuid
 end

 def generate_pay_code
   if self.pay_code.blank?
      self.pay_code = SecureRandom.hex
      self.save!
   end
 end

end
