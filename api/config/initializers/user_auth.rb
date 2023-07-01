# api/config/initializers/user_auth.rb
module UserAuth
  # access tokenの有効期限
  mattr_accessor :access_token_lifetime
  self.access_token_lifetime = 30.minute
  # self.access_token_lifetime = 10.second

  # refresh tokenの有効期限
  mattr_accessor :refresh_token_lifetime
  self.refresh_token_lifetime = 1.day

  # cookieからrefresh tokenを取得する際のキー
  # cookies[UserAuth.session_key]で取得ができる
  mattr_accessor :session_key
  self.session_key = :refresh_token

  # userを識別するクレーム名　クレームには好きな値を入れられる
  # :subというキーにユーザーIDを入れるためここではsubを指定
  mattr_accessor :user_claim
  self.user_claim = :sub

  # JWTの発行者を識別する文字列(認可サーバー（jwtを発行するサーバー）URL)
  # UserAuth.token_issuer
  # => "http://localhost:3000"
  mattr_accessor :token_issuer
  self.token_issuer = "http://localhost:3000"
  # self.token_issuer = ENV["BASE_URL"]

  # JWTの受信者を識別する文字列(保護リソースURL)
  # 今回は発行者も受信者も同じなので上と同じくAPIのURLを指定
  mattr_accessor :token_audience
  self.token_audience = "http://localhost:3000"
  # self.token_audience = ENV["BASE_URL"]

  # JWTの署名アルゴリズム
  # それぞれに同じ鍵を使用するHS256を指定
  mattr_accessor :token_signature_algorithm
  self.token_signature_algorithm = "HS256"

  #　エンコード時に使用する鍵を指定
  # 今回はRAILSのシークレットキーを使う
  mattr_accessor :token_secret_signature_key
  self.token_secret_signature_key = Rails.application.credentials.secret_key_base

  # 署名・検証に使用する公開鍵(RS256は今回使わないのでNIL)
  mattr_accessor :token_public_key
  self.token_public_key = nil

  # ユーザーが見つからない場合のエラーを指定
  mattr_accessor :not_found_exception_class
  self.not_found_exception_class = ActiveRecord::RecordNotFound
end
