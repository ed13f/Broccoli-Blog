get '/users/new' do
  erb :'users/new'
end

post '/users' do
  create_user
end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  login
end

delete '/logout' do
  session.delete(:user_id)
  redirect '/'
end

get '/users/show' do
  @user = current_user.id
  erb :'users/show'
end
