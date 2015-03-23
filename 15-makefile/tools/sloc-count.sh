#-----------------------
#sloc-count.sh
#(c) H.Buchmann FHNW 2015
# ${1} directory
#-----------------------
#we are in 15-makefile
MAKEFILE_HOME="15-makefile"
[[ $(basename ${PWD}) != ${MAKEFILE_HOME} ]] &&
{
 echo "not in ${MAKEFILE_HOME}"
 exit 1
}
[[ ! -d ${1} ]] && 
{
 echo "usage ${0} sourcefile directory"
}
sloccount --datadir sloccount ${1}  
#try
##sloccount --cached --details --datadir sloccount 
