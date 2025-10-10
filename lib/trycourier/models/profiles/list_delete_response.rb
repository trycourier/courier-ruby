# frozen_string_literal: true

module Trycourier
  module Models
    module Profiles
      # @see Trycourier::Resources::Profiles::Lists#delete
      class ListDeleteResponse < Trycourier::Internal::Type::BaseModel
        # @!attribute status
        #
        #   @return [Symbol, Trycourier::Models::Profiles::ListDeleteResponse::Status]
        required :status, enum: -> { Trycourier::Models::Profiles::ListDeleteResponse::Status }

        # @!method initialize(status:)
        #   @param status [Symbol, Trycourier::Models::Profiles::ListDeleteResponse::Status]

        # @see Trycourier::Models::Profiles::ListDeleteResponse#status
        module Status
          extend Trycourier::Internal::Type::Enum

          SUCCESS = :SUCCESS

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
