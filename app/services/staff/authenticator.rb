# Staff::Authenticatorクラスを定義
class Staff::Authenticator
    # staff_memberを引数に取り、インスタンス変数に代入
    def initialize(staff_member)
        @staff_member = staff_member
    end

    # パスワードを引数に取り、認証処理を行う
    def authenticate(raw_password)
        # staff_memberが存在し、アカウントが凍結されていない、パスワードが設定されている、
        # 開始日が今日以前で、終了日が未設定または今日以降である場合、パスワードを認証する
        @staff_member &&
        !@staff_member.suspended? &&
        @staff_member.hashed_password &&
        @staff_member.start_date <= Date.today &&
        (@staff_member.end_date.nil? || @staff_member.end_date > Date.today) &&
        BCrypt::Password.new(@staff_member.hashed_password) == raw_password
    end
end
