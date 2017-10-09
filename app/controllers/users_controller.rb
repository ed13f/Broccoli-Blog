#create
get '/users/new' do
  erb :"/users/new"
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

#show
get '/users/:id' do
  require_user
  @user = User.find(params[:id])
  @entries = @user.entries
  # binding.pry
  if @user.id == session[:user_id]
    erb :"/users/show"
  else
    @errors = ["you are not authorized to view this page"]
    erb :'entries/index'
  end
end

#show users posts
get '/users/:id/entries' do
  @user = User.find(params[:id])
  erb :'users/user_posts'
end


#login
get '/sessions/new' do
  erb :'users/login'
end

post '/sessions' do
   user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    status 442
    @errors = ["login failed."]
    erb :'users/login'
  end
end

#log out
delete '/sessions' do
  session.clear
  redirect '/'
end