require 'erb'
require './app/lib/logic'

class Zombie
  include Logic

  def self.call(env)
    new(env).response.finish
  end

  def initialize(env)
    @req = Rack::Request.new(env)
    @mood     = 30
    @brains   = 30
    @hp       = 30
    @rage     = 30
    @strength = 30
    @energy   = 30
    @banana   = 1
    $NEEDS = %w[mood brains hp rage strength]
  end

  def response
    case @req.path
    when '/'
      Rack::Response.new(render('form.html.erb'))

    when '/initialize'
      Rack::Response.new do |response|
        response.set_cookie('mood', @mood)
        response.set_cookie('brains', @brains)
        response.set_cookie('hp', @hp)
        response.set_cookie('rage', @rage)
        response.set_cookie('strength', @strength)
        response.set_cookie('energy', @energy)
        response.set_cookie('banana', @banana)
        response.set_cookie('name', @req.params['name'])
        response.redirect('/start')
      end

    when '/exit'
      Rack::Response.new('Game Over', 404)
      Rack::Response.new(render('GameOver.html.erb'))

    when '/clicker'
      return Logic.banana_params(@req, 'banana') if @req.params['banana']
      if get("banana") >= 100
        Rack::Response.new('Game complete', 404)
        Rack::Response.new(render("BananaWinner.html.erb"))
      else
        Rack::Response.new(render("clicker.html.erb"))
      end

    when '/start'
      Rack::Response.new(render('index.html.erb'))


    when '/change'
      return Logic.change_params(@req, 'mood') if @req.params['mood']
      return Logic.change_params(@req, 'brains') if @req.params['brains']
      return Logic.change_params(@req, 'hp') if @req.params['hp']
      return Logic.change_params(@req, 'rage') if @req.params['rage']
      return Logic.change_params(@req, 'strength') if @req.params['strength']
      return Logic.change_params(@req, 'energy') if @req.params['energy']
      return Logic.change_params(@req, 'banana') if @req.params['banana']
    else
      Rack::Response.new('Not Found', 404)
    end
  end

  def render(template)
    path = File.expand_path("../pages/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def name
    name = @req.cookies['name'].delete(' ')
    name.empty? ? 'Zombie' : @req.cookies['name']
  end

  def get(attr)
    @req.cookies[attr.to_s].to_i
  end
end

