# frozen_string_literal: true

Devise.setup do |config|
  # config.secret_key = 'a3d3fc125aedf70bab2e7d39f0649d39bf377477e4b659772efd57fcf22dc009c489a37ba2103e7b862ed4ff457f31a23d8fc51ed3873fcf79baa1c3bda73d4b'

  # config.parent_controller = 'DeviseController'

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  # config.mailer = 'Devise::Mailer'

  # config.parent_mailer = 'ActionMailer::Base'

  require 'devise/orm/active_record'

  # config.authentication_keys = [:email]

  # config.request_keys = []

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  # config.params_authenticatable = true

  # config.http_authenticatable = false

  # config.http_authenticatable_on_xhr = true

  # config.http_authentication_realm = 'Application'

  # config.paranoid = true

  config.skip_session_storage = [:http_auth]

  # config.clean_up_csrf_token_on_authentication = true

  # config.reload_routes = true

  config.stretches = Rails.env.test? ? 1 : 12

  # config.pepper = '022f0a6c7c71e580a88970b3d6a1b15876d87c48fecddcacf49af1c8f4b1c80957611946b833ccb0bee450aa94d7c114a658442390f210d5d40e8369e3d9eb1f'

  # config.send_email_changed_notification = false

  # config.send_password_change_notification = false

  # config.allow_unconfirmed_access_for = 2.days

  # config.confirm_within = 3.days

  config.reconfirmable = true

  # config.confirmation_keys = [:email]

  # config.remember_for = 2.weeks

  config.expire_all_remember_me_on_sign_out = true

  # config.extend_remember_period = false

  # config.rememberable_options = {}

  # Range for password length.
  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # config.timeout_in = 30.minutes

  # config.lock_strategy = :failed_attempts

  # config.unlock_keys = [:email]

  # config.unlock_strategy = :both

  # config.maximum_attempts = 20

  # config.unlock_in = 1.hour

  # config.last_attempt_warning = true

  # config.reset_password_keys = [:email]

  config.reset_password_within = 6.hours

  # config.sign_in_after_reset_password = true

  # config.encryptor = :sha512

  # config.scoped_views = false

  # config.default_scope = :user

  # config.sign_out_all_scopes = true

  # config.navigational_formats = ['*/*', :html]

  config.sign_out_via = :delete

  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end

  # config.omniauth_path_prefix = '/my_engine/users/auth'

  # ActiveSupport.on_load(:devise_failure_app) do
  #   include Turbolinks::Controller
  # end


  # config.sign_in_after_change_password = true
end
