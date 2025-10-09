# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Profiles#replace
    class ProfileReplaceParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute profile
      #
      #   @return [Hash{Symbol=>Object}]
      required :profile, Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown]

      # @!method initialize(profile:, request_options: {})
      #   @param profile [Hash{Symbol=>Object}]
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
