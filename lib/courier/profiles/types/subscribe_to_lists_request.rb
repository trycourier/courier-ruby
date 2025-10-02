# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class SubscribeToListsRequest < Internal::Types::Model
        field :lists, lambda {
          Internal::Types::Array[Courier::Profiles::Types::SubscribeToListsRequestListObject]
        }, optional: false, nullable: false
      end
    end
  end
end
