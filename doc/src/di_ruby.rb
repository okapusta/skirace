class A 
  attr_reader :obj

  def initialize(obj)
   @obj = obj
  end

  def do_b
    obj.do_sth
  end
end

a = A.new(B.new)
a.do_b
