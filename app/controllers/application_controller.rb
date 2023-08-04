class ApplicationController < ActionController::API
    JWT_SECRET_KEY = 'bc8b5443fe37bae5c2d7b0f183d6f669'
    def encode_token(payload)
        JWT.encode(payload, JWT_SECRET_KEY)
    end

    def decode_token
        auth_header = request.headers['Authorization']

        if auth_header
            token = auth_header.split(' ').last
            begin
                JWT.decode(token, JWT_SECRET_KEY, true, algorithm: 'HS256')
            rescue JWT::DecodeError => e
                nil
            end

        end
    end

    def authorized_user
        if decode_token
            user_id = decode_token.first['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def authorize
        render json: {message: 'You must log in'}, status: :unauthorized unless authorized_user
    end
end
