# condizioni iniziali a caso
GoL = rand(Bool,100,100)
using PyPlot
using DSP
imgplot = plt[:imshow](GoL, interpolation="none")
#il seguente kernel conta il numero di vicini di ognio cellula
Kern = [true true  true; true  false  true; true true true]
for i_gen = 1:1000
    convGoL = conv2(GoL, Kern)
    #nel Gioco della Vita una cellula è viva solo se ha 2 o 3 vicini
    lives2 = convGoL .== 2
    lives3 = convGoL .== 3

    twoLiveNeig =    (GoL .& lives2[2:end-1,2:end-1])
    threeLiveNeig =  (GoL .& lives3[2:end-1,2:end-1])
    #in uno spazio vuoto nasce una cellula se ha esattamente 3 vicini
    reproduce =     (.~GoL .& lives3[2:end-1,2:end-1])

    GoL = twoLiveNeig .| threeLiveNeig .| reproduce
    imgplot = plt[:imshow](GoL, interpolation="none")
    plt[:savefig]("/Users/francescocavallo/github/CGoL/GoLpics/gen$i_gen.png")
end

# at the command prompt of where the files are stored
# ffmpeg -r 15 -f image2 -s 800x600 -i gen%d.png -vcodec libx264 -crf 20 CGoL.mp4
