# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Lists#retrieve
    class SubscriptionList < Trycourier::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute created
      #
      #   @return [String, nil]
      optional :created, String, nil?: true

      # @!attribute updated
      #
      #   @return [String, nil]
      optional :updated, String, nil?: true

      # @!method initialize(id:, name:, created: nil, updated: nil)
      #   @param id [String]
      #   @param name [String]
      #   @param created [String, nil]
      #   @param updated [String, nil]
    end
  end
end
