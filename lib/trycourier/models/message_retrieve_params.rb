# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Messages#retrieve
    class MessageRetrieveParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
