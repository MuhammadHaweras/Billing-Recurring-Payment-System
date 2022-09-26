module ApplicationHelper
  def nav_bar
    return 'shared/navbar_admin' if current_user.admin?

    'shared/navbar_buyer'
  end
end
