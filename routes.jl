using Genie.Router
using Genie.Requests

route("/") do
  serve_static_file("welcome.html")
end

using Emails


route("/email") do
  e=payload(:hello)
  f=payload(:lastname)


  c=Email(name=e,lastname=f)
  
  g=findone(Email, lastname=f)  


  if isnothing(g)
    g = Email(lastname=f, counter=1)
    save(g)
  else
    g.counter += 1 
    save(g)
     
  end

end



route("/add") do
  a=payload(:a)
  b=payload(:b)
  i=parse(Int, a)
  j=parse(Int, b)
  i+j
  
end

