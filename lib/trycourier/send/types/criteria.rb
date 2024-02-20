# frozen_string_literal: true

module Courier
  class Send
    # @type [CRITERIA]
    CRITERIA = { no_escalation: "no-escalation", delivered: "delivered", viewed: "viewed", engaged: "engaged" }.freeze
  end
end
