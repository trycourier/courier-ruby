# typed: strong

module Courier
  module Models
    class ElementalChannelNode < Courier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalChannelNode, Courier::Internal::AnyHash)
        end

      # The channel the contents of this element should be applied to. Can be `email`,
      # `push`, `direct_message`, `sms` or a provider such as slack
      sig { returns(T.nilable(String)) }
      attr_reader :channel

      sig { params(channel: String).void }
      attr_writer :channel

      # Email only. Document-level base font size (CSS px, e.g. `16px`) for body content
      # — text, quote, list and action button labels. Heading styles (`h1`/`h2`/`h3`)
      # and `subtext` keep their preset sizes.
      sig { returns(T.nilable(String)) }
      attr_accessor :font_size

      # Email only. Document-level line height (CSS px or unitless multiplier, e.g.
      # `24px` or `1.5`) applied to all body content unless overridden per block.
      sig { returns(T.nilable(String)) }
      attr_accessor :line_height

      # Email only. Document-level body padding applied once around the email body, as a
      # CSS px shorthand (1–4 values), e.g. `48px 64px`.
      sig { returns(T.nilable(String)) }
      attr_accessor :padding

      # Raw data to apply to the channel. If `elements` has not been specified, `raw` is
      # required.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :raw

      # The channel element allows a notification to be customized based on which
      # channel it is sent through. For example, you may want to display a detailed
      # message when the notification is sent through email, and a more concise message
      # in a push notification. Channel elements are only valid as top-level elements;
      # you cannot nest channel elements. If there is a channel element specified at the
      # top-level of the document, all sibling elements must be channel elements. Note:
      # As an alternative, most elements support a `channel` property. Which allows you
      # to selectively display an individual element on a per channel basis. See the
      # [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/)
      # for more details.
      sig do
        params(
          channel: String,
          font_size: T.nilable(String),
          line_height: T.nilable(String),
          padding: T.nilable(String),
          raw: T.nilable(T::Hash[Symbol, T.anything])
        ).returns(T.attached_class)
      end
      def self.new(
        # The channel the contents of this element should be applied to. Can be `email`,
        # `push`, `direct_message`, `sms` or a provider such as slack
        channel: nil,
        # Email only. Document-level base font size (CSS px, e.g. `16px`) for body content
        # — text, quote, list and action button labels. Heading styles (`h1`/`h2`/`h3`)
        # and `subtext` keep their preset sizes.
        font_size: nil,
        # Email only. Document-level line height (CSS px or unitless multiplier, e.g.
        # `24px` or `1.5`) applied to all body content unless overridden per block.
        line_height: nil,
        # Email only. Document-level body padding applied once around the email body, as a
        # CSS px shorthand (1–4 values), e.g. `48px 64px`.
        padding: nil,
        # Raw data to apply to the channel. If `elements` has not been specified, `raw` is
        # required.
        raw: nil
      )
      end

      sig do
        override.returns(
          {
            channel: String,
            font_size: T.nilable(String),
            line_height: T.nilable(String),
            padding: T.nilable(String),
            raw: T.nilable(T::Hash[Symbol, T.anything])
          }
        )
      end
      def to_hash
      end
    end
  end
end
