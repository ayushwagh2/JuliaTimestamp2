using Genie, Genie.Router, Genie.Assets
using SearchLight

Genie.config.websockets_server = true # enable the websockets server
Genie.config.webchannels_default_route="ayush"

Genie.WebChannels.broadcast("ayush", "hey!")

route("/") do
  Assets.channels_support()
end 
 
d=Dict()
channel("/ayush/join") do
  a = params()[:WS_CLIENT]
  id=params(:payload)["id"]
  d[id]=a
  
    end
    

using Messagings
Messaging()
channel("/ayush/message") do
  ws = params()[:WS_CLIENT]
  Rid = params()[:payload]["Rid"]
  Sid = params(:payload)["Sid"]
  msg = params()[:payload]["msg"]
  d[Rid]
  
  Genie.WebChannels.message(d[Rid],msg)
  save(Messaging(msg=msg,Sid=Sid,Rid=Rid))
  
end


find(Messaging, Sid=1)
