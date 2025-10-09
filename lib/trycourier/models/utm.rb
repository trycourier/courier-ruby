# frozen_string_literal: true

module Trycourier
  module Models
    class Utm < Trycourier::Internal::Type::BaseModel
      # @!attribute campaign
      #
      #   @return [String, nil]
      optional :campaign, String, nil?: true

      # @!attribute content
      #
      #   @return [String, nil]
      optional :content, String, nil?: true

      # @!attribute medium
      #
      #   @return [String, nil]
      optional :medium, String, nil?: true

      # @!attribute source
      #
      #   @return [String, nil]
      optional :source, String, nil?: true

      # @!attribute term
      #
      #   @return [String, nil]
      optional :term, String, nil?: true

      # @!method initialize(campaign: nil, content: nil, medium: nil, source: nil, term: nil)
      #   @param campaign [String, nil]
      #   @param content [String, nil]
      #   @param medium [String, nil]
      #   @param source [String, nil]
      #   @param term [String, nil]
    end
  end
end
