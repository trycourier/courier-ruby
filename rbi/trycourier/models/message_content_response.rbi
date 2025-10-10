# typed: strong

module Trycourier
  module Models
    class MessageContentResponse < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::Models::MessageContentResponse,
            Trycourier::Internal::AnyHash
          )
        end

      # An array of render output of a previously sent message.
      sig do
        returns(T::Array[Trycourier::Models::MessageContentResponse::Result])
      end
      attr_accessor :results

      sig do
        params(
          results:
            T::Array[Trycourier::Models::MessageContentResponse::Result::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # An array of render output of a previously sent message.
        results:
      )
      end

      sig do
        override.returns(
          {
            results:
              T::Array[Trycourier::Models::MessageContentResponse::Result]
          }
        )
      end
      def to_hash
      end

      class Result < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Models::MessageContentResponse::Result,
              Trycourier::Internal::AnyHash
            )
          end

        # The channel used for rendering the message.
        sig { returns(String) }
        attr_accessor :channel

        # The ID of channel used for rendering the message.
        sig { returns(String) }
        attr_accessor :channel_id

        # Content details of the rendered message.
        sig do
          returns(Trycourier::Models::MessageContentResponse::Result::Content)
        end
        attr_reader :content

        sig do
          params(
            content:
              Trycourier::Models::MessageContentResponse::Result::Content::OrHash
          ).void
        end
        attr_writer :content

        sig do
          params(
            channel: String,
            channel_id: String,
            content:
              Trycourier::Models::MessageContentResponse::Result::Content::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The channel used for rendering the message.
          channel:,
          # The ID of channel used for rendering the message.
          channel_id:,
          # Content details of the rendered message.
          content:
        )
        end

        sig do
          override.returns(
            {
              channel: String,
              channel_id: String,
              content:
                Trycourier::Models::MessageContentResponse::Result::Content
            }
          )
        end
        def to_hash
        end

        class Content < Trycourier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Trycourier::Models::MessageContentResponse::Result::Content,
                Trycourier::Internal::AnyHash
              )
            end

          # The blocks of the rendered message.
          sig do
            returns(
              T::Array[
                Trycourier::Models::MessageContentResponse::Result::Content::Block
              ]
            )
          end
          attr_accessor :blocks

          # The body of the rendered message.
          sig { returns(String) }
          attr_accessor :body

          # The html content of the rendered message.
          sig { returns(String) }
          attr_accessor :html

          # The subject of the rendered message.
          sig { returns(String) }
          attr_accessor :subject

          # The text of the rendered message.
          sig { returns(String) }
          attr_accessor :text

          # The title of the rendered message.
          sig { returns(String) }
          attr_accessor :title

          # Content details of the rendered message.
          sig do
            params(
              blocks:
                T::Array[
                  Trycourier::Models::MessageContentResponse::Result::Content::Block::OrHash
                ],
              body: String,
              html: String,
              subject: String,
              text: String,
              title: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The blocks of the rendered message.
            blocks:,
            # The body of the rendered message.
            body:,
            # The html content of the rendered message.
            html:,
            # The subject of the rendered message.
            subject:,
            # The text of the rendered message.
            text:,
            # The title of the rendered message.
            title:
          )
          end

          sig do
            override.returns(
              {
                blocks:
                  T::Array[
                    Trycourier::Models::MessageContentResponse::Result::Content::Block
                  ],
                body: String,
                html: String,
                subject: String,
                text: String,
                title: String
              }
            )
          end
          def to_hash
          end

          class Block < Trycourier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Trycourier::Models::MessageContentResponse::Result::Content::Block,
                  Trycourier::Internal::AnyHash
                )
              end

            # The block text of the rendered message block.
            sig { returns(String) }
            attr_accessor :text

            # The block type of the rendered message block.
            sig { returns(String) }
            attr_accessor :type

            sig { params(text: String, type: String).returns(T.attached_class) }
            def self.new(
              # The block text of the rendered message block.
              text:,
              # The block type of the rendered message block.
              type:
            )
            end

            sig { override.returns({ text: String, type: String }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
