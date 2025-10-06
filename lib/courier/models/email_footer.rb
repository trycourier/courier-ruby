# frozen_string_literal: true

module Courier
  module Models
    class EmailFooter < Courier::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [Object, nil]
      optional :content, Courier::Internal::Type::Unknown

      # @!attribute inherit_default
      #
      #   @return [Boolean, nil]
      optional :inherit_default, Courier::Internal::Type::Boolean, api_name: :inheritDefault, nil?: true

      # @!method initialize(content: nil, inherit_default: nil)
      #   @param content [Object]
      #   @param inherit_default [Boolean, nil]
    end
  end
end
