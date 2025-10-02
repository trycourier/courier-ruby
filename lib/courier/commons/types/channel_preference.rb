# frozen_string_literal: true

module Courier
  module Commons
    module Types
      class ChannelPreference < Internal::Types::Model
        field :channel, -> { Courier::Commons::Types::ChannelClassification }, optional: false, nullable: false
      end
    end
  end
end
