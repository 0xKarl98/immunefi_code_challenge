# Description 
This challenge code is broken , as one may doing the following to break it :
 - There is no gas limitation , so one can exhaust remaining gas to stop others using the provided functions ;
 - The deposit function itself is weird , as this only emits the event without doing other useful things ;
 - The msg.value sent to deposit function can even be 0 or negative , since they use if , not require .
