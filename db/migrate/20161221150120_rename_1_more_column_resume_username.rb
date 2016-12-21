class Rename1MoreColumnResumeUsername < ActiveRecord::Migration[5.0]
  def change
		change_table :resumes do |t|
			t.rename :answer22, :resume_name
		end
  end
end
