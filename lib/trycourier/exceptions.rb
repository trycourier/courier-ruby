require "trycourier/version"
require "net/http"
require "json"
require "openssl"

module Courier
  #ResponseError in order to maintain v1.0.2 signature.
  class ResponseError < StandardError; end
  class CourierAPIError < ResponseError; end  

  class ErrorHandler
    def self.check_err(res)
      code = res.code.to_i
      obj = JSON.parse res.read_body

      if code < 400
        obj
      elsif (message = obj["Message"].nil? ? obj["message"] : obj["Message"])
        err = "#{code}: #{message}"
        raise CourierAPIError.new err
      end
    end

    def self.check_err_non_json(res)
      code = res.code.to_i
      if code >= 400
        obj = JSON.parse res.read_body
        if (message = obj["Message"].nil? ? obj["message"] : obj["Message"])
          err = "#{code}: #{message}"
          raise CourierAPIError.new err
        end
      end
      res
    end
  end
end
