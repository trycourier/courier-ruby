# typed: strong

module Courier
  module Models
    module Tenants
      class ElementalContent < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Tenants::ElementalContent,
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
                Courier::ElementalNode::UnionMember6
              )
            ]
          )
        end
        attr_accessor :elements

        # For example, "2022-01-01"
        sig { returns(String) }
        attr_accessor :version

        sig { returns(T.nilable(String)) }
        attr_accessor :brand

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
                  Courier::ElementalNode::UnionMember6::OrHash
                )
              ],
            version: String,
            brand: T.nilable(String)
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
                    Courier::ElementalNode::UnionMember6
                  )
                ],
              version: String,
              brand: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
