class ApplicationOperation
  attr_reader :params, :form

  def initialize(params, current_user = nil)
    @params = params
    @current_user = current_user
  end
end
