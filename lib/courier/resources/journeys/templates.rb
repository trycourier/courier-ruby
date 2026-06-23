# frozen_string_literal: true

module Courier
  module Resources
    class Journeys
      class Templates
        # Create a notification template scoped to this journey. Defaults to `DRAFT`
        # state; pass `state: "PUBLISHED"` to publish on create.
        #
        # @overload create(template_id, channel:, notification:, provider_key: nil, state: nil, request_options: {})
        #
        # @param template_id [String] Journey id
        #
        # @param channel [String]
        #
        # @param notification [Courier::Models::JourneyTemplateCreateRequest::Notification]
        #
        # @param provider_key [String]
        #
        # @param state [String]
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::JourneyTemplateGetResponse]
        #
        # @see Courier::Models::Journeys::TemplateCreateParams
        def create(template_id, params)
          parsed, options = Courier::Journeys::TemplateCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["journeys/%1$s/templates", template_id],
            body: parsed,
            model: Courier::JourneyTemplateGetResponse,
            options: options
          )
        end

        # Fetch a journey-scoped notification template by id. Pass `?version=draft`
        # (default `published`) to retrieve the working draft, or `?version=vN` for a
        # historical version.
        #
        # @overload retrieve(notification_id, template_id:, request_options: {})
        #
        # @param notification_id [String] Notification template id
        #
        # @param template_id [String] Journey id
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::JourneyTemplateGetResponse]
        #
        # @see Courier::Models::Journeys::TemplateRetrieveParams
        def retrieve(notification_id, params)
          parsed, options = Courier::Journeys::TemplateRetrieveParams.dump_request(params)
          template_id =
            parsed.delete(:template_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["journeys/%1$s/templates/%2$s", template_id, notification_id],
            model: Courier::JourneyTemplateGetResponse,
            options: options
          )
        end

        # List notification templates scoped to this journey. Journey-scoped notification
        # templates can only be referenced from `send` nodes within the same journey.
        #
        # @overload list(template_id, cursor: nil, limit: nil, request_options: {})
        #
        # @param template_id [String] Journey id
        #
        # @param cursor [String] Pagination cursor from a prior response.
        #
        # @param limit [Integer] Page size. Minimum 1, maximum 100.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::JourneyTemplateListResponse]
        #
        # @see Courier::Models::Journeys::TemplateListParams
        def list(template_id, params = {})
          parsed, options = Courier::Journeys::TemplateListParams.dump_request(params)
          query = Courier::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["journeys/%1$s/templates", template_id],
            query: query,
            model: Courier::JourneyTemplateListResponse,
            options: options
          )
        end

        # Archive the journey-scoped notification template. Archived templates cannot be
        # sent.
        #
        # @overload archive(notification_id, template_id:, request_options: {})
        #
        # @param notification_id [String] Notification template id
        #
        # @param template_id [String] Journey id
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Journeys::TemplateArchiveParams
        def archive(notification_id, params)
          parsed, options = Courier::Journeys::TemplateArchiveParams.dump_request(params)
          template_id =
            parsed.delete(:template_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["journeys/%1$s/templates/%2$s", template_id, notification_id],
            model: NilClass,
            options: options
          )
        end

        # List published versions of the journey-scoped notification template, ordered
        # most recent first.
        #
        # @overload list_versions(notification_id, template_id:, request_options: {})
        #
        # @param notification_id [String] Notification template id
        #
        # @param template_id [String] Journey id
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::NotificationTemplateVersionListResponse]
        #
        # @see Courier::Models::Journeys::TemplateListVersionsParams
        def list_versions(notification_id, params)
          parsed, options = Courier::Journeys::TemplateListVersionsParams.dump_request(params)
          template_id =
            parsed.delete(:template_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["journeys/%1$s/templates/%2$s/versions", template_id, notification_id],
            model: Courier::NotificationTemplateVersionListResponse,
            options: options
          )
        end

        # Publish the current draft of the journey-scoped notification template as a new
        # version. Optionally roll back to a prior version by passing
        # `{ "version": "vN" }`.
        #
        # @overload publish(notification_id, template_id:, version: nil, request_options: {})
        #
        # @param notification_id [String] Path param: Notification template id
        #
        # @param template_id [String] Path param: Journey id
        #
        # @param version [String] Body param
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Journeys::TemplatePublishParams
        def publish(notification_id, params)
          parsed, options = Courier::Journeys::TemplatePublishParams.dump_request(params)
          template_id =
            parsed.delete(:template_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["journeys/%1$s/templates/%2$s/publish", template_id, notification_id],
            body: parsed,
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Journeys::TemplatePutContentParams} for more details.
        #
        # Replace the elemental content of a journey-scoped notification template.
        # Overwrites all elements in the template draft with the provided content.
        #
        # @overload put_content(notification_id, template_id:, content:, state: nil, request_options: {})
        #
        # @param notification_id [String] Path param: Notification template id
        #
        # @param template_id [String] Path param: Journey id
        #
        # @param content [Courier::Models::NotificationContentPutRequest::Content] Body param: Elemental content payload. The server defaults `version` when omitte
        #
        # @param state [Symbol, Courier::Models::NotificationTemplateState] Body param: Template state. Defaults to `DRAFT`.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::NotificationContentMutationResponse]
        #
        # @see Courier::Models::Journeys::TemplatePutContentParams
        def put_content(notification_id, params)
          parsed, options = Courier::Journeys::TemplatePutContentParams.dump_request(params)
          template_id =
            parsed.delete(:template_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["journeys/%1$s/templates/%2$s/content", template_id, notification_id],
            body: parsed,
            model: Courier::NotificationContentMutationResponse,
            options: options
          )
        end

        # Set locale-specific content overrides for a journey-scoped notification
        # template. Each element override must reference an existing element by ID.
        #
        # @overload put_locale(locale_id, template_id:, notification_id:, elements:, state: nil, request_options: {})
        #
        # @param locale_id [String] Path param: Locale code (e.g., `es`, `fr`, `pt-BR`).
        #
        # @param template_id [String] Path param: Journey id
        #
        # @param notification_id [String] Path param: Notification template id
        #
        # @param elements [Array<Courier::Models::NotificationLocalePutRequest::Element>] Body param: Elements with locale-specific content overrides.
        #
        # @param state [Symbol, Courier::Models::NotificationTemplateState] Body param: Template state. Defaults to `DRAFT`.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::NotificationContentMutationResponse]
        #
        # @see Courier::Models::Journeys::TemplatePutLocaleParams
        def put_locale(locale_id, params)
          parsed, options = Courier::Journeys::TemplatePutLocaleParams.dump_request(params)
          template_id =
            parsed.delete(:template_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          notification_id =
            parsed.delete(:notification_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["journeys/%1$s/templates/%2$s/locales/%3$s", template_id, notification_id, locale_id],
            body: parsed,
            model: Courier::NotificationContentMutationResponse,
            options: options
          )
        end

        # Replace the journey-scoped notification template draft.
        #
        # @overload replace(notification_id, template_id:, notification:, state: nil, request_options: {})
        #
        # @param notification_id [String] Path param: Notification template id
        #
        # @param template_id [String] Path param: Journey id
        #
        # @param notification [Courier::Models::JourneyTemplateReplaceRequest::Notification] Body param
        #
        # @param state [String] Body param
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::JourneyTemplateGetResponse]
        #
        # @see Courier::Models::Journeys::TemplateReplaceParams
        def replace(notification_id, params)
          parsed, options = Courier::Journeys::TemplateReplaceParams.dump_request(params)
          template_id =
            parsed.delete(:template_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["journeys/%1$s/templates/%2$s", template_id, notification_id],
            body: parsed,
            model: Courier::JourneyTemplateGetResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Journeys::TemplateRetrieveContentParams} for more details.
        #
        # Retrieve the elemental content of a journey-scoped notification template. The
        # response contains the versioned elements along with their content checksums,
        # which can be used to detect changes between versions. Pass `?version=draft`
        # (default `published`) to retrieve the working draft, or `?version=vN` for a
        # historical version.
        #
        # @overload retrieve_content(notification_id, template_id:, version: nil, request_options: {})
        #
        # @param notification_id [String] Path param: Notification template id
        #
        # @param template_id [String] Path param: Journey id
        #
        # @param version [String] Query param: Accepts `draft`, `published`, or a version string (e.g., `v001`). D
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::NotificationContentGetResponse]
        #
        # @see Courier::Models::Journeys::TemplateRetrieveContentParams
        def retrieve_content(notification_id, params)
          parsed, options = Courier::Journeys::TemplateRetrieveContentParams.dump_request(params)
          query = Courier::Internal::Util.encode_query_params(parsed)
          template_id =
            parsed.delete(:template_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["journeys/%1$s/templates/%2$s/content", template_id, notification_id],
            query: query,
            model: Courier::NotificationContentGetResponse,
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
end
