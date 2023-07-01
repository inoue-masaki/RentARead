class ApplicationController < ActionController::API
    # Cookieを扱う
    include ActionController::Cookies
    # # 認可を行う
    include UserAuthenticateService

    # before_action :xhr_request?

    private

        # XHLHttpRequestsでない場合は403エラーを返す
        def xhr_request?
            # リクエストヘッダ x-Requiested-With: 'XMLHttpRequest'の存在を判定
            # .xhr?メソッドはrailsで用意されているもの x-Requiested-Withの値が'XMLHttpRequest'の場合trueを返す
            return if request.xhr?
            render status: :forbidden, json: { status:403, error: "forbidden"}
        end

        # Internal Server Error
        def response_500(msg = "Internal Server Error")
            render status: 500, json: {status:500, error: msg}
        end
    end
