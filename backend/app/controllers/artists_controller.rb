class ArtistsController < ApplicationController
    
    def index
        @artists = Artist.all
        if @artists
              render json: {
              artists: @artists
           }
        else
              render json: {
              status: 500,
              errors: ['no artists found']
          }
        end
    end

    def show
        @artist = Artist.find(params[:id])
           if @artist
              render json: {
              artist: @artist
           }
           else
              render json: {
              status: 500,
              errors: ['artist not found']
            }
        end
    end
      
    def create
        @artist = Artist.new(artist_params)
             if @artist.save
                 login!  
                 render json: {
                 status: :created,
                 artist: @artist
             }
            else 
                render json: {
                status: 500,
                errors: @artist.errors.full_messages
            }
        end
    end

    private
      
    def artist_params
        params.require(:artist).permit(:username, :password, :password_confirmation)
    end
end