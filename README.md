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

After installing, make sure to include this line at the top of your ruby file:

```ruby
require "trycourier"
```

To create a Courier Ruby client, all you need to do is pass in your authentication information. Then, you can start sending!

### Using token authentication (most secure)

```ruby
client = Courier::Client.new "your-auth-token" # or set via COURIER_AUTH_TOKEN env var (recommended)
```

### Using basic authentication

```ruby
client = Courier::Client.new(username: "USERNAME", password: "PASSWORD") # or set via COURIER_AUTH_USERNAME and COURIER_AUTH_PASSWORD env vars
```

### Sending a message to an individual recipient

```ruby
client = Courier::Client.new "your-auth-token" # or set via COURIER_AUTH_TOKEN env var
res = client.send_message({
    "message" => {
      "to" => {
        "email" => "foo@bar.com"
      }
      "content" => {
        "title" => "hello {{name}}",
        "body" => "Welcome to Courier!"
      },
      "data" => {
        "name" => "Ruby"
      }
    }
  })
  puts res.code # the HTTP response code
  puts res.request_id # if the code is 202, this will be the Courier request ID for this message
rescue Courier::CourierAPIError => re #error sent from from the API
  puts re.message
end
```

```ruby
client = Courier::Client.new "your-auth-token" # or set via COURIER_AUTH_TOKEN env var
res = client.send({
    "event" => "your-event-id",
    "recipient" => "your-recipient-id",

    "profile" => { #optional (include any key-value pairs required by your chosen integrations. This information can also be stored in the recipient's profile in Courier)
      "email": "example@example.com",
      "phone_number": "555-867-5309"
    },

    "data" => { #any data you want to pass to a message template
      "world" => "Ruby!"
    }
  })
  puts res.code # the HTTP response code
  puts res.message_id # if the code is 200, this will be the Courier message ID for this notification
rescue Courier::CourierAPIError => re #error sent from from the API
  puts re.message
end
```

### Sending a message to an individual with metadata

```ruby
client = Courier::Client.new "your-auth-token" # or set via COURIER_AUTH_TOKEN env var
res = client.send_message({
    "message" => {
      "to" => {
        "email" => "foo@bar.com"
      }
      "content" => {
        "title" => "hello {{name}}",
        "body" => "Welcome to Courier!"
      },
      "data" => {
        "name" => "Ruby"
      },
      "metadata" => {
        "utm" => {
          "source" => "Ruby"
        }
      }
    }
  })
  puts res.code # the HTTP response code
  puts res.request_id # if the code is 202, this will be the Courier request ID for this message
rescue Courier::CourierAPIError => re #error sent from from the API
  puts re.message
end
```

## Advanced Usage

### Lists

```ruby
require "trycourier"
client = Courier::Client.new "your-auth-token" # or set via COURIER_AUTH_TOKEN env var

"""
Creating a List
"""
res = client.lists.put(list_id, name)
puts res

"""
Example: send a message to a list
"""
resp = client.lists.send(
  event: "your-event-id",
  list: "your.list.id",
  brand: "your-brand-id", # optional
  data: {}, # optional
  override: {} # optional
)
puts resp['messageId'])

"""
Example: send a message to a list pattern
"""
resp = client.lists.send(
  event: "your-event-id",
  pattern: "your.list.*", #PATTERN (will send to all list ids that start with "your.list.")
  brand: "your-brand-id", # optional
  data: {}, # optional
  override: {} # optional
)
puts resp['messageId'])

"""
Example: get all lists
"""
resp = client.lists.list(
  cursor: "MTU4OTQ5NTI1ODY4NywxLTVlYmRjNWRhLTEwODZlYWFjMWRmMjEwMTNjM2I0ZjVhMA", # optional
)
puts resp

"""
Example: get a specific list
"""
resp = client.lists.get(list_id: "your-list-id")
puts resp


"""
Example: delete a list
"""
client.lists.delete(list_id: "your-list-id")

"""
Example: restore a list
"""
client.lists.restore(list_id: "your-list-id")

"""
Example: get a list's subscribptions
"""
resp = client.lists.get_subscriptions(list_id: "your-list-id",
  cursor: "MTU4OTQ5NTI1ODY4NywxLTVlYmRjNWRhLTEwODZlYWFjMWRmMjEwMTNjM2I0ZjVhMA", # optional
)
puts resp

"""
Example: replace many recipients to a new or existing list
"""
client.lists.put_subscriptions(list_id: "your-list-id", recipients: [
  "RECIPIENT_ID_1",
  "RECIPIENT_ID_2"
])

"""
Example: Example: subscribe single recipient to a new or existing list
"""
client.lists.subscribe(list_id: "your-list-id", recipient_id: "your-recipient-id")

"""
Example: unsubscribe recipient from list
"""
client.lists.unsubscribe(list_id: "your-list-id", recipient_id: "your-recipient-id")
```

### Profiles

