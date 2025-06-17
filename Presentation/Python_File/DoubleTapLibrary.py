from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword

class DoubleTapLibrary:
    @keyword("Double Tap")
    def double_tap(self, x, y):
        appiumlib = BuiltIn().get_library_instance("AppiumLibrary")
        driver = appiumlib._current_application()
        args = {
            "x": int(x),
            "y": int(y)
        }
        driver.execute_script("mobile: doubleClickGesture", args)
