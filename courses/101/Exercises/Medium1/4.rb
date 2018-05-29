# 1000 lights: https://launchschool.com/exercises/61d687f4

def create_switches(n)
  hash_result = {}
  1.upto(n){ |i| hash_result[i] = false}
  hash_result
end

def lights_on_after_repetitive_switching(n)
  switches = create_switches(n)
  # Iterate every round (1, 2, 3 .. n)
  1.upto(n) do |round|
    # ex: if round = 3, switch_key = 3, 6, ... until it is the last possible number lower than n
    # Then we flip the true/false value contained in hash
    round.step(n,round){ |switch_key| switches[switch_key] = !switches[switch_key] }
  end

  (switches.select { |_, v| v }).keys
end

p lights_on_after_repetitive_switching(1000)