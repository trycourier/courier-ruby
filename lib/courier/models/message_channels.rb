# frozen_string_literal: true

module Courier
  module Models
    # @type [Courier::Internal::Type::Converter]
    MessageChannels = Courier::Internal::Type::HashOf[-> { Courier::Channel }]
  end
end
