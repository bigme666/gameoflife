module Generation

using DSP

    create(height, width) = rand(0:1:1, height, width)

    function next(generation)
        kern = [1 1 1;1 0 1;1 1 1]
        convgen = conv2(generation,kern)
        alive2 = convgen .== 2
        alive3 = convgen .== 3
        twoLiveNeig =    (generation .& alive2[2:end-1,2:end-1])
        threeLiveNeig =  (generation .& alive3[2:end-1,2:end-1])
        #in uno spazio vuoto nasce una cellula se ha esattamente 3 vicini
        reproduce =     (.~generation .& alive3[2:end-1,2:end-1])
        generation = twoLiveNeig .| threeLiveNeig .| reproduce
    end

end
