# frozen_string_literal: true

module Courier
  module Models
    module Notifications
      class BaseCheck < Courier::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute status
        #
        #   @return [Symbol, Courier::Models::Notifications::BaseCheck::Status]
        required :status, enum: -> { Courier::Notifications::BaseCheck::Status }

        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::Notifications::BaseCheck::Type]
        required :type, enum: -> { Courier::Notifications::BaseCheck::Type }

        # @!method initialize(id:, status:, type:)
        #   @param id [String]
        #   @param status [Symbol, Courier::Models::Notifications::BaseCheck::Status]
        #   @param type [Symbol, Courier::Models::Notifications::BaseCheck::Type]

        # @see Courier::Models::Notifications::BaseCheck#status
        module Status
          extend Courier::Internal::Type::Enum

          RESOLVED = :RESOLVED
          FAILED = :FAILED
          PENDING = :PENDING

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Courier::Models::Notifications::BaseCheck#type
        module Type
          extend Courier::Internal::Type::Enum

          CUSTOM = :custom

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
