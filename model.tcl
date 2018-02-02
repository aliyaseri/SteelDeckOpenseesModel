
#3D Steel Deck Model
#Written by ali yaseripour 
#Unit N,m

wipe
model BasicBuilder -ndm 3 -ndf 6

source node.tcl


#define Rigidity 


#rigidLink 	beam	master node 	slave node
#rigidLink 	beam	17	17
#rigidLink 	beam	18	18
#rigidLink 	beam	19	19
#rigidLink 	beam	20	20
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
rigidLink 	beam	17	65
rigidLink 	beam	18	66
rigidLink 	beam	19	67
rigidLink 	beam	20	68
rigidLink 	beam	21	69
rigidLink 	beam	22	70
rigidLink 	beam	23	71
rigidLink 	beam	24	72
rigidLink 	beam	25	73
rigidLink 	beam	26	74
rigidLink 	beam	27	75
rigidLink 	beam	28	76
rigidLink 	beam	29	77
rigidLink 	beam	30	78
rigidLink 	beam	31	79
rigidLink 	beam	32	80





#

#Define Constrain	
#     ndTag ux    uy    uz    rx    ry    rz  1 fix 0free;															
fix 	1	1	1	1	1	1	1 ;
fix 	16	1	1	1	1	1	0 ; 

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

##element 	truss	eleTag	I 	j	A	matTag
#element 	truss	46	1	17	0.1	2
#element 	truss	47	2	18	0.1	2
#element 	truss	48	3	19	0.1	2
#element 	truss	49	4	20	0.1	2
#element 	truss	50	5	21	0.1	2
#element 	truss	51	6	22	0.1	2
#element 	truss	52	7	23	0.1	2
#element 	truss	53	8	24	0.1	2
#element 	truss	54	9	25	0.1	2
#element 	truss	55	10	26	0.1	2
#element 	truss	56	11	27	0.1	2
#element 	truss	57	12	28	0.1	2
#element 	truss	58	13	29	0.1	2
#element 	truss	59	14	30	0.1	2
#element 	truss	60	15	31	0.1	2
#element 	truss	61	16	32	0.1	2


#element 	beam	eleTag	I 	j	A	E	G	J	Iz	Iy	transtag	mass
element 	elasticBeamColumn	46	1	17	0.000314159	2.10E+11	80769230769	1.5708E-08	7.85398E-09	7.85398E-09	1	7850
element 	elasticBeamColumn	47	2	18	0.000314159	2.10E+11	80769230769	1.5708E-08	7.85398E-09	7.85398E-09	1	7850
element 	elasticBeamColumn	48	3	19	0.000314159	2.10E+11	80769230769	1.5708E-08	7.85398E-09	7.85398E-09	1	7850
element 	elasticBeamColumn	49	4	20	0.000314159	2.10E+11	80769230769	1.5708E-08	7.85398E-09	7.85398E-09	1	7850
element 	elasticBeamColumn	50	5	21	0.000314159	2.10E+11	80769230769	1.5708E-08	7.85398E-09	7.85398E-09	1	7850
element 	elasticBeamColumn	51	6	22	0.000314159	2.10E+11	80769230769	1.5708E-08	7.85398E-09	7.85398E-09	1	7850
element 	elasticBeamColumn	52	7	23	0.000314159	2.10E+11	80769230769	1.5708E-08	7.85398E-09	7.85398E-09	1	7850
element 	elasticBeamColumn	53	8	24	0.000314159	2.10E+11	80769230769	1.5708E-08	7.85398E-09	7.85398E-09	1	7850
element 	elasticBeamColumn	54	9	25	0.000314159	2.10E+11	80769230769	1.5708E-08	7.85398E-09	7.85398E-09	1	7850
element 	elasticBeamColumn	55	10	26	0.000314159	2.10E+11	80769230769	1.5708E-08	7.85398E-09	7.85398E-09	1	7850
element 	elasticBeamColumn	56	11	27	0.000314159	2.10E+11	80769230769	1.5708E-08	7.85398E-09	7.85398E-09	1	7850
element 	elasticBeamColumn	57	12	28	0.000314159	2.10E+11	80769230769	1.5708E-08	7.85398E-09	7.85398E-09	1	7850
element 	elasticBeamColumn	58	13	29	0.000314159	2.10E+11	80769230769	1.5708E-08	7.85398E-09	7.85398E-09	1	7850
element 	elasticBeamColumn	59	14	30	0.000314159	2.10E+11	80769230769	1.5708E-08	7.85398E-09	7.85398E-09	1	7850
element 	elasticBeamColumn	60	15	31	0.000314159	2.10E+11	80769230769	1.5708E-08	7.85398E-09	7.85398E-09	1	7850
element 	elasticBeamColumn	61	16	32	0.000314159	2.10E+11	80769230769	1.5708E-08	7.85398E-09	7.85398E-09	1	7850


