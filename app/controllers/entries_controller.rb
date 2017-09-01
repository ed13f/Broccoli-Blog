# route handlers dealing with the collection
get '/entries' do
  @entries = Entry.most_recent
  erb :'entries/index'
end

post '/entries' do
  entry_params = params[:entry]
  # in order to include the newly added user_id
  entry_params[:user_id] = session[:user_id]
  @entry = Entry.new(entry_params)
  if @entry.save
    redirect "/entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/new'
  end
end

get '/entries/new' do
  if session_user == nil
    erb :'404'
  else
    erb :'entries/new'
  end
end

get '/entries/:id' do
  @entry = find_and_ensure_entry(params[:id])
  erb :'entries/show'
end

put '/entries/:id' do
  @entry = find_and_ensure_entry(params[:id])
  @entry.assign_attributes(params[:entry])

  if @entry.save
    redirect "entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/edit'
  end
end

delete '/entries/:id' do
  @entry = find_and_ensure_entry(params[:id])
  @entry.destroy
  redirect '/entries'
end

get '/entries/:id/edit' do
  if session_user == nil
    erb :'404'
  else
    @entry = find_and_ensure_entry(params[:id])
    erb :'entries/edit'
  end
end
