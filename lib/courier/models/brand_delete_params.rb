# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Brands#delete
    class BrandDeleteParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
