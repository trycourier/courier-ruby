# frozen_string_literal: true

module Courier
  module Send
    module Types
      class AudienceFilter < Internal::Types::Model
        field :operator, -> { String }, optional: false, nullable: false
        field :path, -> { String }, optional: false, nullable: false
        field :value, -> { String }, optional: false, nullable: false
      end
    end
  end
end
