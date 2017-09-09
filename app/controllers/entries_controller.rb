# route handlers dealing with the collection
get '/entries' do
  @user_id = session[:user_id]
  @entries = Entry.most_recent
  erb :'entries/index'
end

get '/entries/new' do
  if logged_in?
   erb :'entries/new'
  else
    redirect '/sessions/new'
  end
end

post '/entries' do
  if logged_in?
    @entry = Entry.new(params[:entry])

    if @entry.save
      redirect "/entries/#{@entry.id}"
    else
      @errors = @entry.errors.full_messages
      erb :'entries/new'
    end
  else
    redirect '/sessions/new'
  end
end

get '/entries/:id' do
  @entry = find_and_ensure_entry(params[:id])
  if logged_in? && current_user
    erb :'entries/show'
  else
    redirect '/sessions/new'
  end
end

put '/entries/:id' do
  @entry = find_and_ensure_entry(params[:id])
  @user = User.find_by(id: session[:user_id])
  if logged_in? && @entry.user_id == @user.id
    @entry.assign_attributes(params[:entry])
    if @entry.save
      redirect "entries/#{@entry.id}"
    else
      @errors = @entry.errors.full_messages
      erb :'entries/edit'
    end
  else
    redirect "/users/#{@user.id}"
  end
end

delete '/entries/:id' do
  @entry = find_and_ensure_entry(params[:id])
  @user = User.find_by(id: session[:user_id])
  if logged_in? && @entry.user_id == @user.id
    @entry = find_and_ensure_entry(params[:id])
    @entry.destroy
    redirect '/entries'
  else
    @errors = ["You are not authorized to change this post"]
    erb :'entries/show'
  end
end

get '/entries/:id/edit' do
  @entry = find_and_ensure_entry(params[:id])
  @user = User.find_by(id: session[:user_id])
  if logged_in? && @entry.user_id == @user.id
    @entry = find_and_ensure_entry(params[:id])
    erb :'entries/edit'
  else
    @errors = ["You are not authorized to change this post"]
    erb :'entries/show'
  end
end
