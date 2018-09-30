require 'pry'

class MeMyselfAndI
  self
  binding.pry

  def self.me
    binding.pry
    self
    binding.pry
  end

  def myself
    binding.pry
    self
    binding.pry
  end
end

i = MeMyselfAndI.new
MeMyselfAndI.me
i.myself
