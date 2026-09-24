# typed: strong

module Courier
  module Models
    module Notifications
      module Previews
        class CreatePreviewRunRequest < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Notifications::Previews::CreatePreviewRunRequest,
                Courier::Internal::AnyHash
              )
            end

          # Template variables to render with, the same shape as the `data` object on a
          # send.
          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :data

          sig { params(data: T::Hash[Symbol, T.anything]).void }
          attr_writer :data

          # The devices to render on, by `PreviewDevice.id`, for a one-off run. Mutually
          # exclusive with `device_set_id`.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :device_ids

          sig { params(device_ids: T::Array[String]).void }
          attr_writer :device_ids

          # A saved device set naming the devices to render on. Mutually exclusive with
          # `device_ids`.
          sig { returns(T.nilable(String)) }
          attr_reader :device_set_id

          sig { params(device_set_id: String).void }
          attr_writer :device_set_id

          # Render the template's content for this locale, e.g. "fr-FR".
          sig { returns(T.nilable(String)) }
          attr_reader :locale

          sig { params(locale: String).void }
          attr_writer :locale

          # Which version of the template to render. Omit for the latest saved draft, which
          # always exists and is what the editor shows. `published` renders the live
          # version; a zero-padded `v002` renders that specific publish. Versions are
          # 1-based, so `v000` is not a version, and the unpadded `v2` is rejected — that
          # spelling belongs to journeys' AutomationVersionId, a different scheme in which
          # `v0` means published.
          sig { returns(T.nilable(String)) }
          attr_reader :template_version

          sig { params(template_version: String).void }
          attr_writer :template_version

          # Request body for creating a preview run of the template in the path. Provide
          # exactly one of `device_set_id` or `device_ids`. The template is the path's
          # `{id}`; a `template_id` here is an unknown key and a 400.
          sig do
            params(
              data: T::Hash[Symbol, T.anything],
              device_ids: T::Array[String],
              device_set_id: String,
              locale: String,
              template_version: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Template variables to render with, the same shape as the `data` object on a
            # send.
            data: nil,
            # The devices to render on, by `PreviewDevice.id`, for a one-off run. Mutually
            # exclusive with `device_set_id`.
            device_ids: nil,
            # A saved device set naming the devices to render on. Mutually exclusive with
            # `device_ids`.
            device_set_id: nil,
            # Render the template's content for this locale, e.g. "fr-FR".
            locale: nil,
            # Which version of the template to render. Omit for the latest saved draft, which
            # always exists and is what the editor shows. `published` renders the live
            # version; a zero-padded `v002` renders that specific publish. Versions are
            # 1-based, so `v000` is not a version, and the unpadded `v2` is rejected — that
            # spelling belongs to journeys' AutomationVersionId, a different scheme in which
            # `v0` means published.
            template_version: nil
          )
          end

          sig do
            override.returns(
              {
                data: T::Hash[Symbol, T.anything],
                device_ids: T::Array[String],
                device_set_id: String,
                locale: String,
                template_version: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
