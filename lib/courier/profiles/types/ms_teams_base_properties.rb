# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class MsTeamsBaseProperties < Internal::Types::Model
        field :tenant_id, -> { String }, optional: false, nullable: false
        field :service_url, -> { String }, optional: false, nullable: false
      end
    end
  end
end
