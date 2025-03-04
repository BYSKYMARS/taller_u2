require "test_helper"
Webdrivers::Chromedriver.required_version = '133.0.6943.53'
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
