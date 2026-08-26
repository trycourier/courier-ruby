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

  AirshipProfile = Courier::Models::AirshipProfile

  AirshipProfileAudience = Courier::Models::AirshipProfileAudience

  Alignment = Courier::Models::Alignment

  Apn = Courier::Models::Apn

  AssociatedNotificationListResponse = Courier::Models::AssociatedNotificationListResponse

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

  AutomationRunListItem = Courier::Models::AutomationRunListItem

  AutomationRunListResponse = Courier::Models::AutomationRunListResponse

  AutomationRunStep = Courier::Models::AutomationRunStep

  AutomationRunStepsResponse = Courier::Models::AutomationRunStepsResponse

  Automations = Courier::Models::Automations

  AutomationTemplate = Courier::Models::AutomationTemplate

  AutomationTemplateListResponse = Courier::Models::AutomationTemplateListResponse

  AwsSns = Courier::Models::AwsSns

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

  Broadcast = Courier::Models::Broadcast

  BroadcastArchiveParams = Courier::Models::BroadcastArchiveParams

  BroadcastCancelParams = Courier::Models::BroadcastCancelParams

  BroadcastCreateParams = Courier::Models::BroadcastCreateParams

  BroadcastDuplicateParams = Courier::Models::BroadcastDuplicateParams

  BroadcastListParams = Courier::Models::BroadcastListParams

  BroadcastListResponse = Courier::Models::BroadcastListResponse

  BroadcastPutContentParams = Courier::Models::BroadcastPutContentParams

  BroadcastRetrieveContentParams = Courier::Models::BroadcastRetrieveContentParams

  BroadcastRetrieveParams = Courier::Models::BroadcastRetrieveParams

  BroadcastSchedule = Courier::Models::BroadcastSchedule

  BroadcastScheduleParams = Courier::Models::BroadcastScheduleParams

  BroadcastSendParams = Courier::Models::BroadcastSendParams

  BroadcastUpdateParams = Courier::Models::BroadcastUpdateParams

  BulkAddUsersParams = Courier::Models::BulkAddUsersParams

  BulkCreateJobParams = Courier::Models::BulkCreateJobParams

  BulkListUsersParams = Courier::Models::BulkListUsersParams

  BulkRetrieveJobParams = Courier::Models::BulkRetrieveJobParams

  BulkRunJobParams = Courier::Models::BulkRunJobParams

  CancelJourneyRequest = Courier::Models::CancelJourneyRequest

  CancelJourneyResponse = Courier::Models::CancelJourneyResponse

  Channel = Courier::Models::Channel

  ChannelClassification = Courier::Models::ChannelClassification

  ChannelMetadata = Courier::Models::ChannelMetadata

  ChannelPreference = Courier::Models::ChannelPreference

  Check = Courier::Models::Check

  CreateBroadcastRequest = Courier::Models::CreateBroadcastRequest

  CreateJourneyRequest = Courier::Models::CreateJourneyRequest

  DefaultPreferences = Courier::Models::DefaultPreferences

  DeviceType = Courier::Models::DeviceType

  DigestCategory = Courier::Models::DigestCategory

  DigestInstance = Courier::Models::DigestInstance

  DigestInstanceListResponse = Courier::Models::DigestInstanceListResponse

  Digests = Courier::Models::Digests

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

  JourneyAINode = Courier::Models::JourneyAINode

  JourneyAPIInvokeTriggerNode = Courier::Models::JourneyAPIInvokeTriggerNode

  JourneyArchiveParams = Courier::Models::JourneyArchiveParams

  JourneyAudienceTriggerNode = Courier::Models::JourneyAudienceTriggerNode

  JourneyCancelParams = Courier::Models::JourneyCancelParams

  # @type [Courier::Internal::Type::Converter]
  JourneyConditionAtom = Courier::Models::JourneyConditionAtom

  JourneyConditionGroup = Courier::Models::JourneyConditionGroup

  JourneyConditionNestedGroup = Courier::Models::JourneyConditionNestedGroup

  JourneyConditionsField = Courier::Models::JourneyConditionsField

  JourneyCreateParams = Courier::Models::JourneyCreateParams

  JourneyDelayDurationNode = Courier::Models::JourneyDelayDurationNode

  JourneyDelayUntilNode = Courier::Models::JourneyDelayUntilNode

  JourneyExitNode = Courier::Models::JourneyExitNode

  JourneyExperiment = Courier::Models::JourneyExperiment

  JourneyExperimentVariant = Courier::Models::JourneyExperimentVariant

  JourneyFetchGetDeleteNode = Courier::Models::JourneyFetchGetDeleteNode

  JourneyFetchPostPutNode = Courier::Models::JourneyFetchPostPutNode

  JourneyInvokeParams = Courier::Models::JourneyInvokeParams

  JourneyListParams = Courier::Models::JourneyListParams

  JourneyListVersionsParams = Courier::Models::JourneyListVersionsParams

  JourneyMergeStrategy = Courier::Models::JourneyMergeStrategy

  JourneyNode = Courier::Models::JourneyNode

  JourneyPublishParams = Courier::Models::JourneyPublishParams

  JourneyPublishRequest = Courier::Models::JourneyPublishRequest

  JourneyReplaceParams = Courier::Models::JourneyReplaceParams

  JourneyResponse = Courier::Models::JourneyResponse

  JourneyRetrieveParams = Courier::Models::JourneyRetrieveParams

  JourneyRun = Courier::Models::JourneyRun

  JourneyRunListItem = Courier::Models::JourneyRunListItem

  JourneyRunListResponse = Courier::Models::JourneyRunListResponse

  JourneyRunResponse = Courier::Models::JourneyRunResponse

  JourneyRunStep = Courier::Models::JourneyRunStep

  JourneyRunStepsResponse = Courier::Models::JourneyRunStepsResponse

  Journeys = Courier::Models::Journeys

  JourneySegmentTriggerNode = Courier::Models::JourneySegmentTriggerNode

  JourneySendNode = Courier::Models::JourneySendNode

  JourneysInvokeRequest = Courier::Models::JourneysInvokeRequest

  JourneysInvokeResponse = Courier::Models::JourneysInvokeResponse

  JourneysListResponse = Courier::Models::JourneysListResponse

  JourneyState = Courier::Models::JourneyState

  JourneyTemplateCreateRequest = Courier::Models::JourneyTemplateCreateRequest

  JourneyTemplateGetResponse = Courier::Models::JourneyTemplateGetResponse

  JourneyTemplateListResponse = Courier::Models::JourneyTemplateListResponse

  JourneyTemplatePublishRequest = Courier::Models::JourneyTemplatePublishRequest

  JourneyTemplateReplaceRequest = Courier::Models::JourneyTemplateReplaceRequest

  JourneyTemplateSummary = Courier::Models::JourneyTemplateSummary

  JourneyThrottleDynamicNode = Courier::Models::JourneyThrottleDynamicNode

  JourneyThrottleStaticNode = Courier::Models::JourneyThrottleStaticNode

  JourneyVersionItem = Courier::Models::JourneyVersionItem

  JourneyVersionsListResponse = Courier::Models::JourneyVersionsListResponse

  JourneyWebhookTriggerNode = Courier::Models::JourneyWebhookTriggerNode

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

  # @type [Courier::Internal::Type::Converter]
  MessageChannels = Courier::Models::MessageChannels

  MessageContentParams = Courier::Models::MessageContentParams

  MessageContext = Courier::Models::MessageContext

  MessageDetails = Courier::Models::MessageDetails

  MessageHistoryParams = Courier::Models::MessageHistoryParams

  MessageListParams = Courier::Models::MessageListParams

  # @type [Courier::Internal::Type::Converter]
  MessageProviders = Courier::Models::MessageProviders

  MessageProvidersType = Courier::Models::MessageProvidersType

  MessageResendParams = Courier::Models::MessageResendParams

  MessageRetrieveParams = Courier::Models::MessageRetrieveParams

  MessageRouting = Courier::Models::MessageRouting

  MessageRoutingChannel = Courier::Models::MessageRoutingChannel

  Metadata = Courier::Models::Metadata

  MsTeams = Courier::Models::MsTeams

  MsTeamsBaseProperties = Courier::Models::MsTeamsBaseProperties

  MsTeamsRecipient = Courier::Models::MsTeamsRecipient

  MultipleTokens = Courier::Models::MultipleTokens

  NotificationArchiveParams = Courier::Models::NotificationArchiveParams

  NotificationContentGetResponse = Courier::Models::NotificationContentGetResponse

  NotificationContentMutationResponse = Courier::Models::NotificationContentMutationResponse

  NotificationContentPutRequest = Courier::Models::NotificationContentPutRequest

  NotificationCreateParams = Courier::Models::NotificationCreateParams

  NotificationElementPutRequest = Courier::Models::NotificationElementPutRequest

  NotificationGetContent = Courier::Models::NotificationGetContent

  NotificationGetMetricsParams = Courier::Models::NotificationGetMetricsParams

  NotificationListParams = Courier::Models::NotificationListParams

  NotificationListVersionsParams = Courier::Models::NotificationListVersionsParams

  NotificationLocalePutRequest = Courier::Models::NotificationLocalePutRequest

  NotificationMetricsResponse = Courier::Models::NotificationMetricsResponse

  NotificationPreferenceDetails = Courier::Models::NotificationPreferenceDetails

  NotificationPublishParams = Courier::Models::NotificationPublishParams

  NotificationPutContentParams = Courier::Models::NotificationPutContentParams

  NotificationPutElementParams = Courier::Models::NotificationPutElementParams

  NotificationPutLocaleParams = Courier::Models::NotificationPutLocaleParams

  NotificationReplaceParams = Courier::Models::NotificationReplaceParams

  NotificationRetrieveContentParams = Courier::Models::NotificationRetrieveContentParams

  NotificationRetrieveParams = Courier::Models::NotificationRetrieveParams

  Notifications = Courier::Models::Notifications

  NotificationTemplateAlias = Courier::Models::NotificationTemplateAlias

  NotificationTemplateCreateRequest = Courier::Models::NotificationTemplateCreateRequest

  NotificationTemplatePayload = Courier::Models::NotificationTemplatePayload

  NotificationTemplatePublishRequest = Courier::Models::NotificationTemplatePublishRequest

  NotificationTemplateResponse = Courier::Models::NotificationTemplateResponse

  NotificationTemplateState = Courier::Models::NotificationTemplateState

  NotificationTemplateSummary = Courier::Models::NotificationTemplateSummary

  NotificationTemplateUpdateRequest = Courier::Models::NotificationTemplateUpdateRequest

  NotificationTemplateVersionListResponse = Courier::Models::NotificationTemplateVersionListResponse

  NotificationTemplateWritePayload = Courier::Models::NotificationTemplateWritePayload

  Pagerduty = Courier::Models::Pagerduty

  PagerdutyRecipient = Courier::Models::PagerdutyRecipient

  Paging = Courier::Models::Paging

  PostTenantTemplatePublishRequest = Courier::Models::PostTenantTemplatePublishRequest

  PostTenantTemplatePublishResponse = Courier::Models::PostTenantTemplatePublishResponse

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

  PublishPreferencesRequest = Courier::Models::PublishPreferencesRequest

  PublishPreferencesResponse = Courier::Models::PublishPreferencesResponse

  PutSubscriptionsRecipient = Courier::Models::PutSubscriptionsRecipient

  PutTenantTemplateRequest = Courier::Models::PutTenantTemplateRequest

  PutTenantTemplateResponse = Courier::Models::PutTenantTemplateResponse

  RecipientPreferences = Courier::Models::RecipientPreferences

  RequestArchiveParams = Courier::Models::RequestArchiveParams

  RoutingStrategyArchiveParams = Courier::Models::RoutingStrategyArchiveParams

  RoutingStrategyCreateParams = Courier::Models::RoutingStrategyCreateParams

  RoutingStrategyCreateRequest = Courier::Models::RoutingStrategyCreateRequest

  RoutingStrategyGetResponse = Courier::Models::RoutingStrategyGetResponse

  RoutingStrategyListNotificationsParams = Courier::Models::RoutingStrategyListNotificationsParams

  RoutingStrategyListParams = Courier::Models::RoutingStrategyListParams

  RoutingStrategyListResponse = Courier::Models::RoutingStrategyListResponse

  RoutingStrategyReplaceParams = Courier::Models::RoutingStrategyReplaceParams

  RoutingStrategyReplaceRequest = Courier::Models::RoutingStrategyReplaceRequest

  RoutingStrategyRetrieveParams = Courier::Models::RoutingStrategyRetrieveParams

  RoutingStrategySummary = Courier::Models::RoutingStrategySummary

  Rule = Courier::Models::Rule

  ScheduleBroadcastRequest = Courier::Models::ScheduleBroadcastRequest

  SendBroadcastRequest = Courier::Models::SendBroadcastRequest

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

  UpdateBroadcastRequest = Courier::Models::UpdateBroadcastRequest

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

  WorkspacePreferenceArchiveParams = Courier::Models::WorkspacePreferenceArchiveParams

  WorkspacePreferenceCreateParams = Courier::Models::WorkspacePreferenceCreateParams

  WorkspacePreferenceCreateRequest = Courier::Models::WorkspacePreferenceCreateRequest

  WorkspacePreferenceGetResponse = Courier::Models::WorkspacePreferenceGetResponse

  WorkspacePreferenceListParams = Courier::Models::WorkspacePreferenceListParams

  WorkspacePreferenceListResponse = Courier::Models::WorkspacePreferenceListResponse

  WorkspacePreferencePublishParams = Courier::Models::WorkspacePreferencePublishParams

  WorkspacePreferenceReplaceParams = Courier::Models::WorkspacePreferenceReplaceParams

  WorkspacePreferenceReplaceRequest = Courier::Models::WorkspacePreferenceReplaceRequest

  WorkspacePreferenceRetrieveParams = Courier::Models::WorkspacePreferenceRetrieveParams

  WorkspacePreferences = Courier::Models::WorkspacePreferences

  WorkspacePreferenceTopicCreateRequest = Courier::Models::WorkspacePreferenceTopicCreateRequest

  WorkspacePreferenceTopicGetResponse = Courier::Models::WorkspacePreferenceTopicGetResponse

  WorkspacePreferenceTopicListResponse = Courier::Models::WorkspacePreferenceTopicListResponse

  WorkspacePreferenceTopicReplaceRequest = Courier::Models::WorkspacePreferenceTopicReplaceRequest
end
