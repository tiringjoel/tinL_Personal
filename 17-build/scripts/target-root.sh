#------------------
#target-root.sh
#(c) H.Buchmann FHNW 2015
#------------------
. scripts/common.sh
function crdir()
{
  mkdir -p ${TARGET_ROOT}/${1}
}


crdir proc
crdir sys
crdir dev
crdir home/root
crdir dev/pts


fakeroot tar -cvzf ${BUILD_HOME}/target-root.tar.gz -C ${TARGET_ROOT} .
#copy to sd-card
# sudo tar -xzvf target-root.tar.gz  -C home-of-sd-card  .
#sync
