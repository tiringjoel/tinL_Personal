#-----------------------
#sloc-count.sh
#(c) H.Buchmann FHNW 2015
# ${1} directory
#-----------------------
#we are in 4-devel
[[ ! -d ${1} ]] && 
{
 echo "usage ${0} sourcefile directory"
 exit 1
}
sloccount --datadir sloccount ${1}  
#try
##sloccount --cached --details --datadir sloccount 
