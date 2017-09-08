get '/' do
 redirect '/home'
end

get '/home' do
   @questions = Question.all

 erb :home
end
