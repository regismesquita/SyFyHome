require 'opencv'

class FaceDetection
  def initialize(image)
    data = "./data/haarcascades/haarcascade_frontalface_alt.xml"
    @detector = OpenCV::CvHaarClassifierCascade::load(data)
    @image = load_image(image)
  end

  def face_present?
    @detector.detect_objects(@image).any?
  end

  private
  def load_image(image)
    case image
      when String 
        OpenCV::IplImage.load(image)
      when File
        OpenCV::IplImage.load(image.path)
      when OpenCV::IplImage
        image
      else
        raise "The image should be a file , a path or a IplImage."
    end
  end
end
