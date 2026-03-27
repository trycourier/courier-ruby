# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#list_versions
    class NotificationTemplateVersionListResponse < Courier::Internal::Type::BaseModel
      # @!attribute paging
      #
      #   @return [Courier::Models::Paging]
      required :paging, -> { Courier::Paging }

      # @!attribute versions
      #
      #   @return [Array<Courier::Models::VersionNode>]
      required :versions, -> { Courier::Internal::Type::ArrayOf[Courier::VersionNode] }

      # @!method initialize(paging:, versions:)
      #   @param paging [Courier::Models::Paging]
      #   @param versions [Array<Courier::Models::VersionNode>]
    end
  end
end
