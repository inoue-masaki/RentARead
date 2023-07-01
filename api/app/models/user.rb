# require "validator/email_validator"

class User < ApplicationRecord
    has_many :books, through: :favarites

    include TokenGenerateService

    before_validation :downcase_email
    has_secure_password

    validates :name, presence: true,
        length: { maximum: 30, allow_blank: true }

    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true
        # length: { maximum: 255},
        # format: { with: VALID_EMAIL_REGEX }

    # VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
    # validates :password, presence: true,
    #     length: { minimum: 8 },
    #     format: {
    #         with: VALID_PASSWORD_REGEX,
    #         message: :invalid_password
    #     },
    #     allow_nil: true

        class << self
            # emailからアクティブなユーザーを返す
            def find_activated(email)
              find_by(email: email)
            end
        end

          # 自分以外の同じemailのアクティブなユーザーがいる場合にtrueを返す
        def email_activated?
            users = User.where.not(id: id)
            users.find_activated(email).present?
        end

        # リフレッシュトークンのJWT IDを記憶する
        def remember(jti)
            update!(refresh_jti: jti)
        end

        # リフレッシュトークンのJWT IDを削除する
        def forget
            update!(refresh_jti: nil)
        end

        # 共通のJsonレスポンス
        def response_json(payload = {})
            # .with_indifferent_accessメソッドはハッシュのキーをシンボルでも文字列でも取得できるメソッド
            as_json(only: [:id, :name]).merge(payload).with_indifferent_access
        end

        private

          # email小文字化
          def downcase_email
            self.email.downcase! if email
          end
end