def session_user
  @user = User.find_by(id: session[:user_id])
end
