module Spec
  module ControllerHelper
    def json_response
      JSON.parse(response.body)
    end
  end
end
