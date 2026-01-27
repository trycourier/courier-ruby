# frozen_string_literal: true

module Courier
  module Models
    class BaseCheck < Courier::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute status
      #
      #   @return [Symbol, Courier::Models::BaseCheck::Status]
      required :status, enum: -> { Courier::BaseCheck::Status }

      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::BaseCheck::Type]
      required :type, enum: -> { Courier::BaseCheck::Type }

      # @!method initialize(id:, status:, type:)
      #   @param id [String]
      #   @param status [Symbol, Courier::Models::BaseCheck::Status]
      #   @param type [Symbol, Courier::Models::BaseCheck::Type]

      # @see Courier::Models::BaseCheck#status
      module Status
        extend Courier::Internal::Type::Enum

        RESOLVED = :RESOLVED
        FAILED = :FAILED
        PENDING = :PENDING

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Courier::Models::BaseCheck#type
      module Type
        extend Courier::Internal::Type::Enum

        CUSTOM = :custom

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
