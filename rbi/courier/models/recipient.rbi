# typed: strong

module Courier
  module Models
    module Recipient
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(Courier::UserRecipient, Courier::Recipient::ListRecipient)
        end

      class ListRecipient < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::Recipient::ListRecipient, Courier::Internal::AnyHash)
          end

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :data

        sig { returns(T.nilable(String)) }
        attr_accessor :list_id

        sig do
          params(
            data: T.nilable(T::Hash[Symbol, T.anything]),
            list_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(data: nil, list_id: nil)
        end

        sig do
          override.returns(
            {
              data: T.nilable(T::Hash[Symbol, T.anything]),
              list_id: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      sig { override.returns(T::Array[Courier::Recipient::Variants]) }
      def self.variants
      end
    end
  end
end
