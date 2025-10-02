# frozen_string_literal: true

module Courier
  module Users
    module Tokens
      module Types
        module PatchOp
          extend Courier::Internal::Types::Enum

          REPLACE = "replace"
          ADD = "add"
          REMOVE = "remove"
          COPY = "copy"
          MOVE = "move"
          TEST = "test"
        end
      end
    end
  end
end
