class MinilangRuntimeError < RuntimeError; end
class BadTokenError < MinilangRuntimeError; end
class EmptyStackError < MinilangRuntimeError; end


class Minilang
  def initialize(arg)
    @register = 0
    @stack = []
    @token_array = arg.split 
  end

  def eval
    @token_array.each { |token| eval_token(token) }
  rescue MinilangRuntimeError => e
    puts e.message
  end

  private

  def eval_token(token)
    case token
    when /\A[-+]?\d+\z/ then @register = token.to_i 
    when "PUSH" then @stack.push(@register)
    when "ADD" then @register += pop
    when "SUB" then @register -= pop
    when "MULT" then @register *= pop
    when "DIV" then @register /= pop
    when "MOD" then @register %= pop
    when "POP" then @register = pop
    when "PRINT" then p @register
    else
      raise(BadTokenError, "Invalid token: #{token}")
    end
  end

  def pop
    @stack.empty? ? raise(EmptyStackError, "Empty stack!") : @stack.pop
  end
end




Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)