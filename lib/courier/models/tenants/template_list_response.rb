# frozen_string_literal: true

module Courier
  module Models
    module Tenants
      # @see Courier::Resources::Tenants::Templates#list
      class TemplateListResponse < Courier::Internal::Type::BaseModel
        # @!attribute has_more
        #   Set to true when there are more pages that can be retrieved.
        #
        #   @return [Boolean]
        required :has_more, Courier::Internal::Type::Boolean

        # @!attribute type
        #   Always set to `list`. Represents the type of this object.
        #
        #   @return [Symbol, Courier::Models::Tenants::TemplateListResponse::Type]
        required :type, enum: -> { Courier::Models::Tenants::TemplateListResponse::Type }

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
        #   @return [Array<Courier::Models::Tenants::TemplateListResponse::Item>, nil]
        optional :items,
                 -> { Courier::Internal::Type::ArrayOf[Courier::Models::Tenants::TemplateListResponse::Item] },
                 nil?: true

        # @!attribute next_url
        #   A url that may be used to generate fetch the next set of results. Defined only
        #   when `has_more` is set to true
        #
        #   @return [String, nil]
        optional :next_url, String, nil?: true

        # @!method initialize(has_more:, type:, url:, cursor: nil, items: nil, next_url: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::Tenants::TemplateListResponse} for more details.
        #
        #   @param has_more [Boolean] Set to true when there are more pages that can be retrieved.
        #
        #   @param type [Symbol, Courier::Models::Tenants::TemplateListResponse::Type] Always set to `list`. Represents the type of this object.
        #
        #   @param url [String] A url that may be used to generate these results.
        #
        #   @param cursor [String, nil] A pointer to the next page of results. Defined
        #
        #   @param items [Array<Courier::Models::Tenants::TemplateListResponse::Item>, nil]
        #
        #   @param next_url [String, nil] A url that may be used to generate fetch the next set of results.

        # Always set to `list`. Represents the type of this object.
        #
        # @see Courier::Models::Tenants::TemplateListResponse#type
        module Type
          extend Courier::Internal::Type::Enum

          LIST = :list

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class Item < Courier::Models::Tenants::BaseTemplateTenantAssociation
          # @!attribute data
          #   The template's data containing it's routing configs
          #
          #   @return [Courier::Models::Tenants::TemplateListResponse::Item::Data]
          required :data, -> { Courier::Models::Tenants::TemplateListResponse::Item::Data }

          # @!method initialize(data:)
          #   @param data [Courier::Models::Tenants::TemplateListResponse::Item::Data] The template's data containing it's routing configs

          class Data < Courier::Internal::Type::BaseModel
            # @!attribute routing
            #
            #   @return [Courier::Models::MessageRouting]
            required :routing, -> { Courier::MessageRouting }

            # @!method initialize(routing:)
            #   The template's data containing it's routing configs
            #
            #   @param routing [Courier::Models::MessageRouting]
          end
        end
      end
    end
  end
end
