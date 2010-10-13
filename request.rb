require 'json'
require 'net/http'

host = 'http://minisculus.edendevelopment.co.uk'
Net::HTTP.start(URI.parse(host).host) do |http|

  @get_headers = {'Accept' =>'application/json'}
  @put_headers = @get_headers.merge('Content-type' => 'application/json')
  @http = http

  def request_question(key)
    response = @http.request_get(key, @get_headers)
    JSON.parse(response.body)['reference-url']
  end

  def solve_for(key, answer = nil)
    if answer
      response = @http.request_put(key, {:answer => answer}.to_json, @put_headers)
      response['location']
    else
      question_path = request_question(key)
      puts "question path: #{question_path}"
    end
  end

  question_1 = http.request_get('/start', @get_headers)['location']
  question_2 = solve_for(question_1, 'Yzxutm5TK5cotjy2')
  question_3 = solve_for(question_2)

end