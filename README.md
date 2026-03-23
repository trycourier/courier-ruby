<!-- AUTO-GENERATED-OVERVIEW:START — Do not edit this section. It is synced from mintlify-docs. -->
# Courier Ruby SDK

The Courier Ruby SDK provides typed access to the Courier REST API from any Ruby 3.2+ application. It ships with Yard docstrings, RBS and RBI type definitions for Sorbet, and uses `net/http` with connection pooling.

## Installation

Add to your `Gemfile`:

```ruby
gem "trycourier"
```

Then run `bundle install`.

## Quick Start

```ruby
require "bundler/setup"
require "courier"

client = Courier::Client.new

response = client.send_.message(
  message: {
    to: { email: "you@example.com" },
    content: {
      title: "Hello from Courier!",
      body: "Your first notification, sent with the Ruby SDK."
    }
  }
)

puts response.request_id
```

The client reads `COURIER_API_KEY` from your environment automatically. You can also pass it explicitly: `Courier::Client.new(api_key: "your-key")`.

> **Note**: The method is `send_` (with trailing underscore) because `send` is a reserved method in Ruby.

## Documentation

Full documentation: **[courier.com/docs/sdk-libraries/ruby](https://www.courier.com/docs/sdk-libraries/ruby/)**

- [Quickstart](https://www.courier.com/docs/getting-started/quickstart/)
- [Send API](https://www.courier.com/docs/platform/sending/send-message/)
- [API Reference](https://www.courier.com/docs/reference/get-started/)
- [RubyDoc](https://gemdocs.org/gems/trycourier)
<!-- AUTO-GENERATED-OVERVIEW:END -->
