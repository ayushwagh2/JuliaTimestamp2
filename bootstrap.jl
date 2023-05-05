(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir



using Tutorialapp1
push!(Base.modules_warned_for, Base.PkgId(Tutorialapp1))
Tutorialapp1.main()

