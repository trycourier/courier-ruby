# frozen_string_literal: true

module Courier
  module Models
    class AudienceRecipient < Courier::Internal::Type::BaseModel
      # @!attribute audience_id
      #   A unique identifier associated with an Audience. A message will be sent to each
      #   user in the audience.
      #
      #   @return [String]
      required :audience_id, String

      # @!attribute data
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!attribute filters
      #
      #   @return [Array<Courier::Models::AudienceFilter>, nil]
      optional :filters, -> { Courier::Internal::Type::ArrayOf[Courier::AudienceFilter] }, nil?: true

      # @!method initialize(audience_id:, data: nil, filters: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::AudienceRecipient} for more details.
      #
      #   Send to all users in an audience
      #
      #   @param audience_id [String] A unique identifier associated with an Audience. A message will be sent to each
      #
      #   @param data [Hash{Symbol=>Object}, nil]
      #
      #   @param filters [Array<Courier::Models::AudienceFilter>, nil]
    end
  end
end
