# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Messages#retrieve
    class MessageRetrieveResponse < Courier::Models::MessageDetails
      # @!attribute providers
      #
      #   @return [Array<Hash{Symbol=>Object}>, nil]
      optional :providers,
               Courier::Internal::Type::ArrayOf[Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]],
               nil?: true

      # @!method initialize(providers: nil)
      #   @param providers [Array<Hash{Symbol=>Object}>, nil]
    end
  end
end
