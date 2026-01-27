# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Profiles#replace
    class ProfileReplaceResponse < Courier::Internal::Type::BaseModel
      # @!attribute status
      #
      #   @return [Symbol, Courier::Models::ProfileReplaceResponse::Status]
      required :status, enum: -> { Courier::Models::ProfileReplaceResponse::Status }

      # @!method initialize(status:)
      #   @param status [Symbol, Courier::Models::ProfileReplaceResponse::Status]

      # @see Courier::Models::ProfileReplaceResponse#status
      module Status
        extend Courier::Internal::Type::Enum

        SUCCESS = :SUCCESS

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
