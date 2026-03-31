# frozen_string_literal: true

module Courier
  module Models
    class ChannelMetadata < Courier::Internal::Type::BaseModel
      # @!attribute utm
      #
      #   @return [Courier::Models::Utm, nil]
      optional :utm, -> { Courier::Utm }, nil?: true

      # @!method initialize(utm: nil)
      #   @param utm [Courier::Models::Utm, nil]
    end
  end
end
