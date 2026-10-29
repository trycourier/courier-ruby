# typed: strong

module Courier
  module Models
    class ProviderPatchParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::ProviderPatchParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # Operations to apply, in order. Paths address the provider as it is returned:
      # `/title`, `/alias`, `/provider`, and `/settings/<key>` with the snake_case
      # setting keys, including nested paths such as `/settings/rate_limit/rate`. If any
      # operation fails, for example a `test`, nothing is saved and the request returns
      # a 400. The result can't change `provider`, remove `title`, or add other
      # top-level fields. Removing `/alias` clears it.
      sig { returns(T::Array[Courier::ProviderPatchParams::Patch]) }
      attr_accessor :patch

      sig do
        params(
          id: String,
          patch: T::Array[Courier::ProviderPatchParams::Patch::OrHash],
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Operations to apply, in order. Paths address the provider as it is returned:
        # `/title`, `/alias`, `/provider`, and `/settings/<key>` with the snake_case
        # setting keys, including nested paths such as `/settings/rate_limit/rate`. If any
        # operation fails, for example a `test`, nothing is saved and the request returns
        # a 400. The result can't change `provider`, remove `title`, or add other
        # top-level fields. Removing `/alias` clears it.
        patch:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            patch: T::Array[Courier::ProviderPatchParams::Patch],
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Patch < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::ProviderPatchParams::Patch,
              Courier::Internal::AnyHash
            )
          end

        # The operation to perform.
        sig { returns(Courier::ProviderPatchParams::Patch::Op::OrSymbol) }
        attr_accessor :op

        # JSON Pointer to the field to operate on, such as `/settings/api_key`.
        sig { returns(String) }
        attr_accessor :path

        # JSON Pointer to the source field for `move` and `copy`.
        sig { returns(T.nilable(String)) }
        attr_reader :from

        sig { params(from: String).void }
        attr_writer :from

        # The value for `add`, `replace` and `test`. Any JSON value.
        sig { returns(T.nilable(T.anything)) }
        attr_reader :value

        sig { params(value: T.anything).void }
        attr_writer :value

        # One JSON Patch (RFC 6902) operation.
        sig do
          params(
            op: Courier::ProviderPatchParams::Patch::Op::OrSymbol,
            path: String,
            from: String,
            value: T.anything
          ).returns(T.attached_class)
        end
        def self.new(
          # The operation to perform.
          op:,
          # JSON Pointer to the field to operate on, such as `/settings/api_key`.
          path:,
          # JSON Pointer to the source field for `move` and `copy`.
          from: nil,
          # The value for `add`, `replace` and `test`. Any JSON value.
          value: nil
        )
        end

        sig do
          override.returns(
            {
              op: Courier::ProviderPatchParams::Patch::Op::OrSymbol,
              path: String,
              from: String,
              value: T.anything
            }
          )
        end
        def to_hash
        end

        # The operation to perform.
        module Op
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::ProviderPatchParams::Patch::Op)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ADD =
            T.let(:add, Courier::ProviderPatchParams::Patch::Op::TaggedSymbol)
          REMOVE =
            T.let(
              :remove,
              Courier::ProviderPatchParams::Patch::Op::TaggedSymbol
            )
          REPLACE =
            T.let(
              :replace,
              Courier::ProviderPatchParams::Patch::Op::TaggedSymbol
            )
          MOVE =
            T.let(:move, Courier::ProviderPatchParams::Patch::Op::TaggedSymbol)
          COPY =
            T.let(:copy, Courier::ProviderPatchParams::Patch::Op::TaggedSymbol)
          TEST =
            T.let(:test, Courier::ProviderPatchParams::Patch::Op::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Courier::ProviderPatchParams::Patch::Op::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
