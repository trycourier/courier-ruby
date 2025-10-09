# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      # @see Trycourier::Resources::Users::Tokens#delete
      class TokenDeleteParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!method initialize(user_id:, request_options: {})
        #   @param user_id [String]
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
