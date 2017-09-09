get '/answer' do
  @answers = Answer.all
  erb :answer
end

get '/answer/:id' do

end

get '/answer/:id/edit' do
  if session[:user_id]
    @answer = Answer.find(params[:id])
    erb :"answers/edit"
  else
    redirect '/'
  end
end

post '/questions/:id/answer' do
  if session[:user_id]
    @answer = Answer.create(body: params[:answer], question_id: params[:id])
    redirect "/questions/#{params[:id]}"
  else
    redirect '/login'
  end
end

def update_answer
  if session[:user_id]
    @answer = Answer.find(params[:id])
    @answer.update(body: params[:body])
    redirect "/"
  else
    redirect '/login'
  end
end

patch '/answer/:id' do
  update_answer
end

get '/answer/:id/delete' do
  if session[:user_id]
    Answer.find(params[:id]).destroy!
    redirect '/'
  else
    redirect'/login'
  end
end

