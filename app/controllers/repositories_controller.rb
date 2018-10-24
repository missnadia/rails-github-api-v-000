class RepositoriesController < ApplicationController
  def index
    resp = Faraday.get("https://api.github.com/user") do |req|

    end
  end

  def create
    redirect_to '/'
  end
end
