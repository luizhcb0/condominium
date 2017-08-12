require 'net/http'

namespace :daemon do
  
  task start: :environment do
    Rails.logger       = Logger.new(Rails.root.join('log', 'daemon.log'))
    Rails.logger.level = Logger.const_get((ENV['LOG_LEVEL'] || 'info').upcase)

    if ENV['BACKGROUND']
      Process.daemon(true, true)
    end

    if ENV['PIDFILE']
      File.open(ENV['PIDFILE'], 'w') { |f| f << Process.pid }
    end

    Signal.trap('TERM') { abort }

    Rails.logger.info "Start daemon..."
    
    tanks = Tank.all
    init_time = Time.current
    loop do
      
      changed = false
      tanks.each do |tank|
        
        uri = URI(tank.address+"/value")
        current_level = Net::HTTP.get(uri)
        current_level = current_level.to_i
        
        id = Level.get_current_level(tank.id)
        last_level = Level.find(id).level
        
        now_time = Time.current
        elapsed_time = now_time - init_time
        
        # Rails.logger.info "Last Level: #{@last_level}"
        # Rails.logger.info "Current Level: #{current_level}"
        # Rails.logger.info "Elapsed Time: #{@elapsed_time}"
        # 
        
        # 600 seconds or get a different value to update
        
        
        #CRIAR METODO PARA ATUALIZAR O TEMPO POR CADA RESERVATORIO
        if ((last_level != current_level) || (elapsed_time > 600)) #10 minutes
          
          level = Level.create(tank: tank, level: current_level)
          changed = true
          log = "New level inserted. Tank: #{level.tank_id} Level: #{current_level} At: #{level.created_at}"
          Rails.logger.info log
        
        end

      end
      
      if changed
        init_time = Time.current
      end

      sleep 5
      # sleep ENV['INTERVAL'] || 5
    end
  end
  
end
