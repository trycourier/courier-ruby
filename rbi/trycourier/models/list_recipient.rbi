# typed: strong

module Trycourier
  module Models
    class ListRecipient < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::ListRecipient, Trycourier::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :data

      sig { returns(T.nilable(T::Array[Trycourier::ListFilter])) }
      attr_accessor :filters

      sig { returns(T.nilable(String)) }
      attr_accessor :list_id

      # Send to all users in a specific list
      sig do
        params(
          data: T.nilable(T::Hash[Symbol, T.anything]),
          filters: T.nilable(T::Array[Trycourier::ListFilter::OrHash]),
          list_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(data: nil, filters: nil, list_id: nil)
      end

      sig do
        override.returns(
          {
            data: T.nilable(T::Hash[Symbol, T.anything]),
            filters: T.nilable(T::Array[Trycourier::ListFilter]),
            list_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
