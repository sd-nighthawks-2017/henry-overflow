# index comments
get '/comments' do
  @comments = Comment.all
end

# new comment - form
get '/comments/new' do
  @comment = Comment.new
  erb :"comments/new"
end

# create comment
# moved to questions controller

# show comment

# edit comment - form

# update comment

# delete comment
