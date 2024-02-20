# frozen_string_literal: true

require_relative "test_helper"
require "trycourier"

# Basic Courier tests
class TestCourier < Minitest::Test
  def test_function
    Courier::Client.new
  end
end
