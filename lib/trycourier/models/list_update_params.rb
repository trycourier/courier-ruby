# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Lists#update
    class ListUpdateParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute preferences
      #
      #   @return [Trycourier::Models::RecipientPreferences, nil]
      optional :preferences, -> { Trycourier::RecipientPreferences }, nil?: true

      # @!method initialize(name:, preferences: nil, request_options: {})
      #   @param name [String]
      #   @param preferences [Trycourier::Models::RecipientPreferences, nil]
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
