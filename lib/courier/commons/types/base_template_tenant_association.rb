# frozen_string_literal: true

module Courier
  module Commons
    module Types
      class BaseTemplateTenantAssociation < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :created_at, -> { String }, optional: false, nullable: false
        field :updated_at, -> { String }, optional: false, nullable: false
        field :published_at, -> { String }, optional: false, nullable: false
        field :version, -> { String }, optional: false, nullable: false
      end
    end
  end
end
