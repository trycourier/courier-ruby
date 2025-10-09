# frozen_string_literal: true

module Trycourier
  module Models
    module Notifications
      # @see Trycourier::Resources::Notifications::Checks#update
      class CheckUpdateResponse < Trycourier::Internal::Type::BaseModel
        # @!attribute checks
        #
        #   @return [Array<Trycourier::Models::Check>]
        required :checks, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::Check] }

        # @!method initialize(checks:)
        #   @param checks [Array<Trycourier::Models::Check>]
      end
    end
  end
end
