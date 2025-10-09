# typed: strong

module Trycourier
  module Models
    class TenantListUsersResponse < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::Models::TenantListUsersResponse,
            Trycourier::Internal::AnyHash
          )
        end

      # Set to true when there are more pages that can be retrieved.
      sig { returns(T::Boolean) }
      attr_accessor :has_more

      # Always set to `list`. Represents the type of this object.
      sig do
        returns(Trycourier::Models::TenantListUsersResponse::Type::TaggedSymbol)
      end
      attr_accessor :type

      # A url that may be used to generate these results.
      sig { returns(String) }
      attr_accessor :url

      # A pointer to the next page of results. Defined only when `has_more` is set to
      # true
      sig { returns(T.nilable(String)) }
      attr_accessor :cursor

      sig { returns(T.nilable(T::Array[Trycourier::TenantAssociation])) }
      attr_accessor :items

      # A url that may be used to generate fetch the next set of results. Defined only
      # when `has_more` is set to true
      sig { returns(T.nilable(String)) }
      attr_accessor :next_url

      sig do
        params(
          has_more: T::Boolean,
          type: Trycourier::Models::TenantListUsersResponse::Type::OrSymbol,
          url: String,
          cursor: T.nilable(String),
          items: T.nilable(T::Array[Trycourier::TenantAssociation::OrHash]),
          next_url: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Set to true when there are more pages that can be retrieved.
        has_more:,
        # Always set to `list`. Represents the type of this object.
        type:,
        # A url that may be used to generate these results.
        url:,
        # A pointer to the next page of results. Defined only when `has_more` is set to
        # true
        cursor: nil,
        items: nil,
        # A url that may be used to generate fetch the next set of results. Defined only
        # when `has_more` is set to true
        next_url: nil
      )
      end

      sig do
        override.returns(
          {
            has_more: T::Boolean,
            type:
              Trycourier::Models::TenantListUsersResponse::Type::TaggedSymbol,
            url: String,
            cursor: T.nilable(String),
            items: T.nilable(T::Array[Trycourier::TenantAssociation]),
            next_url: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Always set to `list`. Represents the type of this object.
      module Type
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Trycourier::Models::TenantListUsersResponse::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LIST =
          T.let(
            :list,
            Trycourier::Models::TenantListUsersResponse::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Trycourier::Models::TenantListUsersResponse::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
