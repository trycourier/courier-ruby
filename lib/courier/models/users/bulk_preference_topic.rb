# frozen_string_literal: true

module Courier
  module Models
    module Users
      class BulkPreferenceTopic < Courier::Internal::Type::BaseModel
        # @!attribute custom_routing
        #
        #   @return [Array<Symbol, Courier::Models::ChannelClassification>]
        required :custom_routing, -> { Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification] }

        # @!attribute has_custom_routing
        #
        #   @return [Boolean]
        required :has_custom_routing, Courier::Internal::Type::Boolean

        # @!attribute status
        #   The applied subscription status. Echoes the requested value, so it is always
        #   OPTED_IN or OPTED_OUT.
        #
        #   @return [Symbol, Courier::Models::Users::BulkPreferenceTopic::Status]
        required :status, enum: -> { Courier::Users::BulkPreferenceTopic::Status }

        # @!attribute topic_id
        #
        #   @return [String]
        required :topic_id, String

        # @!method initialize(custom_routing:, has_custom_routing:, status:, topic_id:)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::Users::BulkPreferenceTopic} for more details.
        #
        #   A single topic override echoed in a bulk preference response.
        #
        #   @param custom_routing [Array<Symbol, Courier::Models::ChannelClassification>]
        #
        #   @param has_custom_routing [Boolean]
        #
        #   @param status [Symbol, Courier::Models::Users::BulkPreferenceTopic::Status] The applied subscription status. Echoes the requested value, so it is always OPT
        #
        #   @param topic_id [String]

        # The applied subscription status. Echoes the requested value, so it is always
        # OPTED_IN or OPTED_OUT.
        #
        # @see Courier::Models::Users::BulkPreferenceTopic#status
        module Status
          extend Courier::Internal::Type::Enum

          OPTED_IN = :OPTED_IN
          OPTED_OUT = :OPTED_OUT

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
