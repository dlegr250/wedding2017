Account.delete_all
User.delete_all

account = Account.create

User.create(
  account: account,
  full_name: "Dan LeGrand",
  account_owner: true,
  email: "dan.legrand@gmail.com",
  password: "password",
  password_confirmation: "password",
  confirmed_at: Time.now,
  confirmation_token: ::Modules::Generator.random_token,
  authentication_token: ::Modules::Generator.random_token
)
