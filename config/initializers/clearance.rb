class BanCheckGuard < Clearance::SignInGuard
  def call
    if banned?
      failure("Your account is banned, please GET OUT!!!")
    else
      next_guard
    end
  end

  def banned?
    current_user.ban?
  end
end

Clearance.configure do |config|
  config.mailer_sender = "reply@example.com"
  config.sign_in_guards = [BanCheckGuard]
end
