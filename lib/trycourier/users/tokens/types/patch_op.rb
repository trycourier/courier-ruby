# frozen_string_literal: true

module Courier
  module Users
    class Tokens
      # @type [PATCH_OP]
      PATCH_OP = { replace: "replace", add: "add", remove: "remove", copy: "copy", move: "move", test: "test" }.freeze
    end
  end
end
