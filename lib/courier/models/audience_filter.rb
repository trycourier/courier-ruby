# frozen_string_literal: true

module Courier
  module Models
    class AudienceFilter < Courier::Internal::Type::BaseModel
      # @!attribute operator
      #   Send to users only if they are member of the account
      #
      #   @return [Symbol, Courier::Models::AudienceFilter::Operator]
      required :operator, enum: -> { Courier::AudienceFilter::Operator }

      # @!attribute path
      #
      #   @return [Symbol, Courier::Models::AudienceFilter::Path]
      required :path, enum: -> { Courier::AudienceFilter::Path }

      # @!attribute value
      #
      #   @return [String]
      required :value, String

      # @!method initialize(operator:, path:, value:)
      #   @param operator [Symbol, Courier::Models::AudienceFilter::Operator] Send to users only if they are member of the account
      #
      #   @param path [Symbol, Courier::Models::AudienceFilter::Path]
      #
      #   @param value [String]

      # Send to users only if they are member of the account
      #
      # @see Courier::Models::AudienceFilter#operator
      module Operator
        extend Courier::Internal::Type::Enum

        MEMBER_OF = :MEMBER_OF

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Courier::Models::AudienceFilter#path
      module Path
        extend Courier::Internal::Type::Enum

        ACCOUNT_ID = :account_id

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
