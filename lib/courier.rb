# frozen_string_literal: true

# Standard libraries.
# rubocop:disable Lint/RedundantRequireStatement
require "English"
require "cgi"
require "date"
require "erb"
require "etc"
require "json"
require "net/http"
require "pathname"
require "rbconfig"
require "securerandom"
require "set"
require "stringio"
require "time"
require "uri"
# rubocop:enable Lint/RedundantRequireStatement

# We already ship the preferred sorbet manifests in the package itself.
# `tapioca` currently does not offer us a way to opt out of unnecessary compilation.
if Object.const_defined?(:Tapioca) &&
   caller.chain([$PROGRAM_NAME]).chain(ARGV).any?(/tapioca/) &&
   ARGV.none?(/dsl/)
  return
end

# Gems.
require "connection_pool"

# Package files.
require_relative "courier/version"
require_relative "courier/internal/util"
require_relative "courier/internal/type/converter"
require_relative "courier/internal/type/unknown"
require_relative "courier/internal/type/boolean"
require_relative "courier/internal/type/file_input"
require_relative "courier/internal/type/enum"
require_relative "courier/internal/type/union"
require_relative "courier/internal/type/array_of"
require_relative "courier/internal/type/hash_of"
require_relative "courier/internal/type/base_model"
require_relative "courier/internal/type/base_page"
require_relative "courier/internal/type/request_parameters"
require_relative "courier/internal"
require_relative "courier/request_options"
require_relative "courier/file_part"
require_relative "courier/errors"
require_relative "courier/internal/transport/base_client"
require_relative "courier/internal/transport/pooled_net_requester"
require_relative "courier/client"
require_relative "courier/models/elemental_group_node"
require_relative "courier/models/elemental_channel_node"
require_relative "courier/models/elemental_node"
require_relative "courier/models/message_context"
require_relative "courier/models/message_routing"
require_relative "courier/models/message_routing_channel"
require_relative "courier/models/preference"
require_relative "courier/models/recipient"
require_relative "courier/models/send_message_params"
require_relative "courier/models/send_message_response"
require_relative "courier/models/utm"
require_relative "courier/models"
require_relative "courier/resources/send"
