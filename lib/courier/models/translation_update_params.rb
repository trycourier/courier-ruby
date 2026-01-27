# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Translations#update
    class TranslationUpdateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

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
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
