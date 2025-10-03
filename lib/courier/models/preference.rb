# frozen_string_literal: true

module Courier
  module Models
    class Preference < Courier::Internal::Type::BaseModel
      # @!attribute status
      #
      #   @return [Symbol, Courier::Models::Preference::Status]
      required :status, enum: -> { Courier::Preference::Status }

      # @!attribute channel_preferences
      #
      #   @return [Array<Courier::Models::Preference::ChannelPreference>, nil]
      optional :channel_preferences,
               -> { Courier::Internal::Type::ArrayOf[Courier::Preference::ChannelPreference] },
               nil?: true

      # @!attribute rules
      #
      #   @return [Array<Courier::Models::Preference::Rule>, nil]
      optional :rules, -> { Courier::Internal::Type::ArrayOf[Courier::Preference::Rule] }, nil?: true

      # @!attribute source
      #
      #   @return [Symbol, Courier::Models::Preference::Source, nil]
      optional :source, enum: -> { Courier::Preference::Source }, nil?: true

      # @!method initialize(status:, channel_preferences: nil, rules: nil, source: nil)
      #   @param status [Symbol, Courier::Models::Preference::Status]
      #   @param channel_preferences [Array<Courier::Models::Preference::ChannelPreference>, nil]
      #   @param rules [Array<Courier::Models::Preference::Rule>, nil]
      #   @param source [Symbol, Courier::Models::Preference::Source, nil]

      # @see Courier::Models::Preference#status
      module Status
        extend Courier::Internal::Type::Enum

        OPTED_IN = :OPTED_IN
        OPTED_OUT = :OPTED_OUT
        REQUIRED = :REQUIRED

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class ChannelPreference < Courier::Internal::Type::BaseModel
        # @!attribute channel
        #
        #   @return [Symbol, Courier::Models::Preference::ChannelPreference::Channel]
        required :channel, enum: -> { Courier::Preference::ChannelPreference::Channel }

        # @!method initialize(channel:)
        #   @param channel [Symbol, Courier::Models::Preference::ChannelPreference::Channel]

        # @see Courier::Models::Preference::ChannelPreference#channel
        module Channel
          extend Courier::Internal::Type::Enum

          DIRECT_MESSAGE = :direct_message
          EMAIL = :email
          PUSH = :push
          SMS = :sms
          WEBHOOK = :webhook
          INBOX = :inbox

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Rule < Courier::Internal::Type::BaseModel
        # @!attribute until_
        #
        #   @return [String]
        required :until_, String, api_name: :until

        # @!attribute start
        #
        #   @return [String, nil]
        optional :start, String, nil?: true

        # @!method initialize(until_:, start: nil)
        #   @param until_ [String]
        #   @param start [String, nil]
      end

      # @see Courier::Models::Preference#source
      module Source
        extend Courier::Internal::Type::Enum

        SUBSCRIPTION = :subscription
        LIST = :list
        RECIPIENT = :recipient

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
