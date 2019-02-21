module Display

using PyPlot

function draw(generation)
    imgplot = plt[:imshow](World, interpolation="none")
    plt[:savefig]("/Users/francescocavallo/github/gameoflife/Worldpics/gen$generation.png")
end

end
