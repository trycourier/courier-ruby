# frozen_string_literal: true

module Courier
  module Models
    # Describes the content of the message in a way that will work for email, push,
    # chat, or any channel.
    module Message
      extend Courier::Internal::Type::Union

      # Describes the content of the message in a way that will work for email, push, chat, or any channel.
      variant -> { Courier::Message::ContentMessage }

      # A template for a type of message that can be sent more than once. For example, you might create an "Appointment Reminder" Notification or “Reset Password” Notifications.
      variant -> { Courier::Message::TemplateMessage }

      # @!method self.variants
      #   @return [Array(Courier::Models::Message::ContentMessage, Courier::Models::Message::TemplateMessage)]
    end
  end
end
