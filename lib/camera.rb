require 'opencv'
class Camera
  def initialize
    @device = OpenCV::CvCapture.open(nil)
  end

  def shot
    path = self.class.picture_path_with_timestamp
    @device.query.save_image(path)
    return path
  end

  def self.single_shot
    path = picture_path_with_timestamp
    OpenCV::CvCapture.get_picture().save_image(path)
    return path
  end

  def self.preview(image)
    window = OpenCV::GUI::Window.new("preview")
    window.show(image)
    OpenCV::GUI::wait_key
    window.destroy
  end

  private

  def self.picture_path_with_timestamp
    'public/'<<Time.now.to_s << '.jpg'
  end
end
