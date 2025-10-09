# frozen_string_literal: true

module Trycourier
  module Models
    module Notifications
      # @see Trycourier::Resources::Notifications::Checks#list
      class CheckListParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!method initialize(id:, request_options: {})
        #   @param id [String]
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
