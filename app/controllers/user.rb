SyFyHome.controllers :user do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  get :new do
    @user = User.new
    render 'user/new'
  end

  post :create do
    params[:user]['favorite_artists'] = params[:user]['favorite_artists'].split(',')
    @user = User.create(params[:user])
    render 'user/show'
  end

  get :show,:with => :face_id do
    @user = User.where(:face_id => params[:face_id]).first
    render 'user/show'
  end

  post :add_photo,:with => :id do
    @user = User.find(params[:id])
    foto = Camera.single_shot
    @user.pictures.push foto
    @user.save
    render 'user/show'
  end

  post :send_photos,:with => :id do
    @user = User.find(params[:id])
    @result = FaceRecognition.new.add_face_images_for_user({face_files: @user.pictures, user: @user.face_id})
    @user.pictures = Array.new
    @user.save
    render 'user/show'
  end


  get :index do
  end

end
