require 'face'
class FaceRecognition
  include FaceConfig

  def initialize
    @client = Face.get_client(:api_key => KEY, :api_secret => SECRET)
  end

  def recognize_user_faces_in(file)
    get_user_from(faces_in_file(file))
  end

  def add_face_images_for_user(params)
    @tids = Array.new
    params[:face_files].each do |face_file|
      @tids.push register_face_from_file(face)
    end

    @tids.each do |tid|
      client.tags_save(:tids => tids.join(','), :uid => uid_for(params[:user]))
    end
    
    client.faces_train(:uids => uid_for(params[:user]))
  end

  private
  def all_uid
    'all' << PRIVATE_NAMESPACE
  end

  def uid_for(user)
    user << PRIVATE_NAMESPACE
  end

  def faces_in_file(file)
    image = File.open(file,'rb')
    client.faces_recognize(:file => image, :uids => all_uid)
  end

  def get_users_from(faces_return)
     faces_return['photos'].first['tags'].first['uids']
  end
  
  def register_face_from_file(file)
    face_detect = client.faces_detect(:file => file)
    face_detect['photos'].first['tags'].first['tid']
  end
end
