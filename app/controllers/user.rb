get '/login' do
  erb :login
end

get '/login/:id' do

  erb :profile
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/login/#{@user.id}"
  else
    erb :login
  end
end

get '/register' do

  erb :register
end

post '/register' do
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
  if @user.save
    session[:user_id]
    redirect "/login/#{@user.id}"
  else
    erb :register
  end
end

get '/profile' do
 if session[:user_id] != nil
  erb :profile
 else
  erb :login
 end
end

get '/logout' do
 session.clear
 redirect '/'
end
