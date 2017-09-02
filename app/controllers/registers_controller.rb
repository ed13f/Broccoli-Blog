get '/register' do
  erb :"registers/index"
end

post '/register' do
  @user = User.new(params[:user])
  if @user.save
    redirect "/login"
  else
    status 422
    @errors = @user.errors.full_messages
    erb :"registers/index"
  end
end
