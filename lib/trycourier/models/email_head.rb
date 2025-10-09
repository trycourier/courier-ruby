# frozen_string_literal: true

module Trycourier
  module Models
    class EmailHead < Trycourier::Internal::Type::BaseModel
      # @!attribute inherit_default
      #
      #   @return [Boolean]
      required :inherit_default, Trycourier::Internal::Type::Boolean, api_name: :inheritDefault

      # @!attribute content
      #
      #   @return [String, nil]
      optional :content, String, nil?: true

      # @!method initialize(inherit_default:, content: nil)
      #   @param inherit_default [Boolean]
      #   @param content [String, nil]
    end
  end
end
