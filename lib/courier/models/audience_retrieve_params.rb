# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Audiences#retrieve
    class AudienceRetrieveParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute audience_id
      #
      #   @return [String]
      required :audience_id, String

      # @!method initialize(audience_id:, request_options: {})
      #   @param audience_id [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
