# frozen_string_literal: true

module Trycourier
  [Trycourier::Internal::Type::BaseModel, *Trycourier::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Trycourier::Internal::AnyHash) } }
  end

  Trycourier::Internal::Util.walk_namespaces(Trycourier::Models).each do |mod|
    case mod
    in Trycourier::Internal::Type::Enum | Trycourier::Internal::Type::Union
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

  Trycourier::Internal::Util.walk_namespaces(Trycourier::Models)
                            .lazy
                            .grep(Trycourier::Internal::Type::Union)
                            .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Alignment = Trycourier::Models::Alignment

  Audience = Trycourier::Models::Audience

  AudienceDeleteParams = Trycourier::Models::AudienceDeleteParams

  AudienceListMembersParams = Trycourier::Models::AudienceListMembersParams

  AudienceListParams = Trycourier::Models::AudienceListParams

  AudienceRetrieveParams = Trycourier::Models::AudienceRetrieveParams

  AudienceUpdateParams = Trycourier::Models::AudienceUpdateParams

  AuditEvent = Trycourier::Models::AuditEvent

  AuditEventListParams = Trycourier::Models::AuditEventListParams

  AuditEventRetrieveParams = Trycourier::Models::AuditEventRetrieveParams

  AuthIssueTokenParams = Trycourier::Models::AuthIssueTokenParams

  AutomationInvokeResponse = Trycourier::Models::AutomationInvokeResponse

  Automations = Trycourier::Models::Automations

  BaseCheck = Trycourier::Models::BaseCheck

  BaseTemplateTenantAssociation = Trycourier::Models::BaseTemplateTenantAssociation

  Brand = Trycourier::Models::Brand

  BrandColors = Trycourier::Models::BrandColors

  BrandCreateParams = Trycourier::Models::BrandCreateParams

  BrandDeleteParams = Trycourier::Models::BrandDeleteParams

  BrandListParams = Trycourier::Models::BrandListParams

  BrandRetrieveParams = Trycourier::Models::BrandRetrieveParams

  BrandSettings = Trycourier::Models::BrandSettings

  BrandSettingsEmail = Trycourier::Models::BrandSettingsEmail

  BrandSettingsInApp = Trycourier::Models::BrandSettingsInApp

  BrandSnippet = Trycourier::Models::BrandSnippet

  BrandSnippets = Trycourier::Models::BrandSnippets

  BrandTemplate = Trycourier::Models::BrandTemplate

  BrandUpdateParams = Trycourier::Models::BrandUpdateParams

  BulkAddUsersParams = Trycourier::Models::BulkAddUsersParams

  BulkCreateJobParams = Trycourier::Models::BulkCreateJobParams

  BulkListUsersParams = Trycourier::Models::BulkListUsersParams

  BulkRetrieveJobParams = Trycourier::Models::BulkRetrieveJobParams

  BulkRunJobParams = Trycourier::Models::BulkRunJobParams

  ChannelClassification = Trycourier::Models::ChannelClassification

  ChannelPreference = Trycourier::Models::ChannelPreference

  Check = Trycourier::Models::Check

  DefaultPreferences = Trycourier::Models::DefaultPreferences

  ElementalActionNodeWithType = Trycourier::Models::ElementalActionNodeWithType

  ElementalBaseNode = Trycourier::Models::ElementalBaseNode

  ElementalChannelNode = Trycourier::Models::ElementalChannelNode

  ElementalChannelNodeWithType = Trycourier::Models::ElementalChannelNodeWithType

  ElementalContent = Trycourier::Models::ElementalContent

  ElementalContentSugar = Trycourier::Models::ElementalContentSugar

  ElementalDividerNodeWithType = Trycourier::Models::ElementalDividerNodeWithType

  ElementalImageNodeWithType = Trycourier::Models::ElementalImageNodeWithType

  ElementalMetaNodeWithType = Trycourier::Models::ElementalMetaNodeWithType

  ElementalNode = Trycourier::Models::ElementalNode

  ElementalQuoteNodeWithType = Trycourier::Models::ElementalQuoteNodeWithType

  ElementalTextNodeWithType = Trycourier::Models::ElementalTextNodeWithType

  EmailFooter = Trycourier::Models::EmailFooter

  EmailHead = Trycourier::Models::EmailHead

  EmailHeader = Trycourier::Models::EmailHeader

  Filter = Trycourier::Models::Filter

  FilterConfig = Trycourier::Models::FilterConfig

  Icons = Trycourier::Models::Icons

  InboundBulkMessage = Trycourier::Models::InboundBulkMessage

  InboundBulkMessageUser = Trycourier::Models::InboundBulkMessageUser

  InboundTrackEventParams = Trycourier::Models::InboundTrackEventParams

  ListDeleteParams = Trycourier::Models::ListDeleteParams

  ListListParams = Trycourier::Models::ListListParams

  ListRestoreParams = Trycourier::Models::ListRestoreParams

  ListRetrieveParams = Trycourier::Models::ListRetrieveParams

  Lists = Trycourier::Models::Lists

  ListUpdateParams = Trycourier::Models::ListUpdateParams

  Logo = Trycourier::Models::Logo

  MessageCancelParams = Trycourier::Models::MessageCancelParams

  MessageContentParams = Trycourier::Models::MessageContentParams

  MessageContext = Trycourier::Models::MessageContext

  MessageDetails = Trycourier::Models::MessageDetails

  MessageHistoryParams = Trycourier::Models::MessageHistoryParams

  MessageListParams = Trycourier::Models::MessageListParams

  MessageRetrieveParams = Trycourier::Models::MessageRetrieveParams

  MessageRouting = Trycourier::Models::MessageRouting

  MessageRoutingChannel = Trycourier::Models::MessageRoutingChannel

  NotificationGetContent = Trycourier::Models::NotificationGetContent

  NotificationListParams = Trycourier::Models::NotificationListParams

  NotificationPreferenceDetails = Trycourier::Models::NotificationPreferenceDetails

  NotificationRetrieveContentParams = Trycourier::Models::NotificationRetrieveContentParams

  Notifications = Trycourier::Models::Notifications

  Paging = Trycourier::Models::Paging

  Preference = Trycourier::Models::Preference

  PreferenceStatus = Trycourier::Models::PreferenceStatus

  ProfileCreateParams = Trycourier::Models::ProfileCreateParams

  ProfileDeleteParams = Trycourier::Models::ProfileDeleteParams

  ProfileReplaceParams = Trycourier::Models::ProfileReplaceParams

  ProfileRetrieveParams = Trycourier::Models::ProfileRetrieveParams

  Profiles = Trycourier::Models::Profiles

  ProfileUpdateParams = Trycourier::Models::ProfileUpdateParams

  PutSubscriptionsRecipient = Trycourier::Models::PutSubscriptionsRecipient

  Recipient = Trycourier::Models::Recipient

  RecipientPreferences = Trycourier::Models::RecipientPreferences

  RequestArchiveParams = Trycourier::Models::RequestArchiveParams

  Rule = Trycourier::Models::Rule

  SendMessageParams = Trycourier::Models::SendMessageParams

  SubscribeToListsRequestItem = Trycourier::Models::SubscribeToListsRequestItem

  SubscriptionList = Trycourier::Models::SubscriptionList

  SubscriptionTopicNew = Trycourier::Models::SubscriptionTopicNew

  Tenant = Trycourier::Models::Tenant

  TenantAssociation = Trycourier::Models::TenantAssociation

  TenantDeleteParams = Trycourier::Models::TenantDeleteParams

  TenantListParams = Trycourier::Models::TenantListParams

  TenantListUsersParams = Trycourier::Models::TenantListUsersParams

  TenantRetrieveParams = Trycourier::Models::TenantRetrieveParams

  Tenants = Trycourier::Models::Tenants

  TenantUpdateParams = Trycourier::Models::TenantUpdateParams

  TextStyle = Trycourier::Models::TextStyle

  TopicPreference = Trycourier::Models::TopicPreference

  TranslationRetrieveParams = Trycourier::Models::TranslationRetrieveParams

  TranslationUpdateParams = Trycourier::Models::TranslationUpdateParams

  UserRecipient = Trycourier::Models::UserRecipient

  Users = Trycourier::Models::Users

  UserToken = Trycourier::Models::UserToken

  Utm = Trycourier::Models::Utm

  WidgetBackground = Trycourier::Models::WidgetBackground
end
