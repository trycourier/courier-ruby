# frozen_string_literal: true

module Courier
  module Models
    class LocaleItem < Courier::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [String]
      required :content, String

      # @!method initialize(content:)
      #   @param content [String]
    end

    # @type [Courier::Internal::Type::Converter]
    Locales = Courier::Internal::Type::HashOf[-> { Courier::LocaleItem }]
  end
end
