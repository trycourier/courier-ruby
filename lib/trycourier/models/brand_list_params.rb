# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Brands#list
    class BrandListParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute cursor
      #   A unique identifier that allows for fetching the next set of brands.
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!method initialize(cursor: nil, request_options: {})
      #   @param cursor [String, nil] A unique identifier that allows for fetching the next set of brands.
      #
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
