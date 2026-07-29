# typed: strong

module Courier
  module Resources
    # Store and retrieve the translation strings Courier uses to render localized
    # template content.
    class Translations
      # Returns the translation strings stored for one domain and locale, for use in
      # localized notification content.
      sig do
        params(
          locale: String,
          domain: String,
          request_options: Courier::RequestOptions::OrHash
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

      # Uploads the translation strings for one domain and locale. Courier uses them to
      # render localized content for recipients in that locale.
      sig do
        params(
          locale: String,
          domain: String,
          body: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def update(
        # Path param: The locale you want to retrieve the translations for
        locale,
        # Path param: The domain you want to retrieve translations for. Only `default` is
        # supported at the moment
        domain:,
        # Body param
        body:,
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
