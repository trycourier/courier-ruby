# frozen_string_literal: true

module Courier
  module Models
    module Notifications
      module Previews
        class CreatePreviewRunRequest < Courier::Internal::Type::BaseModel
          # @!attribute data
          #   Template variables to render with, the same shape as the `data` object on a
          #   send.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

          # @!attribute device_ids
          #   The devices to render on, by `PreviewDevice.id`, for a one-off run. Mutually
          #   exclusive with `device_set_id`.
          #
          #   @return [Array<String>, nil]
          optional :device_ids, Courier::Internal::Type::ArrayOf[String]

          # @!attribute device_set_id
          #   A saved device set naming the devices to render on. Mutually exclusive with
          #   `device_ids`.
          #
          #   @return [String, nil]
          optional :device_set_id, String

          # @!attribute locale
          #   Render the template's content for this locale, e.g. "fr-FR".
          #
          #   @return [String, nil]
          optional :locale, String

          # @!attribute template_version
          #   Which version of the template to render. Omit for the latest saved draft, which
          #   always exists and is what the editor shows. `published` renders the live
          #   version; a zero-padded `v002` renders that specific publish. Versions are
          #   1-based, so `v000` is not a version, and the unpadded `v2` is rejected — that
          #   spelling belongs to journeys' AutomationVersionId, a different scheme in which
          #   `v0` means published.
          #
          #   @return [String, nil]
          optional :template_version, String

          # @!method initialize(data: nil, device_ids: nil, device_set_id: nil, locale: nil, template_version: nil)
          #   Some parameter documentations has been truncated, see
          #   {Courier::Models::Notifications::Previews::CreatePreviewRunRequest} for more
          #   details.
          #
          #   Request body for creating a preview run of the template in the path. Provide
          #   exactly one of `device_set_id` or `device_ids`. The template is the path's
          #   `{id}`; a `template_id` here is an unknown key and a 400.
          #
          #   @param data [Hash{Symbol=>Object}] Template variables to render with, the same shape as the `data` object on a send
          #
          #   @param device_ids [Array<String>] The devices to render on, by `PreviewDevice.id`, for a one-off run. Mutually exc
          #
          #   @param device_set_id [String] A saved device set naming the devices to render on. Mutually exclusive with `dev
          #
          #   @param locale [String] Render the template's content for this locale, e.g. "fr-FR".
          #
          #   @param template_version [String] Which version of the template to render. Omit for the latest saved draft, which
        end
      end
    end
  end
end
