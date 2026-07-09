# frozen_string_literal: true

module Courier
  module Models
    module Users
      # @see Courier::Resources::Users::Preferences#bulk_replace
      class PreferenceBulkReplaceParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!attribute topics
        #   The complete set of topic overrides for the user. Up to 50 topics may be
        #   provided. Any existing override not listed here is reset to its topic default;
        #   an empty array resets every existing override.
        #
        #   @return [Array<Courier::Models::Users::PreferenceBulkReplaceParams::Topic>]
        required :topics,
                 -> { Courier::Internal::Type::ArrayOf[Courier::Users::PreferenceBulkReplaceParams::Topic] }

        # @!attribute tenant_id
        #   Replace the preferences of a user for this specific tenant context.
        #
        #   @return [String, nil]
        optional :tenant_id, String, nil?: true

        # @!method initialize(user_id:, topics:, tenant_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::Users::PreferenceBulkReplaceParams} for more details.
        #
        #   @param user_id [String]
        #
        #   @param topics [Array<Courier::Models::Users::PreferenceBulkReplaceParams::Topic>] The complete set of topic overrides for the user. Up to 50 topics may be provide
        #
        #   @param tenant_id [String, nil] Replace the preferences of a user for this specific tenant context.
        #
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

        class Topic < Courier::Internal::Type::BaseModel
          # @!attribute status
          #   The subscription status to apply for this topic.
          #
          #   @return [Symbol, Courier::Models::Users::PreferenceBulkReplaceParams::Topic::Status]
          required :status, enum: -> { Courier::Users::PreferenceBulkReplaceParams::Topic::Status }

          # @!attribute topic_id
          #   A unique identifier associated with a subscription topic.
          #
          #   @return [String]
          required :topic_id, String

          # @!attribute custom_routing
          #   The channels a user has chosen to receive notifications through for this topic.
          #
          #   @return [Array<Symbol, Courier::Models::ChannelClassification>, nil]
          optional :custom_routing, -> { Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification] }

          # @!attribute has_custom_routing
          #   Whether the recipient has chosen specific delivery channels for this topic.
          #
          #   @return [Boolean, nil]
          optional :has_custom_routing, Courier::Internal::Type::Boolean

          # @!method initialize(status:, topic_id:, custom_routing: nil, has_custom_routing: nil)
          #   @param status [Symbol, Courier::Models::Users::PreferenceBulkReplaceParams::Topic::Status] The subscription status to apply for this topic.
          #
          #   @param topic_id [String] A unique identifier associated with a subscription topic.
          #
          #   @param custom_routing [Array<Symbol, Courier::Models::ChannelClassification>] The channels a user has chosen to receive notifications through for this topic.
          #
          #   @param has_custom_routing [Boolean] Whether the recipient has chosen specific delivery channels for this topic.

          # The subscription status to apply for this topic.
          #
          # @see Courier::Models::Users::PreferenceBulkReplaceParams::Topic#status
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
end
