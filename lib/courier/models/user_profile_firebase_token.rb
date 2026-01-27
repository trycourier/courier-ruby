# frozen_string_literal: true

module Courier
  module Models
    module UserProfileFirebaseToken
      extend Courier::Internal::Type::Union

      variant String

      variant -> { Courier::Models::UserProfileFirebaseToken::StringArray }

      # @!method self.variants
      #   @return [Array(String, Array<String>)]

      # @type [Courier::Internal::Type::Converter]
      StringArray = Courier::Internal::Type::ArrayOf[String]
    end
  end
end
