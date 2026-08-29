# frozen_string_literal: true

module Courier
  module Models
    class ElementalImageNode < Courier::Models::ElementalBaseNode
      # @!attribute src
      #   The source of the image.
      #
      #   @return [String]
      required :src, String

      # @!attribute align
      #   The alignment of the image.
      #
      #   @return [Symbol, Courier::Models::Alignment, nil]
      optional :align, enum: -> { Courier::Alignment }, nil?: true

      # @!attribute alt_text
      #   Alternate text for the image.
      #
      #   @return [String, nil]
      optional :alt_text, String, nil?: true

      # @!attribute border_color
      #   CSS border color applied to the image. For example, `#ccc`
      #
      #   @return [String, nil]
      optional :border_color, String, nil?: true

      # @!attribute border_size
      #   CSS border width applied to the image. For example, `1px`
      #
      #   @return [String, nil]
      optional :border_size, String, nil?: true

      # @!attribute href
      #   A URL to link to when the image is clicked.
      #
      #   @return [String, nil]
      optional :href, String, nil?: true

      # @!attribute padding
      #   CSS padding applied around the image. For example, `10px`
      #
      #   @return [String, nil]
      optional :padding, String, nil?: true

      # @!attribute width
      #   CSS width properties to apply to the image. For example, 50px
      #
      #   @return [String, nil]
      optional :width, String, nil?: true

      # @!method initialize(src:, align: nil, alt_text: nil, border_color: nil, border_size: nil, href: nil, padding: nil, width: nil)
      #   Used to embed an image into the notification.
      #
      #   @param src [String] The source of the image.
      #
      #   @param align [Symbol, Courier::Models::Alignment, nil] The alignment of the image.
      #
      #   @param alt_text [String, nil] Alternate text for the image.
      #
      #   @param border_color [String, nil] CSS border color applied to the image. For example, `#ccc`
      #
      #   @param border_size [String, nil] CSS border width applied to the image. For example, `1px`
      #
      #   @param href [String, nil] A URL to link to when the image is clicked.
      #
      #   @param padding [String, nil] CSS padding applied around the image. For example, `10px`
      #
      #   @param width [String, nil] CSS width properties to apply to the image. For example, 50px
    end
  end
end
