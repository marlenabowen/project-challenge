module ApplicationHelper
  def owner?(dog)
    return false if current_user.nil?
    current_user == dog.user && !dog.user.nil?
  end
end
