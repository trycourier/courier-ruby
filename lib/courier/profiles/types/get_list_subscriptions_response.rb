# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class GetListSubscriptionsResponse < Internal::Types::Model
        field :paging, -> { Courier::Commons::Types::Paging }, optional: false, nullable: false
        field :results, lambda {
          Internal::Types::Array[Courier::Profiles::Types::GetListSubscriptionsList]
        }, optional: false, nullable: false
      end
    end
  end
end
