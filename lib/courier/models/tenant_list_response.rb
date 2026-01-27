# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Tenants#list
    class TenantListResponse < Courier::Internal::Type::BaseModel
      # @!attribute has_more
      #   Set to true when there are more pages that can be retrieved.
      #
      #   @return [Boolean]
      required :has_more, Courier::Internal::Type::Boolean

      # @!attribute items
      #   An array of Tenants
      #
      #   @return [Array<Courier::Models::Tenant>]
      required :items, -> { Courier::Internal::Type::ArrayOf[Courier::Tenant] }

      # @!attribute type
      #   Always set to "list". Represents the type of this object.
      #
      #   @return [Symbol, Courier::Models::TenantListResponse::Type]
      required :type, enum: -> { Courier::Models::TenantListResponse::Type }

      # @!attribute url
      #   A url that may be used to generate these results.
      #
      #   @return [String]
      required :url, String

      # @!attribute cursor
      #   A pointer to the next page of results. Defined only when has_more is set to
      #   true.
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!attribute next_url
      #   A url that may be used to generate fetch the next set of results. Defined only
      #   when has_more is set to true
      #
      #   @return [String, nil]
      optional :next_url, String, nil?: true

      # @!method initialize(has_more:, items:, type:, url:, cursor: nil, next_url: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::TenantListResponse} for more details.
      #
      #   @param has_more [Boolean] Set to true when there are more pages that can be retrieved.
      #
      #   @param items [Array<Courier::Models::Tenant>] An array of Tenants
      #
      #   @param type [Symbol, Courier::Models::TenantListResponse::Type] Always set to "list". Represents the type of this object.
      #
      #   @param url [String] A url that may be used to generate these results.
      #
      #   @param cursor [String, nil] A pointer to the next page of results. Defined only when has_more is set to true
      #
      #   @param next_url [String, nil] A url that may be used to generate fetch the next set of results.

      # Always set to "list". Represents the type of this object.
      #
      # @see Courier::Models::TenantListResponse#type
      module Type
        extend Courier::Internal::Type::Enum

        LIST = :list

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
