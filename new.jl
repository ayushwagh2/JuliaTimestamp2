using Genie, Genie.Router, Genie.Assets
using SearchLight

Genie.config.websockets_server = true # enable the websockets server
Genie.config.webchannels_default_route="ayush"

Genie.WebChannels.broadcast("ayush", "hey!")

using Messagings
Messaging()
using Users
User()

route("/") do
  Assets.channels_support()
end 




d=Dict()

channel("/ayush/join") do 
  a = params()[:WS_CLIENT]
  h = hash(a)
  s = string(h)
  
  id=params(:payload)["id"]
   
  save(User(hash=s,uid=id))
  d[id]=a
 
  return s
end
channel("/ayush/message") do
  a = params()[:WS_CLIENT]
  h = hash(a)
  s = string(h)
  key = s
   
  Rid = params()[:payload]["Rid"] 
  msg = params()[:payload]["msg"]
  Sid = params(:payload)["Sid"] 
  value = find(User, uid=Sid, hash=key )

  if  isempty(value)
    return "thsi is wrong "
  else
    Genie.WebChannels.message(d[Rid], msg)
  end


end
 