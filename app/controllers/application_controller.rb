class ApplicationController < ActionController::API
    JWT_SECRET = Rails.application.secrets.secret_key_base

    def encode_token(payload)
        JWT.encode(payload, ENV['JWT_SECRET_KEY'])
    end

    def decode_token
        auth_header = request.headers['Authorization']

        if auth_header
            token = auth_header.split(' ').last

            return token

            begin
                JWT.decode(token, ENV['JWT_SECRET_KEY'], true, algorithm: 'HS256')
            rescue JWT::DecodeError => e
                { errors: e.message }
            end
        else
            'No token provided'
        end
    end

    def authorized_user
        decoded_token = decode_token()
        return decoded_token

        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def authorize
        render json: authorized_user
        # render json: {message: 'Você precisa estar logado'}, status: :unauthorized unless authorized_user
    end
end
