# typed: strong

module Courier
  module Resources
    # Invoke a stored automation template or an ad hoc automation defined in the
    # request.
    class Automations
      # Invoke a stored automation template or an ad hoc automation defined in the
      # request.
      sig { returns(Courier::Resources::Automations::Invoke) }
      attr_reader :invoke

      # Invoke a stored automation template or an ad hoc automation defined in the
      # request.
      sig { returns(Courier::Resources::Automations::Runs) }
      attr_reader :runs

      # Lists the workspace's saved automation templates, each with its id and a cursor
      # for paging to the next page of results.
      sig do
        params(
          cursor: String,
          version: Courier::AutomationListParams::Version::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::AutomationTemplateListResponse)
      end
      def list(
        # A cursor token for pagination. Use the cursor from the previous response to
        # fetch the next page of results.
        cursor: nil,
        # The version of templates to retrieve. Accepted values are published (for
        # published templates) or draft (for draft templates). Defaults to published.
        version: nil,
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
