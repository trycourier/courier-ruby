# frozen_string_literal: true

module Trycourier
  module Models
    module Tenants
      # @see Trycourier::Resources::Tenants::Templates#list
      class TemplateListResponse < Trycourier::Internal::Type::BaseModel
        # @!attribute has_more
        #   Set to true when there are more pages that can be retrieved.
        #
        #   @return [Boolean]
        required :has_more, Trycourier::Internal::Type::Boolean

        # @!attribute type
        #   Always set to `list`. Represents the type of this object.
        #
        #   @return [Symbol, Trycourier::Models::Tenants::TemplateListResponse::Type]
        required :type, enum: -> { Trycourier::Models::Tenants::TemplateListResponse::Type }

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
        #   @return [Array<Trycourier::Models::Tenants::TemplateListResponse::Item>, nil]
        optional :items,
                 -> { Trycourier::Internal::Type::ArrayOf[Trycourier::Models::Tenants::TemplateListResponse::Item] },
                 nil?: true

        # @!attribute next_url
        #   A url that may be used to generate fetch the next set of results. Defined only
        #   when `has_more` is set to true
        #
        #   @return [String, nil]
        optional :next_url, String, nil?: true

        # @!method initialize(has_more:, type:, url:, cursor: nil, items: nil, next_url: nil)
        #   Some parameter documentations has been truncated, see
        #   {Trycourier::Models::Tenants::TemplateListResponse} for more details.
        #
        #   @param has_more [Boolean] Set to true when there are more pages that can be retrieved.
        #
        #   @param type [Symbol, Trycourier::Models::Tenants::TemplateListResponse::Type] Always set to `list`. Represents the type of this object.
        #
        #   @param url [String] A url that may be used to generate these results.
        #
        #   @param cursor [String, nil] A pointer to the next page of results. Defined
        #
        #   @param items [Array<Trycourier::Models::Tenants::TemplateListResponse::Item>, nil]
        #
        #   @param next_url [String, nil] A url that may be used to generate fetch the next set of results.

        # Always set to `list`. Represents the type of this object.
        #
        # @see Trycourier::Models::Tenants::TemplateListResponse#type
        module Type
          extend Trycourier::Internal::Type::Enum

          LIST = :list

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class Item < Trycourier::Models::BaseTemplateTenantAssociation
          # @!attribute data
          #   The template's data containing it's routing configs
          #
          #   @return [Trycourier::Models::Tenants::TemplateListResponse::Item::Data]
          required :data, -> { Trycourier::Models::Tenants::TemplateListResponse::Item::Data }

          # @!method initialize(data:)
          #   @param data [Trycourier::Models::Tenants::TemplateListResponse::Item::Data] The template's data containing it's routing configs

          class Data < Trycourier::Internal::Type::BaseModel
            # @!attribute routing
            #
            #   @return [Trycourier::Models::MessageRouting]
            required :routing, -> { Trycourier::MessageRouting }

            # @!method initialize(routing:)
            #   The template's data containing it's routing configs
            #
            #   @param routing [Trycourier::Models::MessageRouting]
          end
        end
      end
    end
  end
end
