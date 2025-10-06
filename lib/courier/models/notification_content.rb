# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#retrieve_content
    class NotificationContent < Courier::Internal::Type::BaseModel
      # @!attribute blocks
      #
      #   @return [Array<Courier::Models::NotificationContent::Block>, nil]
      optional :blocks,
               -> {
                 Courier::Internal::Type::ArrayOf[Courier::NotificationContent::Block]
               },
               nil?: true

      # @!attribute channels
      #
      #   @return [Array<Courier::Models::NotificationContent::Channel>, nil]
      optional :channels,
               -> { Courier::Internal::Type::ArrayOf[Courier::NotificationContent::Channel] },
               nil?: true

      # @!attribute checksum
      #
      #   @return [String, nil]
      optional :checksum, String, nil?: true

      # @!method initialize(blocks: nil, channels: nil, checksum: nil)
      #   @param blocks [Array<Courier::Models::NotificationContent::Block>, nil]
      #   @param channels [Array<Courier::Models::NotificationContent::Channel>, nil]
      #   @param checksum [String, nil]

      class Block < Courier::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::NotificationContent::Block::Type]
        required :type, enum: -> { Courier::NotificationContent::Block::Type }

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
        #   @return [String, Courier::Models::NotificationContent::Block::Content::NotificationContentHierarchy, nil]
        optional :content, union: -> { Courier::NotificationContent::Block::Content }, nil?: true

        # @!attribute context
        #
        #   @return [String, nil]
        optional :context, String, nil?: true

        # @!attribute locales
        #
        #   @return [Hash{Symbol=>String, Courier::Models::NotificationContent::Block::Locale::NotificationContentHierarchy}, nil]
        optional :locales,
                 -> { Courier::Internal::Type::HashOf[union: Courier::NotificationContent::Block::Locale] },
                 nil?: true

        # @!method initialize(id:, type:, alias_: nil, checksum: nil, content: nil, context: nil, locales: nil)
        #   @param id [String]
        #   @param type [Symbol, Courier::Models::NotificationContent::Block::Type]
        #   @param alias_ [String, nil]
        #   @param checksum [String, nil]
        #   @param content [String, Courier::Models::NotificationContent::Block::Content::NotificationContentHierarchy, nil]
        #   @param context [String, nil]
        #   @param locales [Hash{Symbol=>String, Courier::Models::NotificationContent::Block::Locale::NotificationContentHierarchy}, nil]

        # @see Courier::Models::NotificationContent::Block#type
        module Type
          extend Courier::Internal::Type::Enum

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

        # @see Courier::Models::NotificationContent::Block#content
        module Content
          extend Courier::Internal::Type::Union

          variant String

          variant -> { Courier::NotificationContent::Block::Content::NotificationContentHierarchy }

          class NotificationContentHierarchy < Courier::Internal::Type::BaseModel
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
          #   @return [Array(String, Courier::Models::NotificationContent::Block::Content::NotificationContentHierarchy)]
        end

        module Locale
          extend Courier::Internal::Type::Union

          variant String

          variant -> { Courier::NotificationContent::Block::Locale::NotificationContentHierarchy }

          class NotificationContentHierarchy < Courier::Internal::Type::BaseModel
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
          #   @return [Array(String, Courier::Models::NotificationContent::Block::Locale::NotificationContentHierarchy)]
        end
      end

      class Channel < Courier::Internal::Type::BaseModel
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
        #   @return [Courier::Models::NotificationContent::Channel::Content, nil]
        optional :content, -> { Courier::NotificationContent::Channel::Content }, nil?: true

        # @!attribute locales
        #
        #   @return [Hash{Symbol=>Courier::Models::NotificationContent::Channel::Locale}, nil]
        optional :locales,
                 -> { Courier::Internal::Type::HashOf[Courier::NotificationContent::Channel::Locale] },
                 nil?: true

        # @!attribute type
        #
        #   @return [String, nil]
        optional :type, String, nil?: true

        # @!method initialize(id:, checksum: nil, content: nil, locales: nil, type: nil)
        #   @param id [String]
        #   @param checksum [String, nil]
        #   @param content [Courier::Models::NotificationContent::Channel::Content, nil]
        #   @param locales [Hash{Symbol=>Courier::Models::NotificationContent::Channel::Locale}, nil]
        #   @param type [String, nil]

        # @see Courier::Models::NotificationContent::Channel#content
        class Content < Courier::Internal::Type::BaseModel
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

        class Locale < Courier::Internal::Type::BaseModel
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
