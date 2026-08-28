# frozen_string_literal: true

module Courier
  module Models
    class ElementalHTMLNode < Courier::Models::ElementalBaseNode
      # @!attribute content
      #   Raw HTML string to render inside the notification.
      #
      #   @return [String]
      required :content, String

      # @!attribute locales
      #   Region specific content. See
      #   [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/)
      #   for more details.
      #
      #   @return [Hash{Symbol=>Courier::Models::LocaleItem}, nil]
      optional :locales, -> { Courier::Internal::Type::HashOf[Courier::LocaleItem] }, nil?: true

      # @!method initialize(content:, locales: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::ElementalHTMLNode} for more details.
      #
      #   Raw HTML string inside an Elemental document. When rendering a message, this
      #   node is turned into output only for the email channel; for other channels it
      #   produces no blocks.
      #
      #   @param content [String] Raw HTML string to render inside the notification.
      #
      #   @param locales [Hash{Symbol=>Courier::Models::LocaleItem}, nil] Region specific content. See [locales docs](https://www.courier.com/docs/platfor
    end
  end
end
