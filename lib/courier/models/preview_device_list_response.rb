# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Previews#list_devices
    class PreviewDeviceListResponse < Courier::Internal::Type::BaseModel
      # @!attribute results
      #
      #   @return [Array<Courier::Models::PreviewDevice>]
      required :results, -> { Courier::Internal::Type::ArrayOf[Courier::PreviewDevice] }

      # @!method initialize(results:)
      #   The full catalog of renderable devices. Not paginated.
      #
      #   @param results [Array<Courier::Models::PreviewDevice>]
    end
  end
end
