# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Brands#delete
    class BrandDeleteParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute brand_id
      #
      #   @return [String]
      required :brand_id, String

      # @!method initialize(brand_id:, request_options: {})
      #   @param brand_id [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
