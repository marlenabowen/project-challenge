module ApplicationHelper
  def owner?(dog)
    current_user == dog.user && !dog.user.nil?
  end
end
