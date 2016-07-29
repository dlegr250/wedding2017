User.delete_all

User.create(
  full_name: "Dan LeGrand",
  email: "dan.legrand@gmail.com",
  password: "password",
  password_confirmation: "password",
  confirmed_at: Time.now,
  confirmation_token: ::Modules::Generator.random_token,
  authentication_token: ::Modules::Generator.random_token
)
