# frozen_string_literal: true

module Trycourier
  module Models
    class ListFilter < Trycourier::Internal::Type::BaseModel
      # @!attribute operator
      #   Send to users only if they are member of the account
      #
      #   @return [Symbol, Trycourier::Models::ListFilter::Operator]
      required :operator, enum: -> { Trycourier::ListFilter::Operator }

      # @!attribute path
      #
      #   @return [Symbol, Trycourier::Models::ListFilter::Path]
      required :path, enum: -> { Trycourier::ListFilter::Path }

      # @!attribute value
      #
      #   @return [String]
      required :value, String

      # @!method initialize(operator:, path:, value:)
      #   @param operator [Symbol, Trycourier::Models::ListFilter::Operator] Send to users only if they are member of the account
      #
      #   @param path [Symbol, Trycourier::Models::ListFilter::Path]
      #
      #   @param value [String]

      # Send to users only if they are member of the account
      #
      # @see Trycourier::Models::ListFilter#operator
      module Operator
        extend Trycourier::Internal::Type::Enum

        MEMBER_OF = :MEMBER_OF

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Trycourier::Models::ListFilter#path
      module Path
        extend Trycourier::Internal::Type::Enum

        ACCOUNT_ID = :account_id

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
