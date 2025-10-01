# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Profiles#create
    class ProfileCreateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute profile
      #
      #   @return [Hash{Symbol=>Object}]
      required :profile, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!method initialize(profile:, request_options: {})
      #   @param profile [Hash{Symbol=>Object}]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
