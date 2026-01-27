# frozen_string_literal: true

module Courier
  module Models
    class MessageRouting < Courier::Internal::Type::BaseModel
      # @!attribute channels
      #
      #   @return [Array<Courier::Models::MessageRoutingChannel>]
      required :channels, -> { Courier::Internal::Type::ArrayOf[union: Courier::MessageRoutingChannel] }

      # @!attribute method_
      #
      #   @return [Symbol, Courier::Models::MessageRouting::Method]
      required :method_, enum: -> { Courier::MessageRouting::Method }, api_name: :method

      # @!method initialize(channels:, method_:)
      #   @param channels [Array<Courier::Models::MessageRoutingChannel>]
      #   @param method_ [Symbol, Courier::Models::MessageRouting::Method]

      # @see Courier::Models::MessageRouting#method_
      module Method
        extend Courier::Internal::Type::Enum

        ALL = :all
        SINGLE = :single

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
