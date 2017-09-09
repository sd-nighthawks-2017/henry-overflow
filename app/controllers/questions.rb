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

  if request.xhr?
    erb :"/questions/_questions", layout: false
  else
    erb :"questions/show"
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
  @comment = Comment.create(body: params[:body], user_id: session[:user_id])
  @question = Question.find(params[:id])
  @question.comments << @comment
  redirect "/questions/#{@question.id}"
end
