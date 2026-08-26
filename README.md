# Courier Ruby SDK

The Courier Ruby SDK provides typed access to the Courier REST API from Ruby applications. Use it to send notifications, manage user profiles, check message status, issue JWT tokens for client-side SDKs, and more.

## Installation

Add the gem to your `Gemfile`:

<!-- x-release-please-start-version -->

```ruby
gem "trycourier", "~> 6.2.0"
```

<!-- x-release-please-end -->

Then run `bundle install`. Requires Ruby 3.2+.

## Quick Start

```ruby
require "bundler/setup"
require "courier"

courier = Courier::Client.new(
  api_key: ENV["COURIER_API_KEY"] # the default, can be omitted
)

response = courier.send_.message(
  message: {to: {user_id: "your_user_id"}, template: "your_template_id", data: {foo: "bar"}}
)

puts(response.requestId)
```

The client reads `COURIER_API_KEY` from your environment automatically.

Note the trailing underscore on `send_` — `send` is reserved in Ruby.

## Documentation

Full documentation: **[courier.com/docs/sdk-libraries/ruby](https://www.courier.com/docs/sdk-libraries/ruby/)**

- [Quickstart](https://www.courier.com/docs/getting-started/quickstart/)
- [Send API](https://www.courier.com/docs/platform/sending/send-message/)
- [API Reference](https://www.courier.com/docs/reference/get-started/)
