class CarHorn
    attr_accessor :health, :beep_strength, :breaking_threshold
  
    def initialize(health = 100, beep_strength = 10, breaking_threshold = 0)
      @health = health
      @beep_strength = beep_strength
      @breaking_threshold = breaking_threshold
    end
  
    def beep
      if @health > 0
        puts "Beep! Horn health: #{@health}"
        @health -= @beep_strength
      else
        puts "The horn is broken. Repair or replace it."
      end
    end
  
    def repair
      @health = 100
      puts "Horn repaired. Health reset to 100."
    end
  end
  
  # For use, you can change the number below and it will change the desired output -> 

  car_horn = CarHorn.new
  
  11.times do
    car_horn.beep
  end
  
  car_horn.repair
  