class AddAddtion10columnToResume < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :answer50, :string
    add_column :resumes, :answer51, :string
    add_column :resumes, :answer52, :string
    add_column :resumes, :answer53, :string
    add_column :resumes, :answer54, :string
    add_column :resumes, :answer55, :string
    add_column :resumes, :answer56, :string
    add_column :resumes, :answer57, :string
    add_column :resumes, :answer58, :string
    add_column :resumes, :answer59, :string
  end
end
