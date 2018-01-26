
#3D Steel Deck Model
#Written by ali yaseripour 
#Unit N,m

wipe
model BasicBuilder -ndm 3 -ndf 6

source node.tcl


#define Rigidity 


#rigidLink 	beam	master node 	slave node
#rigidLink 	beam	1	17
#rigidLink 	beam	2	18
#rigidLink 	beam	3	19
#rigidLink 	beam	4	20
#rigidLink 	beam	5	21
#rigidLink 	beam	6	22
#rigidLink 	beam	7	23
#rigidLink 	beam	8	24
#rigidLink 	beam	9	25
#rigidLink 	beam	10	26
#rigidLink 	beam	11	27
#rigidLink 	beam	12	28
#rigidLink 	beam	13	29
#rigidLink 	beam	14	30
#rigidLink 	beam	15	31
#rigidLink 	beam	16	32






#

#Define Constrain	
#     ndTag ux    uy    uz    rx    ry    rz  1 fix 0free;															
fix 	1	1	1	1	1	1	1 ;
fix 	16	1	1	1	1	1	0 ; 



## new material for steel and stud 
uniaxialMaterial   Steel02        1 300e6   202.7e9  0.000001 18.5 0.925 0.15
uniaxialMaterial   Steel02        2 415e6   202.7e9  0.000001 18.5 0.925 0.15


#nDmaterial PlaneStressUserMaterial $matTag 40 7 $fc $ft $fcu $epsc0 $epscu $epstu $stc
#                                                               fc         ft    fcu     epsc0     epscu  epstu  stc
nDMaterial PlaneStressUserMaterial    3       40         7    41.0e6     2.08e6 -6.16e6  -0.002    -0.005 0.001 0.05
 
#nDmaterial PlateFromPlaneStress $newmatTag $matTag $OutofPlaneModulus
# nDMaterial PlateFromPlaneStress $matTag $PlaneStressMatTag $OutOfPlaneShearModulus #?????
nDMaterial   PlateFromPlaneStress    4        3   1.283e10

#nDmaterial PlateRebar $newmatTag $matTag $sita

nDMaterial PlateRebar 5 2 90
nDMaterial PlateRebar 6 2 0


#section PlateFiber 1 3 0.156
#long 0.00238
#tra 0.000267
#section LayeredShell $sectionTag $nLayers $matTag1 $thickness1...$matTagn $thicknessn
section LayeredShell 1 3 4 0.156 5 0.00238 6 0.000267;




##new material and section for contact
#nDMaterial ContactMaterial3D $matTag $mu $G $c $t

#nDMaterial ContactMaterial3D 10 0.4 1000.0 0.0 0.0;


#frictionModel Coulomb $frnTag $mu
frictionModel Coulomb 10 0.4


#section PlateFiber $secTag $matTag $h
section PlateFiber 20 10 0.001




set E 2.001E11;
set G [expr $E/(2.0*(1.0+0.3))];

section Fiber 360 -GJ [expr $G*6.21E-05] { ;
patch	quad	1	10	3	-0.08285	0.1415	0.08285	0.1415	0.08285	0.1533	-0.08285	0.1533
patch	quad	1	3	10	-0.00335	-0.1415	0.00335	-0.1415	0.00335	0.1415	-0.00335	0.1415
patch	quad	1	10	3	-0.08285	-0.1533	0.08285	-0.1533	0.08285	-0.1415	-0.08285	-0.1415

} ;

geomTransf PDelta 1 0 1 0;
#geomTransf Linear 2 0 0 -1;

source element.tcl





recorder Node -file  AnewD.out -time -node  7 -dof 3 disp
recorder Node -file AnewR1.out -time -node  1 -dof 3 reaction
recorder Node -file AnewR21.out -time -node  16 -dof 3 reaction

#load
pattern Plain 1 Linear { ;
#eleLoad -ele $eleTag1 <$eleTag2 ....> -type -beamUniform $Wy <$Wx>
load 7 0.0 0.0 10.0 0.0 0.0 0.0  
#load 33 0.0 0.0 10.0 0.0 0.0 0.0 
};


#constraints Transformation
#numberer RCM
#system UmfPack 
#test EnergyIncr 1.0e-5 25 0
#algorithm ModifiedNewton

constraints Transformation;
numberer RCM;
##system BandGeneral;
system UmfPack 
##test NormDispIncr 1.0e-3 200 ;
test EnergyIncr 1.0e-5 200 0;
##algorithm BFGS -count 200
##algorithm NewtonLineSearch
algorithm KrylovNewton;
##algorithm ModifiedNewton
##
integrator DisplacementControl 7 3 -0.0001
##integrator LoadControl 50;	
analysis Static;

#
#source Solver.tcl
#integrator DisplacementControl 10 3 0.001;
analyze 10000;
loadConst -time 0.0;
puts "    pushover is built!"
exit;
