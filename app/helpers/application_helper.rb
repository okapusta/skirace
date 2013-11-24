module ApplicationHelper

  def javascript_tag file
    "<script type='text/javascript' src='#{Dir["./public/assets/#{file}-*.js"].first.gsub('./public', '')}'></script>"
  end

  def stylesheet_tag file
    "<link type='text/css' rel='stylesheet' href='#{Dir["./public/assets/#{file}-*.css"].first.gsub('./public', '')}'></link>"
  end
end