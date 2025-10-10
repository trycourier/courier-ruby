# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Audiences#update
    class AudienceUpdateParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute description
      #   A description of the audience
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute filter
      #   A single filter to use for filtering
      #
      #   @return [Trycourier::Models::Filter, nil]
      optional :filter, -> { Trycourier::Filter }, nil?: true

      # @!attribute name
      #   The name of the audience
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!method initialize(description: nil, filter: nil, name: nil, request_options: {})
      #   @param description [String, nil] A description of the audience
      #
      #   @param filter [Trycourier::Models::Filter, nil] A single filter to use for filtering
      #
      #   @param name [String, nil] The name of the audience
      #
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
