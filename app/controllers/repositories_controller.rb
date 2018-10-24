class RepositoriesController < ApplicationController
  def index
    Faraday.get("https://api.github.com/user") do |req|
      req.headers['Authorization'] = 'token ' + session[:token]
      req.headers['Accept'] = 'application/json'
    end
  end

  def create
  end
end
