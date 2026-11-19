# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Feedback#create
    class FeedbackCreateResponse < Courier::Internal::Type::BaseModel
      # @!attribute feedback_id
      #   The ID of the stored report, `fbk_` followed by a ULID.
      #
      #   @return [String]
      required :feedback_id, String

      # @!method initialize(feedback_id:)
      #   @param feedback_id [String] The ID of the stored report, `fbk_` followed by a ULID.
    end
  end
end
