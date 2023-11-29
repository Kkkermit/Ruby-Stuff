require 'psutil'

def get_resource_usage
  cpu_usage = Psutil.cpu_percent(interval: 1)
  memory_usage = Psutil.virtual_memory.percent

  puts "CPU Usage: #{cpu_usage}%"
  puts "Memory Usage: #{memory_usage}%"
end

get_resource_usage