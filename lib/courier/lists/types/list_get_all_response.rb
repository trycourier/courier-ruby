# frozen_string_literal: true

module Courier
  module Lists
    module Types
      class ListGetAllResponse < Internal::Types::Model
        field :paging, -> { Courier::Commons::Types::Paging }, optional: false, nullable: false
        field :items, -> { Internal::Types::Array[Courier::Lists::Types::List] }, optional: false, nullable: false
      end
    end
  end
end
