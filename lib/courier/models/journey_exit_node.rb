# frozen_string_literal: true

module Courier
  module Models
    class JourneyExitNode < Courier::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::JourneyExitNode::Type]
      required :type, enum: -> { Courier::JourneyExitNode::Type }

      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!method initialize(type:, id: nil)
      #   @param type [Symbol, Courier::Models::JourneyExitNode::Type]
      #   @param id [String]

      # @see Courier::Models::JourneyExitNode#type
      module Type
        extend Courier::Internal::Type::Enum

        EXIT = :exit

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
