# typed: strong

module Trycourier
  module Models
    class ProfileCreateParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Trycourier::ProfileCreateParams, Trycourier::Internal::AnyHash)
        end

      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :profile

      sig do
        params(
          profile: T::Hash[Symbol, T.anything],
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(profile:, request_options: {})
      end

      sig do
        override.returns(
          {
            profile: T::Hash[Symbol, T.anything],
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
