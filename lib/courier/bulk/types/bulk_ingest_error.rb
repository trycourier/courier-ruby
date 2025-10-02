# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      class BulkIngestError < Internal::Types::Model
        field :user, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
        field :error, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      end
    end
  end
end
