# frozen_string_literal: true

module Courier
  module Models
    module Profiles
      # @see Courier::Resources::Profiles::Lists#delete
      class ListDeleteResponse < Courier::Internal::Type::BaseModel
        # @!attribute status
        #
        #   @return [Symbol, Courier::Models::Profiles::ListDeleteResponse::Status]
        required :status, enum: -> { Courier::Models::Profiles::ListDeleteResponse::Status }

        # @!method initialize(status:)
        #   @param status [Symbol, Courier::Models::Profiles::ListDeleteResponse::Status]

        # @see Courier::Models::Profiles::ListDeleteResponse#status
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
