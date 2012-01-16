require 'opencv'
class Camera
  def initialize
    @device = OpenCV::CvCapture.open(nil)
  end

  def shot
    camera.query.save_image(picture_path_with_timestamp)
  end

  def self.single_shot
    OpenCV::CvCapture.get_picture()
  end

  def self.preview(image)
    window = OpenCV::GUI::Window.new("preview")
    window.show(image)
    OpenCV::GUI::wait_key
    window.destroy
  end

  private

  def picture_path_with_timestamp
    'tmp/'<<Time.now.to_s << '.jpg'
  end
end
