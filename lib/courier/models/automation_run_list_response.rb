# frozen_string_literal: true

module Courier
  module Models
    class AutomationRunListResponse < Courier::Internal::Type::BaseModel
      # @!attribute runs
      #
      #   @return [Array<Courier::Models::AutomationRunListItem>]
      required :runs, -> { Courier::Internal::Type::ArrayOf[Courier::AutomationRunListItem] }

      # @!attribute next_cursor
      #   Pass back as `cursor` to fetch the next page. Absent on the last page.
      #
      #   @return [String, nil]
      optional :next_cursor, String

      # @!method initialize(runs:, next_cursor: nil)
      #   A page of Automation runs.
      #
      #   @param runs [Array<Courier::Models::AutomationRunListItem>]
      #
      #   @param next_cursor [String] Pass back as `cursor` to fetch the next page. Absent on the last page.
    end
  end
end
