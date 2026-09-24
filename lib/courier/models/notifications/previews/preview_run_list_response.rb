# frozen_string_literal: true

module Courier
  module Models
    module Notifications
      module Previews
        # @see Courier::Resources::Notifications::Previews::Runs#list
        class PreviewRunListResponse < Courier::Internal::Type::BaseModel
          # @!attribute paging
          #
          #   @return [Courier::Models::Paging]
          required :paging, -> { Courier::Paging }

          # @!attribute results
          #
          #   @return [Array<Courier::Models::Notifications::Previews::PreviewRun>]
          required :results, -> { Courier::Internal::Type::ArrayOf[Courier::Notifications::Previews::PreviewRun] }

          # @!method initialize(paging:, results:)
          #   Paginated list of preview runs, newest first.
          #
          #   @param paging [Courier::Models::Paging]
          #   @param results [Array<Courier::Models::Notifications::Previews::PreviewRun>]
        end
      end

      PreviewRunListResponse = Previews::PreviewRunListResponse
    end
  end
end
