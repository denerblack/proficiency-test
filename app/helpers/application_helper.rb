module ApplicationHelper
  def page_title
    t "title.#{controller_name}"
  end
end
