# index
get '/questions' do
  @questions = Question.all
  erb :"questions/questions"
end

# new
get '/questions/new' do
  if session[:user_id]
    @question = Question.new
    erb :"questions/new"
  else
   redirect '/'
 end
end

# create
post '/questions' do
 if session[:user_id]
  @question = Question.create(title: params[:title], body: params[:question])
  redirect '/'
 else
  redirect '/login'
end
end

# show
get '/questions/:id' do
  @question = Question.find(params[:id])
  @answer = @question.answers

  erb :"questions/show"
end

get '/questions/:id/upvote' do
  if session[:user_id]
    @question_votes = Question.find(params[:id]).votes
  if @question_votes[0] == nil

   @question_votes << Vote.create(value: 1)
    if request.xhr?
      if request.accept? 'application/json'
        { votes: @question_vote }.to_json
      else
        erb :'/questions/_voteup', layout: false
      end
    else
      redirect "/questions/#{params[:id]}"
    end
  elsif int1 = @question_votes[0].value +=1
    @question_votes[0].update(value: int1)
     if request.xhr?
      if request.accept? 'application/json'
        { votes: @question_votes }.to_json
      else
        erb :'/questions/_voteup', layout: false
      end
     else
      redirect "/questions/#{params[:id]}"
    end
  end
  else
     redirect '/login'
 end
end

get '/questions/:id/downvote' do
  if session[:user_id]
  @question_votes = Question.find(params[:id]).votes
  if @question_votes[0] == nil
   @question_votes << Vote.create(value: 1)
    if request.xhr?
      if request.accept? 'application/json'
        { votes: @question_vote }.to_json
      else
        erb :'/questions/_voteup', layout: false
      end
    else
      redirect "/questions/#{params[:id]}"
    end
  elsif int1 = @question_votes[0].value -=1
    @question_votes[0].update(value: int1)
     if request.xhr?
      if request.accept? 'application/json'
        { votes: @question_votes }.to_json
      else
        erb :'/questions/_voteup', layout: false
      end
     else
      redirect "/questions/#{params[:id]}"
    end
  end
 end
end

# edit
get '/questions/:id/edit' do
  if session[:user_id]
    @question = Question.find(params[:id])
    erb :"questions/edit"
  else
    redirect '/login'
  end
end

# update
def update_question
  if session[:user_id]
    @question = Question.find(params[:id])
    @question.update(params[:question])
    redirect "/questions/#{@question.id}"
  else
   redirect '/login'
 end
end

patch '/questions/:id' do
  update_question
end

# delete
delete '/questions/:id' do
  if session[:user_id]
    Question.find(params[:id]).destroy!
    redirect '/questions'
  else
    redirect '/login'
 end
end

# create comment
post '/questions/:id/comments' do
  if session[:user_id]
  @comment = Comment.create(body: params[:body], user_id: session[:user_id])
  @question = Question.find(params[:id])
  @question.comments << @comment
  redirect "/questions/#{@question.id}"
 else
   redirect '/login'
 end
end


get '/comments/:id/upvote' do
  if session[:user_id]
    @comment_votes = Comment.find(params[:id]).votes
  if @comment_votes[0] == nil
    @comment_votes << Vote.create(value: 1)
    redirect "/"
  else
    int1 = @comment_votes[0].value +=1
    @comment_votes[0].update(value: int1)
     redirect "/"
  end
  else
    redirect '/login'
 end
end

get '/comments/:id/downvote' do
  if session[:user_id]
  @comment_votes = Comment.find(params[:id]).votes
  if @comment_votes[0] == nil
   @comment_votes << Vote.create(value: 1)
    redirect "/questions/#{params[:id]}"
  else
    int1 = @comment_votes[0].value -=1
    @comment_votes[0].update(value: int1)
     redirect "/questions/#{params[:id]}"
  end
 end
end


