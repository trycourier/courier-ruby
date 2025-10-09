# frozen_string_literal: true

module Trycourier
  module Models
    module Notifications
      # @see Trycourier::Resources::Notifications::Draft#retrieve_content
      class DraftRetrieveContentParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!method initialize(request_options: {})
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
