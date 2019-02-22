module Display

using PyPlot

    function draw(generation,n)
        imgplot = plt[:imshow](generation, interpolation="none")
        plt[:savefig]("/Users/francescocavallo/github/gameoflife/Worldpics/gen$n.png")
    end

end
