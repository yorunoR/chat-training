class GraphqlController < GraphqlBaseController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]

    uid, email, name =
      if current_user.blank?
        auth_decode!
      else
        [current_user.uid, current_user.email, current_user.name]
      end

    context = {
      current_user: current_user,
      uid: uid,
      email: email,
      name: name,
    }

    result = AppSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development(e)
  end

  private

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end

  def auth_decode!
    token = request.headers['Authorization']&.gsub(/^Bearer /, '')
    return nil if token.blank?

    payload = FirebaseAuth.new(token).validate!

    [payload['user_id'], payload['email'], payload['name']]
  rescue StandardError => e
    Rails.logger.error e.message

    nil
  end

  def current_user
    return @current_user if @current_user.present?

    uid, _, _ = auth_decode!

    @current_user = User.find_by(uid: uid)
  end
end
