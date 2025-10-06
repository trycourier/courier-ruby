# frozen_string_literal: true

module Courier
  module Resources
    class Translations
      # Some parameter documentations has been truncated, see
      # {Courier::Models::TranslationRetrieveParams} for more details.
      #
      # Get translations by locale
      #
      # @overload retrieve(locale, domain:, request_options: {})
      #
      # @param locale [String] The locale you want to retrieve the translations for
      #
      # @param domain [String] The domain you want to retrieve translations for. Only `default` is supported at
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [String]
      #
      # @see Courier::Models::TranslationRetrieveParams
      def retrieve(locale, params)
        parsed, options = Courier::TranslationRetrieveParams.dump_request(params)
        domain =
          parsed.delete(:domain) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :get,
          path: ["translations/%1$s/%2$s", domain, locale],
          model: String,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::TranslationUpdateParams} for more details.
      #
      # Update a translation
      #
      # @overload update(locale, domain:, body:, request_options: {})
      #
      # @param locale [String] Path param: The locale you want to retrieve the translations for
      #
      # @param domain [String] Path param: The domain you want to retrieve translations for. Only `default` is
      #
      # @param body [String] Body param:
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::TranslationUpdateParams
      def update(locale, params)
        parsed, options = Courier::TranslationUpdateParams.dump_request(params)
        domain =
          parsed.delete(:domain) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :put,
          path: ["translations/%1$s/%2$s", domain, locale],
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
