# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Lists#list
    class ListListParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute cursor
      #   A unique identifier that allows for fetching the next page of lists.
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!attribute pattern
      #   "A pattern used to filter the list items returned. Pattern types supported:
      #   exact match on `list_id` or a pattern of one or more pattern parts. you may
      #   replace a part with either: `*` to match all parts in that position, or `**` to
      #   signify a wildcard `endsWith` pattern match."
      #
      #   @return [String, nil]
      optional :pattern, String, nil?: true

      # @!method initialize(cursor: nil, pattern: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::ListListParams} for more details.
      #
      #   @param cursor [String, nil] A unique identifier that allows for fetching the next page of lists.
      #
      #   @param pattern [String, nil] "A pattern used to filter the list items returned. Pattern types supported: exac
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
