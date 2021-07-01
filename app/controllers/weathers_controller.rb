class WeathersController < ApplicationController

    def index
        @weathers = Weather.all
    end
    def new
        @weather = Weather.new
    end

    def show
    end 

    def create_temperature
        @weather = Weather.new(weather_params)
       
       
            if @weather.save

                if  @weather.degrees < 0
                    msg = {:description => "#{@weather.degrees.to_s + I18n.t('temperature.below_zero')}"}
                    render :json => msg, status: 200
                end

                if @weather.degrees >= 0
                    msg = {:description => "#{@weather.degrees.to_s + I18n.t('temperature.above_zero')}"}
                    render :json => msg, status: 200
                end
              
            else
                
            end
     

    end
    private
        def weather_params
            params.require(:weather).permit(:degrees, :wind_speed, :clouds)
        end
   
    
end
