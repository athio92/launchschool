def fields(str)
  str.split(/[,\s]+/)
end


p fields("Pete,201,Student")
p fields("Pete \t 201    ,  TA")
p fields("Pete \t 201")