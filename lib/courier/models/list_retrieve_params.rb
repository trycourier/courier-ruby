# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Lists#retrieve
    class ListRetrieveParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute list_id
      #
      #   @return [String]
      required :list_id, String

      # @!method initialize(list_id:, request_options: {})
      #   @param list_id [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
