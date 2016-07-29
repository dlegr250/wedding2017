User.delete_all

User.create(
  full_name: "Dan LeGrand",
  admin: true,
  email: "dan.legrand@gmail.com",
  password: "password",
  password_confirmation: "password",
  confirmed_at: Time.now,
  confirmation_token: ::Modules::Generator.random_token,
  authentication_token: ::Modules::Generator.random_token
)

User.create(
  full_name: "Jacqueline Preston",
  admin: true,
  email: "jaq.preston@gmail.com",
  password: "password",
  password_confirmation: "password",
  confirmed_at: Time.now,
  confirmation_token: ::Modules::Generator.random_token,
  authentication_token: ::Modules::Generator.random_token
)
