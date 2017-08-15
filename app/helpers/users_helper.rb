module UsersHelper
  def currently_impersonating?
    current_user != true_user
  end
end
