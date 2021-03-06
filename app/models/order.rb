class Order < ApplicationRecord
  before_create :generate_token
  belongs_to :resume
  belongs_to :user
  def paid?
    is_paid
  end

  def self.default_money
      ["￥399"]
  end

  def self.default_paymethod
    ["微信"]
  end

  def self.default_plan
    ["投行标准简历修改", "程序员专业简历修改"]
  end

  def self.default_plan_amount
    [1]
  end
  include AASM

    aasm do
      state :order_placed, initial: true
      state :paid
      state :order_cancelled

      event :order_paid do
        transitions from: :order_placed, to: :paid
      end

      event :cancell_order do
        transitions from: [:order_placed, :paid,], to: :order_cancelled
      end
    end

private

  def generate_token
    self.token = SecureRandom.uuid
  end

end
