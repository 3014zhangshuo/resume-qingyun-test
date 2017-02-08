class AddIsPaidToResume < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :is_paid, :boolean, default: false
  end
end
