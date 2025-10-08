# frozen_string_literal: true

module Courier
  module Models
    module Users
      # @see Courier::Resources::Users::Preferences#retrieve
      class PreferenceRetrieveResponse < Courier::Internal::Type::BaseModel
        # @!attribute items
        #   The Preferences associated with the user_id.
        #
        #   @return [Array<Courier::Models::TopicPreference>]
        required :items, -> { Courier::Internal::Type::ArrayOf[Courier::TopicPreference] }

        # @!attribute paging
        #   Deprecated - Paging not implemented on this endpoint
        #
        #   @return [Courier::Models::Paging]
        required :paging, -> { Courier::Paging }

        # @!method initialize(items:, paging:)
        #   @param items [Array<Courier::Models::TopicPreference>] The Preferences associated with the user_id.
        #
        #   @param paging [Courier::Models::Paging] Deprecated - Paging not implemented on this endpoint
      end
    end
  end
end
