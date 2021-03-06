# frozen_string_literal: true

module Logic
  def self.change_params(req, name)
    Rack::Response.new do |response|
      response.set_cookie(name, req.cookies[name.to_s].to_i + 10) if req.cookies[name.to_s].to_i < 100

      need = ($NEEDS - [name]).sample

      response.set_cookie(need, req.cookies[need.to_s].to_i - 10)

      response.redirect('/start')
    end
  end
  def self.banana_params(req, name)
    Rack::Response.new do |responses|
      responses.set_cookie(name, req.cookies["#{name}"].to_i + 1)

      responses.redirect('/clicker')
    end
  end

end
