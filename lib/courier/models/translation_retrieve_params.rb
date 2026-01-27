# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Translations#retrieve
    class TranslationRetrieveParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute domain
      #
      #   @return [String]
      required :domain, String

      # @!method initialize(domain:, request_options: {})
      #   @param domain [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
