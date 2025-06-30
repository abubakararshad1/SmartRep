from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

class Touch_Keyword:

    def _get_driver(self):
        appiumlib = BuiltIn().get_library_instance("AppiumLibrary")
        return appiumlib, appiumlib._current_application()

    @keyword("Double Tap")
    def double_tap(self, x, y):
        appiumlib = BuiltIn().get_library_instance("AppiumLibrary")
        driver = appiumlib._current_application()
        args = {
            "x": int(x),
            "y": int(y)
        }
        driver.execute_script("mobile: doubleClickGesture", args)

    @keyword("Tap Element")
    def tap_element(self, locator):
        appiumlib, driver = self._get_driver()
        element = appiumlib._element_find(locator, True, True)
        args = {"elementId": element.id}
        driver.execute_script("mobile: clickGesture", args)

    @keyword("Long Press Element")
    def long_press_element(self, locator, duration=1000):
        appiumlib, driver = self._get_driver()
        element = appiumlib._element_find(locator, True, True)
        args = {
            "elementId": element.id,
            "duration": int(duration)
        }
        driver.execute_script("mobile: longClickGesture", args)

    @keyword("Tap At Coordinates")
    def tap_by_coordinates(self, x, y):
        _, driver = self._get_driver()
        args = {
            "x": int(x),
            "y": int(y)
        }
        driver.execute_script("mobile: clickGesture", args)

    @keyword("Swipe Left")
    def swipe_left(self, left, top, width, height, direction="left", percent=0.75):
        _, driver = self._get_driver()
        args = {
            "left": int(left),
            "top": int(top),
            "width": int(width),
            "height": int(height),
            "direction": direction,
            "percent": float(percent)
            }
        driver.execute_script("mobile: swipeGesture", args)


    @keyword("Swipe Right")
    def swipe_right(self, left, top, width, height, direction="right", percent=0.75):
        _, driver = self._get_driver()
        args = {
            "left": int(left),
            "top": int(top),
            "width": int(width),
            "height": int(height),
            "direction": direction,
            "percent": float(percent)
            }
        driver.execute_script("mobile: swipeGesture", args)

    @keyword("Swipe Up")
    def swipe_up(self, left, top, width, height, direction="up", percent=0.75):
        _, driver = self._get_driver()
        args = {
            "left": int(left),
            "top": int(top),
            "width": int(width),
            "height": int(height),
            "direction": direction,
            "percent": float(percent)
            }
        driver.execute_script("mobile: swipeGesture", args)

    @keyword("Swipe Down")
    def swipe_down(self, left, top, width, height, direction="down", percent=0.75):
        _, driver = self._get_driver()
        args = {
            "left": int(left),
            "top": int(top),
            "width": int(width),
            "height": int(height),
            "direction": direction,
            "percent": float(percent)
            }
        driver.execute_script("mobile: swipeGesture", args)

