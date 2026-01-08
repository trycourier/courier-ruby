# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Automations#list
    class AutomationListParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute cursor
      #   A cursor token for pagination. Use the cursor from the previous response to
      #   fetch the next page of results.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute version
      #   The version of templates to retrieve. Accepted values are published (for
      #   published templates) or draft (for draft templates). Defaults to published.
      #
      #   @return [Symbol, Trycourier::Models::AutomationListParams::Version, nil]
      optional :version, enum: -> { Trycourier::AutomationListParams::Version }

      # @!method initialize(cursor: nil, version: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::AutomationListParams} for more details.
      #
      #   @param cursor [String] A cursor token for pagination. Use the cursor from the previous response to fetc
      #
      #   @param version [Symbol, Trycourier::Models::AutomationListParams::Version] The version of templates to retrieve. Accepted values are published (for publish
      #
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]

      # The version of templates to retrieve. Accepted values are published (for
      # published templates) or draft (for draft templates). Defaults to published.
      module Version
        extend Trycourier::Internal::Type::Enum

        PUBLISHED = :published
        DRAFT = :draft

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
