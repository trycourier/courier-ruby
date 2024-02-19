# frozen_string_literal: true

module Courier
  module Users
    class Tokens
      # @type [TOKEN_STATUS]
      TOKEN_STATUS = { active: "active", unknown: "unknown", failed: "failed", revoked: "revoked" }.freeze
    end
  end
end
