# frozen_string_literal: true

module Courier
  module Models
    class JourneyTemplateGetResponse < Courier::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute brand
      #
      #   @return [Courier::Models::JourneyTemplateGetResponse::Brand, nil]
      required :brand, -> { Courier::JourneyTemplateGetResponse::Brand }, nil?: true

      # @!attribute content
      #
      #   @return [Courier::Models::JourneyTemplateGetResponse::Content]
      required :content, -> { Courier::JourneyTemplateGetResponse::Content }

      # @!attribute created
      #
      #   @return [Integer]
      required :created, Integer

      # @!attribute creator
      #
      #   @return [String]
      required :creator, String

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute state
      #
      #   @return [Symbol, Courier::Models::JourneyTemplateGetResponse::State]
      required :state, enum: -> { Courier::JourneyTemplateGetResponse::State }

      # @!attribute subscription
      #
      #   @return [Courier::Models::JourneyTemplateGetResponse::Subscription, nil]
      required :subscription, -> { Courier::JourneyTemplateGetResponse::Subscription }, nil?: true

      # @!attribute tags
      #
      #   @return [Array<String>]
      required :tags, Courier::Internal::Type::ArrayOf[String]

      # @!attribute updated
      #
      #   @return [Integer, nil]
      optional :updated, Integer

      # @!attribute updater
      #
      #   @return [String, nil]
      optional :updater, String

      # @!method initialize(id:, brand:, content:, created:, creator:, name:, state:, subscription:, tags:, updated: nil, updater: nil)
      #   A journey-scoped notification template.
      #
      #   @param id [String]
      #   @param brand [Courier::Models::JourneyTemplateGetResponse::Brand, nil]
      #   @param content [Courier::Models::JourneyTemplateGetResponse::Content]
      #   @param created [Integer]
      #   @param creator [String]
      #   @param name [String]
      #   @param state [Symbol, Courier::Models::JourneyTemplateGetResponse::State]
      #   @param subscription [Courier::Models::JourneyTemplateGetResponse::Subscription, nil]
      #   @param tags [Array<String>]
      #   @param updated [Integer]
      #   @param updater [String]

      # @see Courier::Models::JourneyTemplateGetResponse#brand
      class Brand < Courier::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!method initialize(id:)
        #   @param id [String]
      end

      # @see Courier::Models::JourneyTemplateGetResponse#content
      class Content < Courier::Internal::Type::BaseModel
        # @!attribute elements
        #
        #   @return [Array<Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType, Courier::Models::ElementalHTMLNodeWithType>]
        required :elements, -> { Courier::Internal::Type::ArrayOf[union: Courier::ElementalNode] }

        # @!attribute version
        #
        #   @return [Symbol, Courier::Models::JourneyTemplateGetResponse::Content::Version]
        required :version, enum: -> { Courier::JourneyTemplateGetResponse::Content::Version }

        # @!attribute scope
        #
        #   @return [Symbol, Courier::Models::JourneyTemplateGetResponse::Content::Scope, nil]
        optional :scope, enum: -> { Courier::JourneyTemplateGetResponse::Content::Scope }

        # @!method initialize(elements:, version:, scope: nil)
        #   @param elements [Array<Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType, Courier::Models::ElementalHTMLNodeWithType>]
        #   @param version [Symbol, Courier::Models::JourneyTemplateGetResponse::Content::Version]
        #   @param scope [Symbol, Courier::Models::JourneyTemplateGetResponse::Content::Scope]

        # @see Courier::Models::JourneyTemplateGetResponse::Content#version
        module Version
          extend Courier::Internal::Type::Enum

          VERSION_2022_01_01 = :"2022-01-01"

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Courier::Models::JourneyTemplateGetResponse::Content#scope
        module Scope
          extend Courier::Internal::Type::Enum

          DEFAULT = :default
          STRICT = :strict

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Courier::Models::JourneyTemplateGetResponse#state
      module State
        extend Courier::Internal::Type::Enum

        DRAFT = :DRAFT
        PUBLISHED = :PUBLISHED

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Courier::Models::JourneyTemplateGetResponse#subscription
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
