class AddConfirmDetailToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_confirmed, :boolean, :default => false
    add_column :users, :confirm_code, :string
  end
end
