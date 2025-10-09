# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Brands#create
    class BrandCreateParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String, nil?: true

      # @!attribute settings
      #
      #   @return [Trycourier::Models::BrandSettings, nil]
      optional :settings, -> { Trycourier::BrandSettings }, nil?: true

      # @!attribute snippets
      #
      #   @return [Trycourier::Models::BrandSnippets, nil]
      optional :snippets, -> { Trycourier::BrandSnippets }, nil?: true

      # @!method initialize(name:, id: nil, settings: nil, snippets: nil, request_options: {})
      #   @param name [String]
      #   @param id [String, nil]
      #   @param settings [Trycourier::Models::BrandSettings, nil]
      #   @param snippets [Trycourier::Models::BrandSnippets, nil]
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
