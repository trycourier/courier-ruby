# frozen_string_literal: true

module Courier
  module Models
    # @type [Courier::Internal::Type::Converter]
    MessageProviders = Courier::Internal::Type::HashOf[-> { Courier::MessageProvidersType }]
  end
end
