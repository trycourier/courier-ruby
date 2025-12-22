# frozen_string_literal: true

module Trycourier
  module Models
    module UserProfileFirebaseToken
      extend Trycourier::Internal::Type::Union

      variant String

      variant -> { Trycourier::Models::UserProfileFirebaseToken::StringArray }

      # @!method self.variants
      #   @return [Array(String, Array<String>)]

      # @type [Trycourier::Internal::Type::Converter]
      StringArray = Trycourier::Internal::Type::ArrayOf[String]
    end
  end
end
