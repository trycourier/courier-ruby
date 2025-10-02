# frozen_string_literal: true

module Courier
  module Users
    module Tokens
      module Types
        class Device < Internal::Types::Model
          field :app_id, -> { String }, optional: true, nullable: false
          field :ad_id, -> { String }, optional: true, nullable: false
          field :device_id, -> { String }, optional: true, nullable: false
          field :platform, -> { String }, optional: true, nullable: false
          field :manufacturer, -> { String }, optional: true, nullable: false
          field :model, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
