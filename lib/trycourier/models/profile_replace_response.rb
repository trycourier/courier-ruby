# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Profiles#replace
    class ProfileReplaceResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute status
      #
      #   @return [Symbol, Trycourier::Models::ProfileReplaceResponse::Status]
      required :status, enum: -> { Trycourier::Models::ProfileReplaceResponse::Status }

      # @!method initialize(status:)
      #   @param status [Symbol, Trycourier::Models::ProfileReplaceResponse::Status]

      # @see Trycourier::Models::ProfileReplaceResponse#status
      module Status
        extend Trycourier::Internal::Type::Enum

        SUCCESS = :SUCCESS

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
