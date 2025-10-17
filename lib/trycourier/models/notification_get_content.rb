# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Notifications#retrieve_content
    class NotificationGetContent < Trycourier::Internal::Type::BaseModel
      # @!attribute blocks
      #
      #   @return [Array<Trycourier::Models::NotificationGetContent::Block>, nil]
      optional :blocks,
               -> { Trycourier::Internal::Type::ArrayOf[Trycourier::NotificationGetContent::Block] },
               nil?: true

      # @!attribute channels
      #
      #   @return [Array<Trycourier::Models::NotificationGetContent::Channel>, nil]
      optional :channels,
               -> { Trycourier::Internal::Type::ArrayOf[Trycourier::NotificationGetContent::Channel] },
               nil?: true

      # @!attribute checksum
      #
      #   @return [String, nil]
      optional :checksum, String, nil?: true

      # @!method initialize(blocks: nil, channels: nil, checksum: nil)
      #   @param blocks [Array<Trycourier::Models::NotificationGetContent::Block>, nil]
      #   @param channels [Array<Trycourier::Models::NotificationGetContent::Channel>, nil]
      #   @param checksum [String, nil]

      class Block < Trycourier::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #
        #   @return [Symbol, Trycourier::Models::NotificationGetContent::Block::Type]
        required :type, enum: -> { Trycourier::NotificationGetContent::Block::Type }

        # @!attribute alias_
        #
        #   @return [String, nil]
        optional :alias_, String, api_name: :alias, nil?: true

        # @!attribute checksum
        #
        #   @return [String, nil]
        optional :checksum, String, nil?: true

        # @!attribute content
        #
        #   @return [String, Trycourier::Models::NotificationGetContent::Block::Content::NotificationContentHierarchy, nil]
        optional :content, union: -> { Trycourier::NotificationGetContent::Block::Content }, nil?: true

        # @!attribute context
        #
        #   @return [String, nil]
        optional :context, String, nil?: true

        # @!attribute locales
        #
        #   @return [Hash{Symbol=>String, Trycourier::Models::NotificationGetContent::Block::Locale::NotificationContentHierarchy}, nil]
        optional :locales,
                 -> {
                   Trycourier::Internal::Type::HashOf[union: Trycourier::NotificationGetContent::Block::Locale]
                 },
                 nil?: true

        # @!method initialize(id:, type:, alias_: nil, checksum: nil, content: nil, context: nil, locales: nil)
        #   @param id [String]
        #   @param type [Symbol, Trycourier::Models::NotificationGetContent::Block::Type]
        #   @param alias_ [String, nil]
        #   @param checksum [String, nil]
        #   @param content [String, Trycourier::Models::NotificationGetContent::Block::Content::NotificationContentHierarchy, nil]
        #   @param context [String, nil]
        #   @param locales [Hash{Symbol=>String, Trycourier::Models::NotificationGetContent::Block::Locale::NotificationContentHierarchy}, nil]

        # @see Trycourier::Models::NotificationGetContent::Block#type
        module Type
          extend Trycourier::Internal::Type::Enum

          ACTION = :action
          DIVIDER = :divider
          IMAGE = :image
          JSONNET = :jsonnet
          LIST = :list
          MARKDOWN = :markdown
          QUOTE = :quote
          TEMPLATE = :template
          TEXT = :text

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Trycourier::Models::NotificationGetContent::Block#content
        module Content
          extend Trycourier::Internal::Type::Union

          variant String

          variant -> { Trycourier::NotificationGetContent::Block::Content::NotificationContentHierarchy }

          class NotificationContentHierarchy < Trycourier::Internal::Type::BaseModel
            # @!attribute children
            #
            #   @return [String, nil]
            optional :children, String, nil?: true

            # @!attribute parent
            #
            #   @return [String, nil]
            optional :parent, String, nil?: true

            # @!method initialize(children: nil, parent: nil)
            #   @param children [String, nil]
            #   @param parent [String, nil]
          end

          # @!method self.variants
          #   @return [Array(String, Trycourier::Models::NotificationGetContent::Block::Content::NotificationContentHierarchy)]
        end

        module Locale
          extend Trycourier::Internal::Type::Union

          variant String

          variant -> { Trycourier::NotificationGetContent::Block::Locale::NotificationContentHierarchy }

          class NotificationContentHierarchy < Trycourier::Internal::Type::BaseModel
            # @!attribute children
            #
            #   @return [String, nil]
            optional :children, String, nil?: true

            # @!attribute parent
            #
            #   @return [String, nil]
            optional :parent, String, nil?: true

            # @!method initialize(children: nil, parent: nil)
            #   @param children [String, nil]
            #   @param parent [String, nil]
          end

          # @!method self.variants
          #   @return [Array(String, Trycourier::Models::NotificationGetContent::Block::Locale::NotificationContentHierarchy)]
        end
      end

      class Channel < Trycourier::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute checksum
        #
        #   @return [String, nil]
        optional :checksum, String, nil?: true

        # @!attribute content
        #
        #   @return [Trycourier::Models::NotificationGetContent::Channel::Content, nil]
        optional :content, -> { Trycourier::NotificationGetContent::Channel::Content }, nil?: true

        # @!attribute locales
        #
        #   @return [Hash{Symbol=>Trycourier::Models::NotificationGetContent::Channel::Locale}, nil]
        optional :locales,
                 -> {
                   Trycourier::Internal::Type::HashOf[Trycourier::NotificationGetContent::Channel::Locale]
                 },
                 nil?: true

        # @!attribute type
        #
        #   @return [String, nil]
        optional :type, String, nil?: true

        # @!method initialize(id:, checksum: nil, content: nil, locales: nil, type: nil)
        #   @param id [String]
        #   @param checksum [String, nil]
        #   @param content [Trycourier::Models::NotificationGetContent::Channel::Content, nil]
        #   @param locales [Hash{Symbol=>Trycourier::Models::NotificationGetContent::Channel::Locale}, nil]
        #   @param type [String, nil]

        # @see Trycourier::Models::NotificationGetContent::Channel#content
        class Content < Trycourier::Internal::Type::BaseModel
          # @!attribute subject
          #
          #   @return [String, nil]
          optional :subject, String, nil?: true

          # @!attribute title
          #
          #   @return [String, nil]
          optional :title, String, nil?: true

          # @!method initialize(subject: nil, title: nil)
          #   @param subject [String, nil]
          #   @param title [String, nil]
        end

        class Locale < Trycourier::Internal::Type::BaseModel
          # @!attribute subject
          #
          #   @return [String, nil]
          optional :subject, String, nil?: true

          # @!attribute title
          #
          #   @return [String, nil]
          optional :title, String, nil?: true

          # @!method initialize(subject: nil, title: nil)
          #   @param subject [String, nil]
          #   @param title [String, nil]
        end
      end
    end
  end
end
