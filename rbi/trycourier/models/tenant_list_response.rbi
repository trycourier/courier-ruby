# typed: strong

module Trycourier
  module Models
    class TenantListResponse < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::Models::TenantListResponse,
            Trycourier::Internal::AnyHash
          )
        end

      # Set to true when there are more pages that can be retrieved.
      sig { returns(T::Boolean) }
      attr_accessor :has_more

      # An array of Tenants
      sig { returns(T::Array[Trycourier::Tenant]) }
      attr_accessor :items

      # Always set to "list". Represents the type of this object.
      sig do
        returns(Trycourier::Models::TenantListResponse::Type::TaggedSymbol)
      end
      attr_accessor :type

      # A url that may be used to generate these results.
      sig { returns(String) }
      attr_accessor :url

      # A pointer to the next page of results. Defined only when has_more is set to
      # true.
      sig { returns(T.nilable(String)) }
      attr_accessor :cursor

      # A url that may be used to generate fetch the next set of results. Defined only
      # when has_more is set to true
      sig { returns(T.nilable(String)) }
      attr_accessor :next_url

      sig do
        params(
          has_more: T::Boolean,
          items: T::Array[Trycourier::Tenant::OrHash],
          type: Trycourier::Models::TenantListResponse::Type::OrSymbol,
          url: String,
          cursor: T.nilable(String),
          next_url: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Set to true when there are more pages that can be retrieved.
        has_more:,
        # An array of Tenants
        items:,
        # Always set to "list". Represents the type of this object.
        type:,
        # A url that may be used to generate these results.
        url:,
        # A pointer to the next page of results. Defined only when has_more is set to
        # true.
        cursor: nil,
        # A url that may be used to generate fetch the next set of results. Defined only
        # when has_more is set to true
        next_url: nil
      )
      end

      sig do
        override.returns(
          {
            has_more: T::Boolean,
            items: T::Array[Trycourier::Tenant],
            type: Trycourier::Models::TenantListResponse::Type::TaggedSymbol,
            url: String,
            cursor: T.nilable(String),
            next_url: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Always set to "list". Represents the type of this object.
      module Type
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Trycourier::Models::TenantListResponse::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LIST =
          T.let(
            :list,
            Trycourier::Models::TenantListResponse::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Trycourier::Models::TenantListResponse::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
