# frozen_string_literal: true

module Courier
  module Send
    module Types
      # The meta element contains information describing the notification that may
      # be used by a particular channel or provider. One important field is the title
      # field which will be used as the title for channels that support it.
      class ElementalMetaNode < Internal::Types::Model
        field :title, -> { String }, optional: true, nullable: false
      end
    end
  end
end
