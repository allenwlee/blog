enable :sessions

get '/' do
  @categories = Category.all
  erb :index
end

get '/user/create' do
  erb :user_create
end

post '/user/create' do  

  @user = User.new(email: params[:email], password: params[:password])
  # if @user.valid? 
    @user.save
    session[:user_id] = @user.id

  #   erb :profile
  # else
  #   erb :user_creation_error
  # end
  erb :profile
end

get '/user/:id' do
  if current_user.id == params[:id]
    erb :profile
  else
    erb :no_access
  end
end

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user.password == params[:password]
    session[:user_id] = @user.id    
    @posts = @user.posts
    erb :profile
  else
    erb :password_error
  end
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end

get '/post/:id/edit' do
  raise "Not Yet Implemented!"
  @post = Post.find(params[:id])
  erb :post_edit
end

get '/post/create' do
  erb :post_create
end

post '/post/create' do
  @post = Post.create(title: params[:title], body: params[:body])
  current_user.posts << @post
  erb :profile
end
  
get '/user/:id' do
  @posts = current_user.posts
  erb :_post
end

get '/logout' do 
  session.clear
  redirect '/'
end

get '/login' do
  
  erb :_login
end