# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Profiles#replace
    class ProfileReplaceParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute user_id
      #
      #   @return [String]
      required :user_id, String

      # @!attribute profile
      #
      #   @return [Hash{Symbol=>Object}]
      required :profile, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!method initialize(user_id:, profile:, request_options: {})
      #   @param user_id [String]
      #   @param profile [Hash{Symbol=>Object}]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
