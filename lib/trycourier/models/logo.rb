# frozen_string_literal: true

module Trycourier
  module Models
    class Logo < Trycourier::Internal::Type::BaseModel
      # @!attribute href
      #
      #   @return [String, nil]
      optional :href, String, nil?: true

      # @!attribute image
      #
      #   @return [String, nil]
      optional :image, String, nil?: true

      # @!method initialize(href: nil, image: nil)
      #   @param href [String, nil]
      #   @param image [String, nil]
    end
  end
end
