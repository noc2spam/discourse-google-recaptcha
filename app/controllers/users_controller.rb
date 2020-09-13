# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorize_mini_profiler, only: [:avatar]

  requires_login only: [
    :username, :update, :upload_user_image,
    :pick_avatar, :destroy_user_image, :destroy, :check_emails,
    :topic_tracking_state, :preferences, :create_second_factor_totp,
    :enable_second_factor_totp, :disable_second_factor, :list_second_factors,
    :update_second_factor, :create_second_factor_backup, :select_avatar,
    :notification_level, :revoke_auth_token, :register_second_factor_security_key,
    :create_second_factor_security_key, :feature_topic, :clear_featured_topic,
    :bookmarks, :invited
  ]

  skip_before_action :check_xhr, only: [
    :show, :badges, :password_reset_show, :password_reset_update, :update, :account_created,
    :activate_account, :perform_account_activation, :avatar,
    :my_redirect, :toggle_anon, :admin_login, :confirm_admin, :email_login, :summary,
    :feature_topic, :clear_featured_topic, :bookmarks
  ]

  before_action :second_factor_check_confirmed_password, only: [
                  :create_second_factor_totp, :enable_second_factor_totp,
                  :disable_second_factor, :update_second_factor, :create_second_factor_backup,
                  :register_second_factor_security_key, :create_second_factor_security_key
                ]

  before_action :respond_to_suspicious_request, only: [:create]
  before_action :respond_to_recaptcha_verify, only: [:create]
  # we need to allow account creation with bad CSRF tokens, if people are caching, the CSRF token on the
  #  page is going to be empty, this means that server will see an invalid CSRF and blow the session
  #  once that happens you can't log in with social
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :redirect_to_login_if_required, only: [:check_username,
                                                            :create,
                                                            :get_honeypot_value,
                                                            :account_created,
                                                            :activate_account,
                                                            :perform_account_activation,
                                                            :send_activation_email,
                                                            :update_activation_email,
                                                            :password_reset_show,
                                                            :password_reset_update,
                                                            :confirm_email_token,
                                                            :email_login,
                                                            :admin_login,
                                                            :confirm_admin]

  after_action :add_noindex_header, only: [:show, :my_redirect]

  def respond_to_recaptcha_verify
    require "uri"
    require "net/http"
    key = params[:user_fields]["1"]
    params = {
      'secret' => SiteSetting.recaptcha_secret_key,
      'response' => key,
      'remoteip' => request.remote_ip
    }
    x = Net::HTTP.post_form(URI.parse('https://www.google.com/recaptcha/api/siteverify'), params)
    responseArray = ActiveSupport::JSON.decode(x.body)
    if responseArray["success"] == false
      render json: {
        success: false,
        message: "Invalid CAPTCHA input"
      }
    end
  end
end

