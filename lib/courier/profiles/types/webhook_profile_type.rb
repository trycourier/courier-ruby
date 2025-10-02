# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      module WebhookProfileType
        extend Courier::Internal::Types::Enum

        LIMITED = "limited"
        EXPANDED = "expanded"
      end
    end
  end
end
