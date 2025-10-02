# frozen_string_literal: true

module Courier
  module Messages
    module Types
      class ListMessagesResponse < Internal::Types::Model
        field :paging, -> { Courier::Commons::Types::Paging }, optional: false, nullable: false
        field :results, lambda {
          Internal::Types::Array[Courier::Messages::Types::MessageDetails]
        }, optional: false, nullable: false
      end
    end
  end
end
