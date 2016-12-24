class Rename1MoreColumnResume < ActiveRecord::Migration[5.0]
  def change
		change_table :resumes do |t|
			t.rename :answer21, :name_resume
		end
  end
end
