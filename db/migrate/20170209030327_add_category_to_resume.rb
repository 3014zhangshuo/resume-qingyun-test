class AddCategoryToResume < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :category, :string
  end
end
