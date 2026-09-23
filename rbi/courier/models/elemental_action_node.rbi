# typed: strong

module Courier
  module Models
    class ElementalActionNode < Courier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalActionNode, Courier::Internal::AnyHash)
        end

      # The text content of the action shown to the user.
      sig { returns(String) }
      attr_accessor :content

      # The target URL of the action.
      sig { returns(String) }
      attr_accessor :href

      # A unique id used to identify the action when it is executed.
      sig { returns(T.nilable(String)) }
      attr_accessor :action_id

      # The alignment of the action button. Defaults to "center".
      sig { returns(T.nilable(Courier::Alignment::OrSymbol)) }
      attr_accessor :align

      # The background color of the action button.
      sig { returns(T.nilable(String)) }
      attr_accessor :background_color

      # CSS border-radius applied to the action button. For example, `4px`
      sig { returns(T.nilable(String)) }
      attr_accessor :border_radius

      # CSS border width applied to the action button. For example, `1px`
      sig { returns(T.nilable(String)) }
      attr_accessor :border_size

      # When true, the action's href is not rewritten for click-through tracking, even
      # when click-through tracking is enabled for the workspace.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :disable_tracking

      # CSS font-size applied to the action button label. For example, `14px`
      sig { returns(T.nilable(String)) }
      attr_accessor :font_size

      # Region specific content. See
      # [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/)
      # for more details.
      sig { returns(T.nilable(T::Hash[Symbol, Courier::LocaleItem])) }
      attr_accessor :locales

      # CSS padding applied to the action button. For example, `8px 16px`
      sig { returns(T.nilable(String)) }
      attr_accessor :padding

      # How prominent the action should be. `button` is the default, `secondary` and
      # `tertiary` are the other two button styles, and `link` renders as inline text
      # rather than a button.
      #
      # Each channel draws these as closely as its medium allows. Email fills `button`,
      # outlines `secondary`, and underlines `tertiary`. The in-app Inbox fills
      # `button`, outlines `secondary`, and draws `tertiary` as a solid button. Slack
      # renders all three as Block Kit buttons, with `secondary` in Slack's `primary`
      # style and `tertiary` in its `danger` style.
      #
      # `background_color` is the fill for `button`, and the border and label color for
      # `secondary`. For `tertiary` it colors the underline and label in email and the
      # fill in the Inbox. It does not apply to `link`. An Inbox theme that sets its own
      # action colors takes precedence over the template.
      sig { returns(T.nilable(Courier::ElementalActionNode::Style::OrSymbol)) }
      attr_accessor :style

      # Allows the user to execute an action. Can be a button or a link.
      sig do
        params(
          content: String,
          href: String,
          action_id: T.nilable(String),
          align: T.nilable(Courier::Alignment::OrSymbol),
          background_color: T.nilable(String),
          border_radius: T.nilable(String),
          border_size: T.nilable(String),
          disable_tracking: T.nilable(T::Boolean),
          font_size: T.nilable(String),
          locales: T.nilable(T::Hash[Symbol, Courier::LocaleItem::OrHash]),
          padding: T.nilable(String),
          style: T.nilable(Courier::ElementalActionNode::Style::OrSymbol)
        ).returns(T.attached_class)
      end
      def self.new(
        # The text content of the action shown to the user.
        content:,
        # The target URL of the action.
        href:,
        # A unique id used to identify the action when it is executed.
        action_id: nil,
        # The alignment of the action button. Defaults to "center".
        align: nil,
        # The background color of the action button.
        background_color: nil,
        # CSS border-radius applied to the action button. For example, `4px`
        border_radius: nil,
        # CSS border width applied to the action button. For example, `1px`
        border_size: nil,
        # When true, the action's href is not rewritten for click-through tracking, even
        # when click-through tracking is enabled for the workspace.
        disable_tracking: nil,
        # CSS font-size applied to the action button label. For example, `14px`
        font_size: nil,
        # Region specific content. See
        # [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/)
        # for more details.
        locales: nil,
        # CSS padding applied to the action button. For example, `8px 16px`
        padding: nil,
        # How prominent the action should be. `button` is the default, `secondary` and
        # `tertiary` are the other two button styles, and `link` renders as inline text
        # rather than a button.
        #
        # Each channel draws these as closely as its medium allows. Email fills `button`,
        # outlines `secondary`, and underlines `tertiary`. The in-app Inbox fills
        # `button`, outlines `secondary`, and draws `tertiary` as a solid button. Slack
        # renders all three as Block Kit buttons, with `secondary` in Slack's `primary`
        # style and `tertiary` in its `danger` style.
        #
        # `background_color` is the fill for `button`, and the border and label color for
        # `secondary`. For `tertiary` it colors the underline and label in email and the
        # fill in the Inbox. It does not apply to `link`. An Inbox theme that sets its own
        # action colors takes precedence over the template.
        style: nil
      )
      end

      sig do
        override.returns(
          {
            content: String,
            href: String,
            action_id: T.nilable(String),
            align: T.nilable(Courier::Alignment::OrSymbol),
            background_color: T.nilable(String),
            border_radius: T.nilable(String),
            border_size: T.nilable(String),
            disable_tracking: T.nilable(T::Boolean),
            font_size: T.nilable(String),
            locales: T.nilable(T::Hash[Symbol, Courier::LocaleItem]),
            padding: T.nilable(String),
            style: T.nilable(Courier::ElementalActionNode::Style::OrSymbol)
          }
        )
      end
      def to_hash
      end

      # How prominent the action should be. `button` is the default, `secondary` and
      # `tertiary` are the other two button styles, and `link` renders as inline text
      # rather than a button.
      #
      # Each channel draws these as closely as its medium allows. Email fills `button`,
      # outlines `secondary`, and underlines `tertiary`. The in-app Inbox fills
      # `button`, outlines `secondary`, and draws `tertiary` as a solid button. Slack
      # renders all three as Block Kit buttons, with `secondary` in Slack's `primary`
      # style and `tertiary` in its `danger` style.
      #
      # `background_color` is the fill for `button`, and the border and label color for
      # `secondary`. For `tertiary` it colors the underline and label in email and the
      # fill in the Inbox. It does not apply to `link`. An Inbox theme that sets its own
      # action colors takes precedence over the template.
      module Style
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::ElementalActionNode::Style) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BUTTON =
          T.let(:button, Courier::ElementalActionNode::Style::TaggedSymbol)
        SECONDARY =
          T.let(:secondary, Courier::ElementalActionNode::Style::TaggedSymbol)
        TERTIARY =
          T.let(:tertiary, Courier::ElementalActionNode::Style::TaggedSymbol)
        LINK = T.let(:link, Courier::ElementalActionNode::Style::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::ElementalActionNode::Style::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
