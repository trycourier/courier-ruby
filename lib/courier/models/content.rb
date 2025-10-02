# frozen_string_literal: true

module Courier
  module Models
    # Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
    module Content
      extend Courier::Internal::Type::Union

      variant -> { Courier::Tenants::ElementalContent }

      # Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
      variant -> { Courier::Content::ElementalContentSugar }

      class ElementalContentSugar < Courier::Internal::Type::BaseModel
        # @!attribute body
        #   The text content displayed in the notification.
        #
        #   @return [String]
        required :body, String

        # @!attribute title
        #   The title to be displayed by supported channels i.e. push, email (as subject)
        #
        #   @return [String]
        required :title, String

        # @!method initialize(body:, title:)
        #   Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
        #
        #   @param body [String] The text content displayed in the notification.
        #
        #   @param title [String] The title to be displayed by supported channels i.e. push, email (as subject)
      end

      # @!method self.variants
      #   @return [Array(Courier::Models::Tenants::ElementalContent, Courier::Models::Content::ElementalContentSugar)]
    end
  end
end
