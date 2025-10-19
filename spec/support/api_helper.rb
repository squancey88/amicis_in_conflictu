module ApiHelper
  def json_body
    @json ||= JSON.parse(response.body)
  end
end
