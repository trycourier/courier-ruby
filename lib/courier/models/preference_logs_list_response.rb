# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::WorkspacePreferences#list_logs
    class PreferenceLogsListResponse < Courier::Internal::Type::BaseModel
      # @!attribute items
      #   One entry per preference change, newest first.
      #
      #   @return [Array<Courier::Models::PreferenceChangeLogEntry>]
      required :items, -> { Courier::Internal::Type::ArrayOf[Courier::PreferenceChangeLogEntry] }

      # @!attribute paging
      #
      #   @return [Courier::Models::Paging]
      required :paging, -> { Courier::Paging }

      # @!method initialize(items:, paging:)
      #   @param items [Array<Courier::Models::PreferenceChangeLogEntry>] One entry per preference change, newest first.
      #
      #   @param paging [Courier::Models::Paging]
    end
  end
end
