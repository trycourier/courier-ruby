# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Previews#list_device_sets
    class DeviceSetListResponse < Courier::Internal::Type::BaseModel
      # @!attribute results
      #
      #   @return [Array<Courier::Models::DeviceSet>]
      required :results, -> { Courier::Internal::Type::ArrayOf[Courier::DeviceSet] }

      # @!method initialize(results:)
      #   The workspace's active device sets. Not paginated.
      #
      #   @param results [Array<Courier::Models::DeviceSet>]
    end
  end
end
