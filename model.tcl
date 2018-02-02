
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


model BasicBuilder -ndm 3 -ndf 3

node 	65	0	0	0
node 	66	0.143	0	0
node 	67	0.4287	0	0
node 	68	0.7144	0	0
node 	69	1.0001	0	0
node 	70	1.2858	0	0
node 	71	1.5715	0	0
node 	72	1.8572	0	0
node 	73	2.1429	0	0
node 	74	2.4286	0	0
node 	75	2.7143	0	0
node 	76	3	0	0
node 	77	3.2857	0	0
node 	78	3.5714	0	0
node 	79	3.8571	0	0
node 	80	4.0001	0	0

node 	81	0	0	0.1
node 	82	0.143	0	0.1
node 	83	0.4287	0	0.1
node 	84	0.7144	0	0.1
node 	85	1.0001	0	0.1
node 	86	1.2858	0	0.1
node 	87	1.5715	0	0.1
node 	88	1.8572	0	0.1
node 	89	2.1429	0	0.1
node 	90	2.4286	0	0.1
node 	91	2.7143	0	0.1
node 	92	3	0	0.1
node 	93	3.2857	0	0.1
node 	94	3.5714	0	0.1
node 	95	3.8571	0	0.1
node 	96	4.0001	0	0.1


model BasicBuilder -ndm 3 -ndf 6
equalDOF 	17	81	1	2	3
equalDOF 	18	82	1	2	3
equalDOF 	19	83	1	2	3
equalDOF 	20	84	1	2	3
equalDOF 	21	85	1	2	3
equalDOF 	22	86	1	2	3
equalDOF 	23	87	1	2	3
equalDOF 	24	88	1	2	3
equalDOF 	25	89	1	2	3
equalDOF 	26	90	1	2	3
equalDOF 	27	91	1	2	3
equalDOF 	28	92	1	2	3
equalDOF 	29	93	1	2	3
equalDOF 	30	94	1	2	3
equalDOF 	31	95	1	2	3
equalDOF 	32	96	1	2	3

equalDOF 	1	65	1	2	3
equalDOF 	2	66	1	2	3
equalDOF 	3	67	1	2	3
equalDOF 	4	68	1	2	3
equalDOF 	5	69	1	2	3
equalDOF 	6	70	1	2	3
equalDOF 	7	71	1	2	3
equalDOF 	8	72	1	2	3
equalDOF 	9	73	1	2	3
equalDOF 	10	74	1	2	3
equalDOF 	11	75	1	2	3
equalDOF 	12	76	1	2	3
equalDOF 	13	77	1	2	3
equalDOF 	14	78	1	2	3
equalDOF 	15	79	1	2	3
equalDOF 	16	80	1	2	3



#

#Define Constrain	
#     ndTag ux    uy    uz    rx    ry    rz  1 fix 0free;															
fix 	1	1	1	1	1	1	1 ;
fix 	16	1	1	1	1	1	0 ; 

uniaxialMaterial   Steel02        1 300e6   202.7e9  0.000001 18.5 0.925 0.15
uniaxialMaterial   Steel02        2 415e6   202.7e9  0.000001 18.5 0.925 0.15
uniaxialMaterial Elastic 50 201e9



#frictionModel Coulomb $frnTag $mu

frictionModel Coulomb 1 0.4

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

#element flatSliderBearing $eleTag $iNode $jNode $frnMdlTag $kInit -P $matTag -T $matTag -My $matTag -Mz $matTag <-orient <$x1 $x2 $x3> $y1 $y2 $y3> <-shearDist $sDratio> <-doRayleigh> <-mass $m> <-iter $maxIter $tol>
#
#element 	flatSliderBearing	62	65	81	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
#element 	flatSliderBearing	63	66	82	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
#element 	flatSliderBearing	64	67	83	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
#element 	flatSliderBearing	65	68	84	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
#element 	flatSliderBearing	66	69	85	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
#element 	flatSliderBearing	67	70	86	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
#element 	flatSliderBearing	68	71	87	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
#element 	flatSliderBearing	69	72	88	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
#element 	flatSliderBearing	70	73	89	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
#element 	flatSliderBearing	71	74	90	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
#element 	flatSliderBearing	72	75	91	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
#element 	flatSliderBearing	73	76	92	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
#element 	flatSliderBearing	74	77	93	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
#element 	flatSliderBearing	75	78	94	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
#element 	flatSliderBearing	76	79	95	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
#element 	flatSliderBearing	77	80	96	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50


element 	flatSliderBearing	62	1	17	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	63	2	18	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	64	3	19	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	65	4	20	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	66	5	21	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	67	6	22	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	68	7	23	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	69	8	24	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	70	9	25	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	71	10	26	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	72	11	27	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	73	12	28	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	74	13	29	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	75	14	30	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	76	15	31	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	77	16	32	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50


element 	flatSliderBearing	78	1	33	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	79	2	34	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	80	3	35	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	81	4	36	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	82	5	37	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	83	6	38	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	84	7	39	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	85	8	40	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	86	9	41	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	87	10	42	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	88	11	43	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	89	12	44	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	90	13	45	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	91	14	46	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	92	15	47	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	93	16	48	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50

element 	flatSliderBearing	94	1	49	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	95	2	50	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	96	3	51	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	97	4	52	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	98	5	53	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	99	6	54	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	100	7	55	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	101	8	56	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	102	9	57	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	103	10	58	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	104	11	59	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	105	12	60	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	106	13	61	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	107	14	62	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	108	15	63	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50
element 	flatSliderBearing	109	16	64	1	1.00E+10	-P	50	-T	50	-My	50	-Mz	50

recorder Node -file S2newD.out -time -node  7 -dof 3 disp
recorder Node -file S2newR1.out -time -node  1 -dof 3 reaction
recorder Node -file S3newR21.out -time -node  16 -dof 3 reaction

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
