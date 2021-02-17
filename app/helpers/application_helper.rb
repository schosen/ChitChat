module ApplicationHelper
  # delete the below after refactoring
  def profile_pic(user, size)
    url = "https://picsum.photos/id/#{1000 + user.id}/#{size}/#{size}"
  end

  def error_profile_pic
    url = "https://www.kirkham-legal.co.uk/wp-content/uploads/2017/02/profile-placeholder.png"
  end

end
