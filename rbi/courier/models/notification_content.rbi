# typed: strong

module Courier
  module Models
    class NotificationContent < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::NotificationContent, Courier::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Array[Courier::NotificationContent::Block])) }
      attr_accessor :blocks

      sig do
        returns(T.nilable(T::Array[Courier::NotificationContent::Channel]))
      end
      attr_accessor :channels

      sig { returns(T.nilable(String)) }
      attr_accessor :checksum

      sig do
        params(
          blocks:
            T.nilable(T::Array[Courier::NotificationContent::Block::OrHash]),
          channels:
            T.nilable(T::Array[Courier::NotificationContent::Channel::OrHash]),
          checksum: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(blocks: nil, channels: nil, checksum: nil)
      end

      sig do
        override.returns(
          {
            blocks: T.nilable(T::Array[Courier::NotificationContent::Block]),
            channels:
              T.nilable(T::Array[Courier::NotificationContent::Channel]),
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
              Courier::NotificationContent::Block,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Courier::NotificationContent::Block::Type::TaggedSymbol) }
        attr_accessor :type

        sig { returns(T.nilable(String)) }
        attr_accessor :alias_

        sig { returns(T.nilable(String)) }
        attr_accessor :checksum

        sig do
          returns(
            T.nilable(Courier::NotificationContent::Block::Content::Variants)
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
                Courier::NotificationContent::Block::Locale::Variants
              ]
            )
          )
        end
        attr_accessor :locales

        sig do
          params(
            id: String,
            type: Courier::NotificationContent::Block::Type::OrSymbol,
            alias_: T.nilable(String),
            checksum: T.nilable(String),
            content:
              T.nilable(
                T.any(
                  String,
                  Courier::NotificationContent::Block::Content::NotificationContentHierarchy::OrHash
                )
              ),
            context: T.nilable(String),
            locales:
              T.nilable(
                T::Hash[
                  Symbol,
                  T.any(
                    String,
                    Courier::NotificationContent::Block::Locale::NotificationContentHierarchy::OrHash
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
              type: Courier::NotificationContent::Block::Type::TaggedSymbol,
              alias_: T.nilable(String),
              checksum: T.nilable(String),
              content:
                T.nilable(
                  Courier::NotificationContent::Block::Content::Variants
                ),
              context: T.nilable(String),
              locales:
                T.nilable(
                  T::Hash[
                    Symbol,
                    Courier::NotificationContent::Block::Locale::Variants
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
              T.all(Symbol, Courier::NotificationContent::Block::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTION =
            T.let(
              :action,
              Courier::NotificationContent::Block::Type::TaggedSymbol
            )
          DIVIDER =
            T.let(
              :divider,
              Courier::NotificationContent::Block::Type::TaggedSymbol
            )
          IMAGE =
            T.let(
              :image,
              Courier::NotificationContent::Block::Type::TaggedSymbol
            )
          JSONNET =
            T.let(
              :jsonnet,
              Courier::NotificationContent::Block::Type::TaggedSymbol
            )
          LIST =
            T.let(
              :list,
              Courier::NotificationContent::Block::Type::TaggedSymbol
            )
          MARKDOWN =
            T.let(
              :markdown,
              Courier::NotificationContent::Block::Type::TaggedSymbol
            )
          QUOTE =
            T.let(
              :quote,
              Courier::NotificationContent::Block::Type::TaggedSymbol
            )
          TEMPLATE =
            T.let(
              :template,
              Courier::NotificationContent::Block::Type::TaggedSymbol
            )
          TEXT =
            T.let(
              :text,
              Courier::NotificationContent::Block::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Courier::NotificationContent::Block::Type::TaggedSymbol]
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
                Courier::NotificationContent::Block::Content::NotificationContentHierarchy
              )
            end

          class NotificationContentHierarchy < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::NotificationContent::Block::Content::NotificationContentHierarchy,
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
              T::Array[Courier::NotificationContent::Block::Content::Variants]
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
                Courier::NotificationContent::Block::Locale::NotificationContentHierarchy
              )
            end

          class NotificationContentHierarchy < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::NotificationContent::Block::Locale::NotificationContentHierarchy,
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
              T::Array[Courier::NotificationContent::Block::Locale::Variants]
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
              Courier::NotificationContent::Channel,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.nilable(String)) }
        attr_accessor :checksum

        sig do
          returns(T.nilable(Courier::NotificationContent::Channel::Content))
        end
        attr_reader :content

        sig do
          params(
            content:
              T.nilable(Courier::NotificationContent::Channel::Content::OrHash)
          ).void
        end
        attr_writer :content

        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, Courier::NotificationContent::Channel::Locale]
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
              T.nilable(Courier::NotificationContent::Channel::Content::OrHash),
            locales:
              T.nilable(
                T::Hash[
                  Symbol,
                  Courier::NotificationContent::Channel::Locale::OrHash
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
                T.nilable(Courier::NotificationContent::Channel::Content),
              locales:
                T.nilable(
                  T::Hash[Symbol, Courier::NotificationContent::Channel::Locale]
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
                Courier::NotificationContent::Channel::Content,
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
                Courier::NotificationContent::Channel::Locale,
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
