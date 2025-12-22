# frozen_string_literal: true

module Trycourier
  module Models
    class AudienceRecipient < Trycourier::Internal::Type::BaseModel
      # @!attribute audience_id
      #   A unique identifier associated with an Audience. A message will be sent to each
      #   user in the audience.
      #
      #   @return [String]
      required :audience_id, String

      # @!attribute data
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :data, Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown], nil?: true

      # @!attribute filters
      #
      #   @return [Array<Trycourier::Models::AudienceFilter>, nil]
      optional :filters, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::AudienceFilter] }, nil?: true

      # @!method initialize(audience_id:, data: nil, filters: nil)
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::AudienceRecipient} for more details.
      #
      #   Send to all users in an audience
      #
      #   @param audience_id [String] A unique identifier associated with an Audience. A message will be sent to each
      #
      #   @param data [Hash{Symbol=>Object}, nil]
      #
      #   @param filters [Array<Trycourier::Models::AudienceFilter>, nil]
    end
  end
end
