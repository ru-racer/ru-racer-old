# ru-racer-old
Codes for the first version of RU-Racer used onboard NI-MyRio. 

![image](https://user-images.githubusercontent.com/26307692/115646423-1bf7af80-a2f0-11eb-9645-69c7ce41e0ad.png)

A 1/7 scaled robotic vehicle (Traxxas XO-1 model) shown is modified with various added onboard sensors
and actuators. The vehicle is four-wheel driven by a powerful brushless motor with the front and rear differentials. At each
wheel, an electric disc brake is added to provide active braking capability. The steering and the brake actuators are
operated by the servo motors that are controlled by the onboard embedded system. Four potentiometers are added
to the suspensions to measure the deflection and thus the normal forces at each tire. Two rotating potentiometers are
added and used to measure the steering angle. All onboard sensors and actuators are connected to an embedded real-time
system (myRIO from National Instruments) with sampling and control frequency of 1 kHz.


![image](https://user-images.githubusercontent.com/26307692/115646387-0c786680-a2f0-11eb-9af8-89c2e8a71b4e.png)

The robotic vehicle is tested on a wooden track as show in this image. The track is specially designed to test the
aggressive vehicle maneuvers with straight-line and U-turn shapes with narrow parts. A set of reflective markers are attached on the robotic
vehicle and on the track and the real-time position of the vehicle is provided by the motion capture systems (8 Bonita cameras from Vicon Inc.).
