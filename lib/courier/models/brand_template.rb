# frozen_string_literal: true

module Courier
  module Models
    class BrandTemplate < Courier::Internal::Type::BaseModel
      # @!attribute enabled
      #
      #   @return [Boolean]
      required :enabled, Courier::Internal::Type::Boolean

      # @!attribute background_color
      #
      #   @return [String, nil]
      optional :background_color, String, api_name: :backgroundColor, nil?: true

      # @!attribute blocks_background_color
      #
      #   @return [String, nil]
      optional :blocks_background_color, String, api_name: :blocksBackgroundColor, nil?: true

      # @!attribute footer
      #
      #   @return [String, nil]
      optional :footer, String, nil?: true

      # @!attribute head
      #
      #   @return [String, nil]
      optional :head, String, nil?: true

      # @!attribute header
      #
      #   @return [String, nil]
      optional :header, String, nil?: true

      # @!attribute width
      #
      #   @return [String, nil]
      optional :width, String, nil?: true

      # @!method initialize(enabled:, background_color: nil, blocks_background_color: nil, footer: nil, head: nil, header: nil, width: nil)
      #   @param enabled [Boolean]
      #   @param background_color [String, nil]
      #   @param blocks_background_color [String, nil]
      #   @param footer [String, nil]
      #   @param head [String, nil]
      #   @param header [String, nil]
      #   @param width [String, nil]
    end
  end
end
