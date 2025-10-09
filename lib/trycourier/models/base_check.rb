# frozen_string_literal: true

module Trycourier
  module Models
    class BaseCheck < Trycourier::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute status
      #
      #   @return [Symbol, Trycourier::Models::BaseCheck::Status]
      required :status, enum: -> { Trycourier::BaseCheck::Status }

      # @!attribute type
      #
      #   @return [Symbol, Trycourier::Models::BaseCheck::Type]
      required :type, enum: -> { Trycourier::BaseCheck::Type }

      # @!method initialize(id:, status:, type:)
      #   @param id [String]
      #   @param status [Symbol, Trycourier::Models::BaseCheck::Status]
      #   @param type [Symbol, Trycourier::Models::BaseCheck::Type]

      # @see Trycourier::Models::BaseCheck#status
      module Status
        extend Trycourier::Internal::Type::Enum

        RESOLVED = :RESOLVED
        FAILED = :FAILED
        PENDING = :PENDING

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Trycourier::Models::BaseCheck#type
      module Type
        extend Trycourier::Internal::Type::Enum

        CUSTOM = :custom

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
