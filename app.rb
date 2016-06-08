class App < Sinatra::Base
  get '/servo' do
    pan = params['pan']
    thilt = params['thilt']

    if pan || thilt
      ArduinoFirmata.connect('/dev/cu.usbmodem1411') do
        servo_write 2, pan.to_i if pan
        servo_write 3, thilt.to_i if thilt
      end

      @pan  = pan
      @thilt = thilt
    end

    haml :index
  end

  #get '/streaming' do
  #  haml :streaming
  #end

  get '/javascripts/main.js' do
      coffee :'coffee/main'
  end
end
