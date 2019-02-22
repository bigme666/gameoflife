include("generation.jl")
include("display.jl")
include("video.jl")

function main(height, width, number_of_generation)
    generation = Generation.create(height, width)
    for i in 1:number_of_generation
        Display.draw(generation,i)
        generation = Generation.next(generation)
    end
end
main(100,100,100)
#cd("$(homedir())/github/gameoflife/Worldpics")
#ffmpeg -r 15 -f image2 -s 800x600 -i gen%d.png -vcodec libx264 -crf 20 CGoL.mp4
