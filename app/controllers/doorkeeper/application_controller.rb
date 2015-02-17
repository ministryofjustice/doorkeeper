module Doorkeeper
  class ApplicationController < ActionController::Base
    include Helpers::Controller

    if ::Rails.version.to_i < 4
      protect_from_forgery Doorkeeper.configuration.protect_from_forgery_options
    else
      protect_from_forgery( {with: :exception}.merge(Doorkeeper.configuration.protect_from_forgery_options) )
    end

    helper 'doorkeeper/dashboard'
  end
end
