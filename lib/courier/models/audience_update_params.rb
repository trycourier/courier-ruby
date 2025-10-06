# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Audiences#update
    class AudienceUpdateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute description
      #   A description of the audience
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute filter
      #   The operator to use for filtering
      #
      #   @return [Courier::Models::Filter::UnionMember0, Courier::Models::NestedFilterConfig, nil]
      optional :filter, union: -> { Courier::Filter }, nil?: true

      # @!attribute name
      #   The name of the audience
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!method initialize(description: nil, filter: nil, name: nil, request_options: {})
      #   @param description [String, nil] A description of the audience
      #
      #   @param filter [Courier::Models::Filter::UnionMember0, Courier::Models::NestedFilterConfig, nil] The operator to use for filtering
      #
      #   @param name [String, nil] The name of the audience
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
