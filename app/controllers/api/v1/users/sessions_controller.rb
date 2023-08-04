class Api::V1::Users::SessionsController < Devise::SessionsController
    include RackSessionFix
    respond_to :json
end
  