# frozen_string_literal: true

module Courier
  module Audiences
    module Types
      class AudienceMemberGetResponse < Internal::Types::Model
        field :audience_member, -> { Courier::Audiences::Types::AudienceMember }, optional: false, nullable: false
      end
    end
  end
end
