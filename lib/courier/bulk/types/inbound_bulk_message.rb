# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      class InboundBulkMessage < Internal::Types::Model
        field :message, -> { Courier::Bulk::Types::InboundBulkMessageV2 }, optional: true, nullable: false
      end
    end
  end
end
