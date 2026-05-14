# frozen_string_literal: true

module Courier
  module Models
    class JourneyTemplateCreateRequest < Courier::Internal::Type::BaseModel
      # @!attribute channel
      #
      #   @return [String]
      required :channel, String

      # @!attribute notification
      #
      #   @return [Courier::Models::JourneyTemplateCreateRequest::Notification]
      required :notification, -> { Courier::JourneyTemplateCreateRequest::Notification }

      # @!attribute provider_key
      #
      #   @return [String, nil]
      optional :provider_key, String, api_name: :providerKey

      # @!attribute state
      #
      #   @return [String, nil]
      optional :state, String

      # @!method initialize(channel:, notification:, provider_key: nil, state: nil)
      #   @param channel [String]
      #   @param notification [Courier::Models::JourneyTemplateCreateRequest::Notification]
      #   @param provider_key [String]
      #   @param state [String]

      # @see Courier::Models::JourneyTemplateCreateRequest#notification
      class Notification < Courier::Internal::Type::BaseModel
        # @!attribute brand
        #
        #   @return [Courier::Models::JourneyTemplateCreateRequest::Notification::Brand, nil]
        required :brand, -> { Courier::JourneyTemplateCreateRequest::Notification::Brand }, nil?: true

        # @!attribute content
        #
        #   @return [Courier::Models::JourneyTemplateCreateRequest::Notification::Content]
        required :content, -> { Courier::JourneyTemplateCreateRequest::Notification::Content }

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute subscription
        #
        #   @return [Courier::Models::JourneyTemplateCreateRequest::Notification::Subscription, nil]
        required :subscription,
                 -> { Courier::JourneyTemplateCreateRequest::Notification::Subscription },
                 nil?: true

        # @!attribute tags
        #
        #   @return [Array<String>]
        required :tags, Courier::Internal::Type::ArrayOf[String]

        # @!method initialize(brand:, content:, name:, subscription:, tags:)
        #   @param brand [Courier::Models::JourneyTemplateCreateRequest::Notification::Brand, nil]
        #   @param content [Courier::Models::JourneyTemplateCreateRequest::Notification::Content]
        #   @param name [String]
        #   @param subscription [Courier::Models::JourneyTemplateCreateRequest::Notification::Subscription, nil]
        #   @param tags [Array<String>]

        # @see Courier::Models::JourneyTemplateCreateRequest::Notification#brand
        class Brand < Courier::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!method initialize(id:)
          #   @param id [String]
        end

        # @see Courier::Models::JourneyTemplateCreateRequest::Notification#content
        class Content < Courier::Internal::Type::BaseModel
          # @!attribute elements
          #
          #   @return [Array<Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType, Courier::Models::ElementalHTMLNodeWithType>]
          required :elements, -> { Courier::Internal::Type::ArrayOf[union: Courier::ElementalNode] }

          # @!attribute version
          #
          #   @return [Symbol, Courier::Models::JourneyTemplateCreateRequest::Notification::Content::Version]
          required :version, enum: -> { Courier::JourneyTemplateCreateRequest::Notification::Content::Version }

          # @!attribute scope
          #
          #   @return [Symbol, Courier::Models::JourneyTemplateCreateRequest::Notification::Content::Scope, nil]
          optional :scope, enum: -> { Courier::JourneyTemplateCreateRequest::Notification::Content::Scope }

          # @!method initialize(elements:, version:, scope: nil)
          #   @param elements [Array<Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType, Courier::Models::ElementalHTMLNodeWithType>]
          #   @param version [Symbol, Courier::Models::JourneyTemplateCreateRequest::Notification::Content::Version]
          #   @param scope [Symbol, Courier::Models::JourneyTemplateCreateRequest::Notification::Content::Scope]

          # @see Courier::Models::JourneyTemplateCreateRequest::Notification::Content#version
          module Version
            extend Courier::Internal::Type::Enum

            VERSION_2022_01_01 = :"2022-01-01"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Courier::Models::JourneyTemplateCreateRequest::Notification::Content#scope
          module Scope
            extend Courier::Internal::Type::Enum

            DEFAULT = :default
            STRICT = :strict

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Courier::Models::JourneyTemplateCreateRequest::Notification#subscription
        class Subscription < Courier::Internal::Type::BaseModel
          # @!attribute topic_id
          #
          #   @return [String]
          required :topic_id, String

          # @!method initialize(topic_id:)
          #   @param topic_id [String]
        end
      end
    end
  end
end
