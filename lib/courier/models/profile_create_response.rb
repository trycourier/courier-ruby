# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Profiles#create
    class ProfileCreateResponse < Courier::Internal::Type::BaseModel
      # @!attribute status
      #
      #   @return [Symbol, Courier::Models::ProfileCreateResponse::Status]
      required :status, enum: -> { Courier::Models::ProfileCreateResponse::Status }

      # @!method initialize(status:)
      #   @param status [Symbol, Courier::Models::ProfileCreateResponse::Status]

      # @see Courier::Models::ProfileCreateResponse#status
      module Status
        extend Courier::Internal::Type::Enum

        SUCCESS = :SUCCESS

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
