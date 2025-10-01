# frozen_string_literal: true

module Courier
  module Models
    module Profiles
      # @see Courier::Resources::Profiles::Lists#subscribe
      class ListSubscribeResponse < Courier::Internal::Type::BaseModel
        # @!attribute status
        #
        #   @return [Symbol, Courier::Models::Profiles::ListSubscribeResponse::Status]
        required :status, enum: -> { Courier::Models::Profiles::ListSubscribeResponse::Status }

        # @!method initialize(status:)
        #   @param status [Symbol, Courier::Models::Profiles::ListSubscribeResponse::Status]

        # @see Courier::Models::Profiles::ListSubscribeResponse#status
        module Status
          extend Courier::Internal::Type::Enum

          SUCCESS = :SUCCESS

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
