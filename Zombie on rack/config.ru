# frozen_string_literal: true

require './app/zombie'

use Rack::Reloader, 0
use Rack::Static, urls: ["/settings"]
use Rack::Auth::Basic do |login, password|
  login == "zombie"
  password == "brains"
end
run Zombie
