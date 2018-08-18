class ConditionService

  def self.response
    new().response
  end

  def response
    JSON.parse(request.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('https://boulder-tubing-api.herokuapp.com/conditions')
  end

  def request
    conn.get { |req| }
  end
end
