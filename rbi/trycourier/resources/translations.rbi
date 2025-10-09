# typed: strong

module Trycourier
  module Resources
    class Translations
      # Get translations by locale
      sig do
        params(
          locale: String,
          domain: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(String)
      end
      def retrieve(
        # The locale you want to retrieve the translations for
        locale,
        # The domain you want to retrieve translations for. Only `default` is supported at
        # the moment
        domain:,
        request_options: {}
      )
      end

      # Update a translation
      sig do
        params(
          locale: String,
          domain: String,
          body: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).void
      end
      def update(
        # Path param: The locale you want to retrieve the translations for
        locale,
        # Path param: The domain you want to retrieve translations for. Only `default` is
        # supported at the moment
        domain:,
        # Body param:
        body:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Trycourier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
