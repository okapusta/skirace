class A
  takes :b

  def do_b
    b.do_sth
  end
end

a = A.new
a.do_b
