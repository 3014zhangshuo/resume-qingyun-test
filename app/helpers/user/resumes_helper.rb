module User::ResumesHelper

  def show_what_category_resume_to_user(resume)
     if resume.category == "white"
       content_tag(:span, "白领简历")
     elsif resume.category == "developer"
       content_tag(:span, "程序员简历")
    end
  end

end
