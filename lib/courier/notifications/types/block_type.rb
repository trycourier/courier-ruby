# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      module BlockType
        extend Courier::Internal::Types::Enum

        ACTION = "action"
        DIVIDER = "divider"
        IMAGE = "image"
        JSONNET = "jsonnet"
        LIST = "list"
        MARKDOWN = "markdown"
        QUOTE = "quote"
        TEMPLATE = "template"
        TEXT = "text"
      end
    end
  end
end
