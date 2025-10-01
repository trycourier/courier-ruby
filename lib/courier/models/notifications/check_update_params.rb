# frozen_string_literal: true

module Courier
  module Models
    module Notifications
      # @see Courier::Resources::Notifications::Checks#update
      class CheckUpdateParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute checks
        #
        #   @return [Array<Courier::Models::Notifications::BaseCheck>]
        required :checks, -> { Courier::Internal::Type::ArrayOf[Courier::Notifications::BaseCheck] }

        # @!method initialize(id:, checks:, request_options: {})
        #   @param id [String]
        #   @param checks [Array<Courier::Models::Notifications::BaseCheck>]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
