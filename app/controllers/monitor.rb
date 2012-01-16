SyFyHome.controllers :monitor do
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

  get :index do
    @picture = Camera.single_shot
    @users_found = FaceRecognition.new.recognize_user_faces_in(@picture)

    render 'monitor/index'
  end
  get :log do
    @log = EntranceLog.all
    render 'monitor/log'
  end

end
