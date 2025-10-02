# frozen_string_literal: true

module Courier
  module Models
    module Tenants
      class ElementalChannelNode < Courier::Internal::Type::BaseModel
        # @!attribute channel
        #   The channel the contents of this element should be applied to. Can be `email`,
        #   `push`, `direct_message`, `sms` or a provider such as slack
        #
        #   @return [String]
        required :channel, String

        # @!attribute channels
        #
        #   @return [Array<String>, nil]
        optional :channels, Courier::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute elements
        #   An array of elements to apply to the channel. If `raw` has not been specified,
        #   `elements` is `required`.
        #
        #   @return [Array<Courier::Models::Tenants::ElementalNode>, nil]
        optional :elements,
                 -> { Courier::Internal::Type::ArrayOf[union: Courier::Tenants::ElementalNode] },
                 nil?: true

        # @!attribute if_
        #
        #   @return [String, nil]
        optional :if_, String, api_name: :if, nil?: true

        # @!attribute loop_
        #
        #   @return [String, nil]
        optional :loop_, String, api_name: :loop, nil?: true

        # @!attribute raw
        #   Raw data to apply to the channel. If `elements` has not been specified, `raw` is
        #   `required`.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :raw, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!attribute ref
        #
        #   @return [String, nil]
        optional :ref, String, nil?: true

        # @!method initialize(channel:, channels: nil, elements: nil, if_: nil, loop_: nil, raw: nil, ref: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::Tenants::ElementalChannelNode} for more details.
        #
        #   @param channel [String] The channel the contents of this element should be applied to. Can be `email`,
        #
        #   @param channels [Array<String>, nil]
        #
        #   @param elements [Array<Courier::Models::Tenants::ElementalNode>, nil] An array of elements to apply to the channel. If `raw` has not been
        #
        #   @param if_ [String, nil]
        #
        #   @param loop_ [String, nil]
        #
        #   @param raw [Hash{Symbol=>Object}, nil] Raw data to apply to the channel. If `elements` has not been
        #
        #   @param ref [String, nil]
      end
    end
  end
end
