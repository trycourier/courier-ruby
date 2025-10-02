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
                Courier::Tenants::ElementalNode::UnionMember0,
                Courier::Tenants::ElementalNode::UnionMember1,
                Courier::Tenants::ElementalNode::UnionMember2,
                Courier::Tenants::ElementalNode::UnionMember3,
                Courier::Tenants::ElementalNode::UnionMember4,
                Courier::Tenants::ElementalNode::UnionMember5,
                Courier::Tenants::ElementalNode::UnionMember6,
                Courier::Tenants::ElementalNode::UnionMember7
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
                  Courier::Tenants::ElementalNode::UnionMember0::OrHash,
                  Courier::Tenants::ElementalNode::UnionMember1::OrHash,
                  Courier::Tenants::ElementalNode::UnionMember2::OrHash,
                  Courier::Tenants::ElementalNode::UnionMember3::OrHash,
                  Courier::Tenants::ElementalNode::UnionMember4::OrHash,
                  Courier::Tenants::ElementalNode::UnionMember5::OrHash,
                  Courier::Tenants::ElementalNode::UnionMember6::OrHash,
                  Courier::Tenants::ElementalNode::UnionMember7::OrHash
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
                    Courier::Tenants::ElementalNode::UnionMember0,
                    Courier::Tenants::ElementalNode::UnionMember1,
                    Courier::Tenants::ElementalNode::UnionMember2,
                    Courier::Tenants::ElementalNode::UnionMember3,
                    Courier::Tenants::ElementalNode::UnionMember4,
                    Courier::Tenants::ElementalNode::UnionMember5,
                    Courier::Tenants::ElementalNode::UnionMember6,
                    Courier::Tenants::ElementalNode::UnionMember7
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
    end
  end
end
