# frozen_string_literal: true

module Courier
  module Models
    module Users
      # @see Courier::Resources::Users::Preferences#bulk_update
      class PreferenceBulkUpdateResponse < Courier::Internal::Type::BaseModel
        # @!attribute errors
        #   The topics that could not be applied, each with a reason.
        #
        #   @return [Array<Courier::Models::Users::PreferenceBulkUpdateResponse::Error>]
        required :errors,
                 -> { Courier::Internal::Type::ArrayOf[Courier::Models::Users::PreferenceBulkUpdateResponse::Error] }

        # @!attribute items
        #   The topics that were successfully created or updated.
        #
        #   @return [Array<Courier::Models::Users::BulkPreferenceTopic>]
        required :items, -> { Courier::Internal::Type::ArrayOf[Courier::Users::BulkPreferenceTopic] }

        # @!method initialize(errors:, items:)
        #   @param errors [Array<Courier::Models::Users::PreferenceBulkUpdateResponse::Error>] The topics that could not be applied, each with a reason.
        #
        #   @param items [Array<Courier::Models::Users::BulkPreferenceTopic>] The topics that were successfully created or updated.

        class Error < Courier::Internal::Type::BaseModel
          # @!attribute reason
          #   A human-readable explanation of why the topic could not be applied.
          #
          #   @return [String]
          required :reason, String

          # @!attribute topic_id
          #
          #   @return [String]
          required :topic_id, String

          # @!method initialize(reason:, topic_id:)
          #   A single topic that could not be applied in a bulk preference request.
          #
          #   @param reason [String] A human-readable explanation of why the topic could not be applied.
          #
          #   @param topic_id [String]
        end
      end
    end
  end
end
