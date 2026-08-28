# frozen_string_literal: true

module Courier
  module Models
    class ElementalActionNode < Courier::Models::ElementalBaseNode
      # @!attribute content
      #   The text content of the action shown to the user.
      #
      #   @return [String]
      required :content, String

      # @!attribute href
      #   The target URL of the action.
      #
      #   @return [String]
      required :href, String

      # @!attribute action_id
      #   A unique id used to identify the action when it is executed.
      #
      #   @return [String, nil]
      optional :action_id, String, nil?: true

      # @!attribute align
      #   The alignment of the action button. Defaults to "center".
      #
      #   @return [Symbol, Courier::Models::Alignment, nil]
      optional :align, enum: -> { Courier::Alignment }, nil?: true

      # @!attribute background_color
      #   The background color of the action button.
      #
      #   @return [String, nil]
      optional :background_color, String, nil?: true

      # @!attribute border_radius
      #   CSS border-radius applied to the action button. For example, `4px`
      #
      #   @return [String, nil]
      optional :border_radius, String, nil?: true

      # @!attribute border_size
      #   CSS border width applied to the action button. For example, `1px`
      #
      #   @return [String, nil]
      optional :border_size, String, nil?: true

      # @!attribute disable_tracking
      #   When true, the action's href is not rewritten for click-through tracking, even
      #   when click-through tracking is enabled for the workspace.
      #
      #   @return [Boolean, nil]
      optional :disable_tracking, Courier::Internal::Type::Boolean, nil?: true

      # @!attribute font_size
      #   CSS font-size applied to the action button label. For example, `14px`
      #
      #   @return [String, nil]
      optional :font_size, String, nil?: true

      # @!attribute locales
      #   Region specific content. See
      #   [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/)
      #   for more details.
      #
      #   @return [Hash{Symbol=>Courier::Models::LocaleItem}, nil]
      optional :locales, -> { Courier::Internal::Type::HashOf[Courier::LocaleItem] }, nil?: true

      # @!attribute padding
      #   CSS padding applied to the action button. For example, `8px 16px`
      #
      #   @return [String, nil]
      optional :padding, String, nil?: true

      # @!attribute style
      #   Defaults to `button`.
      #
      #   @return [Symbol, Courier::Models::ElementalActionNode::Style, nil]
      optional :style, enum: -> { Courier::ElementalActionNode::Style }, nil?: true

      # @!method initialize(content:, href:, action_id: nil, align: nil, background_color: nil, border_radius: nil, border_size: nil, disable_tracking: nil, font_size: nil, locales: nil, padding: nil, style: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::ElementalActionNode} for more details.
      #
      #   Allows the user to execute an action. Can be a button or a link.
      #
      #   @param content [String] The text content of the action shown to the user.
      #
      #   @param href [String] The target URL of the action.
      #
      #   @param action_id [String, nil] A unique id used to identify the action when it is executed.
      #
      #   @param align [Symbol, Courier::Models::Alignment, nil] The alignment of the action button. Defaults to "center".
      #
      #   @param background_color [String, nil] The background color of the action button.
      #
      #   @param border_radius [String, nil] CSS border-radius applied to the action button. For example, `4px`
      #
      #   @param border_size [String, nil] CSS border width applied to the action button. For example, `1px`
      #
      #   @param disable_tracking [Boolean, nil] When true, the action's href is not rewritten for click-through tracking, even w
      #
      #   @param font_size [String, nil] CSS font-size applied to the action button label. For example, `14px`
      #
      #   @param locales [Hash{Symbol=>Courier::Models::LocaleItem}, nil] Region specific content. See [locales docs](https://www.courier.com/docs/platfor
      #
      #   @param padding [String, nil] CSS padding applied to the action button. For example, `8px 16px`
      #
      #   @param style [Symbol, Courier::Models::ElementalActionNode::Style, nil] Defaults to `button`.

      # Defaults to `button`.
      module Style
        extend Courier::Internal::Type::Enum

        BUTTON = :button
        LINK = :link

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
