# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      # @see Trycourier::Resources::Users::Tenants#list
      class TenantListResponse < Trycourier::Internal::Type::BaseModel
        # @!attribute has_more
        #   Set to true when there are more pages that can be retrieved.
        #
        #   @return [Boolean]
        required :has_more, Trycourier::Internal::Type::Boolean

        # @!attribute type
        #   Always set to `list`. Represents the type of this object.
        #
        #   @return [Symbol, Trycourier::Models::Users::TenantListResponse::Type]
        required :type, enum: -> { Trycourier::Models::Users::TenantListResponse::Type }

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
        #   @return [Array<Trycourier::Models::TenantAssociation>, nil]
        optional :items, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::TenantAssociation] }, nil?: true

        # @!attribute next_url
        #   A url that may be used to generate fetch the next set of results. Defined only
        #   when `has_more` is set to true
        #
        #   @return [String, nil]
        optional :next_url, String, nil?: true

        # @!method initialize(has_more:, type:, url:, cursor: nil, items: nil, next_url: nil)
        #   Some parameter documentations has been truncated, see
        #   {Trycourier::Models::Users::TenantListResponse} for more details.
        #
        #   @param has_more [Boolean] Set to true when there are more pages that can be retrieved.
        #
        #   @param type [Symbol, Trycourier::Models::Users::TenantListResponse::Type] Always set to `list`. Represents the type of this object.
        #
        #   @param url [String] A url that may be used to generate these results.
        #
        #   @param cursor [String, nil] A pointer to the next page of results. Defined
        #
        #   @param items [Array<Trycourier::Models::TenantAssociation>, nil]
        #
        #   @param next_url [String, nil] A url that may be used to generate fetch the next set of results.

        # Always set to `list`. Represents the type of this object.
        #
        # @see Trycourier::Models::Users::TenantListResponse#type
        module Type
          extend Trycourier::Internal::Type::Enum

          LIST = :list

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
