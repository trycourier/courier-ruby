# typed: strong

module Courier
  AirshipProfile = Courier::Models::AirshipProfile

  AirshipProfileAudience = Courier::Models::AirshipProfileAudience

  Alignment = Courier::Models::Alignment

  AssociatedNotificationListResponse =
    Courier::Models::AssociatedNotificationListResponse

  Audience = Courier::Models::Audience

  AudienceDeleteParams = Courier::Models::AudienceDeleteParams

  AudienceFilter = Courier::Models::AudienceFilter

  AudienceFilterConfig = Courier::Models::AudienceFilterConfig

  AudienceListMembersParams = Courier::Models::AudienceListMembersParams

  AudienceListParams = Courier::Models::AudienceListParams

  AudienceRecipient = Courier::Models::AudienceRecipient

  AudienceRetrieveParams = Courier::Models::AudienceRetrieveParams

  AudienceUpdateParams = Courier::Models::AudienceUpdateParams

  AuditEvent = Courier::Models::AuditEvent

  AuditEventListParams = Courier::Models::AuditEventListParams

  AuditEventRetrieveParams = Courier::Models::AuditEventRetrieveParams

  AuthIssueTokenParams = Courier::Models::AuthIssueTokenParams

  AutomationInvokeResponse = Courier::Models::AutomationInvokeResponse

  AutomationListParams = Courier::Models::AutomationListParams

  Automations = Courier::Models::Automations

  AutomationTemplate = Courier::Models::AutomationTemplate

  AutomationTemplateListResponse =
    Courier::Models::AutomationTemplateListResponse

  BaseCheck = Courier::Models::BaseCheck

  BaseTemplateTenantAssociation = Courier::Models::BaseTemplateTenantAssociation

  Brand = Courier::Models::Brand

  BrandColors = Courier::Models::BrandColors

  BrandCreateParams = Courier::Models::BrandCreateParams

  BrandDeleteParams = Courier::Models::BrandDeleteParams

  BrandListParams = Courier::Models::BrandListParams

  BrandRetrieveParams = Courier::Models::BrandRetrieveParams

  BrandSettings = Courier::Models::BrandSettings

  BrandSettingsEmail = Courier::Models::BrandSettingsEmail

  BrandSettingsInApp = Courier::Models::BrandSettingsInApp

  BrandSnippet = Courier::Models::BrandSnippet

  BrandSnippets = Courier::Models::BrandSnippets

  BrandTemplate = Courier::Models::BrandTemplate

  BrandUpdateParams = Courier::Models::BrandUpdateParams

  BulkAddUsersParams = Courier::Models::BulkAddUsersParams

  BulkCreateJobParams = Courier::Models::BulkCreateJobParams

  BulkListUsersParams = Courier::Models::BulkListUsersParams

  BulkRetrieveJobParams = Courier::Models::BulkRetrieveJobParams

  BulkRunJobParams = Courier::Models::BulkRunJobParams

  Channel = Courier::Models::Channel

  ChannelClassification = Courier::Models::ChannelClassification

  ChannelMetadata = Courier::Models::ChannelMetadata

  ChannelPreference = Courier::Models::ChannelPreference

  Check = Courier::Models::Check

  DefaultPreferences = Courier::Models::DefaultPreferences

  DeviceType = Courier::Models::DeviceType

  Discord = Courier::Models::Discord

  ElementalActionNodeWithType = Courier::Models::ElementalActionNodeWithType

  ElementalBaseNode = Courier::Models::ElementalBaseNode

  ElementalChannelNode = Courier::Models::ElementalChannelNode

  ElementalChannelNodeWithType = Courier::Models::ElementalChannelNodeWithType

  ElementalContent = Courier::Models::ElementalContent

  ElementalContentSugar = Courier::Models::ElementalContentSugar

  ElementalDividerNodeWithType = Courier::Models::ElementalDividerNodeWithType

  ElementalHTMLNodeWithType = Courier::Models::ElementalHTMLNodeWithType

  ElementalImageNodeWithType = Courier::Models::ElementalImageNodeWithType

  ElementalMetaNodeWithType = Courier::Models::ElementalMetaNodeWithType

  ElementalNode = Courier::Models::ElementalNode

  ElementalQuoteNodeWithType = Courier::Models::ElementalQuoteNodeWithType

  ElementalTextNodeWithType = Courier::Models::ElementalTextNodeWithType

  ElementWithChecksums = Courier::Models::ElementWithChecksums

  EmailFooter = Courier::Models::EmailFooter

  EmailHead = Courier::Models::EmailHead

  EmailHeader = Courier::Models::EmailHeader

  Expo = Courier::Models::Expo

  FilterConfig = Courier::Models::FilterConfig

  Icons = Courier::Models::Icons

  InboundBulkMessage = Courier::Models::InboundBulkMessage

  InboundBulkMessageUser = Courier::Models::InboundBulkMessageUser

  InboundTrackEventParams = Courier::Models::InboundTrackEventParams

  Intercom = Courier::Models::Intercom

  IntercomRecipient = Courier::Models::IntercomRecipient

  Journey = Courier::Models::Journey

  JourneyInvokeParams = Courier::Models::JourneyInvokeParams

  JourneyListParams = Courier::Models::JourneyListParams

  JourneysInvokeRequest = Courier::Models::JourneysInvokeRequest

  JourneysInvokeResponse = Courier::Models::JourneysInvokeResponse

  JourneysListResponse = Courier::Models::JourneysListResponse

  ListDeleteParams = Courier::Models::ListDeleteParams

  ListFilter = Courier::Models::ListFilter

  ListListParams = Courier::Models::ListListParams

  ListPatternRecipient = Courier::Models::ListPatternRecipient

  ListRecipient = Courier::Models::ListRecipient

  ListRestoreParams = Courier::Models::ListRestoreParams

  ListRetrieveParams = Courier::Models::ListRetrieveParams

  Lists = Courier::Models::Lists

  ListUpdateParams = Courier::Models::ListUpdateParams

  Logo = Courier::Models::Logo

  MessageCancelParams = Courier::Models::MessageCancelParams

  MessageChannels =
    T.let(Courier::Models::MessageChannels, Courier::Internal::Type::Converter)

  MessageContentParams = Courier::Models::MessageContentParams

  MessageContext = Courier::Models::MessageContext

  MessageDetails = Courier::Models::MessageDetails

  MessageHistoryParams = Courier::Models::MessageHistoryParams

  MessageListParams = Courier::Models::MessageListParams

  MessageProviders =
    T.let(Courier::Models::MessageProviders, Courier::Internal::Type::Converter)

  MessageProvidersType = Courier::Models::MessageProvidersType

  MessageRetrieveParams = Courier::Models::MessageRetrieveParams

  MessageRouting = Courier::Models::MessageRouting

  MessageRoutingChannel = Courier::Models::MessageRoutingChannel

  Metadata = Courier::Models::Metadata

  MsTeams = Courier::Models::MsTeams

  MsTeamsBaseProperties = Courier::Models::MsTeamsBaseProperties

  MsTeamsRecipient = Courier::Models::MsTeamsRecipient

  MultipleTokens = Courier::Models::MultipleTokens

  NotificationArchiveParams = Courier::Models::NotificationArchiveParams

  NotificationContentGetResponse =
    Courier::Models::NotificationContentGetResponse

  NotificationContentMutationResponse =
    Courier::Models::NotificationContentMutationResponse

  NotificationContentPutRequest = Courier::Models::NotificationContentPutRequest

  NotificationCreateParams = Courier::Models::NotificationCreateParams

  NotificationElementPutRequest = Courier::Models::NotificationElementPutRequest

  NotificationGetContent = Courier::Models::NotificationGetContent

  NotificationListParams = Courier::Models::NotificationListParams

  NotificationListVersionsParams =
    Courier::Models::NotificationListVersionsParams

  NotificationLocalePutRequest = Courier::Models::NotificationLocalePutRequest

  NotificationPreferenceDetails = Courier::Models::NotificationPreferenceDetails

  NotificationPublishParams = Courier::Models::NotificationPublishParams

  NotificationPutContentParams = Courier::Models::NotificationPutContentParams

  NotificationPutElementParams = Courier::Models::NotificationPutElementParams

  NotificationPutLocaleParams = Courier::Models::NotificationPutLocaleParams

  NotificationReplaceParams = Courier::Models::NotificationReplaceParams

  NotificationRetrieveContentParams =
    Courier::Models::NotificationRetrieveContentParams

  NotificationRetrieveParams = Courier::Models::NotificationRetrieveParams

  Notifications = Courier::Models::Notifications

  NotificationTemplateCreateRequest =
    Courier::Models::NotificationTemplateCreateRequest

  NotificationTemplatePayload = Courier::Models::NotificationTemplatePayload

  NotificationTemplatePublishRequest =
    Courier::Models::NotificationTemplatePublishRequest

  NotificationTemplateResponse = Courier::Models::NotificationTemplateResponse

  NotificationTemplateState = Courier::Models::NotificationTemplateState

  NotificationTemplateSummary = Courier::Models::NotificationTemplateSummary

  NotificationTemplateUpdateRequest =
    Courier::Models::NotificationTemplateUpdateRequest

  NotificationTemplateVersionListResponse =
    Courier::Models::NotificationTemplateVersionListResponse

  Pagerduty = Courier::Models::Pagerduty

  PagerdutyRecipient = Courier::Models::PagerdutyRecipient

  Paging = Courier::Models::Paging

  PostTenantTemplatePublishRequest =
    Courier::Models::PostTenantTemplatePublishRequest

  PostTenantTemplatePublishResponse =
    Courier::Models::PostTenantTemplatePublishResponse

  Preference = Courier::Models::Preference

  PreferenceStatus = Courier::Models::PreferenceStatus

  ProfileCreateParams = Courier::Models::ProfileCreateParams

  ProfileDeleteParams = Courier::Models::ProfileDeleteParams

  ProfileReplaceParams = Courier::Models::ProfileReplaceParams

  ProfileRetrieveParams = Courier::Models::ProfileRetrieveParams

  Profiles = Courier::Models::Profiles

  ProfileUpdateParams = Courier::Models::ProfileUpdateParams

  Provider = Courier::Models::Provider

  ProviderCreateParams = Courier::Models::ProviderCreateParams

  ProviderDeleteParams = Courier::Models::ProviderDeleteParams

  ProviderListParams = Courier::Models::ProviderListParams

  ProviderRetrieveParams = Courier::Models::ProviderRetrieveParams

  Providers = Courier::Models::Providers

  ProvidersCatalogEntry = Courier::Models::ProvidersCatalogEntry

  ProviderUpdateParams = Courier::Models::ProviderUpdateParams

  PutSubscriptionsRecipient = Courier::Models::PutSubscriptionsRecipient

  PutTenantTemplateRequest = Courier::Models::PutTenantTemplateRequest

  PutTenantTemplateResponse = Courier::Models::PutTenantTemplateResponse

  RecipientPreferences = Courier::Models::RecipientPreferences

  RequestArchiveParams = Courier::Models::RequestArchiveParams

  RoutingStrategyArchiveParams = Courier::Models::RoutingStrategyArchiveParams

  RoutingStrategyCreateParams = Courier::Models::RoutingStrategyCreateParams

  RoutingStrategyCreateRequest = Courier::Models::RoutingStrategyCreateRequest

  RoutingStrategyGetResponse = Courier::Models::RoutingStrategyGetResponse

  RoutingStrategyListNotificationsParams =
    Courier::Models::RoutingStrategyListNotificationsParams

  RoutingStrategyListParams = Courier::Models::RoutingStrategyListParams

  RoutingStrategyListResponse = Courier::Models::RoutingStrategyListResponse

  RoutingStrategyReplaceParams = Courier::Models::RoutingStrategyReplaceParams

  RoutingStrategyReplaceRequest = Courier::Models::RoutingStrategyReplaceRequest

  RoutingStrategyRetrieveParams = Courier::Models::RoutingStrategyRetrieveParams

  RoutingStrategySummary = Courier::Models::RoutingStrategySummary

  Rule = Courier::Models::Rule

  SendDirectMessage = Courier::Models::SendDirectMessage

  SendMessageParams = Courier::Models::SendMessageParams

  SendToChannel = Courier::Models::SendToChannel

  SendToMsTeamsChannelID = Courier::Models::SendToMsTeamsChannelID

  SendToMsTeamsChannelName = Courier::Models::SendToMsTeamsChannelName

  SendToMsTeamsConversationID = Courier::Models::SendToMsTeamsConversationID

  SendToMsTeamsEmail = Courier::Models::SendToMsTeamsEmail

  SendToMsTeamsUserID = Courier::Models::SendToMsTeamsUserID

  SendToSlackChannel = Courier::Models::SendToSlackChannel

  SendToSlackEmail = Courier::Models::SendToSlackEmail

  SendToSlackUserID = Courier::Models::SendToSlackUserID

  Slack = Courier::Models::Slack

  SlackBaseProperties = Courier::Models::SlackBaseProperties

  SlackRecipient = Courier::Models::SlackRecipient

  SubscribeToListsRequestItem = Courier::Models::SubscribeToListsRequestItem

  SubscriptionList = Courier::Models::SubscriptionList

  SubscriptionTopicNew = Courier::Models::SubscriptionTopicNew

  Tenant = Courier::Models::Tenant

  TenantAssociation = Courier::Models::TenantAssociation

  TenantDeleteParams = Courier::Models::TenantDeleteParams

  TenantListParams = Courier::Models::TenantListParams

  TenantListUsersParams = Courier::Models::TenantListUsersParams

  TenantRetrieveParams = Courier::Models::TenantRetrieveParams

  Tenants = Courier::Models::Tenants

  TenantTemplateInput = Courier::Models::TenantTemplateInput

  TenantUpdateParams = Courier::Models::TenantUpdateParams

  TextStyle = Courier::Models::TextStyle

  Timeouts = Courier::Models::Timeouts

  Token = Courier::Models::Token

  TranslationRetrieveParams = Courier::Models::TranslationRetrieveParams

  TranslationUpdateParams = Courier::Models::TranslationUpdateParams

  UserProfile = Courier::Models::UserProfile

  UserProfileFirebaseToken = Courier::Models::UserProfileFirebaseToken

  UserRecipient = Courier::Models::UserRecipient

  Users = Courier::Models::Users

  Utm = Courier::Models::Utm

  VersionNode = Courier::Models::VersionNode

  WebhookAuthentication = Courier::Models::WebhookAuthentication

  WebhookAuthMode = Courier::Models::WebhookAuthMode

  WebhookMethod = Courier::Models::WebhookMethod

  WebhookProfile = Courier::Models::WebhookProfile

  WebhookProfileType = Courier::Models::WebhookProfileType

  WebhookRecipient = Courier::Models::WebhookRecipient

  WidgetBackground = Courier::Models::WidgetBackground
end
