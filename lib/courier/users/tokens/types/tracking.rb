# frozen_string_literal: true

module Courier
  module Users
    module Tokens
      module Types
        class Tracking < Internal::Types::Model
          field :os_version, -> { String }, optional: true, nullable: false
          field :ip, -> { String }, optional: true, nullable: false
          field :lat, -> { String }, optional: true, nullable: false
          field :long, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
