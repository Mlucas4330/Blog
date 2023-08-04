class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, ENV['JWT_SECRET_KEY'])
    end

    def decode_token
        auth_header = request.headers['Authorization']

        if auth_header
            token = auth_header.split(' ').last

            begin
                JWT.decode(token, ENV['JWT_SECRET_KEY'], true, algorithm: 'HS256')
            rescue JWT::DecodeError => e
                return render json: { errors: e.message }
            end
        else
            render json: { errors: 'Authorization header format is invalid' }
        end
    end

    def authorized_user
        decoded_token = decode_token()
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def authorize
        render json: {message: 'Você precisa estar logado'}, status: :unauthorized unless authorized_user
    end
end
