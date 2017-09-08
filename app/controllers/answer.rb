get '/answer' do
  @answers = Answer.all
  erb :answer
end

get '/answer/:id' do

end

get '/answer/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :"answers/edit"
end

post '/questions/:id/answer' do
  @answer = Answer.create(body: params[:answer], question_id: params[:id])
  redirect "/questions/#{params[:id]}"
end

def update_answer
  @answer = Answer.find(params[:id])
  @answer.update(body: params[:body])
  redirect "/"
end

patch '/answer/:id' do
  update_answer
end

get '/answer/:id/delete' do
  Answer.find(params[:id]).destroy!
  redirect '/'
end

