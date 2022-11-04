OUT="${1:-movie.gif}"
echo "creating '$OUT'"

convert -dispose background -transparent white -delay 10 -transparent white -loop 0 *.ppm $OUT

# mogrify -format png -transparent white *.ppm
# convert -dispose background -delay 10 -transparent white -loop 0 *.png movie.gif
# "-dispose background": remove previous image and the background
# "-dispose previous": did not remove the first image
# "-delay 10": how long to show the image before movingn on (in ms)
# "-loop 0": how many times to repeat the animation (0 is infinite)