```Ruby
"""
Example: create a recipient's profile
"""
resp = client.profiles.add(
  recipient_id: "your-recipient-id",
  profile: {
    "email" => "example@example.com",
    "name" => "Example Name"
  }
)

"""
Example: replace or create a recipient's profile
"""
resp = client.profiles.replace(
  recipient_id: "your-recipient-id",
  profile: {
    "email" => "example@example.com"
  }
)
puts resp['status']

"""
Example: merge or create a recipient's profile
"""
resp = client.profiles.merge(
  recipient_id: "your-recipient-id",
  profile: {
    "phone_number" => "+15555555555"
  }
)
puts resp['status']

"""
Example: get the subscribed lists of a recipient
"""
resp = client.profiles.get_subscriptions(
  recipient_id: "your-recipient-id",
  cursor: "MTU4OTQ5NTI1ODY4NywxLTVlYmRjNWRhLTEwODZlYWFjMWRmMjEwMTNjM2I0ZjVhMA" #optional
)
puts resp

"""
Example: edit the contents of a recipient's profile with a patch operation
(follows JSON Patch conventions: RFC 6902).
"""
resp = client.profiles.patch(
  recipient_id: "your-recipient-id",
  operations: [
    {
      "op" => "add", #operation 1: add this email to profile
      "path" => "/parent",
      "value" => "example@example.com"
    }
    {
      "op" => "replace", #operation 2: update with new email
      "path" => "/parent",
      "value" => "jane@doe.com"
    }
    {
      "op" => "copy", #operation 3: copy that email to /emergency_contact
      "from" => "/parent",
      "path" => "/emergency_contact"
    }
    ...
  ]
)
puts resp


"""
Example: get a recipient's profile
"""
resp = client.profiles.get(recipient_id: "your-recipient-id")
puts resp
```

### Messages

```Ruby
"""
Example: fetch the statuses of messages you've previously sent.
"""
resp = client.messages.list(
  cursor: "MTU4OTQ5NTI1ODY4NywxLTVlYmRjNWRhLTEwODZlYWFjMWRmMjEwMTNjM2I0ZjVhMA", # optional
  event: "your-event-id", # optional
  list: "your-list-id", #optional
  message_id: "your-message-id" #optional
  notification: ["message-status-1", "message-status-2",...] #optional
  recipient: "recipient-id" # optional
)
puts resp

"""
Example: fetch the status of a message you've previously sent
"""
resp = client.messages.get(message_id: "your-message-id")
puts resp

"""
Example: fetch the array of events of a message you've previously sent.
"""
resp = client.messages.get_history(
message_id: "your-message-id",
type: "list-type" #optional ("FILTERED", "RENDERED", "MAPPED", "PROFILE_LOADED")
)
puts resp
```

### Events

```Ruby
"""
Example: fetch the list of events
"""
resp = client.events.list
puts resp

"""
Example: fetch a specific event by event ID
"""
resp = client.events.get(event_id: "your-event-id")
puts resp

"""
Example: create or replace an event
"""
resp = client.events.replace(
  event_id: "your-event-id",
  notification_id: "notification_id",
  type: "notificaton" ## optional, defaults to notification
)
puts resp

"""
Example: get all brands
"""
resp = client.brands.list(
  cursor: "MTU4OTQ5NTI1ODY4NywxLTVlYmRjNWRhLTEwODZlYWFjMWRmMjEwMTNjM2I0ZjVhMA", # optional
)
puts resp

"""
Example: get a specific brand
"""
resp = client.brands.get(brand_id: "brand_id")
puts resp

"""
Example: create a brand
"""
resp = client.brands.create(
  name: "brand-name",
  settings: {
    "color" => {
      "primary" => "#0000FF",
      "secondary" => "#FF0000",
      "tertiary" => "#00FF00"
    }
  },
  id: "my-brand-id", #optional
  snippets: {}, #optional
  idempotency_key: "my-idemp-key", #optional
)
puts resp

"""
Example: replace a brand
"""
resp = client.brands.replace(
  brand_id: "your-brand-id",
  name: "brand-name",
  settings: {}
    "color" => {
      "primary" => "#FF0000",
      "secondary" => "#00FF00",
      "tertiary" => "#0000FF"
    }
  },
  snippets: {} #optional
)
puts resp

"""
Example: delete a brand
"""
resp = client.brands.delete(brand_id: "your-brand-id")
puts resp
```

### Automations

````Ruby
"""
Example: invoke ad-hoc automation
"""
steps = [
  {
    "action" => "send"
  }
]
automation = {
  "steps" => steps
}

resp = client.automations.invoke(
  automation: automation,
  brand: "your-brand-id", # optional
  data: {}, # optional
  profile: {
    "email" => "example@example.com",
  }, # optional
  recipient: "your-recipient-id", # optional
  template: "your-notification-template-id" # optional
)
puts resp['runId']

"""
Example: invoke automation template
"""
resp = client.automations.invoke_template(
  template_id: "your-automation-template-id",
  brand: "your-brand-id", # optional
  data: {}, # optional
  profile: {
    "email" => "example@example.com",
  }, # optional
  recipient: "your-recipient-id", # optional
  template: "your-notification-template-id" # optional
)
puts resp['runId']

### Notes on input and errors
With the exception of passing an auth token to create a client, and ```client.send(body)```, every parameter (optional or required) is sent using keyword arguments.
In the case of ```client.send(body)```, if the hash does not have the required components, it will throw an InputError exception, which can be caught with rescue blocks:
```ruby
rescue InputError
````

Any other errors from the API are thrown as a CourierAPIError. Catch these errors by putting this after your method calls:

```ruby
rescue CourierAPIError
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/trycourier/courier-ruby.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
