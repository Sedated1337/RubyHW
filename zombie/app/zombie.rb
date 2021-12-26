require 'erb'
require './app/lib/logic'

class Zombie
  include Logic

  def self.call(env)
    new(env).response.finish
  end

  def initialize(env)
    @request = Rack::Request.new(env)
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
    case @request.path
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
        response.set_cookie('name', @request.params['name'])
        response.redirect('/start')
      end

    when '/exit'
      Rack::Response.new('Game Over', 404)
      Rack::Response.new(render('GameOver.html.erb'))

    when '/start'
      Rack::Response.new(render('index.html.erb'))


    when '/banana'
      Rack::Response.new(render('banana.html.erb'))
      return Logic.change_banana_params(@request, 'banana') if @request.params['banana']


    when '/change'
      return Logic.change_params(@request, 'mood') if @request.params['mood']
      return Logic.change_params(@request, 'brains') if @request.params['brains']
      return Logic.change_params(@request, 'hp') if @request.params['hp']
      return Logic.change_params(@request, 'rage') if @request.params['rage']
      return Logic.change_params(@request, 'strength') if @request.params['strength']
      return Logic.change_params(@request, 'energy') if @request.params['energy']
      return Logic.change_params(@request, 'banana') if @request.params['banana']
    else
      Rack::Response.new('Not Found', 404)
    end
  end

  def render(template)
    path = File.expand_path("../pages/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def name
    name = @request.cookies['name'].delete(' ')
    name.empty? ? 'Zombie' : @request.cookies['name']
  end

  def get(attr)
    @request.cookies[attr.to_s].to_i
  end
end

