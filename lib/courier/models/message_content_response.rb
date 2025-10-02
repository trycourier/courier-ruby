# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Messages#content
    class MessageContentResponse < Courier::Internal::Type::BaseModel
      # @!attribute results
      #   An array of render output of a previously sent message.
      #
      #   @return [Array<Courier::Models::MessageContentResponse::Result>]
      required :results,
               -> { Courier::Internal::Type::ArrayOf[Courier::Models::MessageContentResponse::Result] }

      # @!method initialize(results:)
      #   @param results [Array<Courier::Models::MessageContentResponse::Result>] An array of render output of a previously sent message.

      class Result < Courier::Internal::Type::BaseModel
        # @!attribute channel
        #   The channel used for rendering the message.
        #
        #   @return [String]
        required :channel, String

        # @!attribute channel_id
        #   The ID of channel used for rendering the message.
        #
        #   @return [String]
        required :channel_id, String

        # @!attribute content
        #   Content details of the rendered message.
        #
        #   @return [Courier::Models::MessageContentResponse::Result::Content]
        required :content, -> { Courier::Models::MessageContentResponse::Result::Content }

        # @!method initialize(channel:, channel_id:, content:)
        #   @param channel [String] The channel used for rendering the message.
        #
        #   @param channel_id [String] The ID of channel used for rendering the message.
        #
        #   @param content [Courier::Models::MessageContentResponse::Result::Content] Content details of the rendered message.

        # @see Courier::Models::MessageContentResponse::Result#content
        class Content < Courier::Internal::Type::BaseModel
          # @!attribute blocks
          #   The blocks of the rendered message.
          #
          #   @return [Array<Courier::Models::MessageContentResponse::Result::Content::Block>]
          required :blocks,
                   -> { Courier::Internal::Type::ArrayOf[Courier::Models::MessageContentResponse::Result::Content::Block] }

          # @!attribute body
          #   The body of the rendered message.
          #
          #   @return [String]
          required :body, String

          # @!attribute html
          #   The html content of the rendered message.
          #
          #   @return [String]
          required :html, String

          # @!attribute subject
          #   The subject of the rendered message.
          #
          #   @return [String]
          required :subject, String

          # @!attribute text
          #   The text of the rendered message.
          #
          #   @return [String]
          required :text, String

          # @!attribute title
          #   The title of the rendered message.
          #
          #   @return [String]
          required :title, String

          # @!method initialize(blocks:, body:, html:, subject:, text:, title:)
          #   Content details of the rendered message.
          #
          #   @param blocks [Array<Courier::Models::MessageContentResponse::Result::Content::Block>] The blocks of the rendered message.
          #
          #   @param body [String] The body of the rendered message.
          #
          #   @param html [String] The html content of the rendered message.
          #
          #   @param subject [String] The subject of the rendered message.
          #
          #   @param text [String] The text of the rendered message.
          #
          #   @param title [String] The title of the rendered message.

          class Block < Courier::Internal::Type::BaseModel
            # @!attribute text
            #   The block text of the rendered message block.
            #
            #   @return [String]
            required :text, String

            # @!attribute type
            #   The block type of the rendered message block.
            #
            #   @return [String]
            required :type, String

            # @!method initialize(text:, type:)
            #   @param text [String] The block text of the rendered message block.
            #
            #   @param type [String] The block type of the rendered message block.
          end
        end
      end
    end
  end
end
