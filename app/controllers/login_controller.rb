get '/login' do
  erb :"sessions/index"
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/entries"
  else
    status 422
    @errors = ["There was an error logging in."]
    erb :"sessions/index"
  end
end

get '/logout' do
  session.clear
  redirect "/login"
end
