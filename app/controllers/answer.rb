get '/answer' do
  @answers = Answer.all
  erb :answer
end

get '/answer/:id' do

end

post '/answer' do
  @answer = Answer.create(body: params[:answer])
  @question = @answer.question

  redirect "/question/#{@question.id}"

end
