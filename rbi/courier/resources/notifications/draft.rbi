# typed: strong

module Courier
  module Resources
    class Notifications
      class Draft
        sig do
          params(
            id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::NotificationContent)
        end
        def retrieve_content(id, request_options: {})
        end

        # @api private
        sig { params(client: Courier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
