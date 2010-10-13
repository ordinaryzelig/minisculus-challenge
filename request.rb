require 'json'
require 'net/http'

host = 'http://minisculus.edendevelopment.co.uk'
Net::HTTP.start(URI.parse(host).host) do |http|

  @get_headers = {'Accept' =>'application/json'}
  @put_headers = @get_headers.merge('Content-type' => 'application/json')
  @http = http

  def request_question(key)
    response = @http.request_get(key, @get_headers)
    puts response.body
    response
  end

  def solve_for(key, answer = nil)
    if answer
      response = @http.request_put(key, {:answer => answer}.to_json, @put_headers)
      print answer + ' is '
      if response.code == '303'
        puts 'correct'
        return response
      else
        puts 'wrong'
        exit
      end
    else
      request_question(key)
    end
  end

  question_1 = http.request_get('/start', @get_headers)['location']
  question_2 = solve_for(question_1, 'Yzxutm5TK5cotjy2')
  question_3 = solve_for(question_2['location'], 'Wkh2Ghvhuw2Ir.2zloo2pryh2632wdqnv2wr2Fdodlv2dw2gdzq')
  question_4 = solve_for(question_3['location'], 'JMl0kBp?20QixoivSc.2"vvmls8KOk"0jA,4kgt0OmUb,pm.')
  all_solved = solve_for(question_4['location'], 'The rockets will strike at coordinates 49.977984 7.9257857 422979.83 5536735.81 on Oct. 7th')
  ending = http.request_get(all_solved['location'], @get_headers)
  http

end
