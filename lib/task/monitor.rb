task :monitor => :environment do
  @device = Camera.new
  @counter = 0
  puts "Hi , I am your security guard. I will start my shift now."
  while true do
    image = @device.shot
    if FaceDetection.new(image).face_present?
      @counter = @counter.succ
      puts "I guess I saw something...#{@counter.to_s}"
    else
      puts "Nothing seen..."
      @counter = 0
    end
    if @counter > 2
      puts "OMG! I really saw something.. I better register that... let's see who is it..."
      users = FaceRecognition.new.recognize_user_faces_in(image)
      puts "I don't know who this guy is..." if users.empty?
      users.each do |user_found|
        face_id = user_found['uid'].split('@').first
        puts "It's #{face_id}! How are you doing?!" 
        EntranceLog.create({
          date: Time.now,
          user_face_id: face_id,
          picture_path: image
        })
      end
      @counter = 0
    else
      File.unlink image
    end
  end
end
