module JSONHelper
  def last_json
    if @response
      @response.body
    else
      last_response.body
    end
  end
end

World JSONHelper
