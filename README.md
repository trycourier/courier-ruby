# `trycourier`
[![fern shield](https://img.shields.io/badge/%F0%9F%8C%BF-SDK%20generated%20by%20Fern-brightgreen)](https://buildwithfern.com/?utm_source=trycourier/courier-ruby/readme)

This Gem helps you send notifications through [Courier](https://www.trycourier.com/), the smartest way to design &amp; deliver notifications. Design your notifications once using our drag &amp; drop editor, then deliver to any channel through one API. Email, mobile push, SMS, Slack &mdash; you name it!

## Beta Notice
Please note that this SDK is in BETA, versions >3.x are currently in beta (starting with 3.0.0-beta1), to ensure stability and to not experience any breaking changes please continue using version **2.0.0**.
While in beta, please feel free to install and use this gem at the risk that we may make breaking changes where necessary. If you have any issues using it, we will respond to github issues as soon as possible.

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
client = Courier::Client.new "your-auth-token" # or set via COURIER_AUTH_TOKEN env var
```

### Sending a message to an individual recipient

```ruby
client = Courier::Client.new "your-auth-token" # or set via COURIER_AUTH_TOKEN env var
res = client.send(message: {
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
  })
  puts res.request_id # if the code is 202, this will be the Courier request ID for this message
```

```ruby
client = Courier::Client.new "your-auth-token" # or set via COURIER_AUTH_TOKEN env var
res = client.send(message: {
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
  puts res.message_id # if the code is 200, this will be the Courier message ID for this notification
```

### Sending a message to an individual with metadata

```ruby
client = Courier::Client.new "your-auth-token" # or set via COURIER_AUTH_TOKEN env var
res = client.send(message: {
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
        },
        "tags" => ["tag-1", "tag-2"],
        "trace_id" => "feed-me-hungry"
      }
  })
  puts res.request_id # if the code is 202, this will be the Courier request ID for this message
```

### Sending a message to an individual with granular metadata

```ruby
client = Courier::Client.new "your-auth-token" # or set via COURIER_AUTH_TOKEN env var
res = client.send(message: {
      "to" => {
        "email" => "foo@bar.com"
      },
      "content" => {
			  "version" => "2020-01-01",
        "elements" => [
				  {
            "type" => "text",
            "content" => "Thanks for signing up, {{name}}"
          },
          {
            "type" => "action",
            "content" => "Click Me!",
            "href" => "https://www.example.com"
          }
        ]
		  },
      "routing" => {
        "method" => "all",
        "channels" => [
          "email"
        ]
		  },
      "data" => {
        "name" => "Ruby"
      },
      "metadata" => {
        "utm" => {
          "source" => "Ruby"
        },
      },
      "channels" => {
        "email" => {
          "routing_method" => "all",
          "providers" => [
            "sendgrid",
            "mailjet"
          ],
          "metadata" => {
            "utm" => {
              "medium" => "email"
            }
          }
        }
      },
      "providers" => {
        "sendgrid" => {
          "metadata" => {
            "utm" => {
              "source" => "sendgrid"
            }
          }
        }
      }
  })
  puts res.request_id # if the code is 202, this will be the Courier request ID for this message
```

## Advanced Usage

### Lists

```ruby
require "trycourier"
client = Courier::Client.new "your-auth-token" # or set via COURIER_AUTH_TOKEN env var

"""
Creating a List
"""
res = client.lists.update(list_id: list_id, request: { name: name})
puts res

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
Example: get a list's subscriptions
"""
resp = client.lists.get_subscribers(
    list_id: "your-list-id",
    cursor: "MTU4OTQ5NTI1ODY4NywxLTVlYmRjNWRhLTEwODZlYWFjMWRmMjEwMTNjM2I0ZjVhMA", # optional
)
puts resp

"""
Example: replace many recipients to a new or existing list
"""
client.lists.update_subscribers(
    list_id: "your-list-id",
    request: [{
        recipient_id: "RECIPIENT_ID_1"
    },{
        recipient_id: "RECIPIENT_ID_2"
    }]
)

"""
Example: Example: subscribe single recipient to a new or existing list
"""
client.lists.subscribe(list_id: "your-list-id", user_id: "your-user-id")

"""
Example: unsubscribe recipient from list
"""
client.lists.unsubscribe(list_id: "your-list-id", user_id: "your-user-id")
```

### Profiles

```Ruby
"""
Example: merge or create a recipient's profile
"""
resp = client.profiles.create(
  user_id: "your-user-id",
  profile: {
    "email" => "example@example.com",
    "name" => "Example Name"
  }
)

"""
Example: replace or create a recipient's profile
"""
resp = client.profiles.replace(
  user_id: "your-user-id",
  profile: {
    "email" => "example@example.com"
  }
)
puts resp['status']

"""
Example: get the subscribed lists of a recipient
"""
resp = client.profiles.get_list_subscriptions(
  user_id: "your-user-id",
  cursor: "MTU4OTQ5NTI1ODY4NywxLTVlYmRjNWRhLTEwODZlYWFjMWRmMjEwMTNjM2I0ZjVhMA" #optional
)
puts resp

"""
Example: edit the contents of a recipient's profile with a patch operation
(follows JSON Patch conventions: RFC 6902).
"""
resp = client.profiles.replace(
  user_id: "your-user-id",
  profile: [
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
resp = client.profiles.get(user_id: "your-user-id")
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
  notification: "message-statua" #optional
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

resp = client.automations.invoke_ad_hoc_automation(
  request: {
    automation: automation,
    brand: "your-brand-id", # optional
    data: {}, # optional
    profile: {
      "email" => "example@example.com",
    }, # optional
    recipient: "your-recipient-id", # optional
    template: "your-notification-template-id" # optional
  }
)
puts resp.run_id

"""
Example: invoke automation template
"""
resp = client.automations.invoke_automation_template(
  template_id: "your-automation-template-id",
  request: {
    brand: "your-brand-id", # optional
    data: {}, # optional
    profile: {
      "email" => "example@example.com",
    }, # optional
    recipient: "your-recipient-id", # optional
    template: "your-notification-template-id" # optional
  }
)
puts resp.run_id
````

### Audiences

List of supported operators for audience filtering: https://www.courier.com/docs/reference/audieces/operators

```Ruby
"""
Example: create or update an Audience
"""
resp = client.audiences.update(
  audience_id: "your-audience-id",
  filter: {
    "operator": "EQ",
    "value": "en-US",
    "path": "locale"
  }
)

"""
Example: Get all members of an Audience
"""
resp = client.audiences.list_members(
  audience_id: "your-audience-id"
)

"""
Example: Send to an Audience
"""
client = Courier::Client.new "your-auth-token" # or set via COURIER_AUTH_TOKEN env var
res = client.send(message: {
      "to" => {
        "audience_id" => "your-audience-id"
      }
      "content" => {
        "title" => "hello {{name}}",
        "body" => "Welcome to Courier!"
      },
      "data" => {
        "name" => "Ruby"
      }
  })
puts res.request_id # if the code is 202, this will be the Courier request ID for this message
```

### Audit Events

```Ruby
"""
Example: List audit events
"""
resp = client.audit_events.list

"""
Example: Get a specific audit event
"""
resp = client.audit_events.get(audit_event_id: "audit-event-id")
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/trycourier/courier-ruby.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
