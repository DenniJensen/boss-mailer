module BossMailer
  class TimeParser
    def parse(time)
      raise if time.size > 5
      @time = time.split ":"
      return parse_seperated_time unless @time.first == time
      parse_mixed_time
    end

    private

    def parse_mixed_time
      return parse_hours_only_time if @time.first.size < 3
      digits = @time.first.chars
      @time[1] = digits.pop(2).join
      @time[0] = digits.first(2).join
      parse_seperated_time
    end

    def parse_hours_only_time
      @time[1] = '00'
      parse_seperated_time
    end

    def parse_seperated_time
      hours = digit_to_two @time.first
      minutes = digit_to_two @time.last
      "#{hours}:#{minutes}"
    end

    def digit_to_two(digit)
      return digit if digit.size == 2
      "0#{digit}"
    end
  end
end