#element 	elasticBeamColumn	46	1	17	0.125663706	2.10E+11	80769230769	0.002513274	0.001256637	0.001256637	1	7850
#element 	elasticBeamColumn	47	2	18	0.125663706	2.10E+11	80769230769	0.002513274	0.001256637	0.001256637	1	7850
#element 	elasticBeamColumn	48	3	19	0.125663706	2.10E+11	80769230769	0.002513274	0.001256637	0.001256637	1	7850
#element 	elasticBeamColumn	49	4	20	0.125663706	2.10E+11	80769230769	0.002513274	0.001256637	0.001256637	1	7850
#element 	elasticBeamColumn	50	5	21	0.125663706	2.10E+11	80769230769	0.002513274	0.001256637	0.001256637	1	7850
#element 	elasticBeamColumn	51	6	22	0.125663706	2.10E+11	80769230769	0.002513274	0.001256637	0.001256637	1	7850
#element 	elasticBeamColumn	52	7	23	0.125663706	2.10E+11	80769230769	0.002513274	0.001256637	0.001256637	1	7850
#element 	elasticBeamColumn	53	8	24	0.125663706	2.10E+11	80769230769	0.002513274	0.001256637	0.001256637	1	7850
#element 	elasticBeamColumn	54	9	25	0.125663706	2.10E+11	80769230769	0.002513274	0.001256637	0.001256637	1	7850
#element 	elasticBeamColumn	55	10	26	0.125663706	2.10E+11	80769230769	0.002513274	0.001256637	0.001256637	1	7850
#element 	elasticBeamColumn	56	11	27	0.125663706	2.10E+11	80769230769	0.002513274	0.001256637	0.001256637	1	7850
#element 	elasticBeamColumn	57	12	28	0.125663706	2.10E+11	80769230769	0.002513274	0.001256637	0.001256637	1	7850
#element 	elasticBeamColumn	58	13	29	0.125663706	2.10E+11	80769230769	0.002513274	0.001256637	0.001256637	1	7850
#element 	elasticBeamColumn	59	14	30	0.125663706	2.10E+11	80769230769	0.002513274	0.001256637	0.001256637	1	7850
#element 	elasticBeamColumn	60	15	31	0.125663706	2.10E+11	80769230769	0.002513274	0.001256637	0.001256637	1	7850
#element 	elasticBeamColumn	61	16	32	0.125663706	2.10E+11	80769230769	0.002513274	0.001256637	0.001256637	1	7850


#element zeroLengthContact3D $eleTag $sNode $mNode $Kn $Kt $mu $c $dir
element 	zeroLengthContact3D	62	65	1	1.00E+10	1.00E+10	0.4	0	1
element 	zeroLengthContact3D	63	66	2	1.00E+10	1.00E+10	0.4	0	1
element 	zeroLengthContact3D	64	67	3	1.00E+10	1.00E+10	0.4	0	1
element 	zeroLengthContact3D	65	68	4	1.00E+10	1.00E+10	0.4	0	1
element 	zeroLengthContact3D	66	69	5	1.00E+10	1.00E+10	0.4	0	1
element 	zeroLengthContact3D	67	70	6	1.00E+10	1.00E+10	0.4	0	1
element 	zeroLengthContact3D	68	71	7	1.00E+10	1.00E+10	0.4	0	1
element 	zeroLengthContact3D	69	72	8	1.00E+10	1.00E+10	0.4	0	1
element 	zeroLengthContact3D	70	72	8	1.00E+10	1.00E+10	0.4	0	1
element 	zeroLengthContact3D	71	74	10	1.00E+10	1.00E+10	0.4	0	1
element 	zeroLengthContact3D	72	75	11	1.00E+10	1.00E+10	0.4	0	1
element 	zeroLengthContact3D	73	76	12	1.00E+10	1.00E+10	0.4	0	1
element 	zeroLengthContact3D	74	77	13	1.00E+10	1.00E+10	0.4	0	1
element 	zeroLengthContact3D	75	78	14	1.00E+10	1.00E+10	0.4	0	1
element 	zeroLengthContact3D	76	79	15	1.00E+10	1.00E+10	0.4	0	1
element 	zeroLengthContact3D	77	80	16	1.00E+10	1.00E+10	0.4	0	1
puts "    creat to it"
#


recorder Node -file AnewD.out -time -node  7 -dof 3 disp
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
