# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Profiles#create
    class ProfileCreateResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute status
      #
      #   @return [Symbol, Trycourier::Models::ProfileCreateResponse::Status]
      required :status, enum: -> { Trycourier::Models::ProfileCreateResponse::Status }

      # @!method initialize(status:)
      #   @param status [Symbol, Trycourier::Models::ProfileCreateResponse::Status]

      # @see Trycourier::Models::ProfileCreateResponse#status
      module Status
        extend Trycourier::Internal::Type::Enum

        SUCCESS = :SUCCESS

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
