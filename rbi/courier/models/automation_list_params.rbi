# typed: strong

module Courier
  module Models
    class AutomationListParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::AutomationListParams, Courier::Internal::AnyHash)
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
        returns(T.nilable(Courier::AutomationListParams::Version::OrSymbol))
      end
      attr_reader :version

      sig do
        params(version: Courier::AutomationListParams::Version::OrSymbol).void
      end
      attr_writer :version

      sig do
        params(
          cursor: String,
          version: Courier::AutomationListParams::Version::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
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
            version: Courier::AutomationListParams::Version::OrSymbol,
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The version of templates to retrieve. Accepted values are published (for
      # published templates) or draft (for draft templates). Defaults to published.
      module Version
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::AutomationListParams::Version) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PUBLISHED =
          T.let(
            :published,
            Courier::AutomationListParams::Version::TaggedSymbol
          )
        DRAFT =
          T.let(:draft, Courier::AutomationListParams::Version::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::AutomationListParams::Version::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
