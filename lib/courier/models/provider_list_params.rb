# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Providers#list
    class ProviderListParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Opaque cursor for fetching the next page.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!method initialize(cursor: nil, request_options: {})
      #   @param cursor [String] Opaque cursor for fetching the next page.
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
