# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      # @see Trycourier::Resources::Users::Preferences#retrieve
      class PreferenceRetrieveResponse < Trycourier::Internal::Type::BaseModel
        # @!attribute items
        #   The Preferences associated with the user_id.
        #
        #   @return [Array<Trycourier::Models::TopicPreference>]
        required :items, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::TopicPreference] }

        # @!attribute paging
        #   Deprecated - Paging not implemented on this endpoint
        #
        #   @return [Trycourier::Models::Paging]
        required :paging, -> { Trycourier::Paging }

        # @!method initialize(items:, paging:)
        #   @param items [Array<Trycourier::Models::TopicPreference>] The Preferences associated with the user_id.
        #
        #   @param paging [Trycourier::Models::Paging] Deprecated - Paging not implemented on this endpoint
      end
    end
  end
end
