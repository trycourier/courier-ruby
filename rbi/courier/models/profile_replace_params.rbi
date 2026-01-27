# typed: strong

module Courier
  module Models
    class ProfileReplaceParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::ProfileReplaceParams, Courier::Internal::AnyHash)
        end

      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :profile

      sig do
        params(
          profile: T::Hash[Symbol, T.anything],
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(profile:, request_options: {})
      end

      sig do
        override.returns(
          {
            profile: T::Hash[Symbol, T.anything],
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
