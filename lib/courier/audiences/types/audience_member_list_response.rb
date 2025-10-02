# frozen_string_literal: true

module Courier
  module Audiences
    module Types
      class AudienceMemberListResponse < Internal::Types::Model
        field :items, lambda {
          Internal::Types::Array[Courier::Audiences::Types::AudienceMember]
        }, optional: false, nullable: false
        field :paging, -> { Courier::Commons::Types::Paging }, optional: false, nullable: false
      end
    end
  end
end
