module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Discover Box Hills"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
      image_tag("fobh3.png", :alt => "FOBH")
  end 
end