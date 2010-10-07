class NumToBase
  MAX_BASE = 62
  # Function taken from http://www.dreamincode.net/code/snippet4882.htm
  # basic idea, convert any decimal(i.e. integer to given base)
  # I updated base to be max of 62
  def self.toBaseN(dec, base=MAX_BASE)
    nums ='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
    #allows up to base 64
    #add your own symbols to allow you to use higher bases

    result = ""
    #result string

    return nil if dec.instance_of? Float
    #if anyone has any idea how to make floating points acceptable, I'd love to hear it!

    return nil if base < 2
    #base 0 isn't possible, and neither is base 1

    return 0 if dec == 0
    #0 is 0 in every base

    while dec != 0

     result += nums[dec%base].chr

     dec /= base

    end
    return result.reverse
  end
end