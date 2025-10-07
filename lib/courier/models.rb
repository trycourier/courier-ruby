# frozen_string_literal: true

module Courier
  [Courier::Internal::Type::BaseModel, *Courier::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Courier::Internal::AnyHash) } }
  end

  Courier::Internal::Util.walk_namespaces(Courier::Models).each do |mod|
    case mod
    in Courier::Internal::Type::Enum | Courier::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  Courier::Internal::Util.walk_namespaces(Courier::Models)
                         .lazy
                         .grep(Courier::Internal::Type::Union)
                         .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Audience = Courier::Models::Audience

  AudienceDeleteParams = Courier::Models::AudienceDeleteParams

  AudienceListMembersParams = Courier::Models::AudienceListMembersParams

  AudienceListParams = Courier::Models::AudienceListParams

  AudienceRetrieveParams = Courier::Models::AudienceRetrieveParams

  AudienceUpdateParams = Courier::Models::AudienceUpdateParams

  AuditEvent = Courier::Models::AuditEvent

  AuditEventListParams = Courier::Models::AuditEventListParams

  AuditEventRetrieveParams = Courier::Models::AuditEventRetrieveParams

  AuthIssueTokenParams = Courier::Models::AuthIssueTokenParams

  Automations = Courier::Models::Automations

  Brand = Courier::Models::Brand

  BrandCreateParams = Courier::Models::BrandCreateParams

  BrandDeleteParams = Courier::Models::BrandDeleteParams

  BrandListParams = Courier::Models::BrandListParams

  BrandRetrieveParams = Courier::Models::BrandRetrieveParams

  BrandSettings = Courier::Models::BrandSettings

  BrandSnippets = Courier::Models::BrandSnippets

  BrandTemplate = Courier::Models::BrandTemplate

  BrandUpdateParams = Courier::Models::BrandUpdateParams

  BulkAddUsersParams = Courier::Models::BulkAddUsersParams

  BulkCreateJobParams = Courier::Models::BulkCreateJobParams

  BulkListUsersParams = Courier::Models::BulkListUsersParams

  BulkRetrieveJobParams = Courier::Models::BulkRetrieveJobParams

  BulkRunJobParams = Courier::Models::BulkRunJobParams

  Content = Courier::Models::Content

  DefaultPreferences = Courier::Models::DefaultPreferences

  Filter = Courier::Models::Filter

  FilterConfig = Courier::Models::FilterConfig

  InboundBulkMessage = Courier::Models::InboundBulkMessage

  InboundBulkMessageUser = Courier::Models::InboundBulkMessageUser

  InboundTrackEventParams = Courier::Models::InboundTrackEventParams

  List = Courier::Models::List

  ListDeleteParams = Courier::Models::ListDeleteParams

  ListListParams = Courier::Models::ListListParams

  ListRestoreParams = Courier::Models::ListRestoreParams

  ListRetrieveParams = Courier::Models::ListRetrieveParams

  Lists = Courier::Models::Lists

  ListUpdateParams = Courier::Models::ListUpdateParams

  MessageCancelParams = Courier::Models::MessageCancelParams

  MessageContentParams = Courier::Models::MessageContentParams

  MessageContext = Courier::Models::MessageContext

  MessageDetails = Courier::Models::MessageDetails

  MessageHistoryParams = Courier::Models::MessageHistoryParams

  MessageListParams = Courier::Models::MessageListParams

  MessageRetrieveParams = Courier::Models::MessageRetrieveParams

  MessageRouting = Courier::Models::MessageRouting

  MessageRoutingChannel = Courier::Models::MessageRoutingChannel

  NestedFilterConfig = Courier::Models::NestedFilterConfig

  NotificationGetContent = Courier::Models::NotificationGetContent

  NotificationListParams = Courier::Models::NotificationListParams

  NotificationRetrieveContentParams = Courier::Models::NotificationRetrieveContentParams

  Notifications = Courier::Models::Notifications

  Paging = Courier::Models::Paging

  ProfileCreateParams = Courier::Models::ProfileCreateParams

  ProfileDeleteParams = Courier::Models::ProfileDeleteParams

  ProfileReplaceParams = Courier::Models::ProfileReplaceParams

  ProfileRetrieveParams = Courier::Models::ProfileRetrieveParams

  Profiles = Courier::Models::Profiles

  ProfileUpdateParams = Courier::Models::ProfileUpdateParams

  Recipient = Courier::Models::Recipient

  RequestArchiveParams = Courier::Models::RequestArchiveParams

  SendSendMessageParams = Courier::Models::SendSendMessageParams

  Tenant = Courier::Models::Tenant

  TenantDeleteParams = Courier::Models::TenantDeleteParams

  TenantListParams = Courier::Models::TenantListParams

  TenantListUsersParams = Courier::Models::TenantListUsersParams

  TenantRetrieveParams = Courier::Models::TenantRetrieveParams

  Tenants = Courier::Models::Tenants

  TenantUpdateParams = Courier::Models::TenantUpdateParams

  TranslationRetrieveParams = Courier::Models::TranslationRetrieveParams

  TranslationUpdateParams = Courier::Models::TranslationUpdateParams

  UserRecipient = Courier::Models::UserRecipient

  Users = Courier::Models::Users
end
