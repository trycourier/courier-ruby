# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Bulk#add_users
    class BulkAddUsersParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute users
      #
      #   @return [Array<Courier::Models::InboundBulkMessageUser>]
      required :users, -> { Courier::Internal::Type::ArrayOf[Courier::InboundBulkMessageUser] }

      # @!method initialize(users:, request_options: {})
      #   @param users [Array<Courier::Models::InboundBulkMessageUser>]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
