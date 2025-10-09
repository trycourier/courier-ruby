# frozen_string_literal: true

module Trycourier
  module Models
    class EmailFooter < Trycourier::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [String, nil]
      optional :content, String, nil?: true

      # @!attribute inherit_default
      #
      #   @return [Boolean, nil]
      optional :inherit_default, Trycourier::Internal::Type::Boolean, api_name: :inheritDefault, nil?: true

      # @!method initialize(content: nil, inherit_default: nil)
      #   @param content [String, nil]
      #   @param inherit_default [Boolean, nil]
    end
  end
end
