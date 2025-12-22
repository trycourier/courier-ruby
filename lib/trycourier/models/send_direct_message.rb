# frozen_string_literal: true

module Trycourier
  module Models
    class SendDirectMessage < Trycourier::Internal::Type::BaseModel
      # @!attribute user_id
      #
      #   @return [String]
      required :user_id, String

      # @!method initialize(user_id:)
      #   @param user_id [String]
    end
  end
end
