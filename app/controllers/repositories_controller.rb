class RepositoriesController < ApplicationController
  def index
    user = Faraday.get("https://api.github.com/user") do |req|
      req.headers['Authorization'] = 'token ' + session[:token]
      req.headers['Accept'] = 'application/json'
    end
    @user_data = JSON.parse(user.body)

    repo = Faraday.get("https://api.github.com/user/repos") do |req|
      req.headers['Authorization'] = 'token ' + session[:token]
      req.headers['Accept'] = 'application/json'
    end
    @repo_data = JSON.parse(repo.body)
  end

  def create
    resp = Faraday.post("https://api.github.com/user/repos") do |req|
      req.body = { 'client_id': client_id, 'client_secret': client_secret, 'code': code }
      req.headers['Accept'] = 'application/json'
    end

    body = JSON.parse(resp.body)
    session[:token] = body['access_token']
    redirect_to root_path
  end
end
