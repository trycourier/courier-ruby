# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Brands#create
    class BrandCreateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute settings
      #
      #   @return [Courier::Models::BrandSettings]
      required :settings, -> { Courier::BrandSettings }

      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String, nil?: true

      # @!attribute snippets
      #
      #   @return [Courier::Models::BrandSnippets, nil]
      optional :snippets, -> { Courier::BrandSnippets }, nil?: true

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_idempotency_expiration
      #
      #   @return [String, nil]
      optional :x_idempotency_expiration, String

      # @!method initialize(name:, settings:, id: nil, snippets: nil, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
      #   @param name [String]
      #   @param settings [Courier::Models::BrandSettings]
      #   @param id [String, nil]
      #   @param snippets [Courier::Models::BrandSnippets, nil]
      #   @param idempotency_key [String]
      #   @param x_idempotency_expiration [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
