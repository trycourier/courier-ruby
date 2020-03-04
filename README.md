# `trycourier`

This Gem helps you send notifications through [Courier](https://www.trycourier.com/), the smartest way to design &amp; deliver notifications. Design your notifications once using our drag &amp; drop editor, then deliver to any channel through one API. Email, mobile push, SMS, Slack &mdash; you name it!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'trycourier'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install trycourier

## Usage

```ruby
require "trycourier"

begin
  client = Courier::Client.new "your-auth-token" # or set via COURIER_AUTH_TOKEN env var
  res = client.send({
    "event" => "your-event-id",
    "recipient" => "your-recipient-id",

    "profile" => {
      "email": "example@example.com",
      "phone_number": "555-867-5309"
    },

    "data" => {
      "world" => "Ruby!"
    }
  })

  puts res.code # the HTTP response code
  puts res.message_id # if 200, this will be the Courier message ID for this notification
rescue Courier::ResponseError => re
  puts re.message
rescue Courier::InputError => ie
  puts ie.message
end

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/trycourier.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
