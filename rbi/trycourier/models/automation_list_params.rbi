# typed: strong

module Trycourier
  module Models
    class AutomationListParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Trycourier::AutomationListParams, Trycourier::Internal::AnyHash)
        end

      # A cursor token for pagination. Use the cursor from the previous response to
      # fetch the next page of results.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # The version of templates to retrieve. Accepted values are published (for
      # published templates) or draft (for draft templates). Defaults to published.
      sig do
        returns(T.nilable(Trycourier::AutomationListParams::Version::OrSymbol))
      end
      attr_reader :version

      sig do
        params(
          version: Trycourier::AutomationListParams::Version::OrSymbol
        ).void
      end
      attr_writer :version

      sig do
        params(
          cursor: String,
          version: Trycourier::AutomationListParams::Version::OrSymbol,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A cursor token for pagination. Use the cursor from the previous response to
        # fetch the next page of results.
        cursor: nil,
        # The version of templates to retrieve. Accepted values are published (for
        # published templates) or draft (for draft templates). Defaults to published.
        version: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            version: Trycourier::AutomationListParams::Version::OrSymbol,
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The version of templates to retrieve. Accepted values are published (for
      # published templates) or draft (for draft templates). Defaults to published.
      module Version
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Trycourier::AutomationListParams::Version)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PUBLISHED =
          T.let(
            :published,
            Trycourier::AutomationListParams::Version::TaggedSymbol
          )
        DRAFT =
          T.let(:draft, Trycourier::AutomationListParams::Version::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::AutomationListParams::Version::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
