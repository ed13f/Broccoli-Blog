get '/users/:id/entries' do
  @users = User.find_by(id: params[:id])
  @entries = @users.entries
  erb :'users/index'
end

get '/users/:user_id/entries/:id' do
  @user = User.find_by(id: params[:user_id])
  @entry = find_and_ensure_entry(params[:id])
  if @user.id == @entry.user_id
    erb :'entries/show'
  else
    erb :'404'
  end
end
