class Order < ApplicationRecord
  before_create :generate_token
  belongs_to :resume
  belongs_to :user

  def paid?
    is_paid
  end

private

 def generate_token
   self.token = SecureRandom.uuid
 end

end
