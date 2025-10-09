# frozen_string_literal: true

module Trycourier
  module Models
    class MessageRouting < Trycourier::Internal::Type::BaseModel
      # @!attribute channels
      #
      #   @return [Array<Trycourier::Models::MessageRoutingChannel>]
      required :channels, -> { Trycourier::Internal::Type::ArrayOf[union: Trycourier::MessageRoutingChannel] }

      # @!attribute method_
      #
      #   @return [Symbol, Trycourier::Models::MessageRouting::Method]
      required :method_, enum: -> { Trycourier::MessageRouting::Method }, api_name: :method

      # @!method initialize(channels:, method_:)
      #   @param channels [Array<Trycourier::Models::MessageRoutingChannel>]
      #   @param method_ [Symbol, Trycourier::Models::MessageRouting::Method]

      # @see Trycourier::Models::MessageRouting#method_
      module Method
        extend Trycourier::Internal::Type::Enum

        ALL = :all
        SINGLE = :single

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
