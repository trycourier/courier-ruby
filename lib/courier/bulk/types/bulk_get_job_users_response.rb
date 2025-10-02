# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      class BulkGetJobUsersResponse < Internal::Types::Model
        field :items, lambda {
          Internal::Types::Array[Courier::Bulk::Types::BulkMessageUserResponse]
        }, optional: false, nullable: false
        field :paging, -> { Courier::Commons::Types::Paging }, optional: false, nullable: false
      end
    end
  end
end
