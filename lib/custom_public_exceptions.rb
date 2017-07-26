class CustomPublicExceptions < ActionDispatch::PublicExceptions
  def call(env)
    if env["action_dispatch.exception"].is_a?(ActionController::RoutingError)
      ErrorsController.action(:not_found).call(env)
    else
      ErrorsController.action(:internal_server_error).call(env)
    end
  end
end