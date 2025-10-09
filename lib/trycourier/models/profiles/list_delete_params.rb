# frozen_string_literal: true

module Trycourier
  module Models
    module Profiles
      # @see Trycourier::Resources::Profiles::Lists#delete
      class ListDeleteParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!method initialize(request_options: {})
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
