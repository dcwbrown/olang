set -eu
#echo INSTALLDIR = $INSTALLDIR
rm -f *.o *.obj *.exe *.sym *.c *.h signal
"$INSTALLDIR/bin/voc" signal.mod -M
./SignalTest x &
sleep 1
kill -2 $!
wait
read RESULT <result
if [ "$RESULT" != "Signal 2" ]; then echo signal test incorrect result "$RESULT"; exit 1;fi