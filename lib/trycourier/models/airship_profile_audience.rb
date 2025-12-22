# frozen_string_literal: true

module Trycourier
  module Models
    class AirshipProfileAudience < Trycourier::Internal::Type::BaseModel
      # @!attribute named_user
      #
      #   @return [String]
      required :named_user, String

      # @!method initialize(named_user:)
      #   @param named_user [String]
    end
  end
end
