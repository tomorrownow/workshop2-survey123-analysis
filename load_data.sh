BASEDIR="/home/coreywhite/Documents/QL2_DEMS/3m/WakeCoNC"
BASEDIR="/home/coreywhite/Documents/QL2_DEMS/3m/OrangeCoNC"
BASEDIR="/home/coreywhite/Documents/QL2_DEMS/3m/DurhamCoNC"


# Add single county 
# cd $BASEDIR
# Import rasters
# g.region res=3
# for f in *.img; do
#         r=`basename $f .img`
#         r.import input=$f output="${r}"
# done

# Set hard limit for concurrent open files on os
ulimit -n 15000
ulimit -s 65536
# MAPS1=`g.list type=raster separator=comma pat="D03_37_1*"`
# MAPS2=`g.list type=raster separator=comma pat="D03_37_2*"`


#Create a mosaic of all 10m raster tiles
# g.region raster=$MAPS1 res=3 -p
# r.patch input=$MAPS1 output=OrangeCoNC_QL2_3m_1 --overwrite

# g.region raster=$MAPS2 res=3 -p
# r.patch input=$MAPS2 output=OrangeCoNC_QL2_3m_2 --overwrite

# g.region raster=OrangeCoNC_QL2_3m_1,OrangeCoNC_QL2_3m_2 res=3 -p
# echo "Patching Map 1 and 2"
# r.patch input=OrangeCoNC_QL2_3m_1,OrangeCoNC_QL2_3m_2 output=DurhamCoNC_QL2_3m --overwrite

MAPS=`g.list type=raster separator=comma pat="Wake*"`
g.region raster=$MAPS res=3 -p
r.patch input=$MAPS output=WakeCoNC_QL2_3m --overwrite
