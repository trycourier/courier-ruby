# frozen_string_literal: true

module Courier
  module Models
    class SlackBaseProperties < Courier::Internal::Type::BaseModel
      # @!attribute access_token
      #
      #   @return [String]
      required :access_token, String

      # @!method initialize(access_token:)
      #   @param access_token [String]
    end
  end
end
