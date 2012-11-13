# Basic Parameters
touch.deviceType = touchScreen
touch.orientationAware = 1

device.internal = 1

# These calibration values are derived from empirical measurements
# and may not be appropriate for use with other touch screens.
# Refer to the input device calibration documentation for more details.
#

# Touch Size
touch.touchSize.calibration = pressure

# Tool Size
# Driver reports tool size as a linear width measurement summed over
# all contact points.
#
# Raw width field measures approx. 1 unit per millimeter
# of tool size on the surface where a raw width of 1 corresponds
# to about 17mm of physical size.  Given that the display resolution
# is 10px per mm we obtain a scale factor of 10 pixels / unit and
# a bias of 160 pixels.  In addition, the raw width represents a
# sum of all contact area so we note this fact in the calibration.
touch.toolSize.calibration = linear
touch.toolSize.linearScale = 10
touch.toolSize.linearBias = 160
touch.toolSize.isSummed = 1

# Size
touch.size.calibration = diameter
touch.size.scale = 10
touch.size.bias = 0
touch.size.isSummed = 0

# Pressure
# Driver reports signal strength as pressure.
#
# A normal thumb touch typically registers about 200 signal strength
# units although we don't expect these values to be accurate.
touch.pressure.calibration = amplitude
touch.pressure.scale = 0.005

# Orientation
touch.orientation.calibration = none
