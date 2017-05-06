class ApiResponder < ActionController::Responder
  def respond
    return display_errors if has_errors?
    return head(:no_content) if delete?

    display(resource, status_code: status_code)
  end

  private

  def display(resource, given_options = {})
    options[:json] = resource
    options[:fields] = controller.params[:fields].to_hash if controller.params[:fields]
    controller.render(options.merge(given_options))
  end

  def status_code
    return :created if post?
    :ok
  end

  def display_errors
    controller.render(
      status: :unprocessable_entity,
      json: { msg: "invalid_attributes", errors: format_errors }
    )
  end

  def format_errors
    resource.errors.as_json
  end
end
