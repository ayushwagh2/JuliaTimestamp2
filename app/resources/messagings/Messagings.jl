module Messagings

import SearchLight: AbstractModel, DbId
import Base: @kwdef
using Dates

export Messaging

@kwdef mutable struct Messaging <: AbstractModel
  id::DbId = DbId()
  msg::String = ""
  Sid::Int = 0
  Rid::Int = 0
  time::DateTime = now()
end

end
