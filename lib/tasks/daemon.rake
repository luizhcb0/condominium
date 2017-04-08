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

    loop do
      Rails.logger.info "Waiting..."

      sleep ENV['INTERVAL'] || 1
    end
  end
  
end
