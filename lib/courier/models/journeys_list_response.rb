# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Journeys#list
    class JourneysListResponse < Courier::Internal::Type::BaseModel
      # @!attribute cursor
      #   A cursor token for pagination. Present when there are more results available.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute templates
      #
      #   @return [Array<Courier::Models::Journey>, nil]
      optional :templates, -> { Courier::Internal::Type::ArrayOf[Courier::Journey] }

      # @!method initialize(cursor: nil, templates: nil)
      #   @param cursor [String] A cursor token for pagination. Present when there are more results available.
      #
      #   @param templates [Array<Courier::Models::Journey>]
    end
  end
end
