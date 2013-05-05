Sunglasses
===

Sunglasses is RubyMotion-based iOS app which asks the Arduino-based Server for the current value of Lumen outside the window.
After getting the JSON data it decides whether one should wear sunglasses or not :) .

JSON response should look like the following:

```json
{
  "values": {
    "light": 781
  }
}	
