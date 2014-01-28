module CoachesHelper
  def render_name_as_first_and_last(name)
    [
      (content_tag :p, name.split(" ").first, class: "name"),
      (content_tag :p, name.split(" ").last, class: "last")
    ].join("</br>").html_safe
  end
end
