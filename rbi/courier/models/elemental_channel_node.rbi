# typed: strong

module Courier
  module Models
    class ElementalChannelNode < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalChannelNode, Courier::Internal::AnyHash)
        end

      # The channel the contents of this element should be applied to. Can be `email`,
      # `push`, `direct_message`, `sms` or a provider such as slack
      sig { returns(String) }
      attr_accessor :channel

      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :channels

      # An array of elements to apply to the channel. If `raw` has not been specified,
      # `elements` is `required`.
      sig { returns(T.nilable(T::Array[Courier::ElementalNode])) }
      attr_accessor :elements

      sig { returns(T.nilable(String)) }
      attr_accessor :if_

      sig { returns(T.nilable(String)) }
      attr_accessor :loop_

      # Raw data to apply to the channel. If `elements` has not been specified, `raw` is
      # `required`.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :raw

      sig { returns(T.nilable(String)) }
      attr_accessor :ref

      sig do
        params(
          channel: String,
          channels: T.nilable(T::Array[String]),
          elements: T.nilable(T::Array[Courier::ElementalNode]),
          if_: T.nilable(String),
          loop_: T.nilable(String),
          raw: T.nilable(T::Hash[Symbol, T.anything]),
          ref: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The channel the contents of this element should be applied to. Can be `email`,
        # `push`, `direct_message`, `sms` or a provider such as slack
        channel:,
        channels: nil,
        # An array of elements to apply to the channel. If `raw` has not been specified,
        # `elements` is `required`.
        elements: nil,
        if_: nil,
        loop_: nil,
        # Raw data to apply to the channel. If `elements` has not been specified, `raw` is
        # `required`.
        raw: nil,
        ref: nil
      )
      end

      sig do
        override.returns(
          {
            channel: String,
            channels: T.nilable(T::Array[String]),
            elements: T.nilable(T::Array[Courier::ElementalNode]),
            if_: T.nilable(String),
            loop_: T.nilable(String),
            raw: T.nilable(T::Hash[Symbol, T.anything]),
            ref: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
