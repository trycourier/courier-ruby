# frozen_string_literal: true

module Courier
  module Models
    class JourneyTemplateReplaceRequest < Courier::Internal::Type::BaseModel
      # @!attribute notification
      #
      #   @return [Courier::Models::JourneyTemplateReplaceRequest::Notification]
      required :notification, -> { Courier::JourneyTemplateReplaceRequest::Notification }

      # @!attribute state
      #
      #   @return [String, nil]
      optional :state, String

      # @!method initialize(notification:, state: nil)
      #   @param notification [Courier::Models::JourneyTemplateReplaceRequest::Notification]
      #   @param state [String]

      # @see Courier::Models::JourneyTemplateReplaceRequest#notification
      class Notification < Courier::Internal::Type::BaseModel
        # @!attribute brand
        #
        #   @return [Courier::Models::JourneyTemplateReplaceRequest::Notification::Brand, nil]
        required :brand, -> { Courier::JourneyTemplateReplaceRequest::Notification::Brand }, nil?: true

        # @!attribute content
        #
        #   @return [Courier::Models::JourneyTemplateReplaceRequest::Notification::Content]
        required :content, -> { Courier::JourneyTemplateReplaceRequest::Notification::Content }

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute subscription
        #
        #   @return [Courier::Models::JourneyTemplateReplaceRequest::Notification::Subscription, nil]
        required :subscription,
                 -> { Courier::JourneyTemplateReplaceRequest::Notification::Subscription },
                 nil?: true

        # @!attribute tags
        #
        #   @return [Array<String>]
        required :tags, Courier::Internal::Type::ArrayOf[String]

        # @!method initialize(brand:, content:, name:, subscription:, tags:)
        #   @param brand [Courier::Models::JourneyTemplateReplaceRequest::Notification::Brand, nil]
        #   @param content [Courier::Models::JourneyTemplateReplaceRequest::Notification::Content]
        #   @param name [String]
        #   @param subscription [Courier::Models::JourneyTemplateReplaceRequest::Notification::Subscription, nil]
        #   @param tags [Array<String>]

        # @see Courier::Models::JourneyTemplateReplaceRequest::Notification#brand
        class Brand < Courier::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!method initialize(id:)
          #   @param id [String]
        end

        # @see Courier::Models::JourneyTemplateReplaceRequest::Notification#content
        class Content < Courier::Internal::Type::BaseModel
          # @!attribute elements
          #
          #   @return [Array<Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType, Courier::Models::ElementalHTMLNodeWithType>]
          required :elements, -> { Courier::Internal::Type::ArrayOf[union: Courier::ElementalNode] }

          # @!attribute version
          #
          #   @return [Symbol, Courier::Models::JourneyTemplateReplaceRequest::Notification::Content::Version]
          required :version, enum: -> { Courier::JourneyTemplateReplaceRequest::Notification::Content::Version }

          # @!attribute scope
          #
          #   @return [Symbol, Courier::Models::JourneyTemplateReplaceRequest::Notification::Content::Scope, nil]
          optional :scope, enum: -> { Courier::JourneyTemplateReplaceRequest::Notification::Content::Scope }

          # @!method initialize(elements:, version:, scope: nil)
          #   @param elements [Array<Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType, Courier::Models::ElementalHTMLNodeWithType>]
          #   @param version [Symbol, Courier::Models::JourneyTemplateReplaceRequest::Notification::Content::Version]
          #   @param scope [Symbol, Courier::Models::JourneyTemplateReplaceRequest::Notification::Content::Scope]

          # @see Courier::Models::JourneyTemplateReplaceRequest::Notification::Content#version
          module Version
            extend Courier::Internal::Type::Enum

            VERSION_2022_01_01 = :"2022-01-01"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Courier::Models::JourneyTemplateReplaceRequest::Notification::Content#scope
          module Scope
            extend Courier::Internal::Type::Enum

            DEFAULT = :default
            STRICT = :strict

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Courier::Models::JourneyTemplateReplaceRequest::Notification#subscription
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
