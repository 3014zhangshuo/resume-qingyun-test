class RenameFirst21ColumnsResume < ActiveRecord::Migration[5.0]
  def change
		change_table :resumes do |t|
			t.rename :answer00, :one_line_description
			t.rename :answer01, :self_description
			t.rename :answer02, :past_description1
			t.rename :answer03, :past_description2
			t.rename :answer04, :why_employer
			t.rename :answer05, :why_employee1
			t.rename :answer06, :why_employee2
			t.rename :answer07, :why_employee3
			t.rename :answer08, :past_project_title1
			t.rename :answer09, :past_project_title2
			t.rename :answer10, :past_project_title3
			t.rename :answer11, :past_project_description1
			t.rename :answer12, :past_project_description2
			t.rename :answer13, :past_project_description3
			t.rename :answer14, :past_project_image1
			t.rename :answer15, :past_project_image2
			t.rename :answer16, :past_project_image3
			t.rename :answer17, :contact_details1
			t.rename :answer18, :contact_details2
			t.rename :answer19, :contact_details3
			t.rename :answer20, :contact_details4
		end
  end
end
