module ApplicationHelper
  def render_user_states(user)
    if user.admin?
      content_tag(:i, "", class: "fa fa-user-secret")
    else
      content_tag(:i, "", class: "fa fa-user")
    end
  end

  def render_user_name(user)
    if user.resumes.present?
      user.resumes.first.name_resume
    else
    end
  end
end
