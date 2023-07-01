require 'jwt'

# refleshとちがいjwiは生成しない　有効期限は30分なので今回必要なしと判断

module UserAuth
  class AccessToken
    include TokenCommons

    attr_reader :user_id, :payload, :lifetime, :token, :options

    # ここのtokenはデコード時に必要なトークンキーとなる optionsは
    def initialize(user_id: nil, payload: {}, token: nil, options: {})
      if token.present?
        # decode
        @token = token
        @options = options
        @payload = JWT.decode(@token.to_s, decode_key, true, verify_claims.merge(@options)).first
        @user_id = get_user_id_from(@payload)
      else
        # encode
        @user_id = encrypt_for(user_id)
        # もしlifetimeを別な時間に設定したい場合はデフォルトよりそちらを優先させる
        @lifetime = payload[:lifetime] || UserAuth.access_token_lifetime
        # lifetime以外はデフォルトのクレームにmergeする形で盛り込む
        @payload = claims.merge(payload.except(:lifetime))
        @token = JWT.encode(@payload, secret_key, algorithm, header_fields)
      end
    end

    # 暗号化された@user_idからユーザーを取得する
    def entity_for_user
      User.find(decrypt_for(@user_id))
    end

    # @lifetimeの日本語テキストを返す
    def lifetime_text
      time, period = @lifetime.inspect.sub(/s\z/, "").split
      time + I18n.t("datetime.periods.#{period}", default: "")
    end

    private

      ## エンコードメソッド

      # issuerの値がある場合にtrueを返す
      def verify_issuer?
        UserAuth.token_issuer.present?
      end

      # issuerを返す
      def token_issuer
        verify_issuer? && UserAuth.token_issuer
      end

      # audienceの値がある場合にtrueを返す
      def verify_audience?
        UserAuth.token_audience.present?
      end

      # audienceを返す
      def token_audience
        verify_audience? && UserAuth.token_audience
      end

      # user_idの値がある場合にtrueを返す
      def verify_user_id?
        @user_id.present?
      end

      # 有効期限をUnixtimeで返す(必須)
      def token_expiration
        # インスタンス変数@lifetimeの値unixタイムに変換
         @lifetime.from_now.to_i
      end

      # エンコード時のデフォルトクレーム
      # 基本的にその時々に設定したいものを優先させるつくりになっている
      def claims
        _claims = {}
        # 有効期限は必須。これがないとrefreshを作った意味がないため
        _claims[:exp] = token_expiration
        # 暗号化したユーザーIDを入れる
        _claims[user_claim] = @user_id if verify_user_id?
        _claims[:iss] = token_issuer if verify_issuer?
        _claims[:aud] = token_audience if verify_audience?
        _claims
      end

      ## デコードメソッド

      # @optionsにsubjectがある場合にtrueを返す
      def verify_subject?
        @options.has_key?(:sub)
      end

      # @optionsのsubの値を返す
      def token_subject
        verify_subject? && @options[:sub]
      end

      # デコード時の検証オプション
      # Doc: https://github.com/jwt/ruby-jwt
      # default: https://www.rubydoc.info/github/jwt/ruby-jwt/master/JWT/DefaultOptions
      def verify_claims
        {
          iss: token_issuer,
          aud: token_audience,
          sub: token_subject,
          verify_expiration: true,      # 有効期限の検証するか(必須)
          verify_iss: true, # trueの場合値を検証　payloadとissの一致を検証するか　失敗時エラー
          verify_aud: true, # trueの場合値を検証　payloadとaudの一致を検証するか　失敗時エラー
          verify_sub: true, # trueの場合値を検証　payloadとsubの一致を検証するか　失敗時エラー
          # verify_iss: verify_issuer?,   # trueの場合値を検証　payloadとissの一致を検証するか　失敗時エラー
          # verify_aud: verify_audience?, # trueの場合値を検証　payloadとaudの一致を検証するか　失敗時エラー
          # verify_sub: verify_subject?,  # trueの場合値を検証　payloadとsubの一致を検証するか　失敗時エラー
          algorithm: algorithm          # decode時のアルゴリズム
        }
      end
  end
end
