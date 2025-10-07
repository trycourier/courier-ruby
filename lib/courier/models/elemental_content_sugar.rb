# frozen_string_literal: true

module Courier
  module Models
    class ElementalContentSugar < Courier::Internal::Type::BaseModel
      # @!attribute body
      #   The text content displayed in the notification.
      #
      #   @return [String]
      required :body, String

      # @!attribute title
      #   Title/subject displayed by supported channels.
      #
      #   @return [String]
      required :title, String

      # @!method initialize(body:, title:)
      #   Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
      #
      #   @param body [String] The text content displayed in the notification.
      #
      #   @param title [String] Title/subject displayed by supported channels.
    end
  end
end
