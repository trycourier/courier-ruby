# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Translations#update
    class TranslationUpdateParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute domain
      #
      #   @return [String]
      required :domain, String

      # @!attribute body
      #
      #   @return [String]
      required :body, String

      # @!method initialize(domain:, body:, request_options: {})
      #   @param domain [String]
      #   @param body [String]
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
