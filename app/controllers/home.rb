get '/' do
 redirect '/home'
end

get '/home' do

  @questions = ['How do I add ajax in my sinatra app?','weird error when I parse css?',"why can't I connect to my database?",'windows gives black firey screen on boot?','this lightbulb wont come out of the cieling? Do I need more friends to help unscrew it?']

 erb :home
end
