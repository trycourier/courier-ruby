# typed: strong

module Courier
  module Models
    class JourneysListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneysListResponse, Courier::Internal::AnyHash)
        end

      # A cursor token for pagination. Present when there are more results available.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(T::Array[Courier::Journey])) }
      attr_reader :templates

      sig { params(templates: T::Array[Courier::Journey::OrHash]).void }
      attr_writer :templates

      sig do
        params(
          cursor: String,
          templates: T::Array[Courier::Journey::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # A cursor token for pagination. Present when there are more results available.
        cursor: nil,
        templates: nil
      )
      end

      sig do
        override.returns(
          { cursor: String, templates: T::Array[Courier::Journey] }
        )
      end
      def to_hash
      end
    end
  end
end
