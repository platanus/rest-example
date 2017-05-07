module Api::Versioned
  extend ActiveSupport::Concern

  included do
    before_action :check_api_version!
    after_action :set_content_type
  end

  private

  def check_api_version!
    accept_header = request.headers[:accept]
    @version_number = accept_header.match(/version=(\d+)/).try(:captures).try(:first).to_i
    @version_number = 1 if @version_number.zero?
    raise ApiVersionError unless (1..2) === @version_number
  end

  def set_content_type
    contet_type_header = response.headers["Content-Type"]
    parts = !contet_type_header ? [] : contet_type_header.split(";").map(&:strip)
    parts << "version=#{@version_number}"
    response.headers["Content-Type"] = parts.join("; ")
  end
end
