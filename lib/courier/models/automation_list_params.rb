# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Automations#list
    class AutomationListParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

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
      #   @return [Symbol, Courier::Models::AutomationListParams::Version, nil]
      optional :version, enum: -> { Courier::AutomationListParams::Version }

      # @!method initialize(cursor: nil, version: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::AutomationListParams} for more details.
      #
      #   @param cursor [String] A cursor token for pagination. Use the cursor from the previous response to fetc
      #
      #   @param version [Symbol, Courier::Models::AutomationListParams::Version] The version of templates to retrieve. Accepted values are published (for publish
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

      # The version of templates to retrieve. Accepted values are published (for
      # published templates) or draft (for draft templates). Defaults to published.
      module Version
        extend Courier::Internal::Type::Enum

        PUBLISHED = :published
        DRAFT = :draft

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
