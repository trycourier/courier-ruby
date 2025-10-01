# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Tenants#list_users
    class TenantListUsersResponse < Courier::Internal::Type::BaseModel
      # @!attribute has_more
      #   Set to true when there are more pages that can be retrieved.
      #
      #   @return [Boolean]
      required :has_more, Courier::Internal::Type::Boolean

      # @!attribute type
      #   Always set to `list`. Represents the type of this object.
      #
      #   @return [Symbol, Courier::Models::TenantListUsersResponse::Type]
      required :type, enum: -> { Courier::Models::TenantListUsersResponse::Type }

      # @!attribute url
      #   A url that may be used to generate these results.
      #
      #   @return [String]
      required :url, String

      # @!attribute cursor
      #   A pointer to the next page of results. Defined only when `has_more` is set to
      #   true
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!attribute items
      #
      #   @return [Array<Courier::Models::Users::TenantAssociation>, nil]
      optional :items, -> { Courier::Internal::Type::ArrayOf[Courier::Users::TenantAssociation] }, nil?: true

      # @!attribute next_url
      #   A url that may be used to generate fetch the next set of results. Defined only
      #   when `has_more` is set to true
      #
      #   @return [String, nil]
      optional :next_url, String, nil?: true

      # @!method initialize(has_more:, type:, url:, cursor: nil, items: nil, next_url: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::TenantListUsersResponse} for more details.
      #
      #   @param has_more [Boolean] Set to true when there are more pages that can be retrieved.
      #
      #   @param type [Symbol, Courier::Models::TenantListUsersResponse::Type] Always set to `list`. Represents the type of this object.
      #
      #   @param url [String] A url that may be used to generate these results.
      #
      #   @param cursor [String, nil] A pointer to the next page of results. Defined
      #
      #   @param items [Array<Courier::Models::Users::TenantAssociation>, nil]
      #
      #   @param next_url [String, nil] A url that may be used to generate fetch the next set of results.

      # Always set to `list`. Represents the type of this object.
      #
      # @see Courier::Models::TenantListUsersResponse#type
      module Type
        extend Courier::Internal::Type::Enum

        LIST = :list

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
