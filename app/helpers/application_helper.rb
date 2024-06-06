module ApplicationHelper
  include Pagy::Frontend

  GENDER_BADGE_CLASS = {
    "female" => "badge text-bg-warning text-white",
    "male" => "badge text-bg-info text-white"
  }.freeze


  def gender_badge(gender)
    badge_class = GENDER_BADGE_CLASS[gender] || GENDER_BADGE_CLASS["female"]
    content_tag(:span, gender.upcase, class: badge_class)
  end

  def notification_container_class
    if user_signed_in?
      base_class = "transition transform duration-5000 hidden toast-container position-fixed top-0 end-0 px-3 pb-3 pt-4 mt-5"
    else
      base_class = "transition transform duration-5000 hidden toast-container position-fixed top-0 end-0 px-3 pb-3 pt-5 mt-5"
    end
    return base_class
  end
end
