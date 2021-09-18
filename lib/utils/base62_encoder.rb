module Utils
  ##
  # Utils::Base62Encoder
  ##
  module Base62Encoder
    module_function

    ALPHANUMERIC = [*'a'..'z', *'0'..'9', *'A'..'Z'].freeze

    def from_base10(num_to_convert, num_of_char = 7)
      return nil unless num_to_convert.is_a?(Integer) || num_to_convert.to_i.negative?

      choose(ALPHANUMERIC, num_of_char, num_to_convert)
    end

    ##
    # Clone and custom function choose of Securerandom
    # See more in https://github.com/ruby/securerandom/blob/master/lib/securerandom.rb#L264
    ##
    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def choose(chars, num_of_char, num_to_convert)
      size = limit = chars.size
      m = 1

      while limit * size <= 0x100000000
        limit *= size
        m += 1
      end

      rs = num_to_convert
      is = rs.digits(size)
      result = ''.dup

      while m <= num_of_char
        (m - is.length).times { is << 0 }
        result << chars.values_at(*is).join
        num_of_char -= m
      end

      if num_of_char.positive?
        if is.length < num_of_char
          (num_of_char - is.length).times { is << 0 }
        else
          is.pop while num_of_char < is.length
        end
        result.concat chars.values_at(*is).join
      end

      result
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
  end
end
