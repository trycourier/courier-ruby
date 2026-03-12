# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Brands#update
    class BrandUpdateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute brand_id
      #
      #   @return [String]
      required :brand_id, String

      # @!attribute name
      #   The name of the brand.
      #
      #   @return [String]
      required :name, String

      # @!attribute settings
      #
      #   @return [Courier::Models::BrandSettings, nil]
      optional :settings, -> { Courier::BrandSettings }, nil?: true

      # @!attribute snippets
      #
      #   @return [Courier::Models::BrandSnippets, nil]
      optional :snippets, -> { Courier::BrandSnippets }, nil?: true

      # @!method initialize(brand_id:, name:, settings: nil, snippets: nil, request_options: {})
      #   @param brand_id [String]
      #
      #   @param name [String] The name of the brand.
      #
      #   @param settings [Courier::Models::BrandSettings, nil]
      #
      #   @param snippets [Courier::Models::BrandSnippets, nil]
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
