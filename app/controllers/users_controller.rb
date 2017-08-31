# Create new user
get '/users/new' do
  erb :'users/new'
end

post '/users/new' do
  @user = User.create(params[:user])
  redirect "users/#{@user.id}"
end

# Allow user login
get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  @user = User.find_by(email: params[:email])
  if User.authenticate(params[:email], params[:password])
    redirect "/users/#{@user.id}"
  else
    "Hello world"
  end
end

# Show user profile
get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'users/profile'
end

