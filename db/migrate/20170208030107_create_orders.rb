class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :resume_id
      t.string :token
      t.string :plan
      t.integer :plan_amount
      t.string :money
      t.string :paymethod
      t.boolean :is_paid, default: false
      t.string :pay_code
      t.string :paid_code
      t.timestamps
    end
  end
end
