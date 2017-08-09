require './environment'

module FormsLab
  class App < Sinatra::Base

    get "/" do
      erb :root
    end

    get "/new" do
      erb :"pirates/new"
    end

    post "/pirates" do
      ships = params[:pirate][:ships]
      params[:pirate].delete "ships"

      @pirate = Pirate.new params[:pirate]
      @ships = ships.map {|ship| Ship.new ship}

      erb :"pirates/show"
    end
  end
end
