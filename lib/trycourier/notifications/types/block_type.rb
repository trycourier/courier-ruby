# frozen_string_literal: true

module Courier
  class Notifications
    # @type [BLOCK_TYPE]
    BLOCK_TYPE = {
      action: "action",
      divider: "divider",
      image: "image",
      jsonnet: "jsonnet",
      list: "list",
      markdown: "markdown",
      quote: "quote",
      template: "template",
      text: "text"
    }.freeze
  end
end
