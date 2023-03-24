# frozen_string_literal: true

class GraphqlBaseController < ApplicationController
  skip_before_action :verify_authenticity_token
end
