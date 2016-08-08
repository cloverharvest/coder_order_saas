module ApplicationHelper
  # returns the full title on a per-page application bais

  def full_title(page_title= '')
    base_title = "The Order of Coders"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
