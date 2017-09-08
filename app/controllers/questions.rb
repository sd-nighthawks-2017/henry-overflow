# index
get '/questions' do
  @questions = Question.all
  erb :"questions/questions"
end

# new
get '/questions/new' do
  @question = Question.new
  erb :"questions/new"
end

# create
post '/questions' do
  @question = Question.create(params[:question])
  redirect '/'
end

# show
get '/questions/:id' do
  @answers = Answer.all
  @question = Question.find(params[:id])
  erb :"questions/show"
end

# edit
get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :"questions/edit"
end

# update
def update_question
  @question = Question.find(params[:id])
  @question.update(params[:question])
  redirect "/questions/#{@question.id}"
end

patch '/questions/:id' do
  update_question
end

# delete
delete '/questions/:id' do
  Question.find(params[:id]).destroy!
  redirect '/questions'
end
