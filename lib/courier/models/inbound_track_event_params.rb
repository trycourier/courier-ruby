# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Inbound#track_event
    class InboundTrackEventParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute event
      #   A descriptive name of the event. This name will appear as a trigger in the
      #   Courier Automation Trigger node.
      #
      #   @return [String]
      required :event, String

      # @!attribute message_id
      #   A required unique identifier that will be used to de-duplicate requests. If not
      #   unique, will respond with 409 Conflict status
      #
      #   @return [String]
      required :message_id, String, api_name: :messageId

      # @!attribute properties
      #
      #   @return [Hash{Symbol=>Object}]
      required :properties, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::InboundTrackEventParams::Type]
      required :type, enum: -> { Courier::InboundTrackEventParams::Type }

      # @!attribute user_id
      #   The user id associatiated with the track
      #
      #   @return [String, nil]
      optional :user_id, String, api_name: :userId, nil?: true

      # @!method initialize(event:, message_id:, properties:, type:, user_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::InboundTrackEventParams} for more details.
      #
      #   @param event [String] A descriptive name of the event. This name will appear as a trigger in the Couri
      #
      #   @param message_id [String] A required unique identifier that will be used to de-duplicate requests. If not
      #
      #   @param properties [Hash{Symbol=>Object}]
      #
      #   @param type [Symbol, Courier::Models::InboundTrackEventParams::Type]
      #
      #   @param user_id [String, nil] The user id associatiated with the track
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

      module Type
        extend Courier::Internal::Type::Enum

        TRACK = :track

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
