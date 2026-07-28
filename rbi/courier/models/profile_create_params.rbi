# typed: strong

module Courier
  module Models
    class ProfileCreateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::ProfileCreateParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :user_id

      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :profile

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig { returns(T.nilable(String)) }
      attr_reader :x_idempotency_expiration

      sig { params(x_idempotency_expiration: String).void }
      attr_writer :x_idempotency_expiration

      sig do
        params(
          user_id: String,
          profile: T::Hash[Symbol, T.anything],
          idempotency_key: String,
          x_idempotency_expiration: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        user_id:,
        profile:,
        idempotency_key: nil,
        x_idempotency_expiration: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            user_id: String,
            profile: T::Hash[Symbol, T.anything],
            idempotency_key: String,
            x_idempotency_expiration: String,
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
