get '/answer' do
  @answers = Answer.all
  erb :answer
end

get '/answer/:id/upvote' do
  if session[:user_id]
  @answer_votes = Answer.find(params[:id]).votes
  if @answer_votes[0] == nil
   @answer_votes << Vote.create(value: 1)
    redirect '/login'
  else
    int1 = @answer_votes[0].value +=1
    @answer_votes[0].update(value: int1)
     redirect '/'
  end
end
end

get '/answer/:id/downvote' do
  if session[:user_id]
  @answer_votes = Answer.find(params[:id]).votes
  if @answer_votes[0] == nil
   @answer_votes << Vote.create(value: 1)
    redirect '/login'
  else
    int1 = @answer_votes[0].value -=1
    @answer_votes[0].update(value: int1)
     redirect '/'
  end
end
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

# create comment
post '/answers/:id/comments' do
  if session[:user_id]
  @comment = Comment.create!(body: params[:body], user_id: session[:user_id])
  @answer = Answer.find(params[:id])
  @answer.comments << @comment
  redirect "/questions/#{params[:question_id]}"
end
end
