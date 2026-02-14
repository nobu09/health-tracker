class Mutations::SignIn < Mutations::BaseMutation
  null true
  argument :email, String, required: true
  argument :password, String, required: true

  def resolve(email:, password:)
  end
end
