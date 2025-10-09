# frozen_string_literal: true

module Trycourier
  module Models
    module Profiles
      # @see Trycourier::Resources::Profiles::Lists#subscribe
      class ListSubscribeResponse < Trycourier::Internal::Type::BaseModel
        # @!attribute status
        #
        #   @return [Symbol, Trycourier::Models::Profiles::ListSubscribeResponse::Status]
        required :status, enum: -> { Trycourier::Models::Profiles::ListSubscribeResponse::Status }

        # @!method initialize(status:)
        #   @param status [Symbol, Trycourier::Models::Profiles::ListSubscribeResponse::Status]

        # @see Trycourier::Models::Profiles::ListSubscribeResponse#status
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
