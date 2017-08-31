#sign up
get '/users/new' do
  @user = User.new
  erb :'users/new'

end

post '/users' do
  @user = User.create(params[:user])
  if @user.valid?
    session[:user_id] = @user.id
    redirect '/sessions/new'
    # redirect "/users/#{@user.id}"
  else
    status 422
    @errors = @user.errors.full_messages
    erb :"/users/new"
  end

end
#login

get '/sessions/new' do
  erb :'sessions/login'

end

post '/sessions' do
  user = User.find_by(email: params[:user][:email])
  if user && user.password == params[:user][:password]
    session[:user_id] = user.id
    # redirect "/users/#{user.id}"
    redirect "/entries"
    # erb :"/entries/index"
  else
    status 422
    @errors = ["Login failed."]
    erb :"sessions/login"
  end
end


#logout
delete '/logout' do
  session.delete(:user_id)
  redirect '/'
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

#show
get'/users/:id' do
end
