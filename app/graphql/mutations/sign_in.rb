class Mutations::SignIn < Mutations::BaseMutation
  null true
  argument :email, String, required: true
  argument :password, String, required: true

  def resolve(email:, password:)
    user = User.find_for_authentication(email)

    if user&.valid_password?(password)
      # サインイン処理
    end
  end
end
