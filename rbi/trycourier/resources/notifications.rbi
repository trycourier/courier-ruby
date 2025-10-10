# typed: strong

module Trycourier
  module Resources
    class Notifications
      sig { returns(Trycourier::Resources::Notifications::Draft) }
      attr_reader :draft

      sig { returns(Trycourier::Resources::Notifications::Checks) }
      attr_reader :checks

      sig do
        params(
          cursor: T.nilable(String),
          notes: T.nilable(T::Boolean),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::NotificationListResponse)
      end
      def list(
        cursor: nil,
        # Retrieve the notes from the Notification template settings.
        notes: nil,
        request_options: {}
      )
      end

      sig do
        params(
          id: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::NotificationGetContent)
      end
      def retrieve_content(id, request_options: {})
      end

      # @api private
      sig { params(client: Trycourier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
