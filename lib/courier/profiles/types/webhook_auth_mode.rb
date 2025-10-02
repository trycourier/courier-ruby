# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      module WebhookAuthMode
        extend Courier::Internal::Types::Enum

        NONE = "none"
        BASIC = "basic"
        BEARER = "bearer"
      end
    end
  end
end
