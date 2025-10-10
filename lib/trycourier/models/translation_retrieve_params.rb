# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Translations#retrieve
    class TranslationRetrieveParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute domain
      #
      #   @return [String]
      required :domain, String

      # @!method initialize(domain:, request_options: {})
      #   @param domain [String]
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
