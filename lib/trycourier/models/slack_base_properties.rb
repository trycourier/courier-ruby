# frozen_string_literal: true

module Trycourier
  module Models
    class SlackBaseProperties < Trycourier::Internal::Type::BaseModel
      # @!attribute access_token
      #
      #   @return [String]
      required :access_token, String

      # @!method initialize(access_token:)
      #   @param access_token [String]
    end
  end
end
