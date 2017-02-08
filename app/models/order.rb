class Order < ApplicationRecord
  before_create :generate_token
  belongs_to :resume
  belongs_to :user

  def paid?
    is_paid
  end

  include AASM

    aasm do
      state :order_placed, initial: true
      state :choosed
      state :paid
      state :order_cancelled

      event :order_choosed do
        transitions from: :order_placed, to: :choosed
      end

      event :order_paid do
        transitions from: :choosed, to: :paid
      end

      event :cancell_order do
        transitions from: [:order_placed, :paid, :choosed], to: :order_cancelled
      end
    end

private

  def generate_token
    self.token = SecureRandom.uuid
  end

end
