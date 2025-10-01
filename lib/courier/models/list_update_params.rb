# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Lists#update
    class ListUpdateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute preferences
      #
      #   @return [Courier::Models::Lists::RecipientPreferences, nil]
      optional :preferences, -> { Courier::Lists::RecipientPreferences }, nil?: true

      # @!method initialize(name:, preferences: nil, request_options: {})
      #   @param name [String]
      #   @param preferences [Courier::Models::Lists::RecipientPreferences, nil]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
