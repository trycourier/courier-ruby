require "bundler/setup"
require "trycourier"
require "webmock/rspec"
require "base64"

AUTH_TOKEN_MOCK = "TESTAuthToken1234"
AUTH_USERNAME_MOCK = "Jane"
AUTH_PASSWORD_MOCK = "Doe"
NOTIFICATION_ID = "TESTNotificationID"
RECIPIENT_ID = "TESTRecipientID"
LIST_ID = "TESTListID"
BRAND_ID = "TESTBrandID"
MESSAGE_ID = "TESTMessageID"
EVENT_ID = "TESTEventID"
DEFAULT_COURIER_URL = "https://api.courier.com"
TOKEN_AUTH_HEADERS = {
  "Authorization" => "Bearer " + AUTH_TOKEN_MOCK,
  "Content-Type" => "application/json",
  "Host" => "api.courier.com",
  "User-Agent" => "courier-ruby/1.0.1"
}

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
