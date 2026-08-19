# frozen_string_literal: true

module Courier
  module Models
    class JourneyRunListResponse < Courier::Internal::Type::BaseModel
      # @!attribute runs
      #
      #   @return [Array<Courier::Models::JourneyRunListItem>]
      required :runs, -> { Courier::Internal::Type::ArrayOf[Courier::JourneyRunListItem] }

      # @!attribute next_cursor
      #   Pass back as `cursor` to fetch the next page. Absent on the last page.
      #
      #   @return [String, nil]
      optional :next_cursor, String

      # @!attribute prev_cursor
      #   Pass back as `cursor` to fetch the previous page. Absent on the first page.
      #
      #   @return [String, nil]
      optional :prev_cursor, String

      # @!method initialize(runs:, next_cursor: nil, prev_cursor: nil)
      #   A page of Journey runs.
      #
      #   @param runs [Array<Courier::Models::JourneyRunListItem>]
      #
      #   @param next_cursor [String] Pass back as `cursor` to fetch the next page. Absent on the last page.
      #
      #   @param prev_cursor [String] Pass back as `cursor` to fetch the previous page. Absent on the first page.
    end
  end
end
