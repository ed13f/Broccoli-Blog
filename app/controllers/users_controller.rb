get '/users/new' do
  erb :'users/new'
end

post '/users/new' do
  @user = User.new(params[:user])
  @user.save
  redirect 'users/:id'
end

get 'users/:id' do

end