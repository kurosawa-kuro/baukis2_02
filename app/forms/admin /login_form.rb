# rails_training/baukis2_training/baukis2_01/app/forms/admin /login_form.rb
class Admin::LoginForm
    include ActiveModel::Model

    attr_accessor :email, :password
end