# frozen_string_literal: true

module Courier
  module Models
    class Icons < Courier::Internal::Type::BaseModel
      # @!attribute bell
      #
      #   @return [String, nil]
      optional :bell, String, nil?: true

      # @!attribute message
      #
      #   @return [String, nil]
      optional :message, String, nil?: true

      # @!method initialize(bell: nil, message: nil)
      #   @param bell [String, nil]
      #   @param message [String, nil]
    end
  end
end
