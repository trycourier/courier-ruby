# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class Intercom < Internal::Types::Model
        field :from, -> { String }, optional: false, nullable: false
        field :to, -> { Courier::Profiles::Types::IntercomRecipient }, optional: false, nullable: false
      end
    end
  end
end
