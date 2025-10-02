# frozen_string_literal: true

module Courier
  module Brands
    module Types
      class Brand < Internal::Types::Model
        field :created, -> { Integer }, optional: false, nullable: false
        field :id, -> { String }, optional: true, nullable: false
        field :name, -> { String }, optional: false, nullable: false
        field :published, -> { Integer }, optional: false, nullable: false
        field :settings, -> { Courier::Brands::Types::BrandSettings }, optional: false, nullable: false
        field :updated, -> { Integer }, optional: false, nullable: false
        field :snippets, -> { Courier::Brands::Types::BrandSnippets }, optional: true, nullable: false
        field :version, -> { String }, optional: false, nullable: false
      end
    end
  end
end
