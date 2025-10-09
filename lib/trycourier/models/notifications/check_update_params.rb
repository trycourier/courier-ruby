# frozen_string_literal: true

module Trycourier
  module Models
    module Notifications
      # @see Trycourier::Resources::Notifications::Checks#update
      class CheckUpdateParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute checks
        #
        #   @return [Array<Trycourier::Models::BaseCheck>]
        required :checks, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::BaseCheck] }

        # @!method initialize(id:, checks:, request_options: {})
        #   @param id [String]
        #   @param checks [Array<Trycourier::Models::BaseCheck>]
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
