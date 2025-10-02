# frozen_string_literal: true

module Courier
  module Templates
    module Types
      class ListTemplatesResponse < Internal::Types::Model
        field :paging, -> { Courier::Commons::Types::Paging }, optional: false, nullable: false
        field :results, lambda {
          Internal::Types::Array[Courier::Templates::Types::NotificationTemplates]
        }, optional: false, nullable: false
      end
    end
  end
end
