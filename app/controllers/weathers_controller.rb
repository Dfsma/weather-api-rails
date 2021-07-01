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
        @weather = Weather.new(weather_temp_param)

            if @weather.save

                if  @weather.degrees < 0
                    msg = {:description => "#{@weather.degrees.to_s.tr('-', '') + I18n.t('temperature.below_zero')}"}
                    render :json => msg, status: 200
                elsif @weather.degrees >= 0
                    msg = {:description => "#{@weather.degrees.to_s + I18n.t('temperature.above_zero')}"}
                    render :json => msg, status: 200

                end 
            else
                msg = {:description => "Can´t save wheather"}
                    render :json => msg, status: 404
            end
    end
    
    def create_wind
        @weather = Weather.new(weather_wind_param)

            if @weather.save
                if  @weather.wind_speed < 3
                    msg = {:description => I18n.t('wind.none')}
                    render :json => msg, status: 200
                elsif @weather.wind_speed < 8
                    msg = {:description => I18n.t('wind.weak')}
                    render :json => msg, status: 200
                elsif @weather.wind_speed < 20
                    msg = {:description => I18n.t('wind.medium')}
                    render :json => msg, status: 200
                elsif @weather.wind_speed >= 20
                    msg = {:description => I18n.t('wind.strong')}
                    render :json => msg, status: 200
                end
            else
                msg = {:description => "Can´t save wind speed"}
                    render :json => msg, status: 404
            end
    end

    def create_cloud
        @weather = Weather.new(weather_cloud_param)

            if @weather.save
                if @weather.clouds <= 10
                    msg = {:description => I18n.t('clouds.none')}
                    render :json => msg, status: 200
                elsif @weather.clouds <= 70
                    msg = {:description => I18n.t('clouds.partial')}
                    render :json => msg, status: 200
                elsif @weather.clouds > 70
                    msg = {:description => I18n.t('clouds.full')}
                    render :json => msg, status: 200
                end
            else
                msg = {:description => "Can´t save cloud"}
                    render :json => msg, status: 404
            end
    end


    rescue_from ActionController::ParameterMissing do |exception|     
        msg = {:error => "Parameter missing"}
        render :json => msg, status: 422
    end
    
    private
        def weather_temp_param
            params.require(:weather).permit(:degrees)
        end

        def weather_wind_param
            params.require(:weather).permit(:wind_speed)
        end

        def weather_cloud_param
            params.require(:weather).permit(:clouds)
        end
   
    
end
