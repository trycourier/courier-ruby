# typed: strong

module Trycourier
  module Resources
    class Notifications
      class Draft
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
end
