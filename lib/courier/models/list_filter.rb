# frozen_string_literal: true

module Courier
  module Models
    class ListFilter < Courier::Internal::Type::BaseModel
      # @!attribute operator
      #   Send to users only if they are member of the account
      #
      #   @return [Symbol, Courier::Models::ListFilter::Operator]
      required :operator, enum: -> { Courier::ListFilter::Operator }

      # @!attribute path
      #
      #   @return [Symbol, Courier::Models::ListFilter::Path]
      required :path, enum: -> { Courier::ListFilter::Path }

      # @!attribute value
      #
      #   @return [String]
      required :value, String

      # @!method initialize(operator:, path:, value:)
      #   @param operator [Symbol, Courier::Models::ListFilter::Operator] Send to users only if they are member of the account
      #
      #   @param path [Symbol, Courier::Models::ListFilter::Path]
      #
      #   @param value [String]

      # Send to users only if they are member of the account
      #
      # @see Courier::Models::ListFilter#operator
      module Operator
        extend Courier::Internal::Type::Enum

        MEMBER_OF = :MEMBER_OF

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Courier::Models::ListFilter#path
      module Path
        extend Courier::Internal::Type::Enum

        ACCOUNT_ID = :account_id

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
