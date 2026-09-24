# frozen_string_literal: true

module Courier
  module Models
    module Notifications
      module Previews
        # @see Courier::Resources::Notifications::Previews::Runs#retrieve
        class RunRetrieveParams < Courier::Internal::Type::BaseModel
          extend Courier::Internal::Type::RequestParameters::Converter
          include Courier::Internal::Type::RequestParameters

          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute preview_run_id
          #
          #   @return [String]
          required :preview_run_id, String

          # @!method initialize(id:, preview_run_id:, request_options: {})
          #   @param id [String]
          #   @param preview_run_id [String]
          #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
