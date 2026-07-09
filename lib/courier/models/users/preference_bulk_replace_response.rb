# frozen_string_literal: true

module Courier
  module Models
    module Users
      # @see Courier::Resources::Users::Preferences#bulk_replace
      class PreferenceBulkReplaceResponse < Courier::Internal::Type::BaseModel
        # @!attribute deleted
        #   The ids of the overrides that were reset to their topic default.
        #
        #   @return [Array<String>]
        required :deleted, Courier::Internal::Type::ArrayOf[String]

        # @!attribute items
        #   The complete resulting set of topic overrides for the user.
        #
        #   @return [Array<Courier::Models::Users::BulkPreferenceTopic>]
        required :items, -> { Courier::Internal::Type::ArrayOf[Courier::Users::BulkPreferenceTopic] }

        # @!method initialize(deleted:, items:)
        #   @param deleted [Array<String>] The ids of the overrides that were reset to their topic default.
        #
        #   @param items [Array<Courier::Models::Users::BulkPreferenceTopic>] The complete resulting set of topic overrides for the user.
      end
    end
  end
end
