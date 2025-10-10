# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Inbound#track_event
    class InboundTrackEventParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

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
      required :properties, Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown]

      # @!attribute type
      #
      #   @return [Symbol, Trycourier::Models::InboundTrackEventParams::Type]
      required :type, enum: -> { Trycourier::InboundTrackEventParams::Type }

      # @!attribute user_id
      #   The user id associatiated with the track
      #
      #   @return [String, nil]
      optional :user_id, String, api_name: :userId, nil?: true

      # @!method initialize(event:, message_id:, properties:, type:, user_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::InboundTrackEventParams} for more details.
      #
      #   @param event [String] A descriptive name of the event. This name will appear as a trigger in the Couri
      #
      #   @param message_id [String] A required unique identifier that will be used to de-duplicate requests. If not
      #
      #   @param properties [Hash{Symbol=>Object}]
      #
      #   @param type [Symbol, Trycourier::Models::InboundTrackEventParams::Type]
      #
      #   @param user_id [String, nil] The user id associatiated with the track
      #
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]

      module Type
        extend Trycourier::Internal::Type::Enum

        TRACK = :track

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
