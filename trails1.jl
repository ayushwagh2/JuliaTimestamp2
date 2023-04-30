using Genie, Genie.Router, Genie.Assets

Genie.config.websockets_server = true # enable the websockets server
Genie.config.webchannels_default_route="ayu"
 

Genie.WebChannels.broadcast("ayu", "hey!")

route("/") do
  Assets.channels_support()
end

g=[]
d=Dict()

channel("/ayu/echo") do
    ws=params()[:WS_CLIENT]
    push!(g ,ws)
    
    
    "FIRST TRY $(params(:payload))"
    println(params(:payload))
    
    
    if ws==d["1"]

      Genie.WebChannels.message(d["2"], params(:payload))

  
    end  
    if ws==d["2"]

      Genie.WebChannels.message(d["1"], params(:payload))
      
  
    end  
   
   
  end
  
channel("/ayu/setid") do
  ws=params()[:WS_CLIENT]
  push!(g ,ws)
  
  
  "FIRST TRY $(params(:payload))"
  println(params(:payload))
  l=params(:payload)
  d[l]=ws
 
end








  if  :WS_CLIENT==g[4]

  
  end  
  
  
  g
  if :WS_CLIENT==g[1]
  
    Genie.WebChannels.message(g[2], (params(:payload)))
  
  end
  
 
