# frozen_string_literal: true

module Courier
  module Models
    module Notifications
      # @see Courier::Resources::Notifications::Checks#update
      class CheckUpdateResponse < Courier::Internal::Type::BaseModel
        # @!attribute checks
        #
        #   @return [Array<Courier::Models::Notifications::Check>]
        required :checks, -> { Courier::Internal::Type::ArrayOf[Courier::Notifications::Check] }

        # @!method initialize(checks:)
        #   @param checks [Array<Courier::Models::Notifications::Check>]
      end
    end
  end
end
