# frozen_string_literal: true

module Courier
  module Models
    module Notifications
      # @see Courier::Resources::Notifications::Checks#list
      class CheckListResponse < Courier::Internal::Type::BaseModel
        # @!attribute checks
        #
        #   @return [Array<Courier::Models::Check>]
        required :checks, -> { Courier::Internal::Type::ArrayOf[Courier::Check] }

        # @!method initialize(checks:)
        #   @param checks [Array<Courier::Models::Check>]
      end
    end
  end
end
