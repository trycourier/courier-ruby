# typed: strong

module Courier
  module Models
    # Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
    module Content
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::Content::ElementalContent,
            Courier::Content::ElementalContentSugar
          )
        end

      class ElementalContent < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Content::ElementalContent,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[
              T.any(
                Courier::ElementalNode::UnionMember0,
                Courier::ElementalNode::UnionMember1,
                Courier::ElementalNode::UnionMember2,
                Courier::ElementalNode::UnionMember3,
                Courier::ElementalNode::UnionMember4,
                Courier::ElementalNode::UnionMember5,
                Courier::ElementalNode::UnionMember6,
                Courier::ElementalNode::UnionMember7
              )
            ]
          )
        end
        attr_accessor :elements

        # For example, "2022-01-01"
        sig { returns(String) }
        attr_accessor :version

        sig { returns(T.nilable(T.anything)) }
        attr_reader :brand

        sig { params(brand: T.anything).void }
        attr_writer :brand

        sig do
          params(
            elements:
              T::Array[
                T.any(
                  Courier::ElementalNode::UnionMember0::OrHash,
                  Courier::ElementalNode::UnionMember1::OrHash,
                  Courier::ElementalNode::UnionMember2::OrHash,
                  Courier::ElementalNode::UnionMember3::OrHash,
                  Courier::ElementalNode::UnionMember4::OrHash,
                  Courier::ElementalNode::UnionMember5::OrHash,
                  Courier::ElementalNode::UnionMember6::OrHash,
                  Courier::ElementalNode::UnionMember7::OrHash
                )
              ],
            version: String,
            brand: T.anything
          ).returns(T.attached_class)
        end
        def self.new(
          elements:,
          # For example, "2022-01-01"
          version:,
          brand: nil
        )
        end

        sig do
          override.returns(
            {
              elements:
                T::Array[
                  T.any(
                    Courier::ElementalNode::UnionMember0,
                    Courier::ElementalNode::UnionMember1,
                    Courier::ElementalNode::UnionMember2,
                    Courier::ElementalNode::UnionMember3,
                    Courier::ElementalNode::UnionMember4,
                    Courier::ElementalNode::UnionMember5,
                    Courier::ElementalNode::UnionMember6,
                    Courier::ElementalNode::UnionMember7
                  )
                ],
              version: String,
              brand: T.anything
            }
          )
        end
        def to_hash
        end
      end

      class ElementalContentSugar < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Content::ElementalContentSugar,
              Courier::Internal::AnyHash
            )
          end

        # The text content displayed in the notification.
        sig { returns(String) }
        attr_accessor :body

        # The title to be displayed by supported channels i.e. push, email (as subject)
        sig { returns(String) }
        attr_accessor :title

        # Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
        sig { params(body: String, title: String).returns(T.attached_class) }
        def self.new(
          # The text content displayed in the notification.
          body:,
          # The title to be displayed by supported channels i.e. push, email (as subject)
          title:
        )
        end

        sig { override.returns({ body: String, title: String }) }
        def to_hash
        end
      end

      sig { override.returns(T::Array[Courier::Content::Variants]) }
      def self.variants
      end
    end
  end
end
