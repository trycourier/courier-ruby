# typed: strong

module Courier
  module Models
    class NotificationGetContent < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::NotificationGetContent, Courier::Internal::AnyHash)
        end

      sig do
        returns(T.nilable(T::Array[Courier::NotificationGetContent::Block]))
      end
      attr_accessor :blocks

      sig do
        returns(T.nilable(T::Array[Courier::NotificationGetContent::Channel]))
      end
      attr_accessor :channels

      sig { returns(T.nilable(String)) }
      attr_accessor :checksum

      sig do
        params(
          blocks:
            T.nilable(T::Array[Courier::NotificationGetContent::Block::OrHash]),
          channels:
            T.nilable(
              T::Array[Courier::NotificationGetContent::Channel::OrHash]
            ),
          checksum: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(blocks: nil, channels: nil, checksum: nil)
      end

      sig do
        override.returns(
          {
            blocks: T.nilable(T::Array[Courier::NotificationGetContent::Block]),
            channels:
              T.nilable(T::Array[Courier::NotificationGetContent::Channel]),
            checksum: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Block < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::NotificationGetContent::Block,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(Courier::NotificationGetContent::Block::Type::TaggedSymbol)
        end
        attr_accessor :type

        sig { returns(T.nilable(String)) }
        attr_accessor :alias_

        sig { returns(T.nilable(String)) }
        attr_accessor :checksum

        sig do
          returns(
            T.nilable(Courier::NotificationGetContent::Block::Content::Variants)
          )
        end
        attr_accessor :content

        sig { returns(T.nilable(String)) }
        attr_accessor :context

        sig do
          returns(
            T.nilable(
              T::Hash[
                Symbol,
                Courier::NotificationGetContent::Block::Locale::Variants
              ]
            )
          )
        end
        attr_accessor :locales

        sig do
          params(
            id: String,
            type: Courier::NotificationGetContent::Block::Type::OrSymbol,
            alias_: T.nilable(String),
            checksum: T.nilable(String),
            content:
              T.nilable(
                T.any(
                  String,
                  Courier::NotificationGetContent::Block::Content::NotificationContentHierarchy::OrHash
                )
              ),
            context: T.nilable(String),
            locales:
              T.nilable(
                T::Hash[
                  Symbol,
                  T.any(
                    String,
                    Courier::NotificationGetContent::Block::Locale::NotificationContentHierarchy::OrHash
                  )
                ]
              )
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          type:,
          alias_: nil,
          checksum: nil,
          content: nil,
          context: nil,
          locales: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              type: Courier::NotificationGetContent::Block::Type::TaggedSymbol,
              alias_: T.nilable(String),
              checksum: T.nilable(String),
              content:
                T.nilable(
                  Courier::NotificationGetContent::Block::Content::Variants
                ),
              context: T.nilable(String),
              locales:
                T.nilable(
                  T::Hash[
                    Symbol,
                    Courier::NotificationGetContent::Block::Locale::Variants
                  ]
                )
            }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::NotificationGetContent::Block::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTION =
            T.let(
              :action,
              Courier::NotificationGetContent::Block::Type::TaggedSymbol
            )
          DIVIDER =
            T.let(
              :divider,
              Courier::NotificationGetContent::Block::Type::TaggedSymbol
            )
          IMAGE =
            T.let(
              :image,
              Courier::NotificationGetContent::Block::Type::TaggedSymbol
            )
          JSONNET =
            T.let(
              :jsonnet,
              Courier::NotificationGetContent::Block::Type::TaggedSymbol
            )
          LIST =
            T.let(
              :list,
              Courier::NotificationGetContent::Block::Type::TaggedSymbol
            )
          MARKDOWN =
            T.let(
              :markdown,
              Courier::NotificationGetContent::Block::Type::TaggedSymbol
            )
          QUOTE =
            T.let(
              :quote,
              Courier::NotificationGetContent::Block::Type::TaggedSymbol
            )
          TEMPLATE =
            T.let(
              :template,
              Courier::NotificationGetContent::Block::Type::TaggedSymbol
            )
          TEXT =
            T.let(
              :text,
              Courier::NotificationGetContent::Block::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::NotificationGetContent::Block::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Content
          extend Courier::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                Courier::NotificationGetContent::Block::Content::NotificationContentHierarchy
              )
            end

          class NotificationContentHierarchy < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::NotificationGetContent::Block::Content::NotificationContentHierarchy,
                  Courier::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_accessor :children

            sig { returns(T.nilable(String)) }
            attr_accessor :parent

            sig do
              params(
                children: T.nilable(String),
                parent: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(children: nil, parent: nil)
            end

            sig do
              override.returns(
                { children: T.nilable(String), parent: T.nilable(String) }
              )
            end
            def to_hash
            end
          end

          sig do
            override.returns(
              T::Array[
                Courier::NotificationGetContent::Block::Content::Variants
              ]
            )
          end
          def self.variants
          end
        end

        module Locale
          extend Courier::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                Courier::NotificationGetContent::Block::Locale::NotificationContentHierarchy
              )
            end

          class NotificationContentHierarchy < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::NotificationGetContent::Block::Locale::NotificationContentHierarchy,
                  Courier::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_accessor :children

            sig { returns(T.nilable(String)) }
            attr_accessor :parent

            sig do
              params(
                children: T.nilable(String),
                parent: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(children: nil, parent: nil)
            end

            sig do
              override.returns(
                { children: T.nilable(String), parent: T.nilable(String) }
              )
            end
            def to_hash
            end
          end

          sig do
            override.returns(
              T::Array[Courier::NotificationGetContent::Block::Locale::Variants]
            )
          end
          def self.variants
          end
        end
      end

      class Channel < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::NotificationGetContent::Channel,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.nilable(String)) }
        attr_accessor :checksum

        sig do
          returns(T.nilable(Courier::NotificationGetContent::Channel::Content))
        end
        attr_reader :content

        sig do
          params(
            content:
              T.nilable(
                Courier::NotificationGetContent::Channel::Content::OrHash
              )
          ).void
        end
        attr_writer :content

        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, Courier::NotificationGetContent::Channel::Locale]
            )
          )
        end
        attr_accessor :locales

        sig { returns(T.nilable(String)) }
        attr_accessor :type

        sig do
          params(
            id: String,
            checksum: T.nilable(String),
            content:
              T.nilable(
                Courier::NotificationGetContent::Channel::Content::OrHash
              ),
            locales:
              T.nilable(
                T::Hash[
                  Symbol,
                  Courier::NotificationGetContent::Channel::Locale::OrHash
                ]
              ),
            type: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(id:, checksum: nil, content: nil, locales: nil, type: nil)
        end

        sig do
          override.returns(
            {
              id: String,
              checksum: T.nilable(String),
              content:
                T.nilable(Courier::NotificationGetContent::Channel::Content),
              locales:
                T.nilable(
                  T::Hash[
                    Symbol,
                    Courier::NotificationGetContent::Channel::Locale
                  ]
                ),
              type: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        class Content < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::NotificationGetContent::Channel::Content,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :subject

          sig { returns(T.nilable(String)) }
          attr_accessor :title

          sig do
            params(
              subject: T.nilable(String),
              title: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(subject: nil, title: nil)
          end

          sig do
            override.returns(
              { subject: T.nilable(String), title: T.nilable(String) }
            )
          end
          def to_hash
          end
        end

        class Locale < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::NotificationGetContent::Channel::Locale,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :subject

          sig { returns(T.nilable(String)) }
          attr_accessor :title

          sig do
            params(
              subject: T.nilable(String),
              title: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(subject: nil, title: nil)
          end

          sig do
            override.returns(
              { subject: T.nilable(String), title: T.nilable(String) }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
