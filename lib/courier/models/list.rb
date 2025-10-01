# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Lists#retrieve
    class List < Courier::Internal::Type::BaseModel
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
      #   @return [Integer, nil]
      optional :created, Integer, nil?: true

      # @!attribute updated
      #
      #   @return [Integer, nil]
      optional :updated, Integer, nil?: true

      # @!method initialize(id:, name:, created: nil, updated: nil)
      #   @param id [String]
      #   @param name [String]
      #   @param created [Integer, nil]
      #   @param updated [Integer, nil]
    end
  end
end
