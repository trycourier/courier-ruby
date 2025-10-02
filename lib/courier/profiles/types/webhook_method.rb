# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      module WebhookMethod
        extend Courier::Internal::Types::Enum

        POST = "POST"
        PUT = "PUT"
      end
    end
  end
end
