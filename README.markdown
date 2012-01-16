=The Projet=
Since I moved to Sao Paulo(Brazil) , I decided to make my house as geek as it can get.

This project final objective is to create a house automation system inspired in sci-fi movies , the first part of the project that is here is the facial recognition and identification system , that will enable you to register guests , and automatically set a playlist and a art slideshow based on their taste.

This first part of the project , identify faces with OpenCV and recognize them with face.com API.

=Installation=
    * Install OpenCV.
    * copy opencv haarcascades inside a folder called 'data/'
    * Download and install https://github.com/regismesquita/ruby-opencv (Mine failed to install passing on Gemfile.)
    * insert your face.com credendtials and namespace at 'lib/face\_config.rb'
    * Register the authorized personel at 'http://yourpage/user/new'
    * take and send some photos at the user show page (The one after registering)
    * Try the identification at 'http://yourpage/monitor/'
    * Start monitoring for real with padrino rake monitor

=TODO=

Improve the monitor
Set computer playlist and Slideshow based in who is in.
Improve the interface.
Send Email and SMS notification when someone unrecognized enters the perimeter.
Do the rest of the project :P
