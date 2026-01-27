# typed: strong

module Courier
  module Resources
    class Requests
      # Archive message
      sig do
        params(
          request_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def archive(
        # A unique identifier representing the request ID
        request_id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
