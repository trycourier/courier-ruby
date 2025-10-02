# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      class InboundBulkTemplateMessage < Internal::Types::Model
        field :template, -> { String }, optional: false, nullable: false
      end
    end
  end
end
