class A
  takes :obj

  def do_b
    obj.do_sth
  end
end

a = A.new
a.do_b
