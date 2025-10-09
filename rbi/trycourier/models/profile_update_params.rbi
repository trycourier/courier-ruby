# typed: strong

module Trycourier
  module Models
    class ProfileUpdateParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Trycourier::ProfileUpdateParams, Trycourier::Internal::AnyHash)
        end

      # List of patch operations to apply to the profile.
      sig { returns(T::Array[Trycourier::ProfileUpdateParams::Patch]) }
      attr_accessor :patch

      sig do
        params(
          patch: T::Array[Trycourier::ProfileUpdateParams::Patch::OrHash],
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # List of patch operations to apply to the profile.
        patch:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            patch: T::Array[Trycourier::ProfileUpdateParams::Patch],
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Patch < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::ProfileUpdateParams::Patch,
              Trycourier::Internal::AnyHash
            )
          end

        # The operation to perform.
        sig { returns(String) }
        attr_accessor :op

        # The JSON path specifying the part of the profile to operate on.
        sig { returns(String) }
        attr_accessor :path

        # The value for the operation.
        sig { returns(String) }
        attr_accessor :value

        sig do
          params(op: String, path: String, value: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # The operation to perform.
          op:,
          # The JSON path specifying the part of the profile to operate on.
          path:,
          # The value for the operation.
          value:
        )
        end

        sig { override.returns({ op: String, path: String, value: String }) }
        def to_hash
        end
      end
    end
  end
end
