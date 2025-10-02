# typed: strong

module Courier
  module Models
    module Tenants
      class ElementalGroupNode < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Tenants::ElementalGroupNode,
              Courier::Internal::AnyHash
            )
          end

        # Sub elements to render.
        sig { returns(T::Array[Courier::Tenants::ElementalNode]) }
        attr_accessor :elements

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :channels

        sig { returns(T.nilable(String)) }
        attr_accessor :if_

        sig { returns(T.nilable(String)) }
        attr_accessor :loop_

        sig { returns(T.nilable(String)) }
        attr_accessor :ref

        sig do
          params(
            elements: T::Array[Courier::Tenants::ElementalNode],
            channels: T.nilable(T::Array[String]),
            if_: T.nilable(String),
            loop_: T.nilable(String),
            ref: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Sub elements to render.
          elements:,
          channels: nil,
          if_: nil,
          loop_: nil,
          ref: nil
        )
        end

        sig do
          override.returns(
            {
              elements: T::Array[Courier::Tenants::ElementalNode],
              channels: T.nilable(T::Array[String]),
              if_: T.nilable(String),
              loop_: T.nilable(String),
              ref: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
