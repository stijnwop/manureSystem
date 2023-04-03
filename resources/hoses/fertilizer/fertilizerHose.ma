//Maya ASCII 2023 scene
//Name: fertilizerHose.ma
//Last modified: Mon, Apr 03, 2023 10:59:47 PM
//Codeset: 1252
requires maya "2023";
requires "stereoCamera" "10.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2023";
fileInfo "version" "2023";
fileInfo "cutIdentifier" "202202161415-df43006fd3";
fileInfo "osv" "Windows 11 Pro v2009 (Build: 22621)";
fileInfo "UUID" "E7B1BBC7-4F81-000C-64CC-8285A8310125";
createNode transform -s -n "persp";
	rename -uid "5CFE647B-4C79-57C7-93A7-AD84FB1F2C3E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 6.5955024100658504 4.0589630531191281 -5.1308313860225452 ;
	setAttr ".r" -type "double3" -31.538352729722078 -270.59999999999735 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "F42B7A2C-4AD7-B439-F73E-769B1B99528D";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 8.604283455288213;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 1.5265566588595902e-16 1.862645149230957e-07 -2.6288334117661876 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "06BD910D-473D-762F-FB8D-93882C52355B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "A17AC8CE-4FEA-9B55-F791-48B149CFF4F1";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 16.573589077247927;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "7633A1DD-4C19-F832-7FF2-169BB03FE9F5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "EB57CA9C-424E-5016-8431-9E8935D04D89";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 12.420863248588899;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "75879AC8-4CB9-D39E-3BA9-5BBDD561D8E3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 -0.0030933499547639784 -5.2341123249197681 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "8A35C171-4E23-FA0B-4465-69A0126B0796";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 0.20834963743220292;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "hose_main_component1";
	rename -uid "9775E4B1-4DDB-746F-9616-E4AA746D52B5";
	addAttr -ci true -sn "i3D_lightMask" -ln "i3D_lightMask" -dt "string";
	addAttr -ci true -sn "i3D_xmlIdentifier" -ln "i3D_xmlIdentifier" -dt "string";
	addAttr -ci true -sn "i3D_static" -ln "i3D_static" -nn "i3D_static" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_dynamic" -ln "i3D_dynamic" -nn "i3D_dynamic" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_kinematic" -ln "i3D_kinematic" -nn "i3D_kinematic" -min
		0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_compound" -ln "i3D_compound" -nn "i3D_compound" -min 0
		-max 1 -at "bool";
	addAttr -ci true -sn "i3D_compoundChild" -ln "i3D_compoundChild" -nn "i3D_compoundChild"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_collision" -ln "i3D_collision" -nn "i3D_collision" -min
		0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_collisionMask" -ln "i3D_collisionMask" -nn "i3D_collisionMask"
		-dt "string";
	addAttr -ci true -sn "i3D_solverIterationCount" -ln "i3D_solverIterationCount" -nn "i3D_solverIterationCount"
		-at "long";
	addAttr -ci true -sn "i3D_restitution" -ln "i3D_restitution" -nn "i3D_restitution"
		-at "float";
	addAttr -ci true -sn "i3D_staticFriction" -ln "i3D_staticFriction" -nn "i3D_staticFriction"
		-at "float";
	addAttr -ci true -sn "i3D_dynamicFriction" -ln "i3D_dynamicFriction" -nn "i3D_dynamicFriction"
		-at "float";
	addAttr -ci true -sn "i3D_linearDamping" -ln "i3D_linearDamping" -nn "i3D_linearDamping"
		-at "float";
	addAttr -ci true -sn "i3D_angularDamping" -ln "i3D_angularDamping" -nn "i3D_angularDamping"
		-at "float";
	addAttr -ci true -sn "i3D_density" -ln "i3D_density" -nn "i3D_density" -at "float";
	addAttr -ci true -sn "i3D_ccd" -ln "i3D_ccd" -nn "i3D_ccd" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_trigger" -ln "i3D_trigger" -nn "i3D_trigger" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_splitType" -ln "i3D_splitType" -nn "i3D_splitType" -at "long";
	addAttr -ci true -sn "i3D_splitMinU" -ln "i3D_splitMinU" -nn "i3D_splitMinU" -at "float";
	addAttr -ci true -sn "i3D_splitMinV" -ln "i3D_splitMinV" -nn "i3D_splitMinV" -at "float";
	addAttr -ci true -sn "i3D_splitMaxU" -ln "i3D_splitMaxU" -nn "i3D_splitMaxU" -at "float";
	addAttr -ci true -sn "i3D_splitMaxV" -ln "i3D_splitMaxV" -nn "i3D_splitMaxV" -at "float";
	addAttr -ci true -sn "i3D_splitUvWorldScale" -ln "i3D_splitUvWorldScale" -nn "i3D_splitUvWorldScale"
		-at "float";
	addAttr -ci true -sn "i3D_joint" -ln "i3D_joint" -nn "i3D_joint" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_projection" -ln "i3D_projection" -nn "i3D_projection"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_projDistance" -ln "i3D_projDistance" -nn "i3D_projDistance"
		-at "float";
	addAttr -ci true -sn "i3D_projAngle" -ln "i3D_projAngle" -nn "i3D_projAngle" -at "float";
	addAttr -ci true -sn "i3D_xAxisDrive" -ln "i3D_xAxisDrive" -nn "i3D_xAxisDrive"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_yAxisDrive" -ln "i3D_yAxisDrive" -nn "i3D_yAxisDrive"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_zAxisDrive" -ln "i3D_zAxisDrive" -nn "i3D_zAxisDrive"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_drivePos" -ln "i3D_drivePos" -nn "i3D_drivePos" -min 0
		-max 1 -at "bool";
	addAttr -ci true -sn "i3D_driveForceLimit" -ln "i3D_driveForceLimit" -nn "i3D_driveForceLimit"
		-at "float";
	addAttr -ci true -sn "i3D_driveSpring" -ln "i3D_driveSpring" -nn "i3D_driveSpring"
		-at "float";
	addAttr -ci true -sn "i3D_driveDamping" -ln "i3D_driveDamping" -nn "i3D_driveDamping"
		-at "float";
	addAttr -ci true -sn "i3D_breakableJoint" -ln "i3D_breakableJoint" -nn "i3D_breakableJoint"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_jointBreakForce" -ln "i3D_jointBreakForce" -nn "i3D_jointBreakForce"
		-at "float";
	addAttr -ci true -sn "i3D_jointBreakTorque" -ln "i3D_jointBreakTorque" -nn "i3D_jointBreakTorque"
		-at "float";
	addAttr -ci true -sn "i3D_oc" -ln "i3D_oc" -nn "i3D_oc" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_nonRenderable" -ln "i3D_nonRenderable" -nn "i3D_nonRenderable"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_clipDistance" -ln "i3D_clipDistance" -nn "i3D_clipDistance"
		-at "float";
	addAttr -ci true -sn "i3D_objectMask" -ln "i3D_objectMask" -nn "i3D_objectMask"
		-at "long";
	addAttr -ci true -sn "i3D_navMeshMask" -ln "i3D_navMeshMask" -nn "i3D_navMeshMask"
		-at "long";
	addAttr -ci true -sn "i3D_decalLayer" -ln "i3D_decalLayer" -nn "i3D_decalLayer"
		-at "long";
	addAttr -ci true -sn "i3D_mergeGroup" -ln "i3D_mergeGroup" -nn "i3D_mergeGroup"
		-at "long";
	addAttr -ci true -sn "i3D_mergeGroupRoot" -ln "i3D_mergeGroupRoot" -nn "i3D_mergeGroupRoot"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_boundingVolume" -ln "i3D_boundingVolume" -nn "i3D_boundingVolume"
		-dt "string";
	addAttr -ci true -sn "i3D_cpuMesh" -ln "i3D_cpuMesh" -nn "i3D_cpuMesh" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_mergeChildren" -ln "i3D_mergeChildren" -nn "i3D_mergeChildren"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeChildrenFreezeTrans" -ln "i3D_mergeChildrenFreezeTrans"
		-nn "i3D_mergeChildrenFreezeTrans" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeChildrenFreezeRot" -ln "i3D_mergeChildrenFreezeRot"
		-nn "i3D_mergeChildrenFreezeRot" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeChildrenFreezeScale" -ln "i3D_mergeChildrenFreezeScale"
		-nn "i3D_mergeChildrenFreezeScale" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lod" -ln "i3D_lod" -nn "i3D_lod" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lod1" -ln "i3D_lod1" -nn "i3D_lod1" -at "float";
	addAttr -ci true -sn "i3D_lod2" -ln "i3D_lod2" -nn "i3D_lod2" -at "float";
	addAttr -ci true -sn "i3D_lod3" -ln "i3D_lod3" -nn "i3D_lod3" -at "float";
	addAttr -ci true -sn "i3D_scaled" -ln "i3D_scaled" -nn "i3D_scaled" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataFilePath" -ln "i3D_objectDataFilePath" -nn "i3D_objectDataFilePath"
		-dt "string";
	addAttr -ci true -sn "i3D_objectDataExportPosition" -ln "i3D_objectDataExportPosition"
		-nn "i3D_objectDataExportPosition" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataExportOrientation" -ln "i3D_objectDataExportOrientation"
		-nn "i3D_objectDataExportOrientation" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataExportScale" -ln "i3D_objectDataExportScale"
		-nn "i3D_objectDataExportScale" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataHideFirstAndLastObject" -ln "i3D_objectDataHideFirstAndLastObject"
		-nn "i3D_objectDataHideFirstAndLastObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataHierarchicalSetup" -ln "i3D_objectDataHierarchicalSetup"
		-nn "i3D_objectDataHierarchicalSetup" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_minuteOfDayStart" -ln "i3D_minuteOfDayStart" -nn "i3D_minuteOfDayStart"
		-at "long";
	addAttr -ci true -sn "i3D_minuteOfDayEnd" -ln "i3D_minuteOfDayEnd" -nn "i3D_minuteOfDayEnd"
		-at "long";
	addAttr -ci true -sn "i3D_dayOfYearStart" -ln "i3D_dayOfYearStart" -nn "i3D_dayOfYearStart"
		-at "long";
	addAttr -ci true -sn "i3D_dayOfYearEnd" -ln "i3D_dayOfYearEnd" -nn "i3D_dayOfYearEnd"
		-at "long";
	addAttr -ci true -sn "i3D_weatherRequiredMask" -ln "i3D_weatherRequiredMask" -nn "i3D_weatherRequiredMask"
		-dt "string";
	addAttr -ci true -sn "i3D_weatherPreventMask" -ln "i3D_weatherPreventMask" -nn "i3D_weatherPreventMask"
		-dt "string";
	addAttr -ci true -sn "i3D_viewerSpacialityRequiredMask" -ln "i3D_viewerSpacialityRequiredMask"
		-nn "i3D_viewerSpacialityRequiredMask" -dt "string";
	addAttr -ci true -sn "i3D_viewerSpacialityPreventMask" -ln "i3D_viewerSpacialityPreventMask"
		-nn "i3D_viewerSpacialityPreventMask" -dt "string";
	addAttr -ci true -sn "i3D_renderInvisible" -ln "i3D_renderInvisible" -nn "i3D_renderInvisible"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_visibleShaderParameter" -ln "i3D_visibleShaderParameter"
		-nn "i3D_visibleShaderParameter" -at "float";
	addAttr -ci true -sn "i3D_forceVisibilityCondition" -ln "i3D_forceVisibilityCondition"
		-nn "i3D_forceVisibilityCondition" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.7587087570641199e-31 0 -3.8857805861880487e-15 ;
	setAttr ".i3D_lightMask" -type "string" "FFFF";
	setAttr ".i3D_xmlIdentifier" -type "string" "hose_main_component1";
	setAttr ".i3D_dynamic" yes;
	setAttr ".i3D_compound" yes;
	setAttr ".i3D_collision" yes;
	setAttr ".i3D_collisionMask" -type "string" "2109442";
	setAttr ".i3D_solverIterationCount" 4;
	setAttr ".i3D_staticFriction" 0.5;
	setAttr ".i3D_dynamicFriction" 0.5;
	setAttr ".i3D_angularDamping" 0.0099999997764825821;
	setAttr ".i3D_density" 1;
	setAttr ".i3D_splitMaxU" 1;
	setAttr ".i3D_splitMaxV" 1;
	setAttr ".i3D_splitUvWorldScale" 1;
	setAttr ".i3D_projDistance" 0.0099999997764825821;
	setAttr ".i3D_projAngle" 0.0099999997764825821;
	setAttr ".i3D_driveForceLimit" 100000;
	setAttr ".i3D_driveSpring" 1;
	setAttr ".i3D_driveDamping" 0.0099999997764825821;
	setAttr ".i3D_nonRenderable" yes;
	setAttr ".i3D_clipDistance" 300;
	setAttr ".i3D_objectMask" 255;
	setAttr ".i3D_navMeshMask" 255;
	setAttr ".i3D_boundingVolume" -type "string" "";
	setAttr ".i3D_cpuMesh" yes;
	setAttr ".i3D_objectDataFilePath" -type "string" "";
	setAttr ".i3D_objectDataExportPosition" yes;
	setAttr ".i3D_objectDataExportOrientation" yes;
	setAttr ".i3D_weatherRequiredMask" -type "string" "0";
	setAttr ".i3D_weatherPreventMask" -type "string" "0";
	setAttr ".i3D_viewerSpacialityRequiredMask" -type "string" "0";
	setAttr ".i3D_viewerSpacialityPreventMask" -type "string" "0";
	setAttr ".i3D_visibleShaderParameter" 1;
createNode mesh -n "hose_main_componentShape1" -p "hose_main_component1";
	rename -uid "6CA43479-40FA-78D4-E491-89A32E08A0AA";
	setAttr -k off ".v";
	setAttr ".tmp" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5000000074505806 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 36 ".uvst[0].uvsp[0:35]" -type "float2" 0.61048543 0.04576458
		 0.5 1.4901161e-08 0.38951457 0.04576458 0.34375 0.15625 0.38951457 0.26673543 0.5
		 0.3125 0.61048543 0.26673543 0.65625 0.15625 0.375 0.3125 0.40625 0.3125 0.4375 0.3125
		 0.46875 0.3125 0.5 0.3125 0.53125 0.3125 0.5625 0.3125 0.59375 0.3125 0.625 0.3125
		 0.375 0.68843985 0.40625 0.68843985 0.4375 0.68843985 0.46875 0.68843985 0.5 0.68843985
		 0.53125 0.68843985 0.5625 0.68843985 0.59375 0.68843985 0.625 0.68843985 0.61048543
		 0.73326457 0.5 0.6875 0.38951457 0.73326457 0.34375 0.84375 0.38951457 0.95423543
		 0.5 1 0.61048543 0.95423543 0.65625 0.84375 0.5 0.15000001 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".op" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 18 ".vt[0:17]"  0.03269529 -0.03269529 -0.99999994 1.2246467e-16 -0.046238121 -0.99999994
		 -0.03269529 -0.03269529 -0.99999994 -0.046238121 2.0584149e-16 -0.99999994 -0.03269529 0.03269529 -0.99999994
		 1.2246467e-16 0.046238124 -0.99999994 0.032695293 0.032695293 -0.99999994 0.046238128 2.0584149e-16 -0.99999994
		 0.03269529 -0.03269529 -1.4901161e-08 1.824866e-24 -0.046238121 -1.4901161e-08 -0.03269529 -0.03269529 -1.4901161e-08
		 -0.046238121 -1.0266924e-17 -1.4901161e-08 -0.03269529 0.03269529 -1.4901161e-08
		 1.824866e-24 0.046238124 -1.4901161e-08 0.032695293 0.032695293 -1.4901161e-08 0.046238128 -1.0266924e-17 -1.4901161e-08
		 1.2246467e-16 2.0584149e-16 -0.99999994 1.824866e-24 -1.0266924e-17 -1.4901161e-08;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 0 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 8 0 0 8 0 1 9 0 2 10 0
		 3 11 0 4 12 0 5 13 0 6 14 0 7 15 0 16 0 1 16 1 1 16 2 1 16 3 1 16 4 1 16 5 1 16 6 1
		 16 7 1 8 17 1 9 17 1 10 17 1 11 17 1 12 17 1 13 17 1 14 17 1 15 17 1;
	setAttr -s 24 -ch 80 ".fc[0:23]" -type "polyFaces"
		f 4 16 8 -18 -1
		mu 0 4 8 17 18 9
		f 4 17 9 -19 -2
		mu 0 4 9 18 19 10
		f 4 18 10 -20 -3
		mu 0 4 10 19 20 11
		f 4 19 11 -21 -4
		mu 0 4 11 20 21 12
		f 4 20 12 -22 -5
		mu 0 4 12 21 22 13
		f 4 21 13 -23 -6
		mu 0 4 13 22 23 14
		f 4 22 14 -24 -7
		mu 0 4 14 23 24 15
		f 4 23 15 -17 -8
		mu 0 4 15 24 25 16
		f 3 -26 24 0
		mu 0 3 1 34 0
		f 3 -27 25 1
		mu 0 3 2 34 1
		f 3 -28 26 2
		mu 0 3 3 34 2
		f 3 -29 27 3
		mu 0 3 4 34 3
		f 3 -30 28 4
		mu 0 3 5 34 4
		f 3 -31 29 5
		mu 0 3 6 34 5
		f 3 -32 30 6
		mu 0 3 7 34 6
		f 3 -25 31 7
		mu 0 3 0 34 7
		f 3 32 -34 -9
		mu 0 3 32 35 31
		f 3 33 -35 -10
		mu 0 3 31 35 30
		f 3 34 -36 -11
		mu 0 3 30 35 29
		f 3 35 -37 -12
		mu 0 3 29 35 28
		f 3 36 -38 -13
		mu 0 3 28 35 27
		f 3 37 -39 -14
		mu 0 3 27 35 26
		f 3 38 -40 -15
		mu 0 3 26 35 33
		f 3 39 -33 -16
		mu 0 3 33 35 32;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "fertilizer_coupling_camplock_1" -p "hose_main_component1";
	rename -uid "77A762EF-4AFA-F2E8-8A25-419633F691A6";
	addAttr -ci true -sn "i3D_xmlIdentifier" -ln "i3D_xmlIdentifier" -dt "string";
	addAttr -ci true -sn "i3D_objectMask" -ln "i3D_objectMask" -at "long";
	addAttr -ci true -sn "i3D_dynamic" -ln "i3D_dynamic" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_joint" -ln "i3D_joint" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_dynamicFriction" -ln "i3D_dynamicFriction" -at "float";
	addAttr -ci true -sn "i3D_ccd" -ln "i3D_ccd" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_density" -ln "i3D_density" -at "float";
	addAttr -ci true -sn "i3D_splitType" -ln "i3D_splitType" -at "long";
	addAttr -ci true -sn "i3D_splitMinU" -ln "i3D_splitMinU" -at "float";
	addAttr -ci true -sn "i3D_splitMinV" -ln "i3D_splitMinV" -at "float";
	addAttr -ci true -sn "i3D_driveForceLimit" -ln "i3D_driveForceLimit" -at "float";
	addAttr -ci true -sn "i3D_angularDamping" -ln "i3D_angularDamping" -at "float";
	addAttr -ci true -sn "i3D_splitUvWorldScale" -ln "i3D_splitUvWorldScale" -at "float";
	addAttr -ci true -sn "i3D_projection" -ln "i3D_projection" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_driveSpring" -ln "i3D_driveSpring" -at "float";
	addAttr -ci true -sn "i3D_breakableJoint" -ln "i3D_breakableJoint" -min 0 -max 1
		-at "bool";
	addAttr -ci true -sn "i3D_projDistance" -ln "i3D_projDistance" -at "float";
	addAttr -ci true -sn "i3D_driveDamping" -ln "i3D_driveDamping" -at "float";
	addAttr -ci true -sn "i3D_xAxisDrive" -ln "i3D_xAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_compound" -ln "i3D_compound" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_clipDistance" -ln "i3D_clipDistance" -at "float";
	addAttr -ci true -sn "i3D_collision" -ln "i3D_collision" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_scaled" -ln "i3D_scaled" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_projAngle" -ln "i3D_projAngle" -at "float";
	addAttr -ci true -sn "i3D_mergeGroupRoot" -ln "i3D_mergeGroupRoot" -min 0 -max 1
		-at "bool";
	addAttr -ci true -sn "i3D_jointBreakTorque" -ln "i3D_jointBreakTorque" -at "float";
	addAttr -ci true -sn "i3D_restitution" -ln "i3D_restitution" -at "float";
	addAttr -ci true -sn "i3D_yAxisDrive" -ln "i3D_yAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeGroup" -ln "i3D_mergeGroup" -at "long";
	addAttr -ci true -sn "i3D_jointBreakForce" -ln "i3D_jointBreakForce" -at "float";
	addAttr -ci true -sn "i3D_lod1" -ln "i3D_lod1" -at "float";
	addAttr -ci true -sn "i3D_lod2" -ln "i3D_lod2" -at "float";
	addAttr -ci true -sn "i3D_oc" -ln "i3D_oc" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_kinematic" -ln "i3D_kinematic" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_trigger" -ln "i3D_trigger" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_static" -ln "i3D_static" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lightMask" -ln "i3D_lightMask" -dt "string";
	addAttr -ci true -sn "i3D_linearDamping" -ln "i3D_linearDamping" -at "float";
	addAttr -ci true -sn "i3D_lod3" -ln "i3D_lod3" -at "float";
	addAttr -ci true -sn "i3D_drivePos" -ln "i3D_drivePos" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lod" -ln "i3D_lod" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_solverIterationCount" -ln "i3D_solverIterationCount" -at "long";
	addAttr -ci true -sn "i3D_nonRenderable" -ln "i3D_nonRenderable" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_boundingVolume" -ln "i3D_boundingVolume" -dt "string";
	addAttr -ci true -sn "i3D_collisionMask" -ln "i3D_collisionMask" -at "long";
	addAttr -ci true -sn "i3D_zAxisDrive" -ln "i3D_zAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_cpuMesh" -ln "i3D_cpuMesh" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_staticFriction" -ln "i3D_staticFriction" -at "float";
	addAttr -ci true -sn "i3D_decalLayer" -ln "i3D_decalLayer" -at "long";
	addAttr -ci true -sn "i3D_splitMaxV" -ln "i3D_splitMaxV" -at "float";
	addAttr -ci true -sn "i3D_splitMaxU" -ln "i3D_splitMaxU" -at "float";
	addAttr -ci true -sn "i3D_compoundChild" -ln "i3D_compoundChild" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.5265566588595856e-16 1.862645149230957e-07 0 ;
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".i3D_xmlIdentifier" -type "string" "fertilizer_coupling_camplock_1";
	setAttr ".i3D_objectMask" 255;
	setAttr ".i3D_dynamicFriction" 0.5;
	setAttr ".i3D_density" 1;
	setAttr ".i3D_driveForceLimit" 100000;
	setAttr ".i3D_angularDamping" 0.0099999997764825821;
	setAttr ".i3D_splitUvWorldScale" 1;
	setAttr ".i3D_driveSpring" 1;
	setAttr ".i3D_projDistance" 0.0099999997764825821;
	setAttr ".i3D_driveDamping" 0.0099999997764825821;
	setAttr ".i3D_clipDistance" 300;
	setAttr ".i3D_projAngle" 0.0099999997764825821;
	setAttr ".i3D_lightMask" -type "string" "FFFF";
	setAttr ".i3D_solverIterationCount" 4;
	setAttr ".i3D_boundingVolume" -type "string" "";
	setAttr ".i3D_collisionMask" 255;
	setAttr ".i3D_staticFriction" 0.5;
	setAttr ".i3D_splitMaxV" 1;
	setAttr ".i3D_splitMaxU" 1;
createNode mesh -n "fertilizer_coupling_camplock_1Shape" -p "fertilizer_coupling_camplock_1";
	rename -uid "BA72EE0B-45E5-7420-A456-D89476BA6925";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:846]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 4.2335832118988037 0.52103452384471893 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 1748 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.31109667 1.35898459 0.36198902
		 1.35919261 0.36198902 1.36679375 0.31109667 1.3665688 0.41285133 1.35770774 0.41283607
		 1.37219214 0.46371555 1.35891581 0.46370697 1.36652613 0.0057501793 1.35898459 0.056621552
		 1.35898459 0.056621552 1.3665688 0.0057501793 1.3665688 0.10751677 1.35898459 0.10751677
		 1.3665688 0.15840912 1.35898471 0.15840912 1.36656892 0.20930243 1.35898459 0.20930243
		 1.3665688 0.26019764 1.35898471 0.26019716 1.3665688 0.051986694 1.3806957 0.074059486
		 1.3806957 0.074059486 1.38594723 0.051986694 1.38594723 0.026889801 1.3806957 0.026889801
		 1.38594723 0.0057525635 1.3806957 0.0057525635 1.38594711 0.17979956 1.38069582 0.19554043
		 1.3806957 0.19554043 1.38594711 0.17979956 1.38594711 0.15772581 1.3806957 0.15772581
		 1.38594711 0.13262939 1.3806957 0.13262939 1.38594711 0.11606598 1.3806957 0.11606598
		 1.38594711 0.093959808 1.3806957 0.093959808 1.38594711 0.23000383 1.38144851 0.25830889
		 1.38144851 0.25830889 1.38777685 0.23000383 1.38777697 0.28575563 1.38144851 0.28575563
		 1.38777697 0.31038094 1.38144851 0.31038094 1.38777685 0.42430687 1.38789725 0.40622568
		 1.38789725 0.40622568 1.38197839 0.42430687 1.38197839 0.38385868 1.38789725 0.38385868
		 1.38197839 0.3635788 1.38789725 0.36357927 1.38197851 0.34230709 1.38789725 0.34230709
		 1.38197839 0.32103491 1.38789725 0.32103491 1.38197851 0.20556116 1.38144851 0.20556116
		 1.38777685 0.36058807 1.35043895 0.30995226 1.35089386 0.30995226 1.34205699 0.36058807
		 1.34157372 0.25930309 1.35089386 0.25930309 1.34205687 0.20866299 1.35089374 0.20866299
		 1.34205663 0.15802574 1.35089362 0.15802622 1.34205663 0.10738802 1.35089409 0.10738802
		 1.34205663 0.056750774 1.35089409 0.056750774 1.34205687 0.0061135292 1.35089386
		 0.0061135292 1.34205687 0.46176577 1.3507061 0.41118002 1.35220766 0.41113567 1.33533764
		 0.46174383 1.34182656 0.46370077 1.37343836 0.46172619 1.33378398 0.056621552 1.3734802
		 0.0057501793 1.37348032 0.0061135292 1.33403516 0.056750774 1.33403528 0.10751677
		 1.37348008 0.10738802 1.33403516 0.15840912 1.37348032 0.15802622 1.33403528 0.20930243
		 1.3734802 0.20866299 1.33403516 0.26019764 1.3734802 0.52010059 1.084127307 0.52010107
		 1.064020872 0.5316925 1.064019322 0.53169203 1.084125638 0.25930309 1.33403528 4.93759108
		 0.044519186 4.9565134 0.044519007 4.9565134 0.057499349 4.93759108 0.05749929 4.99435806
		 0.044518948 4.99435806 0.05749917 4.63619471 0.044519067 4.65511656 0.044519067 4.65511703
		 0.05749929 4.63619471 0.05749917 4.68789101 0.044519126 4.68789101 0.05749929 4.72573519
		 0.044519126 4.72573519 0.057499409 4.75850964 0.044519097 4.75850964 0.05749929 4.77743149
		 0.044519007 4.77743149 0.05749929 4.81527615 0.044519007 4.81527615 0.05749929 4.83419847
		 0.044519067 4.83419847 0.05749929 4.86697292 0.044519067 4.86697292 0.05749929 4.9048171
		 0.044519126 4.9048171 0.057499468 4.78310823 0.019157559 4.8134737 0.019157678 4.8134737
		 0.031981021 4.78310823 0.031980902 4.84383965 0.01915738 4.84383965 0.031980902 4.87420511
		 0.019157439 4.87420511 0.031980902 4.90457058 0.01915738 4.90457058 0.031980783 4.93493652
		 0.01915738 4.93493652 0.031980842 4.96532106 0.019157261 4.96532106 0.031980962 4.99642754
		 0.019157439 4.99642801 0.031980932 4.63047886 0.019157495 4.66157389 0.01915741 4.66157389
		 0.031980898 4.63047886 0.031980839 4.69198179 0.019157469 4.69198179 0.031981017
		 4.72237635 0.01915741 4.72237635 0.031980783 4.75274277 0.019157439 4.75274277 0.031981021
		 4.28374243 0.17031772 4.30679131 0.17031749 4.30679131 0.1815014 4.28374243 0.18150102
		 4.26034403 0.17031774 4.26034403 0.1815014 4.23729229 0.17031749 4.23729229 0.1815014
		 4.21429205 0.17031772 4.21429205 0.18150134 4.19109631 0.17031772 4.19109631 0.18150158
		 4.16925955 0.17031774 4.16925955 0.18150102 4.14565611 0.17031749 4.14565611 0.18150142
		 4.12272406 0.17031749 4.12272406 0.18150108 4.099633217 0.17031749 4.099633217 0.18150108
		 4.076016426 0.17031766 4.076016426 0.18150102 4.055327415 0.17031772 4.055327415
		 0.18150102 4.03172493 0.17031755 4.03172493 0.18150146 4.0086131096 0.17031749 4.0086131096
		 0.18150131 4.44652367 0.17031772 4.4693408 0.17031771 4.4693408 0.18150133 4.44652367
		 0.1815014 4.42311621 0.17031772 4.42311621 0.18150102 4.4000392 0.17031749 4.40003872
		 0.18150158 4.37664032 0.17031749 4.37664032 0.18150158 4.3533535 0.17031749 4.3533535
		 0.18150096 4.33038235 0.17031772 4.33038235 0.1815014 4.14565563 0.18800442 4.14565611
		 0.18364555 4.16925955 0.18364555 4.16925955 0.18800461 4.19109631 0.18364556 4.19109631
		 0.18800379 4.21429205 0.18364586 4.21429205 0.18800376 4.23729229 0.18364556 4.23729229
		 0.18800379 4.26034403 0.18364556 4.26034403 0.18800379 4.28374243 0.18364556 4.28374243
		 0.18800442 4.30679131 0.18364586 4.30679131 0.18800403 4.33038235 0.18364556 4.33038235
		 0.18800403 4.3533535 0.1836455 4.3533535 0.18800455 4.37664032 0.18364556 4.37664032
		 0.18800403 4.40003872 0.18364556 4.40003872 0.18800403 4.42311621 0.18364556 4.42311621
		 0.1880046 4.44652319 0.18364556 4.44652319 0.18800403 4.4693408 0.18364552 4.46934128
		 0.18800458 4.0086131096 0.1880044 4.0086131096 0.18364559 4.03172493 0.18364598 4.03172493
		 0.18800448 4.055327892 0.18364586 4.055327415 0.18800403 4.076016426 0.18364562 4.076016426
		 0.18800442 4.099633217 0.18364556 4.099633217 0.18800442 4.12272406 0.18364556 4.12272406
		 0.18800443 4.16925955 0.12524644 4.14565611 0.12524645 4.14565611 0.12037669 4.16925955
		 0.12037669 4.19109631 0.12524657 4.19109631 0.12037669 4.21429205 0.12524663 4.21429205
		 0.12037669 4.23729229 0.12524663 4.23729229 0.12037669 4.26034403 0.12524663 4.26034403
		 0.12037669 4.28374243 0.12524645 4.28374243 0.12037669;
	setAttr ".uvst[0].uvsp[250:499]" 4.30679131 0.12524645 4.30679131 0.12037669
		 4.33038235 0.12524663 4.33038235 0.12037669 4.3533535 0.12524663 4.3533535 0.12037669
		 4.37664032 0.12524663 4.3766408 0.12037669 4.40003872 0.12524663 4.4000392 0.12037669
		 4.42311621 0.12524661 4.42311621 0.12037668 4.44652367 0.12524661 4.44652367 0.12037668
		 4.46934128 0.12524661 4.4693408 0.12037668 4.03172493 0.12524669 4.0086131096 0.12524645
		 4.0086131096 0.12037651 4.03172493 0.12037669 4.055327892 0.12524663 4.055327892
		 0.12037669 4.076016426 0.12524645 4.076016426 0.12037651 4.099633217 0.12524663 4.099633217
		 0.12037669 4.12272406 0.12524663 4.12272406 0.12037669 4.16829824 0.11262442 4.14549494
		 0.11262442 4.14549494 0.10138328 4.16829824 0.10138328 4.19115925 0.11262444 4.19115925
		 0.10138324 4.21407557 0.11262444 4.21407557 0.10138324 4.23704338 0.11262444 4.23704338
		 0.10138312 4.26006031 0.11262447 4.26006031 0.10138345 4.28312302 0.11262447 4.28312302
		 0.10138321 4.30622864 0.11262447 4.30622864 0.10138333 4.32937431 0.11262453 4.32937431
		 0.10138321 4.35255814 0.11262447 4.35255814 0.10138321 4.37577772 0.1126247 4.37577772
		 0.10138315 4.39903641 0.11262441 4.39903641 0.10138315 4.42236757 0.11262459 4.42236757
		 0.10138351 4.44598532 0.11262459 4.44598532 0.10138321 4.46875668 0.11262459 4.46875668
		 0.10138321 4.032382011 0.11262448 4.0091977119 0.11262448 4.0091977119 0.10138328
		 4.032382011 0.10138346 4.054894447 0.11262448 4.054894447 0.10138349 4.077450752
		 0.11262448 4.077450752 0.10138349 4.10006952 0.11262448 4.10007 0.10138316 4.12275124
		 0.11262448 4.12275124 0.10138328 4.15996027 0.018596604 4.14371014 0.01859659 4.14371014
		 0.0069898963 4.15996027 0.0069899708 4.18276215 0.018596724 4.18276215 0.0069901496
		 4.20778847 0.018596515 4.20778847 0.0069899112 4.23360157 0.018596336 4.23360157
		 0.0069899112 4.25872231 0.018596396 4.25872231 0.0069902092 4.28170824 0.018596604
		 4.28170824 0.0069899708 4.30496264 0.018596515 4.30496264 0.0069899112 4.32237053
		 0.018596305 4.32237053 0.0069899112 4.34636164 0.018596603 4.34636164 0.0069902083
		 4.37192917 0.018596604 4.37192869 0.0069903573 4.39760733 0.018596336 4.39760733
		 0.0069899699 4.42192459 0.018596364 4.42192507 0.0069901794 4.44353962 0.018596336
		 4.44353962 0.0069899708 4.4693532 0.018596366 4.4693532 0.0069899708 4.029942036
		 0.018596351 4.0086011887 0.018596351 4.0086011887 0.0069899857 4.029942036 0.0069899857
		 4.054123878 0.01859656 4.054123878 0.0069899857 4.079761505 0.01859656 4.079761505
		 0.0069901645 4.10538149 0.018596768 4.10538149 0.0069899261 4.12951279 0.018596768
		 4.12951279 0.0069899559 4.57439804 0.3710044 4.58310986 0.37777835 4.55737162 0.40189409
		 4.56402016 0.36725464 4.55299044 0.36689553 4.54238939 0.36996236 4.53325558 0.37615496
		 4.52648163 0.38486701 4.52273178 0.39524558 4.5223732 0.40627456 4.52544022 0.41687551
		 4.53163242 0.42600998 4.54034376 0.4327834 4.5507226 0.43653333 4.56175232 0.43689266
		 4.57235289 0.43382591 4.58148718 0.42763358 4.58826065 0.4189215 4.5920105 0.40854198
		 4.59237003 0.39751309 4.58930349 0.3869133 4.19737959 0.1325493 4.2156682 0.1325493
		 4.2156682 0.16489702 4.19737959 0.16489676 4.23729992 0.13254881 4.23729992 0.16489699
		 4.2589798 0.1325493 4.2589798 0.16489723 4.27621508 0.1325493 4.27621508 0.16489702
		 4.3139534 0.13229507 4.33175278 0.13229507 4.33175325 0.16478701 4.31395388 0.16478726
		 4.35335732 0.13229528 4.35335684 0.16478676 4.37525797 0.13229528 4.37525797 0.16478726
		 4.39325047 0.13229507 4.39325047 0.16478676 4.42976332 0.13091011 4.44650078 0.13091011
		 4.44650126 0.163744 4.42976332 0.16374427 4.46757269 0.13091011 4.46757269 0.16374423
		 4.0091018677 0.13033837 4.030248642 0.13033837 4.030248642 0.16406626 4.0091018677
		 0.16406648 4.047683716 0.13033864 4.047683716 0.1640662 4.083203793 0.13146155 4.10106754
		 0.13146135 4.10106754 0.16466866 4.083203793 0.16466866 4.12271881 0.13146135 4.12271881
		 0.16466869 4.14422083 0.13146135 4.14422083 0.16466866 4.16198969 0.13146135 4.16199017
		 0.16466868 4.16982841 0.093484953 4.14677429 0.093484953 4.14677429 0.025919512 4.16982841
		 0.025919512 4.12372446 0.093484953 4.12372446 0.025919512 4.10067558 0.093484953
		 4.10067511 0.025919512 4.077617645 0.093484953 4.077617645 0.025919572 4.054577351
		 0.093485013 4.054577351 0.025919512 4.031518459 0.093484953 4.031518459 0.025919512
		 4.0084686279 0.093484953 4.0084686279 0.025919572 4.46948576 0.093484953 4.44644547
		 0.093484953 4.44644547 0.025919482 4.46948576 0.025919482 4.42339134 0.093484953
		 4.42339134 0.025919452 4.40033674 0.093484953 4.40033674 0.025919512 4.37728739 0.093484953
		 4.37728739 0.025919512 4.35423803 0.093484953 4.35423803 0.025919482 4.33118391 0.093484953
		 4.33118391 0.025919512 4.30813932 0.093484953 4.30813932 0.025919512 4.2850852 0.093484953
		 4.2850852 0.025919512 4.26203537 0.093484953 4.26203537 0.025919512 4.23898125 0.093484953
		 4.23898125 0.025919512 4.21592712 0.093484953 4.21592712 0.025919512 4.19288254 0.093484953
		 4.19288254 0.025919512 4.1938529 0.12778893 4.2156682 0.12778899 4.2156682 0.16777536
		 4.1938529 0.16777536 4.23729992 0.12778899 4.23729992 0.16777515 4.2589798 0.12778899
		 4.2589798 0.16777538 4.28098583 0.12778881 4.28098536 0.16777536 4.30956602 0.12784888
		 4.33175278 0.12784904 4.33175278 0.1677153 4.30956602 0.16771509 4.35335732 0.12784904
		 4.35335684 0.16771509 4.37525797 0.12784904 4.37525797 0.16771509 4.397264 0.12784904
		 4.39726448 0.16771509 4.4248848 0.12767862 4.44650126 0.12767862 4.44650126 0.16788572
		 4.4248848 0.16788572 4.46757269 0.12767862 4.46757221 0.16788571 4.0091018677 0.12716234
		 4.030248642 0.12716256 4.030248642 0.16840167 4.0091023445 0.16840161 4.051845074
		 0.1271625 4.051845074 0.16840184 4.078922749 0.12748978;
	setAttr ".uvst[0].uvsp[500:749]" 4.10106754 0.12748994 4.10106754 0.16807419
		 4.078922749 0.16807434 4.12271881 0.12748994 4.12271881 0.16807419 4.14422083 0.12748978
		 4.14422083 0.16807419 4.16635275 0.12748976 4.16635275 0.16807441 4.82972097 0.081645012
		 4.81002998 0.081645012 4.81002998 0.068137467 4.82972097 0.068137527 4.77064753 0.081645131
		 4.770648 0.068137527 4.75095701 0.081644893 4.75095701 0.068137527 4.71685171 0.08164525
		 4.71685171 0.068137646 4.67746973 0.08164525 4.67746973 0.068137646 4.64336443 0.081645012
		 4.64336443 0.068137407 4.62367344 0.081645012 4.62367344 0.068137407 4.99638605 0.081645012
		 4.95700407 0.081645042 4.95700455 0.068137497 4.99638653 0.068137407 4.93731356 0.081645019
		 4.93731356 0.068137474 4.90320778 0.081645012 4.90320778 0.068137407 4.86382627 0.081645012
		 4.86382627 0.068137467 4.85927105 0.092633888 4.88676405 0.092633888 4.88676453 0.10608447
		 4.85927105 0.1060845 4.83148336 0.092633888 4.83148336 0.10608448 4.80390453 0.092633873
		 4.80390406 0.10608448 4.77611971 0.092633888 4.77612019 0.10608432 4.74865294 0.092633799
		 4.74865294 0.10608437 4.72118187 0.092633888 4.72118139 0.10608434 4.6913662 0.092633866
		 4.6913662 0.10608442 4.66030025 0.092633873 4.66030025 0.10608442 4.96875286 0.092633888
		 4.99711609 0.092633858 4.99711609 0.10608444 4.96875286 0.10608444 4.94160032 0.092633858
		 4.9416008 0.10608447 4.91424847 0.092633888 4.91424847 0.10608447 4.77898312 0.116799
		 4.80652618 0.11679894 4.80652618 0.13152057 4.77898312 0.13152057 4.83401346 0.11679891
		 4.83401346 0.13152066 4.86140871 0.11679885 4.86140871 0.13152063 4.88865948 0.11679894
		 4.88865948 0.13152066 4.9156909 0.11679894 4.91569042 0.13152066 4.94239521 0.11679903
		 4.94239521 0.13152063 4.96859694 0.11679894 4.96859694 0.13152067 4.99471283 0.11679894
		 4.99471283 0.13152069 4.66630793 0.11679882 4.69586611 0.11679888 4.69586611 0.13152057
		 4.66630793 0.13152075 4.72379494 0.11679882 4.72379494 0.13152066 4.75140762 0.11679894
		 4.75140762 0.13152072 1.29370594 -0.80349451 1.32248783 -0.80349433 1.32248783 -0.75153649
		 1.29370594 -0.75153649 1.26492453 -0.80349433 1.26492405 -0.75153667 1.23614264 -0.80349433
		 1.23614264 -0.75153643 1.20736074 -0.80349433 1.20736074 -0.75153649 1.17857885 -0.80349433
		 1.17857885 -0.75153649 1.14979744 -0.80349433 1.14979744 -0.75153649 1.12101555 -0.80349433
		 1.12101555 -0.75153649 1.092233658 -0.80349433 1.092233658 -0.75153649 1.063452244
		 -0.80349433 1.063452244 -0.75153649 1.034670353 -0.80349433 1.034670353 -0.75153649
		 1.0058884621 -0.80349433 1.0058884621 -0.75153649 1.43761492 -0.80349445 1.46639681
		 -0.80349445 1.46639681 -0.75153661 1.43761492 -0.75153661 1.40883303 -0.80349445
		 1.40883303 -0.75153661 1.38005161 -0.80349439 1.38005114 -0.75153649 1.35126972 -0.80349433
		 1.35126972 -0.75153643 1.77559662 -0.85865653 1.79656315 -0.85865647 1.79656315 -0.84232116
		 1.77559662 -0.84232116 1.81623554 -0.85865647 1.81623554 -0.84232116 1.83411741 -0.85865647
		 1.83411741 -0.84232116 1.85175896 -0.85865647 1.85175896 -0.84232116 1.87016106 -0.85865647
		 1.87016106 -0.84232116 1.8902421 -0.85865653 1.8902421 -0.84232116 1.90812397 -0.85865653
		 1.90812397 -0.84232116 1.92576551 -0.85865653 1.92576504 -0.84232116 1.94305849 -0.85865647
		 1.94305849 -0.84232116 1.96094942 -0.85865653 1.96094942 -0.84232116 1.97883129 -0.85865653
		 1.97883129 -0.84232116 1.99328136 -0.85865653 1.99328136 -0.84232116 1.69763899 -0.85865653
		 1.71698332 -0.85865647 1.71698332 -0.84232116 1.69763899 -0.84232116 1.74007368 -0.85865653
		 1.74007368 -0.84232116 1.75795555 -0.85865647 1.75795555 -0.8423211 4.15014887 0.31743717
		 4.17881346 0.31743723 4.17881346 0.32456756 4.15014887 0.32456756 4.20747805 0.31743723
		 4.20747805 0.32456756 4.23614264 0.31743723 4.23614216 0.32456747 4.26480722 0.31743723
		 4.26480722 0.32456768 4.29347181 0.31743717 4.29347181 0.32456741 4.3221364 0.31743717
		 4.3221364 0.32456756 4.35080099 0.31743723 4.35080099 0.32456747 4.37946558 0.31743723
		 4.37946558 0.32456756 4.40813017 0.31743723 4.40813017 0.32456756 4.43679476 0.31743723
		 4.43679476 0.32456756 4.46545935 0.31743723 4.46545935 0.32456756 4.0068259239 0.31743723
		 4.035490513 0.31743717 4.035490513 0.32456756 4.0068259239 0.32456756 4.064155102
		 0.31743723 4.064155102 0.32456756 4.092819691 0.31743723 4.092819691 0.32456756 4.12148428
		 0.31743723 4.12148428 0.32456756 1.29374361 -0.74276531 1.32246733 -0.74276525 1.32246733
		 -0.72958046 1.29374361 -0.72958034 1.26501942 -0.74276519 1.26501942 -0.7295804 1.23629332
		 -0.74276519 1.23629332 -0.72958034 1.20756483 -0.74276507 1.20756483 -0.72958028
		 1.17883158 -0.74276507 1.17883158 -0.72958028 1.15009022 -0.74276507 1.15009022 -0.72958022
		 1.12133646 -0.74276507 1.12133646 -0.72958022 1.09256506 -0.74276519 1.09256506 -0.72958028
		 1.063749313 -0.74276519 1.063749313 -0.7295804 1.034706593 -0.74276531 1.034706593
		 -0.72958028 1.0060319901 -0.74276531 1.0060319901 -0.72958028 1.43722105 -0.74276501
		 1.46625328 -0.74276519 1.46625328 -0.72958034 1.43722105 -0.72958034 1.40859509 -0.74276519
		 1.40859509 -0.72958034 1.37990189 -0.74276519 1.37990236 -0.72958034 1.35118818 -0.74276525
		 1.35118818 -0.72958034 4.29362392 0.28270543 4.32236481 0.28270543 4.32236481 0.31109732
		 4.29362392 0.31109726 4.26488352 0.28270543 4.26488352 0.31109732 4.23614264 0.28270543
		 4.23614264 0.31109726 4.20740223 0.28270543 4.20740223 0.31109726 4.17866135 0.28270549
		 4.17866135 0.31109732 4.14992046 0.28270549 4.14992046 0.31109732 4.12118006 0.28270549
		 4.12118006 0.31109732 4.092439175 0.28270549 4.092439175 0.31109732 4.063698769 0.28270549
		 4.063698769 0.31109732 4.034957886 0.28270543 4.034957886 0.31109726 4.0062170029
		 0.28270543 4.0062174797 0.31109726 4.43732738 0.28270543 4.46606827 0.28270543 4.46606827
		 0.31109732;
	setAttr ".uvst[0].uvsp[750:999]" 4.43732738 0.31109732 4.40858698 0.28270549
		 4.40858698 0.31109732 4.3798461 0.28270543 4.3798461 0.31109732 4.35110521 0.28270543
		 4.35110569 0.3110972 4.26376867 0.46544862 4.29121017 0.46544862 4.29121017 0.46957034
		 4.26376867 0.46957028 4.23623419 0.4695704 4.23623419 0.46544877 4.40229511 0.46957004
		 4.37496185 0.46957004 4.37496185 0.46491313 4.40229511 0.46491301 4.34780073 0.46957028
		 4.34780073 0.46491301 4.32429361 0.46491301 4.32429361 0.46957004 4.26165628 0.48774046
		 4.28972912 0.48774046 4.28972912 0.5543285 4.26165628 0.5543285 4.23358345 0.48774046
		 4.23358345 0.55432862 4.20551062 0.4877404 4.20551062 0.55432868 4.40202093 0.48774043
		 4.43009377 0.48774043 4.43009377 0.55432862 4.40202093 0.55432862 4.3739481 0.48774043
		 4.3739481 0.55432862 4.34587526 0.48774043 4.34587526 0.55432862 4.31780243 0.48774037
		 4.31780243 0.55432868 4.3187685 0.40216991 4.31505871 0.41177279 4.29044008 0.41233057
		 4.29033709 0.40328306 4.32436562 0.41174993 4.31882191 0.41173205 4.37495136 0.457414
		 4.34621906 0.45751587 4.34617758 0.41204545 4.3746891 0.41186628 4.40368557 0.45726517
		 4.40320063 0.41166416 4.43045664 0.40138316 4.42562771 0.41103703 4.40308619 0.40264967
		 4.55719995 0.092389189 4.55702114 0.12994002 4.5543828 0.12997983 4.55371714 0.092440814
		 4.2619338 0.4125343 4.23342752 0.41271645 4.23343801 0.40369219 4.26188183 0.40331149
		 4.29121017 0.48005617 4.26376867 0.48005611 4.23623419 0.48005617 4.20792246 0.48005617
		 4.20792246 0.4695704 4.21332169 0.46957034 4.42544222 0.46957034 4.42999554 0.46957034
		 4.42999554 0.48005617 4.40229511 0.48005617 4.37496185 0.48005617 4.34780073 0.48005626
		 4.31904984 0.48005626 4.31904984 0.46957004 4.3149457 0.46957004 4.3149457 0.46544862
		 4.42544222 0.46491301 4.51648045 0.22789478 4.51638985 0.23178664 4.4746027 0.23079413
		 4.47467136 0.22789481 4.34617901 0.40299496 4.37463617 0.4026418 4.4735384 0.26878932
		 4.47352648 0.26606536 4.51638937 0.2658641 4.51640797 0.26949179 4.51627159 0.27307838
		 4.47343779 0.27147377 4.29091978 0.457946 4.26218987 0.45808411 4.23345804 0.45817679
		 4.21336412 0.41236392 4.207551 0.41233653 4.20749331 0.40274182 4.31505871 0.45761281
		 4.32436562 0.45750985 4.42562771 0.45692444 4.21336412 0.45815694 4.21332169 0.46544877
		 4.50158453 0.11658478 4.49580288 0.11658479 4.49575138 0.10845352 4.50158453 0.10731402
		 4.54122591 0.12917233 4.54122591 0.091818795 4.54782009 0.091725774 4.54459906 0.12909965
		 4.51617241 0.2442468 4.47460938 0.24424678 4.47476768 0.24032989 4.51641607 0.23733962
		 4.48906708 0.097970814 4.48300457 0.097970814 4.48300314 0.088736922 4.48900366 0.090080857
		 4.52122164 0.11545755 4.51529408 0.11545755 4.5154767 0.10631538 4.52158642 0.10538142
		 4.47366142 0.251771 4.51635504 0.251771 4.51637697 0.259581 4.4736867 0.25509515
		 4.51624012 0.28548482 4.47362328 0.28548479 4.47376442 0.28157592 4.5164566 0.27829295
		 4.52697515 0.11545756 4.52752209 0.10676663 4.43051243 0.41098005 4.15208149 0.46440455
		 4.15208149 0.46957037 4.12488651 0.46957043 4.12488651 0.46440455 4.17930603 0.46440455
		 4.17930603 0.46957034 4.0090446472 0.46957031 4.0090446472 0.46318442 4.041367531
		 0.46318451 4.041367531 0.46957037 4.068627834 0.46318445 4.068627834 0.46957037 4.092741489
		 0.46318451 4.092741489 0.46957037 4.096412659 0.40346327 4.12089682 0.40424195 4.12089729
		 0.41329339 4.10143328 0.41303846 4.096483707 0.41302404 4.092691422 0.41306844 4.036815166
		 0.45938256 4.036673546 0.41378453 4.065156937 0.41365346 4.065587997 0.45913497 4.0079483986
		 0.45962277 4.0082616806 0.41389361 4.45870399 0.40256891 4.4586277 0.41134033 4.43503761
		 0.41100866 4.5606823 0.092474073 4.55965853 0.13000487 4.149405 0.41317469 4.1493516
		 0.40395206 4.17779827 0.40401214 4.17791176 0.4130339 4.15208149 0.48005626 4.12488651
		 0.48005626 4.17930603 0.48005617 4.20245695 0.46957034 4.43509769 0.46957034 4.45812225
		 0.46957034 4.45812225 0.48005617 4.0090446472 0.48005617 4.041367531 0.48005626 4.068627834
		 0.48005626 4.096509933 0.46957031 4.096509933 0.4800562 4.10149622 0.46957031 4.10149622
		 0.46440452 4.45812225 0.46365091 4.43509769 0.46365106 4.4746027 0.22499529 4.51638985
		 0.22400275 4.036622047 0.40454969 4.065053463 0.40460387 4.0082130432 0.40465757
		 4.474998 0.18433915 4.51845455 0.18433899 4.5183754 0.18801519 4.4749403 0.18709956
		 4.47494125 0.18161711 4.51837587 0.18070182 4.14966679 0.45872557 4.1209383 0.45891684
		 4.17839718 0.45849007 4.20238018 0.41239187 4.10143328 0.45887968 4.092691422 0.45882216
		 4.45914078 0.45678458 4.43503761 0.4567768 4.20238018 0.45817551 4.20245695 0.46440452
		 4.50741911 0.10845385 4.50736713 0.11658474 4.57348013 0.12984169 4.57016373 0.12978084
		 4.56682777 0.092416793 4.57348013 0.092491448 4.5161047 0.21031387 4.51616335 0.21779099
		 4.47461128 0.21366787 4.47456312 0.21031387 4.47694206 0.097970814 4.47700357 0.090082355
		 4.50310946 0.098470196 4.50272846 0.087964639 4.50909805 0.088938698 4.50928974 0.098470196
		 4.4752326 0.20176774 4.47524023 0.19849673 4.51839828 0.19377775 4.51840591 0.20176774
		 4.51848745 0.16695827 4.51860237 0.17457195 4.47536898 0.17060477 4.47528839 0.16695827
		 4.49711084 0.098470196 4.49653959 0.08940915 4.26161671 0.57437164 4.26161671 0.56761473
		 4.28937531 0.56761473 4.28937531 0.57437164 4.23389006 0.57437152 4.23389006 0.56761473
		 4.40157175 0.56761473 4.40157127 0.57422483 4.37384129 0.57422483 4.37384129 0.56761473
		 4.34606695 0.57422483 4.34606695 0.56761473 4.3211832 0.57422483 4.3211832 0.56761473
		 4.47791052 0.7380476 4.51370382 0.75544167 4.47397852 0.75306916 4.47609472 0.76845205
		 4.48393631 0.78185439;
	setAttr ".uvst[0].uvsp[1000:1249]" 4.54347181 0.72902918 4.53109789 0.71964812
		 4.51607656 0.71571648 4.50069332 0.71783227 4.48729134 0.72567397 4.31852674 0.63019705
		 4.29015589 0.62958819 4.2902236 0.62156695 4.31597662 0.62199003 4.31853151 0.62202376
		 4.3211236 0.62199175 4.37529898 0.58191246 4.3752408 0.62166756 4.34677744 0.62163395
		 4.34675217 0.58190948 4.40387297 0.58199441 4.40369129 0.62168896 4.43195009 0.63041776
		 4.40359879 0.62969422 4.42904139 0.62217546 4.51391506 0.39896399 4.51385832 0.40368527
		 4.46869278 0.40263861 4.4687376 0.39896396 4.26177692 0.6215452 4.26176834 0.62961078
		 4.2333827 0.62951994 4.23331738 0.62150997 4.26161671 0.56394517 4.28937531 0.56394517
		 4.23389006 0.56394529 4.20935774 0.56761456 4.20579052 0.56761473 4.20579052 0.56394541
		 4.42596579 0.56761479 4.40157175 0.56394541 4.42910862 0.56394529 4.42910862 0.56761467
		 4.37384081 0.56394541 4.34606743 0.56394529 4.31769896 0.56761473 4.31769896 0.56394541
		 4.31421137 0.56761473 4.31421089 0.5743714 4.42596626 0.57422483 4.51360893 0.35285711
		 4.47411728 0.35285714 4.47406864 0.34968466 4.51354647 0.34871405 4.37524319 0.62973821
		 4.34683275 0.62965316 4.47336292 0.30911899 4.51474619 0.30911979 4.51469088 0.31306496
		 4.47332144 0.31216365 4.47332239 0.30611688 4.51469135 0.30521584 4.26182032 0.58178884
		 4.29038286 0.58185953 4.23327303 0.58179456 4.20801687 0.62192196 4.2051158 0.63015288
		 4.20512438 0.62196398 4.3160553 0.5820024 4.32103014 0.58201474 4.42912388 0.58215171
		 4.20790482 0.58191895 4.20935774 0.57437134 4.48382044 0.13116696 4.48383284 0.12276638
		 4.48946381 0.12387532 4.48940134 0.13227579 4.4682827 0.41884458 4.46843624 0.41347221
		 4.51354408 0.4118416 4.51332998 0.42012188 4.51363039 0.33438358 4.51371288 0.34168035
		 4.47399664 0.33938122 4.47393465 0.33493209 4.49653292 0.13276312 4.49659061 0.12482467
		 4.50215483 0.12357765 4.50215483 0.13151544 4.52078724 0.13124299 4.52091217 0.12260202
		 4.52647924 0.12376006 4.52618742 0.13239831 4.47371626 0.32491553 4.47375154 0.3202897
		 4.51501656 0.31763807 4.51497555 0.3252221 4.51475191 0.29262939 4.51477432 0.30025581
		 4.47328186 0.29748783 4.47325802 0.29283595 4.51543427 0.13222727 4.5153923 0.12358348
		 4.4319458 0.62222344 4.14990187 0.57498312 4.12210512 0.57498318 4.12210512 0.56761479
		 4.14990187 0.56761473 4.17763901 0.56761473 4.17763901 0.57498312 4.0088481903 0.56761473
		 4.036957264 0.56761473 4.036957264 0.57505327 4.0088486671 0.57505339 4.064723969
		 0.56761479 4.064723969 0.57505339 4.089415073 0.57505339 4.089415073 0.56761473 4.52671432
		 0.79305077 4.51133156 0.79516697 4.49630976 0.79123521 4.5513134 0.74243128 4.5534296
		 0.75781405 4.5494976 0.77283573 4.54011631 0.7852093 4.14936447 0.48774043 4.14936447
		 0.55432862 4.12129164 0.5543285 4.12129164 0.48774037 4.17743778 0.4877404 4.17743731
		 0.55432856 4.4581666 0.48774046 4.4581666 0.55432862 4.037073135 0.48774037 4.037073135
		 0.5543285 4.0089998245 0.5543285 4.0089998245 0.48774043 4.065145969 0.48774043 4.065145969
		 0.55432862 4.093218803 0.48774037 4.093218803 0.5543285 4.091704845 0.62994498 4.094272137
		 0.62174284 4.12002659 0.62137747 4.12007618 0.62939882 4.089125633 0.62173396 4.09171772
		 0.62177187 4.035086632 0.58151859 4.063605309 0.58159339 4.063468456 0.62131923 4.034983635
		 0.62129229 4.0066037178 0.58147228 4.006483078 0.62125313 4.43484592 0.62217456 4.46022987
		 0.62169868 4.46041536 0.62963325 4.46869278 0.39528906 4.51385832 0.39424253 4.14847326
		 0.62141889 4.17693281 0.6214478 4.17684984 0.62945777 4.14846373 0.62948459 4.12210464
		 0.56394529 4.14990139 0.56394529 4.17763901 0.56394529 4.20215988 0.56761473 4.43363237
		 0.56761467 4.45831823 0.56394517 4.45831823 0.56761473 4.0088481903 0.56394541 4.036957264
		 0.56394517 4.064723969 0.56394535 4.093278408 0.56394547 4.093278408 0.56761467 4.097378254
		 0.56761479 4.097378254 0.57498318 4.45831823 0.57431799 4.43363237 0.57431793 4.51354694
		 0.35700011 4.47406864 0.35602894 4.063396454 0.62933797 4.034971714 0.62936199 4.0064630508
		 0.62932378 4.47302771 0.44813073 4.47300911 0.44516706 4.51327848 0.44459319 4.51330376
		 0.44843361 4.51322174 0.45223236 4.47296572 0.45105237 4.11995554 0.58166993 4.14851856
		 0.58166271 4.17706585 0.58173233 4.20223188 0.62191576 4.094283104 0.58175522 4.089321136
		 0.58175874 4.4347024 0.58218849 4.45989037 0.58210641 4.20243359 0.58191329 4.20215988
		 0.57498324 4.47823572 0.13225853 4.47819901 0.12385838 4.46865702 0.38193297 4.51369762
		 0.38044545 4.51395082 0.3887248 4.46883583 0.38730475 4.51335812 0.37184727 4.47399473
		 0.37143481 4.47404146 0.3670224 4.51341581 0.36461189 4.50777721 0.1327631 4.50771904
		 0.12482465 4.48325491 0.11550301 4.47742128 0.11672699 4.47714186 0.10740009 4.4831562
		 0.10617325 4.47295237 0.43125057 4.5132494 0.43101758 4.51327705 0.43842432 4.47297955
		 0.43576798 4.51333523 0.46580595 4.47284031 0.46543542 4.47288275 0.46089542 4.51338816
		 0.45836243 4.48902893 0.11658798 4.4891119 0.10725661 4.86642027 0.18082932 4.84919834
		 0.18082932 4.84919834 0.16647838 4.86642027 0.16647838 4.95553923 0.18082929 4.9373188
		 0.18082929 4.9373188 0.16647851 4.95553923 0.16647851 4.92009687 0.18082926 4.92009687
		 0.16647851 4.88407278 0.18082923 4.88407278 0.16647847 4.90283108 0.18082927 4.90283108
		 0.1664785 4.97331047 0.18082929 4.97331047 0.16647851 4.83193207 0.18082924 4.83193207
		 0.16647846 4.81588936 0.18082924 4.80003452 0.18082926 4.80003452 0.16647846 4.81588936
		 0.16647846 4.73162413 0.18082924 4.71715784 0.18082924 4.71715784 0.16647846 4.73162413
		 0.16647846 4.74618006 0.18082927 4.74618006 0.16647846 4.7828126 0.18082927 4.7828126
		 0.16647846;
	setAttr ".uvst[0].uvsp[1250:1499]" 4.7655468 0.18082932 4.7655468 0.16647846
		 4.99057627 0.18082929 4.99057627 0.16647851 4.86696291 0.89526165 4.86696291 0.91031581
		 4.86140299 0.91031587 4.86140299 0.89526153 4.81218338 0.8953948 4.8121829 0.91036892
		 4.79381514 0.91036892 4.79381514 0.8953948 4.76541948 0.89539486 4.76541948 0.91036916
		 4.76300621 0.91036928 4.76300621 0.89539486 4.97224665 0.89564431 4.97224665 0.91071951
		 4.94697237 0.91071951 4.94697237 0.89564431 4.90506458 0.99164921 4.90505314 0.96258974
		 4.95192146 0.96257418 4.95193195 0.99163353 4.80125713 0.94862628 4.80126762 0.91956711
		 4.8481369 0.91958272 4.84812498 0.94864213 4.81622887 0.89539468 4.81622839 0.91036892
		 4.88981056 0.99165809 4.88980293 0.97162789 4.93670845 0.91071945 4.93670845 0.89564401
		 4.86338615 0.92862093 4.863379 0.94865113 4.83862543 0.89539468 4.83862543 0.91036892
		 4.88432169 0.91071945 4.88432169 0.89564401 4.96600676 0.92865545 4.96600246 0.94868577
		 4.84853697 0.89526153 4.84853697 0.91031581 4.84562445 0.91031581 4.84562397 0.89526153
		 4.87905121 0.91071945 4.87905169 0.89564401 4.87266445 0.89526165 4.87266445 0.91031599
		 4.87234354 0.91031599 4.87234306 0.89526165 4.78111458 0.99483061 4.77566433 0.99221164
		 4.77566195 0.97166628 4.78718233 0.9716621 4.7871871 0.99169284 4.87076139 0.89526165
		 4.87076139 0.91031599 4.85121584 0.89526153 4.85511684 0.89526153 4.85511637 0.91031581
		 4.85121584 0.91031581 4.84982872 0.89526153 4.84982824 0.91031581 4.9830308 0.9517169
		 4.97752523 0.94920498 4.97752762 0.92865908 4.98104668 0.92866039 4.98624802 0.93031758
		 4.98853207 0.93447763 4.98931551 0.94057482 4.9877367 0.94746673 4.76465702 0.97748446
		 4.76694155 0.97332436 4.77214193 0.97166711 4.77015877 0.99472398 4.76545238 0.99047399
		 4.76387358 0.9835819 4.9775176 0.95313317 4.97207499 0.95182341 4.77567196 0.99613994
		 4.99015903 0.89564401 4.99015903 0.91071963 4.77151012 0.91036874 4.7715106 0.89539486
		 4.76852083 0.89539468 4.76852083 0.91036892 4.76262665 0.91955388 4.76720047 0.92981482
		 4.76387215 0.92703015 4.76262569 0.92287338 4.98598862 0.97282207 4.99056244 0.96256077
		 4.99056339 0.96588057 4.98931742 0.97003686 4.86696291 0.89526165 4.86140299 0.89526153
		 4.86140299 0.91031587 4.86696291 0.91031581 4.81218338 0.8953948 4.79381514 0.8953948
		 4.79381514 0.91036892 4.8121829 0.91036892 4.76541948 0.89539486 4.76300621 0.89539486
		 4.76300621 0.91036928 4.76541948 0.91036916 4.97224665 0.89564431 4.94697237 0.89564431
		 4.94697237 0.91071951 4.97224665 0.91071951 4.90506458 0.99164921 4.95193195 0.99163353
		 4.95192146 0.96257418 4.90505314 0.96258974 4.80125713 0.94862628 4.84812498 0.94864213
		 4.8481369 0.91958272 4.80126762 0.91956711 4.81622887 0.89539468 4.81622839 0.91036892
		 4.88981056 0.99165809 4.88980293 0.97162789 4.93670845 0.89564401 4.93670845 0.91071945
		 4.863379 0.94865113 4.86338615 0.92862093 4.83862543 0.89539468 4.83862543 0.91036892
		 4.88432169 0.89564401 4.88432169 0.91071945 4.96600246 0.94868577 4.96600676 0.92865545
		 4.84853697 0.89526153 4.84562397 0.89526153 4.84562445 0.91031581 4.84853697 0.91031581
		 4.87905169 0.89564401 4.87905121 0.91071945 4.87266445 0.89526165 4.87234306 0.89526165
		 4.87234354 0.91031599 4.87266445 0.91031599 4.78111458 0.99483061 4.7871871 0.99169284
		 4.78718233 0.9716621 4.77566195 0.97166628 4.77566433 0.99221164 4.87076139 0.91031599
		 4.87076139 0.89526165 4.85121584 0.89526153 4.85121584 0.91031581 4.85511637 0.91031581
		 4.85511684 0.89526153 4.84982824 0.91031581 4.84982872 0.89526153 4.9830308 0.9517169
		 4.9877367 0.94746673 4.98931551 0.94057482 4.98853207 0.93447763 4.98624802 0.93031758
		 4.98104668 0.92866039 4.97752762 0.92865908 4.97752523 0.94920498 4.76465702 0.97748446
		 4.76387358 0.9835819 4.76545238 0.99047399 4.77015877 0.99472398 4.77214193 0.97166711
		 4.76694155 0.97332436 4.9775176 0.95313317 4.97207499 0.95182341 4.77567196 0.99613994
		 4.99015903 0.89564401 4.99015903 0.91071963 4.7715106 0.89539486 4.77151012 0.91036874
		 4.76852083 0.91036892 4.76852083 0.89539468 4.76262665 0.91955388 4.76262569 0.92287338
		 4.76387215 0.92703015 4.76720047 0.92981482 4.98598862 0.97282207 4.98931742 0.97003686
		 4.99056339 0.96588057 4.99056244 0.96256077 4.58888578 0.0028053857 4.58038855 0.0027944446
		 4.58012676 0.08632952 4.58865261 0.079623535 4.59457493 0.079646349 4.60366201 0.086328849
		 4.60319948 0.0027950816 4.59420681 0.0028291941 4.54082775 0.0027849674 4.54082823
		 0.036279917 4.55097961 0.036279887 4.55097961 0.0027849749 4.62554741 0.054356098
		 4.6277647 0.048328876 4.62549496 0.042317837 4.54082823 0.086338997 4.55097961 0.086338967
		 4.55097914 0.047237728 4.54082823 0.047237754 4.54082823 0.041758537 4.55097914 0.041758534
		 4.55807877 0.042352796 4.55582237 0.048367858 4.55805254 0.054389477 4.4962244 0.07818675
		 4.50235844 0.078184485 4.50373125 0.0020514131 4.49621725 0.0020541851 4.48190689
		 0.0077437013 4.48190689 0.016074538 4.49155188 0.016074479 4.49155188 0.0077436566
		 4.48190689 0.044959545 4.48190689 0.077837944 4.49155235 0.077837944 4.49155188 0.044959545
		 4.49155188 0.0023624897 4.48190689 0.0023624897 4.48190689 0.026771784 4.49155188
		 0.026771784 4.48190689 0.036321878 4.49155188 0.036321878 4.52797937 0.039442062
		 4.53110933 0.027787566 4.52574301 0.015574813 4.51446915 0.0057281852 3.14279222
		 2.65184355 3.16563511 2.65184331 3.16563511 2.66580772 3.14279222 2.66580796 3.18843174
		 2.65184355 3.18843174 2.66580772 3.21123695 2.65184355 3.21123695 2.66580772 3.23398733
		 2.65184355 3.23398685 2.66580772 3.25670815 2.65184379 3.25670815 2.66580796 3.27942324
		 2.65184379 3.27942324 2.66580772 3.30213881 2.65184379 3.30213881 2.66580796;
	setAttr ".uvst[0].uvsp[1500:1747]" 3.32485342 2.65184379 3.32485342 2.66580796
		 3.34756756 2.65184331 3.34756756 2.66580796 3.37028408 2.65184331 3.37028408 2.66580796
		 3.39303589 2.65184331 3.39303589 2.66580796 3.41607571 2.65184331 3.41607571 2.66580796
		 3.43961143 2.65184331 3.43961143 2.66580796 3.46389771 2.65184331 3.46389771 2.66580796
		 3.0040884018 2.65184379 3.028375626 2.65184379 3.028375626 2.66580772 3.0040884018
		 2.66580772 3.051929951 2.65184379 3.051929951 2.66580772 3.07514286 2.65184331 3.07514286
		 2.66580772 3.098121643 2.65184355 3.098121643 2.66580772 3.12070751 2.65184355 3.12070751
		 2.66580772 3.16601801 2.64533567 3.14347887 2.64533567 3.14347887 2.63953853 3.16601801
		 2.63953853 3.18952703 2.64533567 3.18952703 2.63953853 3.2120657 2.64533567 3.2120657
		 2.63953853 3.23477173 2.64533567 3.23477173 2.63953853 3.25745964 2.64533567 3.25745964
		 2.63953853 3.28014612 2.64533567 3.28014612 2.63953853 3.3028326 2.64533567 3.3028326
		 2.63953853 3.32551861 2.64533567 3.32551861 2.63953853 3.34820652 2.64533567 3.34820652
		 2.63953853 3.37089252 2.64533567 3.37089252 2.63953853 3.39357853 2.64533567 3.39357853
		 2.63953853 3.41620731 2.64533567 3.41620731 2.63953853 3.43993664 2.64533567 3.43993664
		 2.63953853 3.46458626 2.64533567 3.46458626 2.63953853 3.029747486 2.64533567 3.0047893524
		 2.64564562 3.0047893524 2.63922882 3.029747486 2.63953853 3.053365707 2.64533567
		 3.053365707 2.63953853 3.076060295 2.64533567 3.076060295 2.63953853 3.099107265
		 2.64533567 3.099107265 2.63953853 3.12186193 2.64533567 3.12186193 2.63953853 3.14337301
		 2.67203212 3.16573238 2.67203188 3.16573238 2.67806864 3.14337301 2.67806864 3.18745899
		 2.67203212 3.18745899 2.6780684 3.21020699 2.67203259 3.21020699 2.6780684 3.23320198
		 2.67203259 3.23320198 2.67806888 3.25594044 2.67203259 3.25594044 2.67806888 3.27857971
		 2.67203259 3.27857971 2.67806888 3.30122614 2.67203259 3.30122614 2.67806888 3.32387352
		 2.67203259 3.32387352 2.67806888 3.34651852 2.67203355 3.34651852 2.67806983 3.36916733
		 2.67203355 3.36916733 2.67806983 3.39181328 2.67203355 3.39181328 2.67806983 3.41437912
		 2.67203355 3.41437912 2.67806983 3.43788338 2.67203355 3.43788338 2.67806983 3.46265697
		 2.6718061 3.46265697 2.67829728 3.0040636063 2.67203259 3.028565884 2.67203259 3.028565884
		 2.67806888 3.0040636063 2.67806888 3.05216217 2.67203164 3.05216217 2.67806792 3.074756622
		 2.67203307 3.074756622 2.6780684 3.0974226 2.67203259 3.0974226 2.6780684 3.11993599
		 2.67203212 3.11993599 2.6780684 4.58888578 0.0028053857 4.58038855 0.0027944446 4.58012676
		 0.08632952 4.58865261 0.079623535 4.59457493 0.079646349 4.60366201 0.086328849 4.60319948
		 0.0027950816 4.59420681 0.0028291941 4.54082775 0.0027849674 4.54082823 0.036279917
		 4.55097961 0.036279887 4.55097961 0.0027849749 4.62554741 0.054356098 4.6277647 0.048328876
		 4.62549496 0.042317837 4.54082823 0.086338997 4.55097961 0.086338967 4.55097914 0.047237728
		 4.54082823 0.047237754 4.54082823 0.041758537 4.55097914 0.041758534 4.55807877 0.042352796
		 4.55582237 0.048367858 4.55805254 0.054389477 4.4962244 0.07818675 4.50235844 0.078184485
		 4.50373125 0.0020514131 4.49621725 0.0020541851 4.48190689 0.0077437013 4.48190689
		 0.016074538 4.49155188 0.016074479 4.49155188 0.0077436566 4.48190689 0.044959545
		 4.48190689 0.077837944 4.49155235 0.077837944 4.49155188 0.044959545 4.49155188 0.0023624897
		 4.48190689 0.0023624897 4.48190689 0.026771784 4.49155188 0.026771784 4.48190689
		 0.036321878 4.49155188 0.036321878 4.52797937 0.039442062 4.53110933 0.027787566
		 4.52574301 0.015574813 4.51446915 0.0057281852 4.58888578 0.0028053857 4.58865261
		 0.079623535 4.58012676 0.08632952 4.58038855 0.0027944446 4.59457493 0.079646349
		 4.59420681 0.0028291941 4.60319948 0.0027950816 4.60366201 0.086328849 4.54082775
		 0.0027849674 4.55097961 0.0027849749 4.55097961 0.036279887 4.54082823 0.036279917
		 4.62549496 0.042317837 4.6277647 0.048328876 4.62554741 0.054356098 4.54082823 0.086338997
		 4.54082823 0.047237754 4.55097914 0.047237728 4.55097961 0.086338967 4.55097914 0.041758534
		 4.54082823 0.041758537 4.55805254 0.054389477 4.55582237 0.048367858 4.55807877 0.042352796
		 4.4962244 0.07818675 4.49621725 0.0020541851 4.50373125 0.0020514131 4.50235844 0.078184485
		 4.48190689 0.0077437013 4.49155188 0.0077436566 4.49155188 0.016074479 4.48190689
		 0.016074538 4.48190689 0.044959545 4.49155188 0.044959545 4.49155235 0.077837944
		 4.48190689 0.077837944 4.49155188 0.0023624897 4.48190689 0.0023624897 4.49155188
		 0.026771784 4.48190689 0.026771784 4.49155188 0.036321878 4.48190689 0.036321878
		 4.52797937 0.039442062 4.51446915 0.0057281852 4.52574301 0.015574813 4.53110933
		 0.027787566 4.58888578 0.0028053857 4.58865261 0.079623535 4.58012676 0.08632952
		 4.58038855 0.0027944446 4.59457493 0.079646349 4.59420681 0.0028291941 4.60319948
		 0.0027950816 4.60366201 0.086328849 4.54082775 0.0027849674 4.55097961 0.0027849749
		 4.55097961 0.036279887 4.54082823 0.036279917 4.62549496 0.042317837 4.6277647 0.048328876
		 4.62554741 0.054356098 4.54082823 0.086338997 4.54082823 0.047237754 4.55097914 0.047237728
		 4.55097961 0.086338967 4.55097914 0.041758534 4.54082823 0.041758537 4.55805254 0.054389477
		 4.55582237 0.048367858 4.55807877 0.042352796 4.4962244 0.07818675 4.49621725 0.0020541851
		 4.50373125 0.0020514131 4.50235844 0.078184485 4.48190689 0.0077437013 4.49155188
		 0.0077436566 4.49155188 0.016074479 4.48190689 0.016074538 4.48190689 0.044959545
		 4.49155188 0.044959545 4.49155235 0.077837944 4.48190689 0.077837944 4.49155188 0.0023624897
		 4.48190689 0.0023624897 4.49155188 0.026771784 4.48190689 0.026771784 4.49155188
		 0.036321878 4.48190689 0.036321878 4.52797937 0.039442062 4.51446915 0.0057281852
		 4.52574301 0.015574813 4.53110933 0.027787566;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 980 ".pt";
	setAttr ".pt[0:165]" -type "float3"  0.11746001 -1.8626451e-07 0.22437406
		0.11953557 -1.8626451e-07 0.20931172 0.12141383 -1.8626451e-07 0.19568181 0.12237728
		-1.8626451e-07 0.18868947 0.12205791 -1.8626451e-07 0.19100595 0.12057769 -1.8626451e-07
		0.20174812 0.11850226 -1.8626451e-07 0.21681142 0.11662388 -1.8626451e-07 0.23044132
		0.11566043 -1.8626451e-07 0.23743366 0.11597979 -1.8626451e-07 0.23511624 0.11973441
		-1.8626451e-07 0.22468783 0.12180984 -1.8626451e-07 0.20962548 0.12576771 -1.8626451e-07
		0.19628167 0.12465167 -1.8626451e-07 0.18900323 0.12433231 -1.8626451e-07 0.1913197
		0.12285209 -1.8626451e-07 0.20206188 0.12077665 -1.8626451e-07 0.21712518 0.11889827
		-1.8626451e-07 0.23075508 0.11793482 -1.8626451e-07 0.23774742 0.11825418 -1.8626451e-07
		0.23543 0.11768758 -1.8626451e-07 0.22272228 0.11946011 -1.8626451e-07 0.20986009
		0.12106407 -1.8626451e-07 0.19821954 0.12188673 -1.8626451e-07 0.19224858 0.1216141
		-1.8626451e-07 0.19422841 0.12035012 -1.8626451e-07 0.2033999 0.11857772 -1.8626451e-07
		0.21626306 0.11697376 -1.8626451e-07 0.22790264 0.11615098 -1.8626451e-07 0.23387361
		0.11642361 -1.8626451e-07 0.23189472 0.11996198 -1.8626451e-07 0.2230351 0.1217345
		-1.8626451e-07 0.21017288 0.12540627 -1.8626451e-07 0.19885468 0.12416112 -1.8626451e-07
		0.19256234 0.12388849 -1.8626451e-07 0.19454217 0.12262452 -1.8626451e-07 0.20371367
		0.12085199 -1.8626451e-07 0.21657586 0.11924815 -1.8626451e-07 0.22821546 0.11842537
		-1.8626451e-07 0.23418736 0.118698 -1.8626451e-07 0.23220849 0.12673116 -1.8626451e-07
		0.18928933 0.12624061 -1.8626451e-07 0.19284844 0.12639737 -1.8626451e-07 0.19164014
		0.12596798 -1.8626451e-07 0.19482827 0.12493157 -1.8626451e-07 0.20234801 0.124704
		-1.8626451e-07 0.2040007 0.12285614 -1.8626451e-07 0.21741128 0.1229316 -1.8626451e-07
		0.21686292 0.12097776 -1.8626451e-07 0.23104118 0.12132764 -1.8626451e-07 0.2285025
		0.12001431 -1.8626451e-07 0.23803352 0.12050486 -1.8626451e-07 0.23447347 0.12033367
		-1.8626451e-07 0.2357161 0.12077749 -1.8626451e-07 0.23249458 0.079655245 -1.8626451e-07
		0.11746144 0.029155847 -1.8626451e-07 0.11746144 -0.029155845 -1.8626451e-07 0.11746144
		-0.079655245 -1.8626451e-07 0.11746144 -0.1088111 -1.8626451e-07 0.11746144 -0.1088111
		-1.8626451e-07 0.11746144 -0.079655245 -1.8626451e-07 0.11746144 -0.029155847 -1.8626451e-07
		0.11746144 0.029155845 -1.8626451e-07 0.11746144 0.079655245 -1.8626451e-07 0.11746144
		0.1088111 -1.8626451e-07 0.11746144 0.1088111 -1.8626451e-07 0.11746144 0.079655245
		-1.8626451e-07 0.1374619 0.029155847 -1.8626451e-07 0.1374619 -0.029155845 -1.8626451e-07
		0.1374619 -0.079655245 -1.8626451e-07 0.1374619 -0.1088111 -1.8626451e-07 0.1374619
		-0.1088111 -1.8626451e-07 0.1374619 -0.079655245 -1.8626451e-07 0.1374619 -0.029155847
		-1.8626451e-07 0.1374619 0.029155845 -1.8626451e-07 0.1374619 0.079655245 -1.8626451e-07
		0.1374619 0.1088111 -1.8626451e-07 0.1374619 0.1088111 -1.8626451e-07 0.1374619 0.064117029
		-1.8626451e-07 0.1374619 0.023468465 -1.8626451e-07 0.1374619 -0.023468463 -1.8626451e-07
		0.1374619 -0.064117029 -1.8626451e-07 0.1374619 -0.087585501 -1.8626451e-07 0.1374619
		-0.087585501 -1.8626451e-07 0.1374619 -0.064117029 -1.8626451e-07 0.1374619 -0.023468465
		-1.8626451e-07 0.1374619 0.023468463 -1.8626451e-07 0.1374619 0.064117029 -1.8626451e-07
		0.1374619 0.087585501 -1.8626451e-07 0.1374619 0.087585501 -1.8626451e-07 0.1374619
		0.10886204 -1.8626451e-07 0.011611223 0.092603564 -1.8626451e-07 0.011611223 0.067280412
		-1.8626451e-07 0.011611223 0.035371423 -1.8626451e-07 0.011611223 4.9074442e-16 -1.8626451e-07
		0.011611223 -0.035371423 -1.8626451e-07 0.011611223 -0.067280412 -1.8626451e-07 0.011611223
		-0.092603564 -1.8626451e-07 0.011611223 -0.10886204 -1.8626451e-07 0.011611223 -0.11446428
		-1.8626451e-07 0.011611223 -0.10886204 -1.8626451e-07 0.011611223 -0.092603564 -1.8626451e-07
		0.011611223 -0.067280412 -1.8626451e-07 0.011611223 -0.035371423 -1.8626451e-07 0.011611223
		-3.4113008e-09 -1.8626451e-07 0.011611223 0.035371363 -1.8626451e-07 0.011611223
		0.067280412 -1.8626451e-07 0.011611223 0.092603445 -1.8626451e-07 0.011611223 0.10886192
		-1.8626451e-07 0.011611223 0.11446428 -1.8626451e-07 0.011611223 -0.092603564 -1.8626451e-07
		0.10102773 -0.067280412 -1.8626451e-07 0.10102773 -0.035371423 -1.8626451e-07 0.10102773
		4.8526925e-16 -1.8626451e-07 0.10102773 0.035371423 -1.8626451e-07 0.10102773 0.067280412
		-1.8626451e-07 0.10102773 0.092603564 -1.8626451e-07 0.10102773 0.10886204 -1.8626451e-07
		0.10102773 0.11446428 -1.8626451e-07 0.10102773 0.10886192 -1.8626451e-07 0.10102773
		0.092603445 -1.8626451e-07 0.10102773 0.067280412 -1.8626451e-07 0.10102773 0.035371423
		-1.8626451e-07 0.10102773 -3.4113012e-09 -1.8626451e-07 0.10102773 -0.035371423 -1.8626451e-07
		0.10102773 -0.067280412 -1.8626451e-07 0.10102773 -0.092603564 -1.8626451e-07 0.10102773
		-0.10886204 -1.8626451e-07 0.10102773 -0.11446428 -1.8626451e-07 0.10102773 -0.10886204
		-1.8626451e-07 0.10102773 0.1013521 -1.8626451e-07 0.12856984 0.10737622 -1.8626451e-07
		0.12702584 0.10886204 -1.8626451e-07 0.12330174 0.086215138 -1.8626451e-07 0.12856984
		0.091339707 -1.8626451e-07 0.12702584 0.092603564 -1.8626451e-07 0.12330174 0.062638998
		-1.8626451e-07 0.12856984 0.066362143 -1.8626451e-07 0.12702584 0.067280412 -1.8626451e-07
		0.12330174 0.032931268 -1.8626451e-07 0.12856984 0.034888625 -1.8626451e-07 0.12702584
		0.035371423 -1.8626451e-07 0.12330174 -1.3097178e-08 -1.8626451e-07 0.12856984 1.6051344e-10
		-1.8626451e-07 0.12702584 4.8390537e-16 -1.8626451e-07 0.12330174 -0.032931268 -1.8626451e-07
		0.12856984 -0.034888625 -1.8626451e-07 0.12702584 -0.035371423 -1.8626451e-07 0.12330174
		-0.062638998 -1.8626451e-07 0.12856984 -0.066362143 -1.8626451e-07 0.12702584 -0.067280412
		-1.8626451e-07 0.12330174 -0.086215138 -1.8626451e-07 0.12856984 -0.091339588 -1.8626451e-07
		0.12702584 -0.092603564 -1.8626451e-07 0.12330174 -0.1013521 -1.8626451e-07 0.12856984
		-0.10737622 -1.8626451e-07 0.12702584 -0.10886204 -1.8626451e-07 0.12330174 -0.10656786
		-1.8626451e-07 0.12856984 -0.11290193 -1.8626451e-07 0.12702584 -0.11446428 -1.8626451e-07
		0.12330174 -0.1013521 -1.8626451e-07 0.12856984 -0.10737622 -1.8626451e-07 0.12702584
		-0.10886204 -1.8626451e-07 0.12330174 -0.086215138 -1.8626451e-07 0.12856984 -0.091339588
		-1.8626451e-07 0.1270268 -0.092603564 -1.8626451e-07 0.12330174;
	setAttr ".pt[166:331]" -0.062638998 -1.8626451e-07 0.12856984 -0.066362143
		-1.8626451e-07 0.12702584 -0.067280412 -1.8626451e-07 0.12330174 -0.032931268 -1.8626451e-07
		0.12856984 -0.034888625 -1.8626451e-07 0.1270268 -0.035371423 -1.8626451e-07 0.12330174
		-1.7655253e-08 -1.8626451e-07 0.12856984 -3.5866667e-09 -1.8626451e-07 0.12702584
		-3.4113012e-09 -1.8626451e-07 0.12330174 0.032931268 -1.8626451e-07 0.12856984 0.034888625
		-1.8626451e-07 0.12702584 0.035371423 -1.8626451e-07 0.12330174 0.062638998 -1.8626451e-07
		0.12856984 0.066362143 -1.8626451e-07 0.1270268 0.067280412 -1.8626451e-07 0.12330174
		0.086215138 -1.8626451e-07 0.12856984 0.091339588 -1.8626451e-07 0.12702584 0.092603445
		-1.8626451e-07 0.12330174 0.10135198 -1.8626451e-07 0.12856984 0.1073761 -1.8626451e-07
		0.12702584 0.10886192 -1.8626451e-07 0.12330174 0.10656774 -1.8626451e-07 0.12856984
		0.11290193 -1.8626451e-07 0.12702584 0.11446428 -1.8626451e-07 0.12330174 0.10886204
		-1.8626451e-07 0.0016739368 0.092603564 -1.8626451e-07 0.0016739368 0.067280412 -1.8626451e-07
		0.0016739368 0.035371423 -1.8626451e-07 0.0016739368 4.9135291e-16 -1.8626451e-07
		0.0016739368 -0.035371423 -1.8626451e-07 0.0016739368 -0.067280412 -1.8626451e-07
		0.0016739368 -0.092603564 -1.8626451e-07 0.0016739368 -0.10886204 -1.8626451e-07
		0.0016739368 -0.11446428 -1.8626451e-07 0.0016739368 -0.10886204 -1.8626451e-07 0.0016739368
		-0.092603564 -1.8626451e-07 0.0016739368 -0.067280412 -1.8626451e-07 0.0016739368
		-0.035371423 -1.8626451e-07 0.0016739368 -3.4113008e-09 -1.8626451e-07 0.0016739368
		0.035371363 -1.8626451e-07 0.0016739368 0.067280412 -1.8626451e-07 0.0016739368 0.092603445
		-1.8626451e-07 0.0016739368 0.10886192 -1.8626451e-07 0.0016739368 0.11446428 -1.8626451e-07
		0.0016739368 0.093344808 -1.8626451e-07 0.0016739368 0.079403877 -1.8626451e-07 0.0016739368
		0.057690263 -1.8626451e-07 0.0016739368 0.030329555 -1.8626451e-07 0.0016739368 2.3321192e-09
		-1.8626451e-07 0.0016739368 -0.030329555 -1.8626451e-07 0.0016739368 -0.057690263
		-1.8626451e-07 0.0016739368 -0.079403877 -1.8626451e-07 0.0016739368 -0.093344808
		-1.8626451e-07 0.0016739368 -0.098148465 -1.8626451e-07 0.0016739368 -0.093344808
		-1.8626451e-07 0.0016739368 -0.079403758 -1.8626451e-07 0.0016739368 -0.057690263
		-1.8626451e-07 0.0016739368 -0.030329555 -1.8626451e-07 0.0016739368 -1.0015697e-08
		-1.8626451e-07 0.0016739368 0.030329525 -1.8626451e-07 0.0016739368 0.057690203 -1.8626451e-07
		0.0016739368 0.079403758 -1.8626451e-07 0.0016739368 0.093344688 -1.8626451e-07 0.0016739368
		0.098148465 -1.8626451e-07 0.0016739368 0.093338847 -1.8626451e-07 0.12175775 0.079402804
		-1.8626451e-07 0.12175775 0.05769074 -1.8626451e-07 0.12175775 0.030329555 -1.8626451e-07
		0.12175775 2.3321187e-09 -1.8626451e-07 0.12175775 -0.030329555 -1.8626451e-07 0.12175775
		-0.057690263 -1.8626451e-07 0.12175775 -0.0794034 -1.8626451e-07 0.12175775 -0.093340874
		-1.8626451e-07 0.12175775 -0.098141789 -1.8626451e-07 0.12175775 -0.093341708 -1.8626451e-07
		0.12175775 -0.0794034 -1.8626451e-07 0.12175775 -0.057690144 -1.8626451e-07 0.12175775
		-0.030329943 -1.8626451e-07 0.12175775 -5.4697978e-08 -1.8626451e-07 0.12175775 0.030329674
		-1.8626451e-07 0.12175775 0.057689011 -1.8626451e-07 0.12175775 0.079403877 -1.8626451e-07
		0.12175775 0.093347907 -1.8626451e-07 0.12175775 0.098145843 -1.8626451e-07 0.12175775
		0.083989739 -1.8626451e-07 0.13278222 0.071449757 -1.8626451e-07 0.13278222 0.051912963
		-1.8626451e-07 0.13278222 0.027292192 -1.8626451e-07 0.13278222 -8.0108293e-08 -1.8626451e-07
		0.13278222 -0.027292222 -1.8626451e-07 0.13278222 -0.051912725 -1.8626451e-07 0.13278222
		-0.071450949 -1.8626451e-07 0.13278222 -0.083991885 -1.8626451e-07 0.13278222 -0.088311911
		-1.8626451e-07 0.13278222 -0.083992839 -1.8626451e-07 0.13278222 -0.071450949 -1.8626451e-07
		0.13278222 -0.051912427 -1.8626451e-07 0.13278222 -0.027292728 -1.8626451e-07 0.13278222
		-3.223804e-07 -1.8626451e-07 0.13278222 0.027291894 -1.8626451e-07 0.13278222 0.051911175
		-1.8626451e-07 0.13278222 0.07145226 -1.8626451e-07 0.13278222 0.083999991 -1.8626451e-07
		0.13278222 0.088316083 -1.8626451e-07 0.13278222 4.7756021e-07 -1.8626451e-07 0.45702577
		0.060277045 -1.8626451e-07 0.018801928 0.033737361 -1.8626451e-07 0.018800974 0.033737361
		-1.8626451e-07 0.093837976 0.060277045 -1.8626451e-07 0.093837976 -2.3283017e-10
		-1.8626451e-07 0.018800974 4.857095e-16 -1.8626451e-07 0.093837976 -0.033737421 -1.8626451e-07
		0.018801928 -0.033737421 -1.8626451e-07 0.093837976 -0.060277045 -1.8626451e-07 0.018801928
		-0.060277045 -1.8626451e-07 0.093837976 -0.091155767 -1.8626451e-07 0.018801928 -0.10383308
		-1.8626451e-07 0.018801928 -0.10383308 -1.8626451e-07 0.09383893 -0.091155767 -1.8626451e-07
		0.09383893 -0.10917652 -1.8626451e-07 0.018801928 -0.10917652 -1.8626451e-07 0.093839407
		-0.10383308 -1.8626451e-07 0.018800974 -0.10383308 -1.8626451e-07 0.093837976 -0.091155767
		-1.8626451e-07 0.018800974 -0.091155767 -1.8626451e-07 0.093837976 -0.060276985 -1.8626451e-07
		0.018800974 -0.033737361 -1.8626451e-07 0.018800974 -0.033737361 -1.8626451e-07 0.093837976
		-0.060276985 -1.8626451e-07 0.093837976 -3.9581201e-09 -1.8626451e-07 0.018802404
		-4.8894426e-09 -1.8626451e-07 0.093837976 0.033737361 -1.8626451e-07 0.018800974
		0.033737421 -1.8626451e-07 0.093837976 0.060276985 -1.8626451e-07 0.018800974 0.060276985
		-1.8626451e-07 0.093837976 0.091155767 -1.8626451e-07 0.018801928 0.10383296 -1.8626451e-07
		0.018802404 0.10383296 -1.8626451e-07 0.093837976 0.091155767 -1.8626451e-07 0.09383893
		0.10917652 -1.8626451e-07 0.018801928 0.10917652 -1.8626451e-07 0.093837976 0.10383308
		-1.8626451e-07 0.018800974 0.10383308 -1.8626451e-07 0.093837976 0.091155767 -1.8626451e-07
		0.018800974 0.091155887 -1.8626451e-07 0.093837976 0.079655245 -1.8626451e-07 0.1437161
		0.029155847 -1.8626451e-07 0.1437161 -0.029155845 -1.8626451e-07 0.1437161 -0.079655245
		-1.8626451e-07 0.1437161 -0.1088111 -1.8626451e-07 0.1437161 -0.1088111 -1.8626451e-07
		0.1437161 -0.079655245 -1.8626451e-07 0.1437161 -0.029155847 -1.8626451e-07 0.1437161
		0.029155845 -1.8626451e-07 0.1437161 0.079655245 -1.8626451e-07 0.1437161 0.1088111
		-1.8626451e-07 0.1437161 0.1088111 -1.8626451e-07 0.1437161 0.079655245 -1.8626451e-07
		0.16371655 0.029155847 -1.8626451e-07 0.16371655 -0.029155845 -1.8626451e-07 0.16371655
		-0.079655245 -1.8626451e-07 0.16371655 -0.1088111 -1.8626451e-07 0.16371655 -0.1088111
		-1.8626451e-07 0.16371655 -0.079655245 -1.8626451e-07 0.16371655 -0.029155847 -1.8626451e-07
		0.16371655 0.029155845 -1.8626451e-07 0.16371655;
	setAttr ".pt[332:497]" 0.079655245 -1.8626451e-07 0.16371655 0.1088111 -1.8626451e-07
		0.16371655 0.1088111 -1.8626451e-07 0.16371655 0.0634951 -1.8626451e-07 0.1437161
		0.023240823 -1.8626451e-07 0.1437161 -0.023240821 -1.8626451e-07 0.1437161 -0.0634951
		-1.8626451e-07 0.1437161 -0.086735927 -1.8626451e-07 0.1437161 -0.086735927 -1.8626451e-07
		0.1437161 -0.063495092 -1.8626451e-07 0.1437161 -0.023240823 -1.8626451e-07 0.1437161
		0.023240821 -1.8626451e-07 0.1437161 0.0634951 -1.8626451e-07 0.1437161 0.086735927
		-1.8626451e-07 0.1437161 0.086735927 -1.8626451e-07 0.1437161 0.060738593 -1.8626451e-07
		0.16371655 0.022231871 -1.8626451e-07 0.16371655 -0.022231869 -1.8626451e-07 0.16371655
		-0.060738597 -1.8626451e-07 0.16371655 -0.08297047 -1.8626451e-07 0.16371655 -0.08297047
		-1.8626451e-07 0.16371655 -0.06073859 -1.8626451e-07 0.16371655 -0.022231871 -1.8626451e-07
		0.16371655 0.022231869 -1.8626451e-07 0.16371655 0.060738597 -1.8626451e-07 0.16371655
		0.08297047 -1.8626451e-07 0.16371655 0.08297047 -1.8626451e-07 0.16371655 0.10306761
		-1.8626451e-07 0.17152619 0.078884535 -1.8626451e-07 0.17152619 0.042692035 -1.8626451e-07
		0.17152619 5.6520481e-08 -1.8626451e-07 0.17152619 -0.042691935 -1.8626451e-07 0.17152619
		-0.078884475 -1.8626451e-07 0.17152619 -0.10306758 -1.8626451e-07 0.17152619 -0.11155954
		-1.8626451e-07 0.17152619 -0.10306761 -1.8626451e-07 0.17152619 -0.07888452 -1.8626451e-07
		0.17152619 -0.042692009 -1.8626451e-07 0.17152619 -1.6623668e-08 -1.8626451e-07 0.17152619
		0.04269198 -1.8626451e-07 0.17152619 0.078884497 -1.8626451e-07 0.17152619 0.10306759
		-1.8626451e-07 0.17152619 0.11155954 -1.8626451e-07 0.17152619 0.10306761 -1.8626451e-07
		0.25010514 0.078884535 -1.8626451e-07 0.25010514 0.042692035 -1.8626451e-07 0.25010514
		5.6520481e-08 -1.8626451e-07 0.25010514 -0.042691931 -1.8626451e-07 0.25010514 -0.078884475
		-1.8626451e-07 0.25010514 -0.10306758 -1.8626451e-07 0.25010514 -0.11155954 -1.8626451e-07
		0.25010514 -0.1030676 -1.8626451e-07 0.25010514 -0.07888452 -1.8626451e-07 0.25010514
		-0.042692009 -1.8626451e-07 0.25010514 -1.6623666e-08 -1.8626451e-07 0.25010514 0.04269198
		-1.8626451e-07 0.25010514 0.078884497 -1.8626451e-07 0.25010514 0.10306759 -1.8626451e-07
		0.25010514 0.11155954 -1.8626451e-07 0.25010514 0.071178429 -1.8626451e-07 0.25010514
		0.054477617 -1.8626451e-07 0.25010514 0.029483095 -1.8626451e-07 0.25010514 3.9033015e-08
		-1.8626451e-07 0.25010514 -0.029483022 -1.8626451e-07 0.25010514 -0.05447758 -1.8626451e-07
		0.25010514 -0.071178406 -1.8626451e-07 0.25010514 -0.077042952 -1.8626451e-07 0.25010514
		-0.071178429 -1.8626451e-07 0.25010514 -0.054477606 -1.8626451e-07 0.25010514 -0.029483074
		-1.8626451e-07 0.25010514 -1.1480295e-08 -1.8626451e-07 0.25010514 0.029483054 -1.8626451e-07
		0.25010514 0.054477587 -1.8626451e-07 0.25010514 0.071178421 -1.8626451e-07 0.25010514
		0.077042952 -1.8626451e-07 0.25010514 0.071178429 -1.8626451e-07 0.2575829 0.054477617
		-1.8626451e-07 0.2575829 0.029483095 -1.8626451e-07 0.2575829 3.9033015e-08 -1.8626451e-07
		0.2575829 -0.029483022 -1.8626451e-07 0.2575829 -0.05447758 -1.8626451e-07 0.2575829
		-0.071178406 -1.8626451e-07 0.2575829 -0.077042952 -1.8626451e-07 0.2575829 -0.071178429
		-1.8626451e-07 0.2575829 -0.054477606 -1.8626451e-07 0.2575829 -0.029483074 -1.8626451e-07
		0.2575829 -1.1480295e-08 -1.8626451e-07 0.2575829 0.029483054 -1.8626451e-07 0.2575829
		0.054477587 -1.8626451e-07 0.2575829 0.071178421 -1.8626451e-07 0.2575829 0.077042952
		-1.8626451e-07 0.2575829 0.085883111 -1.8626451e-07 0.17152619 0.065732084 -1.8626451e-07
		0.17152619 0.035573978 -1.8626451e-07 0.17152619 4.7096798e-08 -1.8626451e-07 0.17152619
		-0.035573892 -1.8626451e-07 0.17152619 -0.06573204 -1.8626451e-07 0.17152619 -0.085883081
		-1.8626451e-07 0.17152619 -0.092959173 -1.8626451e-07 0.17152619 -0.085883111 -1.8626451e-07
		0.17152619 -0.065732069 -1.8626451e-07 0.17152619 -0.035573956 -1.8626451e-07 0.17152619
		-1.3851998e-08 -1.8626451e-07 0.17152619 0.03557393 -1.8626451e-07 0.17152619 0.065732054
		-1.8626451e-07 0.17152619 0.085883096 -1.8626451e-07 0.17152619 0.092959173 -1.8626451e-07
		0.17152619 0.085883111 -1.8626451e-07 0.1356957 0.065732084 -1.8626451e-07 0.1356957
		0.035573978 -1.8626451e-07 0.1356957 4.7096798e-08 -1.8626451e-07 0.1356957 -0.035573892
		-1.8626451e-07 0.1356957 -0.06573204 -1.8626451e-07 0.1356957 -0.085883081 -1.8626451e-07
		0.1356957 -0.092959173 -1.8626451e-07 0.1356957 -0.085883111 -1.8626451e-07 0.1356957
		-0.065732069 -1.8626451e-07 0.1356957 -0.035573956 -1.8626451e-07 0.1356957 -1.3851998e-08
		-1.8626451e-07 0.1356957 0.03557393 -1.8626451e-07 0.1356957 0.065732054 -1.8626451e-07
		0.1356957 0.085883096 -1.8626451e-07 0.1356957 0.092959173 -1.8626451e-07 0.1356957
		-0.077254012 -1.8626451e-07 0.2575829 -0.059127681 -1.8626451e-07 0.2575829 -0.031999692
		-1.8626451e-07 0.2575829 4.7568301e-16 -1.8626451e-07 0.2575829 4.7568301e-16 -1.8626451e-07
		0.2575829 -0.03199964 -1.8626451e-07 0.2575829 -0.05912764 -1.8626451e-07 0.2575829
		-0.07725399 -1.8626451e-07 0.2575829 -0.083619103 -1.8626451e-07 0.2575829 -0.10290432
		-1.8626451e-07 0.32073426 -0.078759588 -1.8626451e-07 0.32073426 -0.042624414 -1.8626451e-07
		0.32073426 4.7181609e-16 -1.8626451e-07 0.32073426 4.7181609e-16 -1.8626451e-07 0.32073426
		-0.042624347 -1.8626451e-07 0.32073426 -0.078759544 -1.8626451e-07 0.32073426 -0.1029043
		-1.8626451e-07 0.32073426 -0.11138282 -1.8626451e-07 0.32073426 -0.079189584 -1.8626451e-07
		0.32073426 -0.079189584 -1.8626451e-07 0.32073426 -0.06060908 -1.8626451e-07 0.32073426
		-0.032801386 -1.8626451e-07 0.32073426 -0.032801442 -1.8626451e-07 0.32073426 -0.060609113
		-1.8626451e-07 0.32073426 -0.087266818 -1.8626451e-07 0.32073426 -0.066791147 -1.8626451e-07
		0.32073426 -0.03614714 -1.8626451e-07 0.32073426 4.7181609e-16 -1.8626451e-07 0.32073426
		4.7181609e-16 -1.8626451e-07 0.32073426 -0.036147077 -1.8626451e-07 0.32073426 -0.066791117
		-1.8626451e-07 0.32073426 -0.087266788 -1.8626451e-07 0.32073426 -0.094456904 -1.8626451e-07
		0.32073426 -0.093594491 -1.8626451e-07 0.32073426 -0.08507362 -1.8626451e-07 0.32073426
		-0.093585156 -1.8626451e-07 0.32073426 -0.085064277 -1.8626451e-07 0.32073426 -0.0048049032
		-1.8626451e-07 0.32073426 -0.0036896733 -1.8626451e-07 0.32073426 4.7503085e-16 -1.8626451e-07
		0.26823354 4.750309e-16 -1.8626451e-07 0.26823258 -0.0036113122 -1.8626451e-07 0.26823354
		-0.07719215 -1.8626451e-07 0.26823258;
	setAttr ".pt[498:663]" -0.059080314 -1.8626451e-07 0.26823258 -0.031974025
		-1.8626451e-07 0.26823258 -0.082898021 -1.8626451e-07 0.26823258 -0.083533652 -1.8626451e-07
		0.26823258 -0.082907125 -1.8626451e-07 0.26823258 -0.077170923 -1.8626451e-07 0.26823258
		-0.059064083 -1.8626451e-07 0.26823258 -0.031965274 -1.8626451e-07 0.26823258 -0.0036059935
		-1.8626451e-07 0.26823258 -0.0036897296 -1.8626451e-07 0.32073426 -0.0048049651 -1.8626451e-07
		0.32073426 4.7502958e-16 -1.8626451e-07 0.26825547 -0.0036380552 -1.8626451e-07 0.26825547
		4.7502963e-16 -1.8626451e-07 0.26825356 -0.0035739329 -1.8626451e-07 0.26825452 -0.087997437
		-1.8626451e-07 0.26824975 -0.088633053 -1.8626451e-07 0.26824975 -0.088006534 -1.8626451e-07
		0.26824975 0.077254012 -1.8626451e-07 0.2575829 0.059127681 -1.8626451e-07 0.2575829
		0.031999692 -1.8626451e-07 0.2575829 0.03199964 -1.8626451e-07 0.2575829 0.05912764
		-1.8626451e-07 0.2575829 0.07725399 -1.8626451e-07 0.2575829 0.083619103 -1.8626451e-07
		0.2575829 0.10290432 -1.8626451e-07 0.32073426 0.078759588 -1.8626451e-07 0.32073426
		0.042624414 -1.8626451e-07 0.32073426 0.042624347 -1.8626451e-07 0.32073426 0.078759544
		-1.8626451e-07 0.32073426 0.1029043 -1.8626451e-07 0.32073426 0.11138282 -1.8626451e-07
		0.32073426 0.079189584 -1.8626451e-07 0.32073426 0.079189584 -1.8626451e-07 0.32073426
		0.06060908 -1.8626451e-07 0.32073426 0.032801386 -1.8626451e-07 0.32073426 0.032801442
		-1.8626451e-07 0.32073426 0.060609113 -1.8626451e-07 0.32073426 0.087266818 -1.8626451e-07
		0.32073426 0.066791147 -1.8626451e-07 0.32073426 0.03614714 -1.8626451e-07 0.32073426
		0.036147077 -1.8626451e-07 0.32073426 0.066791117 -1.8626451e-07 0.32073426 0.087266788
		-1.8626451e-07 0.32073426 0.094456904 -1.8626451e-07 0.32073426 0.093594491 -1.8626451e-07
		0.32073426 0.08507362 -1.8626451e-07 0.32073426 0.093585156 -1.8626451e-07 0.32073426
		0.085064277 -1.8626451e-07 0.32073426 0.0048049032 -1.8626451e-07 0.32073426 0.0036896733
		-1.8626451e-07 0.32073426 0.0036113122 -1.8626451e-07 0.26823354 0.07719215 -1.8626451e-07
		0.26823258 0.059080314 -1.8626451e-07 0.26823258 0.031974025 -1.8626451e-07 0.26823258
		0.082898021 -1.8626451e-07 0.26823258 0.083533652 -1.8626451e-07 0.26823258 0.082907125
		-1.8626451e-07 0.26823258 0.077170923 -1.8626451e-07 0.26823258 0.059064083 -1.8626451e-07
		0.26823258 0.031965274 -1.8626451e-07 0.26823258 0.0036059935 -1.8626451e-07 0.26823258
		0.0036897296 -1.8626451e-07 0.32073426 0.0048049651 -1.8626451e-07 0.32073426 0.0036380552
		-1.8626451e-07 0.26825547 0.0035739329 -1.8626451e-07 0.26825452 0.087997437 -1.8626451e-07
		0.26824975 0.088633053 -1.8626451e-07 0.26824975 0.088006534 -1.8626451e-07 0.26824975
		-0.089150727 -1.8626451e-07 0.48697019 -0.068233036 -1.8626451e-07 0.48697019 -0.03692748
		-1.8626451e-07 0.48697019 4.6163709e-16 -1.8626451e-07 0.48697019 4.6163709e-16 -1.8626451e-07
		0.48697019 -0.036927421 -1.8626451e-07 0.48697019 -0.068232991 -1.8626451e-07 0.48697019
		-0.089150704 -1.8626451e-07 0.48697019 -0.096496016 -1.8626451e-07 0.48697019 4.6163709e-16
		-1.8626451e-07 0.48697019 -0.10290432 -1.8626451e-07 0.42381883 -0.078759588 -1.8626451e-07
		0.42381883 -0.042624414 -1.8626451e-07 0.42381883 4.65504e-16 -1.8626451e-07 0.42381883
		4.65504e-16 -1.8626451e-07 0.42381883 -0.042624347 -1.8626451e-07 0.42381883 -0.078759544
		-1.8626451e-07 0.42381883 -0.1029043 -1.8626451e-07 0.42381883 -0.11138282 -1.8626451e-07
		0.42381883 -0.088924617 -1.8626451e-07 0.42381883 -0.088924617 -1.8626451e-07 0.42381883
		-0.068059951 -1.8626451e-07 0.42381883 -0.036833767 -1.8626451e-07 0.42381883 -0.03683383
		-1.8626451e-07 0.42381883 -0.068059988 -1.8626451e-07 0.42381883 -0.097994804 -1.8626451e-07
		0.42381883 -0.075002 -1.8626451e-07 0.42381883 -0.040590826 -1.8626451e-07 0.42381883
		4.65504e-16 -1.8626451e-07 0.42381883 4.65504e-16 -1.8626451e-07 0.42381883 -0.040590756
		-1.8626451e-07 0.42381883 -0.075001962 -1.8626451e-07 0.42381883 -0.097994782 -1.8626451e-07
		0.42381883 -0.1060688 -1.8626451e-07 0.42381883 -0.10510037 -1.8626451e-07 0.42381883
		-0.095531993 -1.8626451e-07 0.42381883 -0.10508988 -1.8626451e-07 0.42381883 -0.095521502
		-1.8626451e-07 0.42381883 -0.0053955857 -1.8626451e-07 0.42381883 -0.0041432567 -1.8626451e-07
		0.42381883 4.6228925e-16 -1.8626451e-07 0.47631955 4.622892e-16 -1.8626451e-07 0.47632051
		-0.0041674357 -1.8626451e-07 0.47631955 -0.089079343 -1.8626451e-07 0.47632051 -0.068178378
		-1.8626451e-07 0.47632051 -0.03689786 -1.8626451e-07 0.47632051 -0.09566389 -1.8626451e-07
		0.47632051 -0.0963974 -1.8626451e-07 0.47632051 -0.095674396 -1.8626451e-07 0.47632051
		-0.089054845 -1.8626451e-07 0.47632051 -0.068159647 -1.8626451e-07 0.47632051 -0.036887761
		-1.8626451e-07 0.47632051 -0.0041612978 -1.8626451e-07 0.47632051 -0.00414332 -1.8626451e-07
		0.42381883 -0.0053956551 -1.8626451e-07 0.42381883 4.6229057e-16 -1.8626451e-07 0.47629762
		-0.0041982969 -1.8626451e-07 0.47629762 4.6229047e-16 -1.8626451e-07 0.47629952 -0.0041243001
		-1.8626451e-07 0.47629857 -0.10154858 -1.8626451e-07 0.47630334 -0.10228208 -1.8626451e-07
		0.47630334 -0.10155909 -1.8626451e-07 0.47630334 0.089150727 -1.8626451e-07 0.48697019
		0.068233036 -1.8626451e-07 0.48697019 0.03692748 -1.8626451e-07 0.48697019 0.036927421
		-1.8626451e-07 0.48697019 0.068232991 -1.8626451e-07 0.48697019 0.089150704 -1.8626451e-07
		0.48697019 0.096496016 -1.8626451e-07 0.48697019 0.10290432 -1.8626451e-07 0.42381883
		0.078759588 -1.8626451e-07 0.42381883 0.042624414 -1.8626451e-07 0.42381883 0.042624347
		-1.8626451e-07 0.42381883 0.078759544 -1.8626451e-07 0.42381883 0.1029043 -1.8626451e-07
		0.42381883 0.11138282 -1.8626451e-07 0.42381883 0.088924617 -1.8626451e-07 0.42381883
		0.088924617 -1.8626451e-07 0.42381883 0.068059951 -1.8626451e-07 0.42381883 0.036833767
		-1.8626451e-07 0.42381883 0.03683383 -1.8626451e-07 0.42381883 0.068059988 -1.8626451e-07
		0.42381883 0.097994804 -1.8626451e-07 0.42381883 0.075002 -1.8626451e-07 0.42381883
		0.040590826 -1.8626451e-07 0.42381883 0.040590756 -1.8626451e-07 0.42381883 0.075001962
		-1.8626451e-07 0.42381883 0.097994782 -1.8626451e-07 0.42381883 0.1060688 -1.8626451e-07
		0.42381883 0.10510037 -1.8626451e-07 0.42381883 0.095531993 -1.8626451e-07 0.42381883
		0.10508988 -1.8626451e-07 0.42381883 0.095521502 -1.8626451e-07 0.42381883 0.0053955857
		-1.8626451e-07 0.42381883 0.0041432567 -1.8626451e-07 0.42381883 0.0041674357 -1.8626451e-07
		0.47631955 0.089079343 -1.8626451e-07 0.47632051;
	setAttr ".pt[664:829]" 0.068178378 -1.8626451e-07 0.47632051 0.03689786 -1.8626451e-07
		0.47632051 0.09566389 -1.8626451e-07 0.47632051 0.0963974 -1.8626451e-07 0.47632051
		0.095674396 -1.8626451e-07 0.47632051 0.089054845 -1.8626451e-07 0.47632051 0.068159647
		-1.8626451e-07 0.47632051 0.036887761 -1.8626451e-07 0.47632051 0.0041612978 -1.8626451e-07
		0.47632051 0.00414332 -1.8626451e-07 0.42381883 0.0053956551 -1.8626451e-07 0.42381883
		0.0041982969 -1.8626451e-07 0.47629762 0.0041243001 -1.8626451e-07 0.47629857 0.10154858
		-1.8626451e-07 0.47630334 0.10228208 -1.8626451e-07 0.47630334 0.10155909 -1.8626451e-07
		0.47630334 -0.042621434 -1.8626451e-07 0.2575829 -0.023066577 -1.8626451e-07 0.2575829
		-0.023066536 -1.8626451e-07 0.2575829 -0.042621408 -1.8626451e-07 0.2575829 -0.055687569
		-1.8626451e-07 0.2575829 -0.055687577 -1.8626451e-07 0.2575829 -0.060275771 -1.8626451e-07
		0.2575829 4.7568301e-16 -1.8626451e-07 0.2575829 4.7568301e-16 -1.8626451e-07 0.2575829
		0.042621434 -1.8626451e-07 0.2575829 0.023066577 -1.8626451e-07 0.2575829 0.023066536
		-1.8626451e-07 0.2575829 0.042621408 -1.8626451e-07 0.2575829 0.055687569 -1.8626451e-07
		0.2575829 0.055687577 -1.8626451e-07 0.2575829 0.060275771 -1.8626451e-07 0.2575829
		-0.11020368 -1.8626451e-07 0.021129847 -0.11020356 -1.8626451e-07 0.021129847 -0.13357782
		-1.8626451e-07 0.089899778 -0.13357782 -1.8626451e-07 0.089899778 -0.1102035 -1.8626451e-07
		0.089899778 -0.11020362 -1.8626451e-07 0.089899778 -0.13357782 -1.8626451e-07 0.10189843
		-0.13357794 -1.8626451e-07 0.10189843 -0.11746609 -1.8626451e-07 0.10189843 -0.11746609
		-1.8626451e-07 0.10189843 -0.11746609 -1.8626451e-07 0.18444419 -0.11746609 -1.8626451e-07
		0.18444419 -0.11746609 -1.8626451e-07 0.1937139 -0.11746609 -1.8626451e-07 0.1937139
		-0.11746609 -1.8626451e-07 0.19654441 -0.11879766 -1.8626451e-07 0.20072341 -0.12214339
		-1.8626451e-07 0.20256066 -0.11746609 -1.8626451e-07 0.19654441 -0.12214339 -1.8626451e-07
		0.20256066 -0.11879766 -1.8626451e-07 0.20072341 -0.13601148 -1.8626451e-07 0.19814944
		-0.12704742 -1.8626451e-07 0.20319343 -0.13259161 -1.8626451e-07 0.20192742 -0.13601148
		-1.8626451e-07 0.19814944 -0.13259161 -1.8626451e-07 0.20192742 -0.12704742 -1.8626451e-07
		0.20319343 -0.13399231 -1.8626451e-07 0.1937139 -0.13715208 -1.8626451e-07 0.19370675
		-0.13610017 -1.8626451e-07 0.18932605 -0.13399231 -1.8626451e-07 0.1937139 -0.13610017
		-1.8626451e-07 0.18932605 -0.13715208 -1.8626451e-07 0.19370675 -0.13357782 -1.8626451e-07
		0.18444419 -0.13357794 -1.8626451e-07 0.18444419 -0.11020362 -1.8626451e-07 0.052200556
		-0.1102035 -1.8626451e-07 0.052200556 -0.13357782 -1.8626451e-07 0.052200556 -0.13357782
		-1.8626451e-07 0.052200556 -0.11845595 -1.8626451e-07 0.024809599 -0.11621672 -1.8626451e-07
		0.022132158 -0.11287373 -1.8626451e-07 0.021129847 -0.11845607 -1.8626451e-07 0.024809599
		-0.11287385 -1.8626451e-07 0.021129847 -0.11621672 -1.8626451e-07 0.022132158 0.11020368
		-1.8626451e-07 0.021129847 0.11020356 -1.8626451e-07 0.021129847 0.13357782 -1.8626451e-07
		0.089899778 0.13357782 -1.8626451e-07 0.089899778 0.1102035 -1.8626451e-07 0.089899778
		0.11020362 -1.8626451e-07 0.089899778 0.13357782 -1.8626451e-07 0.10189843 0.13357794
		-1.8626451e-07 0.10189843 0.11746609 -1.8626451e-07 0.10189843 0.11746609 -1.8626451e-07
		0.10189843 0.11746609 -1.8626451e-07 0.18444419 0.11746609 -1.8626451e-07 0.18444419
		0.11746609 -1.8626451e-07 0.1937139 0.11746609 -1.8626451e-07 0.1937139 0.11746609
		-1.8626451e-07 0.19654441 0.11879766 -1.8626451e-07 0.20072341 0.12214339 -1.8626451e-07
		0.20256066 0.11746609 -1.8626451e-07 0.19654441 0.12214339 -1.8626451e-07 0.20256066
		0.11879766 -1.8626451e-07 0.20072341 0.13601148 -1.8626451e-07 0.19814944 0.12704742
		-1.8626451e-07 0.20319343 0.13259161 -1.8626451e-07 0.20192742 0.13601148 -1.8626451e-07
		0.19814944 0.13259161 -1.8626451e-07 0.20192742 0.12704742 -1.8626451e-07 0.20319343
		0.13399231 -1.8626451e-07 0.1937139 0.13715208 -1.8626451e-07 0.19370675 0.13610017
		-1.8626451e-07 0.18932605 0.13399231 -1.8626451e-07 0.1937139 0.13610017 -1.8626451e-07
		0.18932605 0.13715208 -1.8626451e-07 0.19370675 0.13357782 -1.8626451e-07 0.18444419
		0.13357794 -1.8626451e-07 0.18444419 0.11020362 -1.8626451e-07 0.052200556 0.1102035
		-1.8626451e-07 0.052200556 0.13357782 -1.8626451e-07 0.052200556 0.13357782 -1.8626451e-07
		0.052200556 0.11845595 -1.8626451e-07 0.024809599 0.11621672 -1.8626451e-07 0.022132158
		0.11287373 -1.8626451e-07 0.021129847 0.11845607 -1.8626451e-07 0.024809599 0.11287385
		-1.8626451e-07 0.021129847 0.11621672 -1.8626451e-07 0.022132158 0.10221242 -1.8626451e-07
		0.10105824 0.10409905 -1.8626451e-07 0.10105824 0.11184163 -1.8626451e-07 0.10105824
		0.10984869 -1.8626451e-07 0.10105824 0.11199661 -1.8626451e-07 0.011608362 0.10994567
		-1.8626451e-07 0.011608362 0.10229327 -1.8626451e-07 0.018800974 0.1041799 -1.8626451e-07
		0.018800974 0.1355615 -1.8626451e-07 0.045755625 0.13555428 -1.8626451e-07 0.058646441
		0.13796006 -1.8626451e-07 0.052200556 0.13547952 -1.8626451e-07 0.045757532 0.13788086
		-1.8626451e-07 0.052200556 0.13547783 -1.8626451e-07 0.058646441 0.10059907 -1.8626451e-07
		0.10105824 0.10979865 -1.8626451e-07 0.10105824 0.10648568 -1.8626451e-07 0.10105824
		0.10783015 -1.8626451e-07 0.027993441 0.10783014 -1.8626451e-07 0.027993441 0.10061917
		-1.8626451e-07 0.027993441 0.10061917 -1.8626451e-07 0.027993441 0.13223834 -1.8626451e-07
		0.063934565 0.13487041 -1.8626451e-07 0.052712679 0.12946536 -1.8626451e-07 0.041130304
		0.11861968 -1.8626451e-07 0.031794786 0.13108811 -1.8626451e-07 0.063885927 0.11813404
		-1.8626451e-07 0.03152585 0.12895024 -1.8626451e-07 0.040979624 0.13409609 -1.8626451e-07
		0.052702188 0.084345549 -1.8626451e-07 0.4957211 0.071748614 -1.8626451e-07 0.4957211
		0.052128401 -1.8626451e-07 0.4957211 0.027405515 -1.8626451e-07 0.4957211 4.6110123e-16
		-1.8626451e-07 0.4957211 -0.027405515 -1.8626451e-07 0.4957211 -0.052128382 -1.8626451e-07
		0.4957211 -0.071748555 -1.8626451e-07 0.4957211 -0.084345482 -1.8626451e-07 0.4957211
		-0.088686086 -1.8626451e-07 0.4957211 -0.084345482 -1.8626451e-07 0.4957211 -0.071748547
		-1.8626451e-07 0.4957211 -0.052128375 -1.8626451e-07 0.4957211 -0.027405512 -1.8626451e-07
		0.4957211 -2.6430509e-09 -1.8626451e-07 0.4957211 0.0274055 -1.8626451e-07 0.4957211
		0.05212836 -1.8626451e-07 0.4957211;
	setAttr ".pt[830:979]" 0.07174854 -1.8626451e-07 0.4957211 0.084345475 -1.8626451e-07
		0.4957211 0.088686079 -1.8626451e-07 0.4957211 0.084345549 -1.8626451e-07 0.51263118
		0.071748614 -1.8626451e-07 0.51263118 0.052128401 -1.8626451e-07 0.51263118 0.027405515
		-1.8626451e-07 0.51263118 4.6006579e-16 -1.8626451e-07 0.51263118 -0.027405515 -1.8626451e-07
		0.51263118 -0.052128382 -1.8626451e-07 0.51263118 -0.071748555 -1.8626451e-07 0.51263118
		-0.084345482 -1.8626451e-07 0.51263118 -0.088686086 -1.8626451e-07 0.51263118 -0.084345482
		-1.8626451e-07 0.51263118 -0.071748547 -1.8626451e-07 0.51263118 -0.052128375 -1.8626451e-07
		0.51263118 -0.027405512 -1.8626451e-07 0.51263118 -2.6430509e-09 -1.8626451e-07 0.51263118
		0.0274055 -1.8626451e-07 0.51263118 0.05212836 -1.8626451e-07 0.51263118 0.07174854
		-1.8626451e-07 0.51263118 0.084345475 -1.8626451e-07 0.51263118 0.088686079 -1.8626451e-07
		0.51263118 0.07997746 -1.8626451e-07 0.4957211 0.068032891 -1.8626451e-07 0.4957211
		0.049428791 -1.8626451e-07 0.4957211 0.02598625 -1.8626451e-07 0.4957211 4.6110123e-16
		-1.8626451e-07 0.4957211 -0.025986249 -1.8626451e-07 0.4957211 -0.049428772 -1.8626451e-07
		0.4957211 -0.068032861 -1.8626451e-07 0.4957211 -0.079977438 -1.8626451e-07 0.4957211
		-0.084093243 -1.8626451e-07 0.4957211 -0.079977438 -1.8626451e-07 0.4957211 -0.068032853
		-1.8626451e-07 0.4957211 -0.049428765 -1.8626451e-07 0.4957211 -0.025986241 -1.8626451e-07
		0.4957211 -2.7648634e-09 -1.8626451e-07 0.4957211 0.02598623 -1.8626451e-07 0.4957211
		0.049428754 -1.8626451e-07 0.4957211 0.068032846 -1.8626451e-07 0.4957211 0.079977408
		-1.8626451e-07 0.4957211 0.084093221 -1.8626451e-07 0.4957211 0.07997746 -1.8626451e-07
		0.51263118 0.068032891 -1.8626451e-07 0.51263118 0.049428791 -1.8626451e-07 0.51263118
		0.02598625 -1.8626451e-07 0.51263118 4.6006579e-16 -1.8626451e-07 0.51263118 -0.025986249
		-1.8626451e-07 0.51263118 -0.049428772 -1.8626451e-07 0.51263118 -0.068032861 -1.8626451e-07
		0.51263118 -0.079977438 -1.8626451e-07 0.51263118 -0.084093243 -1.8626451e-07 0.51263118
		-0.079977438 -1.8626451e-07 0.51263118 -0.068032853 -1.8626451e-07 0.51263118 -0.049428765
		-1.8626451e-07 0.51263118 -0.025986241 -1.8626451e-07 0.51263118 -2.7648634e-09 -1.8626451e-07
		0.51263118 0.02598623 -1.8626451e-07 0.51263118 0.049428754 -1.8626451e-07 0.51263118
		0.068032846 -1.8626451e-07 0.51263118 0.079977408 -1.8626451e-07 0.51263118 0.084093221
		-1.8626451e-07 0.51263118 -0.10221242 -1.8626451e-07 0.10105824 -0.10409905 -1.8626451e-07
		0.10105824 -0.11184163 -1.8626451e-07 0.10105824 -0.10984869 -1.8626451e-07 0.10105824
		-0.11199661 -1.8626451e-07 0.011608362 -0.10994567 -1.8626451e-07 0.011608362 -0.10229327
		-1.8626451e-07 0.018800974 -0.1041799 -1.8626451e-07 0.018800974 -0.1355615 -1.8626451e-07
		0.045755625 -0.13555428 -1.8626451e-07 0.058646441 -0.13796006 -1.8626451e-07 0.052200556
		-0.13547952 -1.8626451e-07 0.045757532 -0.13788086 -1.8626451e-07 0.052200556 -0.13547783
		-1.8626451e-07 0.058646441 -0.10059907 -1.8626451e-07 0.10105824 -0.10979865 -1.8626451e-07
		0.10105824 -0.10648568 -1.8626451e-07 0.10105824 -0.10783015 -1.8626451e-07 0.027993441
		-0.10783014 -1.8626451e-07 0.027993441 -0.10061917 -1.8626451e-07 0.027993441 -0.10061917
		-1.8626451e-07 0.027993441 -0.13223834 -1.8626451e-07 0.063934565 -0.13487041 -1.8626451e-07
		0.052712679 -0.12946536 -1.8626451e-07 0.041130304 -0.11861968 -1.8626451e-07 0.031794786
		-0.13108811 -1.8626451e-07 0.063885927 -0.11813404 -1.8626451e-07 0.03152585 -0.12895024
		-1.8626451e-07 0.040979624 -0.13409609 -1.8626451e-07 0.052702188 -0.10221242 -1.8626451e-07
		0.10105824 -0.10409905 -1.8626451e-07 0.10105824 -0.11184163 -1.8626451e-07 0.10105824
		-0.10984869 -1.8626451e-07 0.10105824 -0.11199661 -1.8626451e-07 0.011608362 -0.10994567
		-1.8626451e-07 0.011608362 -0.10229327 -1.8626451e-07 0.018800974 -0.1041799 -1.8626451e-07
		0.018800974 -0.1355615 -1.8626451e-07 0.045755625 -0.13555428 -1.8626451e-07 0.058646441
		-0.13796006 -1.8626451e-07 0.052200556 -0.13547952 -1.8626451e-07 0.045757532 -0.13788086
		-1.8626451e-07 0.052200556 -0.13547783 -1.8626451e-07 0.058646441 -0.10059907 -1.8626451e-07
		0.10105824 -0.10979865 -1.8626451e-07 0.10105824 -0.10648568 -1.8626451e-07 0.10105824
		-0.10783015 -1.8626451e-07 0.027993441 -0.10783014 -1.8626451e-07 0.027993441 -0.10061917
		-1.8626451e-07 0.027993441 -0.10061917 -1.8626451e-07 0.027993441 -0.13223834 -1.8626451e-07
		0.063934565 -0.13487041 -1.8626451e-07 0.052712679 -0.12946536 -1.8626451e-07 0.041130304
		-0.11861968 -1.8626451e-07 0.031794786 -0.13108811 -1.8626451e-07 0.063885927 -0.11813404
		-1.8626451e-07 0.03152585 -0.12895024 -1.8626451e-07 0.040979624 -0.13409609 -1.8626451e-07
		0.052702188 0.10221242 -1.8626451e-07 0.10105824 0.10409905 -1.8626451e-07 0.10105824
		0.11184163 -1.8626451e-07 0.10105824 0.10984869 -1.8626451e-07 0.10105824 0.11199661
		-1.8626451e-07 0.011608362 0.10994567 -1.8626451e-07 0.011608362 0.10229327 -1.8626451e-07
		0.018800974 0.1041799 -1.8626451e-07 0.018800974 0.1355615 -1.8626451e-07 0.045755625
		0.13555428 -1.8626451e-07 0.058646441 0.13796006 -1.8626451e-07 0.052200556 0.13547952
		-1.8626451e-07 0.045757532 0.13788086 -1.8626451e-07 0.052200556 0.13547783 -1.8626451e-07
		0.058646441 0.10059907 -1.8626451e-07 0.10105824 0.10979865 -1.8626451e-07 0.10105824
		0.10648568 -1.8626451e-07 0.10105824 0.10783015 -1.8626451e-07 0.027993441 0.10783014
		-1.8626451e-07 0.027993441 0.10061917 -1.8626451e-07 0.027993441 0.10061917 -1.8626451e-07
		0.027993441 0.13223834 -1.8626451e-07 0.063934565 0.13487041 -1.8626451e-07 0.052712679
		0.12946536 -1.8626451e-07 0.041130304 0.11861968 -1.8626451e-07 0.031794786 0.13108811
		-1.8626451e-07 0.063885927 0.11813404 -1.8626451e-07 0.03152585 0.12895024 -1.8626451e-07
		0.040979624 0.13409609 -1.8626451e-07 0.052702188;
	setAttr -s 980 ".vt";
	setAttr ".vt[0:165]"  -0.058730006 -0.01107874 -0.113024 -0.059767783 -0.012319013 -0.10549283
		 -0.060706913 -0.0088538378 -0.098677874 -0.061188638 -0.0020068842 -0.095181704 -0.061028957 0.0056070033 -0.096339941
		 -0.060288846 0.011079046 -0.10171103 -0.05925113 0.012319341 -0.10924268 -0.058311939 0.0088541452 -0.11605763
		 -0.057830215 0.0020071913 -0.1195538 -0.057989895 -0.0056066774 -0.11839509 -0.059867203 -0.01107874 -0.11318088
		 -0.06090492 -0.012319013 -0.10564971 -0.062883854 -0.0088538378 -0.098977804 -0.062325835 -0.0020068842 -0.095338583
		 -0.062166154 0.0056070033 -0.09649682 -0.061426044 0.011079046 -0.10186791 -0.060388327 0.012319341 -0.10939956
		 -0.059449136 0.0088541452 -0.11621451 -0.058967412 0.0020071913 -0.11971068 -0.059127092 -0.0056066774 -0.11855197
		 -0.058843791 -0.0094607407 -0.11219811 -0.059730053 -0.010519559 -0.10576701 -0.060532033 -0.0075605055 -0.099946737
		 -0.060943365 -0.0017137523 -0.09696126 -0.060807049 0.004787934 -0.097951174 -0.060175061 0.0094610471 -0.10253692
		 -0.059288859 0.010519867 -0.1089685 -0.058486879 0.007560832 -0.11478829 -0.058075488 0.0017140979 -0.11777377
		 -0.058211803 -0.0047876267 -0.11678433 -0.059980989 -0.0094607407 -0.11235452 -0.06086725 -0.010519559 -0.10592341
		 -0.062703133 -0.007554214 -0.10026431 -0.062080562 -0.0017137523 -0.097118139 -0.061944246 0.004787934 -0.098108053
		 -0.061312258 0.0094610471 -0.1026938 -0.060425997 0.010519867 -0.1091249 -0.059624076 0.007560832 -0.1149447
		 -0.059212685 0.0017140979 -0.11793065 -0.059349 -0.0047876267 -0.11694121 -0.063365579 -0.0020068842 -0.095481634
		 -0.063120306 -0.0017137523 -0.09726119 -0.063198686 0.0056120679 -0.096657038 -0.06298399 0.004787934 -0.098251104
		 -0.062465787 0.011079046 -0.10201097 -0.062352002 0.0094610471 -0.10283732 -0.06142807 0.012319341 -0.10954261
		 -0.0614658 0.010519867 -0.10926843 -0.06048888 0.0088541452 -0.11635756 -0.060663819 0.007560832 -0.11508822
		 -0.060007155 0.0020071913 -0.11985373 -0.060252428 0.0017140979 -0.1180737 -0.060166836 -0.0056066774 -0.11869502
		 -0.060388744 -0.0047876267 -0.11708426 -0.039827622 0.039827652 -0.05956769 -0.014577923 0.054405756 -0.05956769
		 0.014577922 0.054405756 -0.05956769 0.039827622 0.039827652 -0.05956769 0.054405548 0.014578092 -0.05956769
		 0.054405548 -0.014577785 -0.05956769 0.039827622 -0.039827503 -0.05956769 0.014577923 -0.05440544 -0.05956769
		 -0.014577922 -0.05440544 -0.05956769 -0.039827622 -0.039827503 -0.05956769 -0.054405548 -0.014577787 -0.05956769
		 -0.054405548 0.01457809 -0.05956769 -0.039827622 0.039827652 -0.069567919 -0.014577923 0.054405756 -0.069567919
		 0.014577922 0.054405756 -0.069567919 0.039827622 0.039827652 -0.069567919 0.054405548 0.014578092 -0.069567919
		 0.054405548 -0.014577785 -0.069567919 0.039827622 -0.039827503 -0.069567919 0.014577923 -0.05440544 -0.069567919
		 -0.014577922 -0.05440544 -0.069567919 -0.039827622 -0.039827503 -0.069567919 -0.054405548 -0.014577787 -0.069567919
		 -0.054405548 0.01457809 -0.069567919 -0.032058515 0.032058682 -0.069567919 -0.011734232 0.043792825 -0.069567919
		 0.011734231 0.043792825 -0.069567919 0.032058515 0.032058682 -0.069567919 0.043792751 0.01173444 -0.069567919
		 0.043792751 -0.01173413 -0.069567919 0.032058515 -0.032058381 -0.069567919 0.011734232 -0.043792672 -0.069567919
		 -0.011734231 -0.043792672 -0.069567919 -0.032058515 -0.032058381 -0.069567919 -0.043792751 -0.011734133 -0.069567919
		 -0.043792751 0.011734437 -0.069567919 -0.054431021 0.017685808 -0.00664258 -0.046301782 0.033640258 -0.00664258
		 -0.033640206 0.046301872 -0.00664258 -0.017685711 0.054431114 -0.00664258 -1.6874012e-16 0.057232421 -0.00664258
		 0.017685711 0.054431096 -0.00664258 0.033640206 0.046301834 -0.00664258 0.046301782 0.033640217 -0.00664258
		 0.054431021 0.017685784 -0.00664258 0.057232141 0 -0.00664258 0.054431021 -0.017685479 -0.00664258
		 0.046301782 -0.03364021 -0.00664258 0.033640206 -0.046301655 -0.00664258 0.017685711 -0.054430887 -0.00664258
		 1.7056504e-09 -0.057232048 -0.00664258 -0.017685682 -0.054430846 -0.00664258 -0.033640206 -0.046301626 -0.00664258
		 -0.046301723 -0.033640191 -0.00664258 -0.054430962 -0.01768546 -0.00664258 -0.057232141 8.9913357e-09 -0.00664258
		 0.046301782 0.033640217 -0.051350832 0.033640206 0.046301853 -0.051350832 0.017685711 0.054431133 -0.051350832
		 -1.6326495e-16 0.057232399 -0.051350832 -0.017685711 0.054431133 -0.051350832 -0.033640206 0.046301853 -0.051350832
		 -0.046301782 0.033640217 -0.051350832 -0.054431021 0.017685808 -0.051350832 -0.057232141 0 -0.051350832
		 -0.054430962 -0.017685503 -0.051350832 -0.046301723 -0.033640221 -0.051350832 -0.033640206 -0.046301547 -0.051350832
		 -0.017685711 -0.05443082 -0.051350832 1.7056506e-09 -0.057231933 -0.051350832 0.017685711 -0.05443082 -0.051350832
		 0.033640206 -0.0463017 -0.051350832 0.046301782 -0.033640221 -0.051350832 0.054431021 -0.017685503 -0.051350832
		 0.057232141 0 -0.051350832 0.054431021 0.017685808 -0.051350832 -0.050676048 0.01646571 -0.065121889
		 -0.053688109 0.017444581 -0.06434989 -0.054431021 0.017685808 -0.062487841 -0.043107569 0.031319562 -0.065121889
		 -0.045669854 0.033181243 -0.06434989 -0.046301782 0.033640217 -0.062487841 -0.031319499 0.043107748 -0.065121889
		 -0.033181071 0.045669936 -0.06434989 -0.033640206 0.046301853 -0.062487841 -0.016465634 0.050676156 -0.065121889
		 -0.017444313 0.053688116 -0.06434989 -0.017685711 0.054431133 -0.062487841 6.5485892e-09 0.053284079 -0.065121889
		 -8.0256635e-11 0.056451175 -0.06434989 -1.6190107e-16 0.057232399 -0.062487841 0.016465634 0.050676156 -0.065121889
		 0.017444313 0.053688116 -0.06434989 0.017685711 0.054431133 -0.062487841 0.031319499 0.043107595 -0.065121889
		 0.033181071 0.045669783 -0.06434989 0.033640206 0.046301853 -0.062487841 0.043107569 0.031319562 -0.065121889
		 0.045669794 0.033181243 -0.06434989 0.046301782 0.033640217 -0.062487841 0.050676048 0.01646571 -0.065121889
		 0.053688109 0.017444581 -0.06434989 0.054431021 0.017685808 -0.062487841 0.05328393 0 -0.065121889
		 0.056450963 0 -0.06434989 0.057232141 0 -0.062487841 0.050676048 -0.01646556 -0.065121889
		 0.053688109 -0.017444275 -0.06434989 0.054431021 -0.017685503 -0.062487841 0.043107569 -0.031319257 -0.065121889
		 0.045669794 -0.033180937 -0.064350367 0.046301782 -0.033640221 -0.062487841;
	setAttr ".vt[166:331]" 0.031319499 -0.043107443 -0.065121889 0.033181071 -0.04566963 -0.06434989
		 0.033640206 -0.0463017 -0.062487841 0.016465634 -0.050675854 -0.065121889 0.017444313 -0.053687956 -0.064350367
		 0.017685711 -0.05443082 -0.062487841 8.8276266e-09 -0.053283766 -0.065121889 1.7933334e-09 -0.056450862 -0.06434989
		 1.7056506e-09 -0.057231933 -0.062487841 -0.016465634 -0.050675854 -0.065121889 -0.017444313 -0.053687956 -0.06434989
		 -0.017685711 -0.05443082 -0.062487841 -0.031319499 -0.043107443 -0.065121889 -0.033181071 -0.04566963 -0.064350367
		 -0.033640206 -0.046301547 -0.062487841 -0.043107569 -0.031319257 -0.065121889 -0.045669794 -0.033180937 -0.06434989
		 -0.046301723 -0.033640221 -0.062487841 -0.050675988 -0.01646556 -0.065121889 -0.053688049 -0.017444275 -0.06434989
		 -0.054430962 -0.017685503 -0.062487841 -0.05328387 0 -0.065121889 -0.056450963 0 -0.06434989
		 -0.057232141 0 -0.062487841 -0.054431021 0.017685808 -0.0016739368 -0.046301782 0.033640258 -0.0016739368
		 -0.033640206 0.046301872 -0.0016739368 -0.017685711 0.054431114 -0.0016739368 -1.6934861e-16 0.057232421 -0.0016739368
		 0.017685711 0.054431096 -0.0016739368 0.033640206 0.046301834 -0.0016739368 0.046301782 0.033640217 -0.0016739368
		 0.054431021 0.01768579 -0.0016739368 0.057232141 0 -0.0016739368 0.054431021 -0.017685473 -0.0016739368
		 0.046301782 -0.03364021 -0.0016739368 0.033640206 -0.046301663 -0.0016739368 0.017685711 -0.054430887 -0.0016739368
		 1.7056504e-09 -0.057232048 -0.0016739368 -0.017685682 -0.054430846 -0.0016739368
		 -0.033640206 -0.046301626 -0.0016739368 -0.046301723 -0.033640198 -0.0016739368 -0.054430962 -0.017685466 -0.0016739368
		 -0.057232141 9.5907495e-09 -0.0016739368 -0.046672404 0.015164916 -0.0016739368 -0.039701939 0.028845185 -0.0016739368
		 -0.028845131 0.039701995 -0.0016739368 -0.015164778 0.04667259 -0.0016739368 -1.1660596e-09 0.049074501 -0.0016739368
		 0.015164778 0.04667259 -0.0016739368 0.028845131 0.039701976 -0.0016739368 0.039701939 0.028845148 -0.0016739368
		 0.046672404 0.01516486 -0.0016739368 0.049074233 0 -0.0016739368 0.046672404 -0.015164564 -0.0016739368
		 0.039701879 -0.028845131 -0.0016739368 0.028845131 -0.039701786 -0.0016739368 0.015164778 -0.046672247 -0.0016739368
		 5.0078484e-09 -0.049074158 -0.0016739368 -0.015164763 -0.04667218 -0.0016739368 -0.028845102 -0.039701737 -0.0016739368
		 -0.039701879 -0.028845111 -0.0016739368 -0.046672344 -0.015164535 -0.0016739368 -0.049074233 2.8772263e-08 -0.0016739368
		 -0.046669424 0.015164284 -0.061715841 -0.039701402 0.028845148 -0.061715841 -0.02884537 0.039702341 -0.061715841
		 -0.015164778 0.04667259 -0.061715841 -1.1660594e-09 0.049074575 -0.061715841 0.015164778 0.04667259 -0.061715841
		 0.028845131 0.039702035 -0.061715841 0.0397017 0.028845148 -0.061715841 0.046670437 0.01516459 -0.061715841
		 0.049070895 1.5345205e-07 -0.061715841 0.046670854 -0.015164286 -0.061715841 0.0397017 -0.028844843 -0.061715841
		 0.028845072 -0.039701883 -0.061715841 0.015164971 -0.046672598 -0.061715841 2.7348989e-08 -0.049073964 -0.061715841
		 -0.015164837 -0.046672288 -0.061715841 -0.028844506 -0.039701268 -0.061715841 -0.039701939 -0.028844535 -0.061715841
		 -0.046673954 -0.015165207 -0.061715841 -0.049072921 -3.069041e-07 -0.061715841 -0.04199487 0.013645723 -0.067228079
		 -0.035724878 0.02595718 -0.067228079 -0.025956482 0.035726398 -0.067228079 -0.013646096 0.04199829 -0.067228079
		 4.0054147e-08 0.044159662 -0.067228079 0.013646111 0.04199829 -0.067228079 0.025956362 0.035725936 -0.067228079
		 0.035725474 0.025956873 -0.067228079 0.041995943 0.01364649 -0.067228079 0.044155955 0 -0.067228079
		 0.041996419 -0.013646338 -0.067228079 0.035725474 -0.025956262 -0.067228079 0.025956213 -0.03572594 -0.067228079
		 0.013646364 -0.041998599 -0.067228079 1.611902e-07 -0.044159204 -0.067228079 -0.013645947 -0.04199829 -0.067228079
		 -0.025955588 -0.035725173 -0.067228079 -0.03572613 -0.02595534 -0.067228079 -0.041999996 -0.013646645 -0.067228079
		 -0.044158041 -1.5345205e-06 -0.067228079 -2.387801e-07 0 -0.22934985 -0.030138522 0.045578152 -0.010237932
		 -0.016868681 0.051916666 -0.010237455 -0.016868681 0.051916666 -0.047755957 -0.030138522 0.045578174 -0.047755957
		 1.1641516e-10 0.054588314 -0.010237455 -1.637052e-16 0.054588344 -0.047755957 0.016868711 0.051916659 -0.010237932
		 0.016868711 0.051916666 -0.047755957 0.030138522 0.045578048 -0.010237932 0.030138522 0.045578018 -0.047755957
		 0.045577884 0.030138638 -0.010237932 0.05191654 0.016868973 -0.010237932 0.05191654 0.016868982 -0.047756433
		 0.045577884 0.030138595 -0.047756433 0.054588258 0 -0.010237932 0.054588258 0 -0.047756672
		 0.05191654 -0.01686864 -0.010237455 0.05191654 -0.016868677 -0.047755957 0.045577884 -0.03013831 -0.010237455
		 0.045577884 -0.03013829 -0.047755957 0.030138493 -0.045577735 -0.010237455 0.016868681 -0.051916432 -0.010237455
		 0.016868681 -0.051916353 -0.047755957 0.030138493 -0.045577712 -0.047755957 1.9790602e-09 -0.054588087 -0.010238171
		 2.4447215e-09 -0.054588106 -0.047755957 -0.016868681 -0.051916409 -0.010237455 -0.016868711 -0.051916353 -0.047755957
		 -0.030138493 -0.045577697 -0.010237455 -0.030138493 -0.045577712 -0.047755957 -0.045577884 -0.03013829 -0.010237932
		 -0.05191648 -0.016868621 -0.010238171 -0.05191648 -0.016868677 -0.047755957 -0.045577884 -0.03013829 -0.047756433
		 -0.054588258 1.9181499e-08 -0.010237932 -0.054588258 0 -0.047755957 -0.05191654 0.016868982 -0.010237455
		 -0.05191654 0.016868982 -0.047755957 -0.045577884 0.030138677 -0.010237455 -0.045577943 0.030138595 -0.047755957
		 -0.039827622 0.039827652 -0.072695017 -0.014577923 0.054405756 -0.072695017 0.014577922 0.054405756 -0.072695017
		 0.039827622 0.039827652 -0.072695017 0.054405548 0.014578092 -0.072695017 0.054405548 -0.014577785 -0.072695017
		 0.039827622 -0.039827503 -0.072695017 0.014577923 -0.05440544 -0.072695017 -0.014577922 -0.05440544 -0.072695017
		 -0.039827622 -0.039827503 -0.072695017 -0.054405548 -0.014577787 -0.072695017 -0.054405548 0.01457809 -0.072695017
		 -0.039827622 0.039827652 -0.082695246 -0.014577923 0.054405756 -0.082695246 0.014577922 0.054405756 -0.082695246
		 0.039827622 0.039827652 -0.082695246 0.054405548 0.014578092 -0.082695246 0.054405548 -0.014577785 -0.082695246
		 0.039827622 -0.039827503 -0.082695246 0.014577923 -0.05440544 -0.082695246 -0.014577922 -0.05440544 -0.082695246;
	setAttr ".vt[332:497]" -0.039827622 -0.039827503 -0.082695246 -0.054405548 -0.014577787 -0.082695246
		 -0.054405548 0.01457809 -0.082695246 -0.03174755 0.031747609 -0.072695017 -0.011620412 0.043367952 -0.072695017
		 0.011620411 0.043367952 -0.072695017 0.03174755 0.031747609 -0.072695017 0.043367963 0.011620641 -0.072695017
		 0.043367963 -0.011620332 -0.072695017 0.031747546 -0.031747311 -0.072695017 0.011620412 -0.043367803 -0.072695017
		 -0.011620411 -0.043367803 -0.072695017 -0.03174755 -0.031747304 -0.072695017 -0.043367963 -0.011620333 -0.072695017
		 -0.043367963 0.011620639 -0.072695017 -0.030369297 0.03036942 -0.082695246 -0.011115936 0.041485261 -0.082695246
		 0.011115935 0.041485261 -0.082695246 0.030369299 0.03036942 -0.082695246 0.041485235 0.011116136 -0.082695246
		 0.041485235 -0.011115827 -0.082695246 0.030369295 -0.030369125 -0.082695246 0.011115936 -0.041485108 -0.082695246
		 -0.011115935 -0.041485108 -0.082695246 -0.030369299 -0.030369116 -0.082695246 -0.041485235 -0.011115829 -0.082695246
		 -0.041485235 0.011116134 -0.082695246 -0.051533807 0.02134607 -0.086600065 -0.039442267 0.039442211 -0.086600065
		 -0.021346018 0.051533997 -0.086600065 -2.826024e-08 0.055780016 -0.086600065 0.021345967 0.051534072 -0.086600065
		 0.039442237 0.039442308 -0.086600065 0.051533788 0.02134621 -0.086600065 0.05577977 4.7624042e-08 -0.086600065
		 0.051533803 -0.021345809 -0.086600065 0.03944226 -0.0394421 -0.086600065 0.021346005 -0.051533729 -0.086600065
		 8.3118339e-09 -0.055779699 -0.086600065 -0.02134599 -0.051533606 -0.086600065 -0.039442249 -0.039442115 -0.086600065
		 -0.051533796 -0.021345867 -0.086600065 -0.05577977 -3.7330778e-09 -0.086600065 -0.051533803 0.02134607 -0.12588954
		 -0.039442267 0.039442211 -0.12588954 -0.021346018 0.051533997 -0.12588954 -2.826024e-08 0.055780016 -0.12588954
		 0.021345966 0.051534064 -0.12588954 0.039442237 0.039442308 -0.12588954 0.051533788 0.021346204 -0.12588954
		 0.05577977 4.7624042e-08 -0.12588954 0.0515338 -0.021345809 -0.12588954 0.03944226 -0.0394421 -0.12588954
		 0.021346005 -0.051533721 -0.12588954 8.311833e-09 -0.055779699 -0.12588954 -0.02134599 -0.051533595 -0.12588954
		 -0.039442249 -0.039442107 -0.12588954 -0.051533796 -0.021345861 -0.12588954 -0.05577977 -3.7330778e-09 -0.12588954
		 -0.035589214 0.014741751 -0.12588954 -0.027238809 0.027238807 -0.12588954 -0.014741547 0.03558946 -0.12588954
		 -1.9516508e-08 0.038521543 -0.12588954 0.014741511 0.035589203 -0.12588954 0.02723879 0.027238868 -0.12588954
		 0.035589203 0.014741538 -0.12588954 0.038521476 3.2889119e-08 -0.12588954 0.035589214 -0.014741478 -0.12588954
		 0.027238803 -0.027238525 -0.12588954 0.014741537 -0.035589024 -0.12588954 5.7401475e-09 -0.038521394 -0.12588954
		 -0.014741527 -0.035589051 -0.12588954 -0.027238794 -0.027238525 -0.12588954 -0.035589211 -0.014741511 -0.12588954
		 -0.038521476 -2.5780622e-09 -0.12588954 -0.035589214 0.014741751 -0.12962842 -0.027238809 0.027238807 -0.12962842
		 -0.014741547 0.03558946 -0.12962842 -1.9516508e-08 0.038521543 -0.12962842 0.014741511 0.035589203 -0.12962842
		 0.02723879 0.027238868 -0.12962842 0.035589203 0.014741538 -0.12962842 0.038521476 3.2889119e-08 -0.12962842
		 0.035589214 -0.014741478 -0.12962842 0.027238803 -0.027238525 -0.12962842 0.014741537 -0.035589024 -0.12962842
		 5.7401475e-09 -0.038521394 -0.12962842 -0.014741527 -0.035589051 -0.12962842 -0.027238794 -0.027238525 -0.12962842
		 -0.035589211 -0.014741511 -0.12962842 -0.038521476 -2.5780622e-09 -0.12962842 -0.042941555 0.01778714 -0.086600065
		 -0.032866042 0.032866083 -0.086600065 -0.017786989 0.0429416 -0.086600065 -2.3548399e-08 0.046479713 -0.086600065
		 0.017786946 0.042941675 -0.086600065 0.03286602 0.032866158 -0.086600065 0.04294154 0.017787259 -0.086600065
		 0.046479587 3.9683655e-08 -0.086600065 0.042941555 -0.017786872 -0.086600065 0.032866035 -0.032865804 -0.086600065
		 0.017786978 -0.04294135 -0.086600065 6.9259989e-09 -0.046479408 -0.086600065 -0.017786965 -0.042941369 -0.086600065
		 -0.032866027 -0.032865822 -0.086600065 -0.042941548 -0.01778692 -0.086600065 -0.046479587 -3.1106708e-09 -0.086600065
		 -0.042941555 0.01778714 -0.068684816 -0.032866042 0.032866083 -0.068684816 -0.017786989 0.0429416 -0.068684816
		 -2.3548399e-08 0.046479713 -0.068684816 0.017786946 0.042941675 -0.068684816 0.03286602 0.032866158 -0.068684816
		 0.04294154 0.017787259 -0.068684816 0.046479587 3.9683655e-08 -0.068684816 0.042941555 -0.017786872 -0.068684816
		 0.032866035 -0.032865804 -0.068684816 0.017786978 -0.04294135 -0.068684816 6.9259989e-09 -0.046479408 -0.068684816
		 -0.017786965 -0.042941369 -0.068684816 -0.032866027 -0.032865822 -0.068684816 -0.042941548 -0.01778692 -0.068684816
		 -0.046479587 -3.1106708e-09 -0.068684816 0.038627006 0.01600218 -0.12962842 0.02956384 0.029566152 -0.12962842
		 0.015999846 0.038629472 -0.12962842 -1.5367871e-16 0.041812163 -0.12962842 -1.5367871e-16 -0.041807041 -0.12962842
		 0.01599982 -0.038624533 -0.12962842 0.02956382 -0.029561233 -0.12962842 0.038626995 -0.015997281 -0.12962842
		 0.041809551 2.3292114e-06 -0.12962842 0.05145216 0.021312421 -0.1612041 0.039379794 0.039379872 -0.1612041
		 0.021312207 0.051452428 -0.1612041 -1.4981179e-16 0.05569154 -0.1612041 -1.4981179e-16 -0.055691246 -0.1612041
		 0.021312173 -0.051451977 -0.1612041 0.039379772 -0.039379641 -0.1612041 0.051452149 -0.021312203 -0.1612041
		 0.05569141 9.2967412e-11 -0.1612041 0.039594792 0.0164009 -0.1612041 0.039594792 -0.016400669 -0.1612041
		 0.03030454 -0.030304305 -0.1612041 0.016400693 -0.039594688 -0.1612041 0.016400721 0.039594963 -0.1612041
		 0.030304557 0.030304559 -0.1612041 0.043633409 0.018073792 -0.1612041 0.033395573 0.03339579 -0.1612041
		 0.01807357 0.043633599 -0.1612041 -1.4981179e-16 0.047228523 -0.1612041 -1.4981179e-16 -0.047228388 -0.1612041
		 0.018073538 -0.043633312 -0.1612041 0.033395559 -0.033395551 -0.1612041 0.043633394 -0.018073549 -0.1612041
		 0.047228452 -1.144187e-09 -0.1612041 0.046797246 0.0021678321 -0.1612041 0.04253681 0.0016103064 -0.1612041
		 0.046792578 -0.0021912328 -0.1612041 0.042532139 -0.0016333984 -0.1612041 0.0024024516 -0.046707906 -0.1612041
		 0.0018448366 -0.042447407 -0.1612041 -1.5302655e-16 0.041793603 -0.13495374 -1.530266e-16 -0.041783247 -0.13495326
		 0.0018056561 -0.041382596 -0.13495374 0.038596075 -0.015984565 -0.13495326;
	setAttr ".vt[498:663]" 0.029540157 -0.02953776 -0.13495326 0.015987013 -0.038593583 -0.13495326
		 0.04144901 -0.0015954268 -0.13495326 0.041766826 2.3292077e-06 -0.13495326 0.041453563 0.0015773962 -0.13495326
		 0.038585462 0.015985195 -0.13495326 0.029532041 0.029534617 -0.13495326 0.015982637 0.038587894 -0.13495326
		 0.0018029967 0.041438516 -0.13495326 0.0018448648 0.042502984 -0.1612041 0.0024024826 0.046763189 -0.1612041
		 -1.5302522e-16 0.044506654 -0.1349647 0.0018190276 0.044151317 -0.1349647 -1.5302533e-16 -0.044332825 -0.13496375
		 0.0017869665 -0.043932326 -0.13496423 0.043998718 -0.0016446833 -0.13496184 0.044316527 2.3270161e-06 -0.13496184
		 0.044003267 0.0016266481 -0.13496184 -0.038627006 0.01600218 -0.12962842 -0.02956384 0.029566152 -0.12962842
		 -0.015999846 0.038629472 -0.12962842 -0.01599982 -0.038624533 -0.12962842 -0.02956382 -0.029561233 -0.12962842
		 -0.038626995 -0.015997281 -0.12962842 -0.041809551 2.3292114e-06 -0.12962842 -0.05145216 0.021312421 -0.1612041
		 -0.039379794 0.039379872 -0.1612041 -0.021312207 0.051452428 -0.1612041 -0.021312173 -0.051451977 -0.1612041
		 -0.039379772 -0.039379641 -0.1612041 -0.051452149 -0.021312203 -0.1612041 -0.05569141 9.2967412e-11 -0.1612041
		 -0.039594792 0.0164009 -0.1612041 -0.039594792 -0.016400669 -0.1612041 -0.03030454 -0.030304305 -0.1612041
		 -0.016400693 -0.039594688 -0.1612041 -0.016400721 0.039594963 -0.1612041 -0.030304557 0.030304559 -0.1612041
		 -0.043633409 0.018073792 -0.1612041 -0.033395573 0.03339579 -0.1612041 -0.01807357 0.043633599 -0.1612041
		 -0.018073538 -0.043633312 -0.1612041 -0.033395559 -0.033395551 -0.1612041 -0.043633394 -0.018073549 -0.1612041
		 -0.047228452 -1.144187e-09 -0.1612041 -0.046797246 0.0021678321 -0.1612041 -0.04253681 0.0016103064 -0.1612041
		 -0.046792578 -0.0021912328 -0.1612041 -0.042532139 -0.0016333984 -0.1612041 -0.0024024516 -0.046707906 -0.1612041
		 -0.0018448366 -0.042447407 -0.1612041 -0.0018056561 -0.041382596 -0.13495374 -0.038596075 -0.015984565 -0.13495326
		 -0.029540157 -0.02953776 -0.13495326 -0.015987013 -0.038593583 -0.13495326 -0.04144901 -0.0015954268 -0.13495326
		 -0.041766826 2.3292077e-06 -0.13495326 -0.041453563 0.0015773962 -0.13495326 -0.038585462 0.015985195 -0.13495326
		 -0.029532041 0.029534617 -0.13495326 -0.015982637 0.038587894 -0.13495326 -0.0018029967 0.041438516 -0.13495326
		 -0.0018448648 0.042502984 -0.1612041 -0.0024024826 0.046763189 -0.1612041 -0.0018190276 0.044151317 -0.1349647
		 -0.0017869665 -0.043932326 -0.13496423 -0.043998718 -0.0016446833 -0.13496184 -0.044316527 2.3270161e-06 -0.13496184
		 -0.044003267 0.0016266481 -0.13496184 0.044575363 0.018463854 -0.24432206 0.034116518 0.034116618 -0.24432206
		 0.01846374 0.044575382 -0.24432206 -1.3963279e-16 0.048248276 -0.24432206 -1.3963279e-16 -0.048247818 -0.24432206
		 0.01846371 -0.044575259 -0.24432206 0.034116495 -0.034116372 -0.24432206 0.044575352 -0.018463625 -0.24432206
		 0.048248008 -4.6368598e-10 -0.24432206 -1.3963279e-16 -4.6972559e-10 -0.24432206
		 0.05145216 0.021312421 -0.21274638 0.039379794 0.039379872 -0.21274638 0.021312207 0.051452428 -0.21274638
		 -1.434997e-16 0.05569154 -0.21274638 -1.434997e-16 -0.055691246 -0.21274638 0.021312173 -0.051451977 -0.21274638
		 0.039379772 -0.039379641 -0.21274638 0.051452149 -0.021312203 -0.21274638 0.05569141 9.2967412e-11 -0.21274638
		 0.044462308 0.01841696 -0.21274638 0.044462308 -0.018416731 -0.21274638 0.034029976 -0.034029882 -0.21274638
		 0.018416883 -0.044462234 -0.21274638 0.018416915 0.044462353 -0.21274638 0.034029994 0.034030128 -0.21274638
		 0.048997402 0.020295504 -0.21274638 0.037501 0.037501179 -0.21274638 0.020295413 0.048997499 -0.21274638
		 -1.434997e-16 0.053034481 -0.21274638 -1.434997e-16 -0.053034183 -0.21274638 0.020295378 -0.048997208 -0.21274638
		 0.037500981 -0.037500795 -0.21274638 0.048997391 -0.020295272 -0.21274638 0.053034399 -1.0581402e-10 -0.21274638
		 0.052550185 0.0024343752 -0.21274638 0.047765996 0.0018080923 -0.21274638 0.05254494 -0.002460612 -0.21274638
		 0.047760751 -0.0018343267 -0.21274638 0.0026977928 -0.0524498 -0.21274638 0.0020716283 -0.047665566 -0.21274638
		 -1.4028495e-16 0.048227012 -0.23899674 -1.402849e-16 -0.048220217 -0.23899722 0.0020837178 -0.047758028 -0.23899674
		 0.044539671 -0.018448904 -0.23899722 0.034089189 -0.034089036 -0.23899722 0.01844893 -0.044539571 -0.23899722
		 0.047831945 -0.0018435866 -0.23899722 0.0481987 -4.6746607e-10 -0.23899722 0.047837198 0.001817657 -0.23899722
		 0.044527423 0.018444039 -0.23899722 0.034079824 0.03407985 -0.23899722 0.018443881 0.044527467 -0.23899722
		 0.0020806489 0.047817018 -0.23899722 0.00207166 0.047727853 -0.21274638 0.0026978275 0.052512109 -0.21274638
		 -1.4028627e-16 0.051357709 -0.23898578 0.0020991485 0.05094767 -0.23898578 -1.4028617e-16 -0.051162694 -0.23898673
		 0.00206215 -0.050700355 -0.23898625 0.050774291 -0.0019007702 -0.23898864 0.051141042 -2.9971119e-09 -0.23898864
		 0.050779544 0.0018745287 -0.23898864 -0.044575363 0.018463854 -0.24432206 -0.034116518 0.034116618 -0.24432206
		 -0.01846374 0.044575382 -0.24432206 -0.01846371 -0.044575259 -0.24432206 -0.034116495 -0.034116372 -0.24432206
		 -0.044575352 -0.018463625 -0.24432206 -0.048248008 -4.6368598e-10 -0.24432206 -0.05145216 0.021312421 -0.21274638
		 -0.039379794 0.039379872 -0.21274638 -0.021312207 0.051452428 -0.21274638 -0.021312173 -0.051451977 -0.21274638
		 -0.039379772 -0.039379641 -0.21274638 -0.051452149 -0.021312203 -0.21274638 -0.05569141 9.2967412e-11 -0.21274638
		 -0.044462308 0.01841696 -0.21274638 -0.044462308 -0.018416731 -0.21274638 -0.034029976 -0.034029882 -0.21274638
		 -0.018416883 -0.044462234 -0.21274638 -0.018416915 0.044462353 -0.21274638 -0.034029994 0.034030128 -0.21274638
		 -0.048997402 0.020295504 -0.21274638 -0.037501 0.037501179 -0.21274638 -0.020295413 0.048997499 -0.21274638
		 -0.020295378 -0.048997208 -0.21274638 -0.037500981 -0.037500795 -0.21274638 -0.048997391 -0.020295272 -0.21274638
		 -0.053034399 -1.0581402e-10 -0.21274638 -0.052550185 0.0024343752 -0.21274638 -0.047765996 0.0018080923 -0.21274638
		 -0.05254494 -0.002460612 -0.21274638 -0.047760751 -0.0018343267 -0.21274638 -0.0026977928 -0.0524498 -0.21274638
		 -0.0020716283 -0.047665566 -0.21274638 -0.0020837178 -0.047758028 -0.23899674 -0.044539671 -0.018448904 -0.23899722;
	setAttr ".vt[664:829]" -0.034089189 -0.034089036 -0.23899722 -0.01844893 -0.044539571 -0.23899722
		 -0.047831945 -0.0018435866 -0.23899722 -0.0481987 -4.6746607e-10 -0.23899722 -0.047837198 0.001817657 -0.23899722
		 -0.044527423 0.018444039 -0.23899722 -0.034079824 0.03407985 -0.23899722 -0.018443881 0.044527467 -0.23899722
		 -0.0020806489 0.047817018 -0.23899722 -0.00207166 0.047727853 -0.21274638 -0.0026978275 0.052512109 -0.21274638
		 -0.0020991485 0.05094767 -0.23898578 -0.00206215 -0.050700355 -0.23898625 -0.050774291 -0.0019007702 -0.23898864
		 -0.051141042 -2.9971119e-09 -0.23898864 -0.050779544 0.0018745287 -0.23898864 0.021310717 0.021313155 -0.12962842
		 0.011533288 0.027846357 -0.12962842 0.011533268 -0.027841419 -0.12962842 0.021310704 -0.021308223 -0.12962842
		 0.027843785 -0.01153085 -0.12962842 0.027843788 0.011535775 -0.12962842 0.030137885 2.3295859e-06 -0.12962842
		 -1.5367871e-16 -0.030135317 -0.12962842 -1.5367871e-16 0.030140283 -0.12962842 -0.021310717 0.021313155 -0.12962842
		 -0.011533288 0.027846357 -0.12962842 -0.011533268 -0.027841419 -0.12962842 -0.021310704 -0.021308223 -0.12962842
		 -0.027843785 -0.01153085 -0.12962842 -0.027843788 0.011535775 -0.12962842 -0.030137885 2.3295859e-06 -0.12962842
		 0.055101842 -0.0066100233 -0.011401892 0.055101782 0.0066104075 -0.011401892 0.066788912 -0.0070000221 -0.045786858
		 0.066788912 0.0070000221 -0.045786858 0.055101752 0.0070000221 -0.045786858 0.055101812 -0.0069999453 -0.045786858
		 0.066788912 -0.0057216128 -0.051786184 0.066788971 0.0057219202 -0.051786184 0.058733046 0.0057219584 -0.051786184
		 0.058733046 -0.005721651 -0.051786184 0.058733046 0.0057219584 -0.093059063 0.058733046 -0.005721651 -0.093059063
		 0.058733046 0.0057219584 -0.09769392 0.058733046 -0.005721651 -0.09769392 0.058733046 -0.005721651 -0.099109173
		 0.05939883 -0.0057216706 -0.10119867 0.061071694 -0.0057216706 -0.1021173 0.058733046 0.0057219584 -0.099109173
		 0.061071694 0.0057219779 -0.1021173 0.05939883 0.0057219779 -0.10119867 0.068005741 -0.0057216128 -0.09991169
		 0.06352371 -0.0057216897 -0.10243368 0.066295803 -0.0057216128 -0.10180068 0.068005741 0.0057219202 -0.09991169
		 0.066295803 0.0057219202 -0.10180068 0.06352371 0.0057219965 -0.10243368 0.066996157 -0.0057216128 -0.09769392
		 0.068576038 -0.0057216128 -0.097690344 0.068050086 -0.0057216128 -0.095499992 0.066996157 0.0057219202 -0.09769392
		 0.068050086 0.0057219202 -0.095499992 0.068576038 0.0057219202 -0.097690344 0.066788912 -0.0057216128 -0.093059063
		 0.066788971 0.0057219202 -0.093059063 0.055101812 -0.0069999453 -0.026937246 0.055101752 0.0070000221 -0.026937246
		 0.066788912 0.0070000221 -0.026937246 0.066788912 -0.0070000221 -0.026937246 0.059227973 -0.0066561359 -0.013241768
		 0.05810836 -0.0066227601 -0.011903048 0.056436867 -0.0066100233 -0.011401892 0.059228033 0.0066564432 -0.013241768
		 0.056436926 0.0066103307 -0.011401892 0.05810836 0.0066230674 -0.011903048 -0.055101842 -0.0066100233 -0.011401892
		 -0.055101782 0.0066104075 -0.011401892 -0.066788912 -0.0070000221 -0.045786858 -0.066788912 0.0070000221 -0.045786858
		 -0.055101752 0.0070000221 -0.045786858 -0.055101812 -0.0069999453 -0.045786858 -0.066788912 -0.0057216128 -0.051786184
		 -0.066788971 0.0057219202 -0.051786184 -0.058733046 0.0057219584 -0.051786184 -0.058733046 -0.005721651 -0.051786184
		 -0.058733046 0.0057219584 -0.093059063 -0.058733046 -0.005721651 -0.093059063 -0.058733046 0.0057219584 -0.09769392
		 -0.058733046 -0.005721651 -0.09769392 -0.058733046 -0.005721651 -0.099109173 -0.05939883 -0.0057216706 -0.10119867
		 -0.061071694 -0.0057216706 -0.1021173 -0.058733046 0.0057219584 -0.099109173 -0.061071694 0.0057219779 -0.1021173
		 -0.05939883 0.0057219779 -0.10119867 -0.068005741 -0.0057216128 -0.09991169 -0.06352371 -0.0057216897 -0.10243368
		 -0.066295803 -0.0057216128 -0.10180068 -0.068005741 0.0057219202 -0.09991169 -0.066295803 0.0057219202 -0.10180068
		 -0.06352371 0.0057219965 -0.10243368 -0.066996157 -0.0057216128 -0.09769392 -0.068576038 -0.0057216128 -0.097690344
		 -0.068050086 -0.0057216128 -0.095499992 -0.066996157 0.0057219202 -0.09769392 -0.068050086 0.0057219202 -0.095499992
		 -0.068576038 0.0057219202 -0.097690344 -0.066788912 -0.0057216128 -0.093059063 -0.066788971 0.0057219202 -0.093059063
		 -0.055101812 -0.0069999453 -0.026937246 -0.055101752 0.0070000221 -0.026937246 -0.066788912 0.0070000221 -0.026937246
		 -0.066788912 -0.0070000221 -0.026937246 -0.059227973 -0.0066561359 -0.013241768 -0.05810836 -0.0066227601 -0.011903048
		 -0.056436867 -0.0066100233 -0.011401892 -0.059228033 0.0066564432 -0.013241768 -0.056436926 0.0066103307 -0.011401892
		 -0.05810836 0.0066230674 -0.011903048 -0.051106211 0.0070851017 -0.051366091 -0.052049525 0.013406117 -0.051366091
		 -0.055920813 0.0071093282 -0.051366091 -0.054924343 0.013417357 -0.051366091 -0.055998303 0.0071036215 -0.0066411495
		 -0.054972835 0.013416321 -0.0066411495 -0.051146634 0.0070850924 -0.010237455 -0.052089948 0.013406117 -0.010237455
		 -0.067780748 0.0070916908 -0.023714781 -0.067777142 0.0070922375 -0.030160189 -0.068980031 0.0071099899 -0.026937246
		 -0.067739762 0.013402021 -0.023715734 -0.068940431 0.013420349 -0.026937246 -0.067738913 0.013402331 -0.030160189
		 -0.050299536 0.019739408 -0.051366091 -0.054899327 0.013311715 -0.051366091 -0.05324284 0.019750323 -0.051366091
		 -0.053915076 0.013305998 -0.014833689 -0.053915072 0.019749297 -0.014833689 -0.050309584 0.013287479 -0.014833689
		 -0.050309587 0.019739414 -0.014833689 -0.066119172 0.013312099 -0.032804251 -0.067435205 0.013311542 -0.027193308
		 -0.064732678 0.0133102 -0.021402121 -0.05930984 0.01330806 -0.016734362 -0.065544054 0.019752163 -0.032779932
		 -0.059067018 0.019750284 -0.016599894 -0.064475119 0.01975178 -0.02132678 -0.067048043 0.019752242 -0.027188063
		 -0.042172775 0.013702986 -0.24869752 -0.035874307 0.026064247 -0.24869752 -0.0260642 0.03587446 -0.24869752
		 -0.013702758 0.042172823 -0.24869752 -1.3909693e-16 0.044343188 -0.24869752 0.013702758 0.042172823 -0.24869752
		 0.026064191 0.035874411 -0.24869752 0.035874277 0.026064217 -0.24869752 0.042172741 0.013702975 -0.24869752
		 0.044343043 0 -0.24869752 0.042172741 -0.013702669 -0.24869752 0.035874274 -0.026063908 -0.24869752
		 0.026064187 -0.035874087 -0.24869752 0.013702756 -0.042172633 -0.24869752 1.3215254e-09 -0.044342846 -0.24869752
		 -0.01370275 -0.042172633 -0.24869752 -0.02606418 -0.035874076 -0.24869752;
	setAttr ".vt[830:979]" -0.03587427 -0.026063899 -0.24869752 -0.042172737 -0.013702657 -0.24869752
		 -0.044343039 0 -0.24869752 -0.042172775 0.013702986 -0.25715256 -0.035874307 0.026064247 -0.25715256
		 -0.0260642 0.03587446 -0.25715256 -0.013702758 0.042172823 -0.25715256 -1.3806149e-16 0.044343188 -0.25715256
		 0.013702758 0.042172823 -0.25715256 0.026064191 0.035874411 -0.25715256 0.035874277 0.026064217 -0.25715256
		 0.042172741 0.013702975 -0.25715256 0.044343043 0 -0.25715256 0.042172741 -0.013702669 -0.25715256
		 0.035874274 -0.026063908 -0.25715256 0.026064187 -0.035874087 -0.25715256 0.013702756 -0.042172633 -0.25715256
		 1.3215254e-09 -0.044342846 -0.25715256 -0.01370275 -0.042172633 -0.25715256 -0.02606418 -0.035874076 -0.25715256
		 -0.03587427 -0.026063899 -0.25715256 -0.042172737 -0.013702657 -0.25715256 -0.044343039 0 -0.25715256
		 -0.03998873 0.012993172 -0.24869752 -0.034016445 0.024714487 -0.24869752 -0.024714395 0.03401652 -0.24869752
		 -0.012993125 0.03998889 -0.24869752 -1.3909693e-16 0.042046685 -0.24869752 0.012993124 0.03998889 -0.24869752
		 0.024714386 0.03401649 -0.24869752 0.03401643 0.024714462 -0.24869752 0.039988719 0.012993149 -0.24869752
		 0.042046621 0 -0.24869752 0.039988719 -0.012992843 -0.24869752 0.034016427 -0.02471415 -0.24869752
		 0.024714382 -0.03401617 -0.24869752 0.012993121 -0.03998857 -0.24869752 1.3824317e-09 -0.042046487 -0.24869752
		 -0.012993115 -0.03998857 -0.24869752 -0.024714377 -0.034016158 -0.24869752 -0.034016423 -0.024714138 -0.24869752
		 -0.039988704 -0.012992838 -0.24869752 -0.04204661 5.8068963e-09 -0.24869752 -0.03998873 0.012993172 -0.25715256
		 -0.034016445 0.024714487 -0.25715256 -0.024714395 0.03401652 -0.25715256 -0.012993125 0.03998889 -0.25715256
		 -1.3806149e-16 0.042046685 -0.25715256 0.012993124 0.03998889 -0.25715256 0.024714386 0.03401649 -0.25715256
		 0.03401643 0.024714462 -0.25715256 0.039988719 0.012993149 -0.25715256 0.042046621 0 -0.25715256
		 0.039988719 -0.012992843 -0.25715256 0.034016427 -0.02471415 -0.25715256 0.024714382 -0.03401617 -0.25715256
		 0.012993121 -0.03998857 -0.25715256 1.3824317e-09 -0.042046487 -0.25715256 -0.012993115 -0.03998857 -0.25715256
		 -0.024714377 -0.034016158 -0.25715256 -0.034016423 -0.024714138 -0.25715256 -0.039988704 -0.012992838 -0.25715256
		 -0.04204661 5.8068963e-09 -0.25715256 0.051106211 -0.0070847948 -0.051366091 0.052049525 -0.013406118 -0.051366091
		 0.055920813 -0.0071090208 -0.051366091 0.054924343 -0.013417052 -0.051366091 0.055998303 -0.0071033142 -0.0066411495
		 0.054972835 -0.013416016 -0.0066411495 0.051146634 -0.007084785 -0.010237455 0.052089948 -0.013406118 -0.010237455
		 0.067780748 -0.0070913834 -0.023714781 0.067777142 -0.0070919301 -0.030160189 0.068980031 -0.0071096825 -0.026937246
		 0.067739762 -0.013402023 -0.023715734 0.068940431 -0.013420044 -0.026937246 0.067738913 -0.013402026 -0.030160189
		 0.050299536 -0.019739103 -0.051366091 0.054899327 -0.01331141 -0.051366091 0.05324284 -0.019750018 -0.051366091
		 0.053915076 -0.013305694 -0.014833689 0.053915072 -0.019748993 -0.014833689 0.050309584 -0.013287175 -0.014833689
		 0.050309587 -0.019739108 -0.014833689 0.066119172 -0.013311793 -0.032804251 0.067435205 -0.013311237 -0.027193308
		 0.064732678 -0.013309894 -0.021402121 0.05930984 -0.013307756 -0.016734362 0.065544054 -0.01975186 -0.032779932
		 0.059067018 -0.019750286 -0.016599894 0.064475119 -0.019751476 -0.02132678 0.067048043 -0.019752244 -0.027188063
		 0.051106211 0.0070851017 -0.051366091 0.052049525 0.013406117 -0.051366091 0.055920813 0.0071093282 -0.051366091
		 0.054924343 0.013417357 -0.051366091 0.055998303 0.0071036215 -0.0066411495 0.054972835 0.013416321 -0.0066411495
		 0.051146634 0.0070850924 -0.010237455 0.052089948 0.013406117 -0.010237455 0.067780748 0.0070916908 -0.023714781
		 0.067777142 0.0070922375 -0.030160189 0.068980031 0.0071099899 -0.026937246 0.067739762 0.013402021 -0.023715734
		 0.068940431 0.013420349 -0.026937246 0.067738913 0.013402331 -0.030160189 0.050299536 0.019739408 -0.051366091
		 0.054899327 0.013311715 -0.051366091 0.05324284 0.019750323 -0.051366091 0.053915076 0.013305998 -0.014833689
		 0.053915072 0.019749297 -0.014833689 0.050309584 0.013287479 -0.014833689 0.050309587 0.019739414 -0.014833689
		 0.066119172 0.013312099 -0.032804251 0.067435205 0.013311542 -0.027193308 0.064732678 0.0133102 -0.021402121
		 0.05930984 0.01330806 -0.016734362 0.065544054 0.019752163 -0.032779932 0.059067018 0.019750284 -0.016599894
		 0.064475119 0.01975178 -0.02132678 0.067048043 0.019752242 -0.027188063 -0.051106211 -0.0070847911 -0.051366091
		 -0.052049525 -0.013406114 -0.051366091 -0.055920813 -0.0071090232 -0.051366091 -0.054924343 -0.013417052 -0.051366091
		 -0.055998303 -0.0071033118 -0.0066411495 -0.054972835 -0.013416016 -0.0066411495
		 -0.051146634 -0.0070847897 -0.010237455 -0.052089948 -0.013406114 -0.010237455 -0.067780748 -0.0070913872 -0.023714781
		 -0.067777142 -0.0070919278 -0.030160189 -0.068980031 -0.0071096825 -0.026937246 -0.067739762 -0.013402021 -0.023715734
		 -0.068940431 -0.013420047 -0.026937246 -0.067738913 -0.013402028 -0.030160189 -0.050299536 -0.019739103 -0.051366091
		 -0.054899327 -0.01331141 -0.051366091 -0.05324284 -0.019750018 -0.051366091 -0.053915076 -0.013305694 -0.014833689
		 -0.053915072 -0.019748993 -0.014833689 -0.050309584 -0.013287175 -0.014833689 -0.050309587 -0.019739108 -0.014833689
		 -0.066119172 -0.013311793 -0.032804251 -0.067435205 -0.01331124 -0.027193308 -0.064732678 -0.0133099 -0.021402121
		 -0.05930984 -0.013307756 -0.016734362 -0.065544054 -0.019751865 -0.032779932 -0.059067018 -0.019750286 -0.016599894
		 -0.064475119 -0.019751476 -0.02132678 -0.067048043 -0.019752244 -0.027188063;
	setAttr -s 1813 ".ed";
	setAttr ".ed[0:165]"  0 1 0 1 2 0 2 3 0 4 5 0 5 6 0 6 7 0 7 8 0 8 9 0 9 0 0
		 10 11 0 11 12 0 12 13 1 14 15 1 15 16 1 16 17 1 17 18 1 18 19 1 19 10 0 0 10 1 1 11 1
		 2 12 1 3 13 0 4 14 0 5 15 1 6 16 1 7 17 1 8 18 1 9 19 1 0 20 1 1 21 1 20 21 0 2 22 1
		 21 22 0 3 23 0 22 23 0 4 24 0 5 25 1 24 25 0 6 26 1 25 26 0 7 27 1 26 27 0 8 28 1
		 27 28 0 9 29 1 28 29 0 29 20 0 10 30 1 11 31 1 30 31 0 12 32 1 31 32 0 32 33 1 34 35 1
		 35 36 1 36 37 1 37 38 1 19 39 0 38 39 1 39 30 0 21 31 1 20 30 1 29 39 1 28 38 1 27 37 1
		 26 36 1 25 35 1 24 34 0 23 33 0 22 32 1 13 40 0 12 40 0 33 41 0 40 41 0 32 41 0 14 42 0
		 34 43 0 42 43 0 15 44 1 42 44 0 35 45 1 44 45 1 43 45 0 16 46 1 44 46 0 36 47 1 46 47 1
		 45 47 0 17 48 1 46 48 0 37 49 1 48 49 1 47 49 0 18 50 1 48 50 0 38 51 1 50 51 1 49 51 0
		 19 52 0 50 52 0 39 53 0 52 53 0 51 53 0 54 55 0 55 56 0 56 57 0 57 58 0 58 59 0 59 60 0
		 60 61 0 61 62 0 62 63 0 63 64 0 64 65 0 65 54 0 66 67 0 67 68 0 68 69 0 69 70 0 70 71 0
		 71 72 0 72 73 0 73 74 0 74 75 0 75 76 0 76 77 0 77 66 0 54 66 0 55 67 0 56 68 0 57 69 0
		 58 70 0 59 71 0 60 72 0 61 73 0 62 74 0 63 75 0 64 76 0 65 77 0 66 78 1 67 79 1 78 79 0
		 68 80 1 79 80 0 69 81 1 80 81 0 70 82 1 81 82 0 71 83 1 82 83 0 72 84 1 83 84 0 73 85 1
		 84 85 0 74 86 1 85 86 0 75 87 1 86 87 0 76 88 1 87 88 0 77 89 1 88 89 0 89 78 0 90 91 0
		 91 92 0 92 93 0;
	setAttr ".ed[166:331]" 93 94 0 94 95 0 95 96 0 96 97 0 97 98 0 98 99 0 99 100 0
		 100 101 0 101 102 0 102 103 0 103 104 0 104 105 0 105 106 0 106 107 0 107 108 0 108 109 0
		 109 90 0 110 111 0 111 112 0 112 113 0 113 114 0 114 115 0 115 116 0 116 117 0 117 118 0
		 118 119 0 119 120 0 120 121 0 121 122 0 122 123 0 123 124 0 124 125 0 125 126 0 126 127 0
		 127 128 0 128 129 0 129 110 0 134 133 1 133 130 0 132 135 1 135 134 1 132 131 1 189 132 1
		 131 130 1 130 187 0 137 136 1 136 133 0 135 138 1 138 137 1 140 139 1 139 136 0 138 141 1
		 141 140 1 143 142 1 142 139 0 141 144 1 144 143 1 146 145 1 145 142 0 144 147 1 147 146 1
		 149 148 1 148 145 0 147 150 1 150 149 1 152 151 1 151 148 0 150 153 1 153 152 1 155 154 1
		 154 151 0 153 156 1 156 155 1 158 157 1 157 154 0 156 159 1 159 158 1 161 160 1 160 157 0
		 159 162 1 162 161 1 164 163 1 163 160 0 162 165 1 165 164 1 167 166 1 166 163 0 165 168 1
		 168 167 1 170 169 1 169 166 0 168 171 1 171 170 1 173 172 1 172 169 0 171 174 1 174 173 1
		 176 175 1 175 172 0 174 177 1 177 176 1 179 178 1 178 175 0 177 180 1 180 179 1 182 181 1
		 181 178 0 180 183 1 183 182 1 185 184 1 184 181 0 183 186 1 186 185 1 188 187 1 187 184 0
		 186 189 1 189 188 1 110 153 1 150 111 1 147 112 1 144 113 1 141 114 1 138 115 1 135 116 1
		 132 117 1 189 118 1 186 119 1 183 120 1 180 121 1 177 122 1 174 123 1 171 124 1 168 125 1
		 165 126 1 162 127 1 159 128 1 156 129 1 131 134 1 134 137 1 137 140 1 140 143 1 143 146 1
		 146 149 1 149 152 1 152 155 1 155 158 1 158 161 1 161 164 1 164 167 1 167 170 1 170 173 1
		 173 176 1 176 179 1 179 182 1 182 185 1 185 188 1 131 188 1 90 190 1 91 191 1 190 191 0
		 92 192 1 191 192 0 93 193 1 192 193 0 94 194 1 193 194 0;
	setAttr ".ed[332:497]" 95 195 1 194 195 0 96 196 1 195 196 0 97 197 1 196 197 0
		 98 198 1 197 198 0 99 199 1 198 199 0 100 200 1 199 200 0 101 201 1 200 201 0 102 202 1
		 201 202 0 103 203 1 202 203 0 104 204 1 203 204 0 105 205 1 204 205 0 106 206 1 205 206 0
		 107 207 1 206 207 0 108 208 1 207 208 0 109 209 1 208 209 0 209 190 0 190 210 1 191 211 1
		 210 211 0 192 212 1 211 212 0 193 213 1 212 213 0 194 214 1 213 214 0 195 215 1 214 215 0
		 196 216 1 215 216 0 197 217 1 216 217 0 198 218 1 217 218 0 199 219 1 218 219 0 200 220 1
		 219 220 0 201 221 1 220 221 0 202 222 1 221 222 0 203 223 1 222 223 0 204 224 1 223 224 0
		 205 225 1 224 225 0 206 226 1 225 226 0 207 227 1 226 227 0 208 228 1 227 228 0 209 229 1
		 228 229 0 229 210 0 230 231 0 231 232 0 232 233 0 233 234 0 234 235 0 235 236 0 236 237 0
		 237 238 0 238 239 0 239 240 0 240 241 0 241 242 0 242 243 0 243 244 0 244 245 0 245 246 0
		 246 247 0 247 248 0 248 249 0 249 230 0 230 250 1 231 251 1 250 251 1 232 252 1 251 252 1
		 233 253 1 252 253 1 234 254 1 253 254 1 235 255 1 254 255 1 236 256 1 255 256 1 237 257 1
		 256 257 1 238 258 1 257 258 1 239 259 1 258 259 1 240 260 1 259 260 1 241 261 1 260 261 1
		 242 262 1 261 262 1 243 263 1 262 263 1 244 264 1 263 264 1 245 265 1 264 265 1 246 266 1
		 265 266 1 247 267 1 266 267 1 248 268 1 267 268 1 249 269 1 268 269 1 269 250 1 250 270 1
		 251 270 1 252 270 1 253 270 1 254 270 1 255 270 1 256 270 1 257 270 1 258 270 1 259 270 1
		 260 270 1 261 270 1 262 270 1 263 270 1 264 270 1 265 270 1 266 270 1 267 270 1 268 270 1
		 269 270 1 91 116 0 92 115 0 96 111 0 97 110 0 101 126 0 102 125 0 106 121 0 107 120 0
		 211 231 1 210 230 1 229 249 1 228 248 1 227 247 1 226 246 1 225 245 1;
	setAttr ".ed[498:663]" 224 244 1 223 243 1 222 242 1 221 241 1 220 240 1 219 239 1
		 218 238 1 217 237 1 216 236 1 215 235 1 214 234 1 213 233 1 212 232 1 92 271 0 93 272 1
		 271 272 0 114 273 1 272 273 1 115 274 0 273 274 0 271 274 0 94 275 1 272 275 0 113 276 1
		 275 276 1 276 273 0 95 277 1 275 277 0 112 278 1 277 278 1 278 276 0 96 279 0 277 279 0
		 111 280 0 279 280 0 280 278 0 97 281 0 98 282 1 281 282 0 129 283 1 282 283 1 110 284 0
		 283 284 0 281 284 0 99 285 1 282 285 0 128 286 1 285 286 1 286 283 0 100 287 1 285 287 0
		 127 288 1 287 288 1 288 286 0 101 289 0 287 289 0 126 290 0 289 290 0 290 288 0 102 291 0
		 103 292 1 291 292 0 124 293 1 292 293 1 125 294 0 293 294 0 291 294 0 104 295 1 292 295 0
		 123 296 1 295 296 1 296 293 0 105 297 1 295 297 0 122 298 1 297 298 1 298 296 0 106 299 0
		 297 299 0 121 300 0 299 300 0 300 298 0 107 301 0 108 302 1 301 302 0 119 303 1 302 303 1
		 120 304 0 303 304 0 301 304 0 109 305 1 302 305 0 118 306 1 305 306 1 306 303 0 90 307 1
		 305 307 0 117 308 1 307 308 1 308 306 0 91 309 0 307 309 0 116 310 0 309 310 0 310 308 0
		 311 312 0 312 313 0 313 314 0 314 315 0 315 316 0 316 317 0 317 318 0 318 319 0 319 320 0
		 320 321 0 321 322 0 322 311 0 323 324 0 324 325 0 325 326 0 326 327 0 327 328 0 328 329 0
		 329 330 0 330 331 0 331 332 0 332 333 0 333 334 0 334 323 0 311 323 0 312 324 0 313 325 0
		 314 326 0 315 327 0 316 328 0 317 329 0 318 330 0 319 331 0 320 332 0 321 333 0 322 334 0
		 311 335 1 312 336 1 335 336 0 313 337 1 336 337 0 314 338 1 337 338 0 315 339 1 338 339 0
		 316 340 1 339 340 0 317 341 1 340 341 0 318 342 1 341 342 0 319 343 1 342 343 0 320 344 1
		 343 344 0 321 345 1 344 345 0 322 346 1 345 346 0 346 335 0 323 347 1;
	setAttr ".ed[664:829]" 324 348 1 347 348 0 325 349 1 348 349 0 326 350 1 349 350 0
		 327 351 1 350 351 0 328 352 1 351 352 0 329 353 1 352 353 0 330 354 1 353 354 0 331 355 1
		 354 355 0 332 356 1 355 356 0 333 357 1 356 357 0 334 358 1 357 358 0 358 347 0 359 375 1
		 360 376 1 361 377 1 362 378 1 363 379 1 364 380 1 365 381 1 366 382 1 367 383 1 368 384 1
		 369 385 1 370 386 1 371 387 1 372 388 1 373 389 1 374 390 1 375 376 0 376 377 0 377 378 0
		 378 379 0 379 380 0 380 381 0 381 382 0 382 383 0 383 384 0 384 385 0 385 386 0 386 387 0
		 387 388 0 388 389 0 389 390 0 390 375 0 361 362 0 360 361 0 359 360 0 362 363 0 363 364 0
		 364 365 0 365 366 0 366 367 0 367 368 0 368 369 0 369 370 0 370 371 0 371 372 0 372 373 0
		 373 374 0 374 359 0 375 391 0 376 392 0 391 392 0 377 393 0 392 393 0 378 394 0 393 394 0
		 379 395 0 394 395 0 380 396 0 395 396 0 381 397 0 396 397 0 382 398 0 397 398 0 383 399 0
		 398 399 0 384 400 0 399 400 0 385 401 0 400 401 0 386 402 0 401 402 0 387 403 0 402 403 0
		 388 404 0 403 404 0 389 405 0 404 405 0 390 406 0 405 406 0 406 391 0 391 407 1 392 408 1
		 407 408 0 393 409 1 408 409 0 394 410 1 409 410 0 395 411 1 410 411 0 396 412 1 411 412 0
		 397 413 1 412 413 0 398 414 1 413 414 0 399 415 1 414 415 0 400 416 1 415 416 0 401 417 1
		 416 417 0 402 418 1 417 418 0 403 419 1 418 419 0 404 420 1 419 420 0 405 421 1 420 421 0
		 406 422 1 421 422 0 422 407 0 359 423 0 360 424 0 423 424 0 361 425 0 424 425 0 362 426 0
		 425 426 0 363 427 0 426 427 0 364 428 0 427 428 0 365 429 0 428 429 0 366 430 0 429 430 0
		 367 431 0 430 431 0 368 432 0 431 432 0 369 433 0 432 433 0 370 434 0 433 434 0 371 435 0
		 434 435 0 372 436 0 435 436 0 373 437 0 436 437 0 374 438 0 437 438 0;
	setAttr ".ed[830:995]" 438 423 0 423 439 1 424 440 1 439 440 0 425 441 1 440 441 0
		 426 442 1 441 442 0 427 443 1 442 443 0 428 444 1 443 444 0 429 445 1 444 445 0 430 446 1
		 445 446 0 431 447 1 446 447 0 432 448 1 447 448 0 433 449 1 448 449 0 434 450 1 449 450 0
		 435 451 1 450 451 0 436 452 1 451 452 0 437 453 1 452 453 0 438 454 1 453 454 0 454 439 0
		 456 457 0 460 461 0 461 462 0 464 479 0 465 480 0 466 481 0 467 482 0 468 483 0 469 484 0
		 470 485 0 471 486 0 472 487 0 465 466 0 469 470 0 470 471 0 464 465 0 455 456 0 473 503 1
		 474 497 1 475 498 1 476 499 1 477 505 1 478 504 1 474 475 0 475 476 0 477 478 0 478 473 0
		 479 473 0 480 478 0 481 477 0 484 476 0 485 475 0 486 474 0 479 480 0 480 481 0 483 492 0
		 484 485 0 485 486 0 487 488 0 473 489 0 472 464 0 488 479 0 488 489 0 463 455 0 489 502 0
		 490 487 0 490 491 0 491 500 0 471 472 0 486 490 0 491 474 0 462 463 0 476 493 0 468 469 0
		 492 484 0 492 493 0 459 460 0 493 496 0 494 458 1 495 459 1 495 496 0 497 462 1 498 461 1
		 499 460 1 497 498 0 498 499 0 501 463 1 500 501 0 501 502 0 503 455 1 504 456 1 505 457 1
		 503 504 0 504 505 0 502 503 0 497 500 0 496 499 0 494 506 0 481 508 0 457 458 0 506 505 0
		 507 477 0 506 507 0 508 482 0 507 508 0 466 467 0 494 509 0 482 509 1 506 510 0 509 510 0
		 510 508 0 495 511 0 483 511 1 496 512 0 492 512 0 511 512 0 500 513 0 501 514 0 513 514 0
		 490 513 0 487 514 1 502 515 0 488 515 0 514 515 0 463 502 1 463 500 1 459 496 1 458 506 1
		 517 518 0 519 520 0 520 521 0 523 536 0 524 537 0 525 538 0 526 539 0 527 540 0 528 541 0
		 529 542 0 524 525 0 526 527 0 527 528 0 523 524 0 516 517 0 530 556 1 531 550 1 532 551 1
		 533 552 1 534 558 1 535 557 1 531 532 0 532 533 0 534 535 0 535 530 0;
	setAttr ".ed[996:1161]" 536 530 0 537 535 0 538 534 0 539 533 0 540 532 0 541 531 0
		 536 537 0 537 538 0 483 547 0 539 540 0 540 541 0 542 543 0 530 544 0 529 523 0 543 536 0
		 543 544 0 522 516 0 544 555 0 545 542 0 545 546 0 546 553 0 528 529 0 541 545 0 546 531 0
		 521 522 0 533 548 0 468 526 0 547 539 0 547 548 0 459 519 0 548 549 0 495 549 0 550 521 1
		 551 520 1 552 519 1 550 551 0 551 552 0 554 522 1 553 554 0 554 555 0 556 516 1 557 517 1
		 558 518 1 556 557 0 557 558 0 555 556 0 550 553 0 549 552 0 494 559 0 538 561 0 518 458 0
		 559 558 0 560 534 0 559 560 0 561 482 0 560 561 0 525 467 0 559 562 0 509 562 0 562 561 0
		 549 563 0 547 563 0 511 563 0 553 564 0 554 565 0 564 565 0 545 564 0 542 565 1 555 566 0
		 543 566 0 565 566 0 522 555 1 522 553 1 459 549 1 458 559 1 568 569 0 572 573 0 573 574 0
		 464 577 1 465 578 1 466 579 1 467 580 1 468 581 1 469 582 1 470 583 1 471 584 1 472 585 1
		 567 576 0 568 576 0 569 576 0 570 576 0 571 576 0 572 576 0 573 576 0 574 576 0 575 576 0
		 577 592 0 578 593 0 579 594 0 580 595 0 581 596 0 582 597 0 583 598 0 584 599 0 585 600 0
		 578 579 0 582 583 0 583 584 0 577 578 0 567 568 0 586 616 1 587 610 1 588 611 1 589 612 1
		 590 618 1 591 617 1 587 588 0 588 589 0 590 591 0 591 586 0 592 586 0 593 591 0 594 590 0
		 597 589 0 598 588 0 599 587 0 592 593 0 593 594 0 596 605 0 597 598 0 598 599 0 600 601 0
		 586 602 0 585 577 0 601 592 0 601 602 0 575 567 0 602 615 0 603 600 0 603 604 0 604 613 0
		 584 585 0 599 603 0 604 587 0 574 575 0 589 606 0 581 582 0 605 597 0 605 606 0 571 572 0
		 606 609 0 607 570 1 608 571 1 608 609 0 610 574 1 611 573 1 612 572 1 610 611 0 611 612 0
		 614 575 1 613 614 0 614 615 0 616 567 1 617 568 1 618 569 1 616 617 0;
	setAttr ".ed[1162:1327]" 617 618 0 615 616 0 610 613 0 609 612 0 607 619 0 594 621 0
		 569 570 0 619 618 0 620 590 0 619 620 0 621 595 0 620 621 0 579 580 0 607 622 0 595 622 1
		 619 623 0 622 623 0 623 621 0 608 624 0 596 624 1 609 625 0 605 625 0 624 625 0 613 626 0
		 614 627 0 626 627 0 603 626 0 600 627 1 615 628 0 601 628 0 627 628 0 575 615 1 575 613 1
		 571 609 1 570 619 1 630 631 0 632 633 0 633 634 0 523 636 1 524 637 1 525 638 1 526 639 1
		 527 640 1 528 641 1 529 642 1 629 576 0 630 576 0 631 576 0 632 576 0 633 576 0 634 576 0
		 635 576 0 636 649 0 637 650 0 638 651 0 639 652 0 640 653 0 641 654 0 642 655 0 637 638 0
		 639 640 0 640 641 0 636 637 0 629 630 0 643 669 1 644 663 1 645 664 1 646 665 1 647 671 1
		 648 670 1 644 645 0 645 646 0 647 648 0 648 643 0 649 643 0 650 648 0 651 647 0 652 646 0
		 653 645 0 654 644 0 649 650 0 650 651 0 596 660 0 652 653 0 653 654 0 655 656 0 643 657 0
		 642 636 0 656 649 0 656 657 0 635 629 0 657 668 0 658 655 0 658 659 0 659 666 0 641 642 0
		 654 658 0 659 644 0 634 635 0 646 661 0 581 639 0 660 652 0 660 661 0 571 632 0 661 662 0
		 608 662 0 663 634 1 664 633 1 665 632 1 663 664 0 664 665 0 667 635 1 666 667 0 667 668 0
		 669 629 1 670 630 1 671 631 1 669 670 0 670 671 0 668 669 0 663 666 0 662 665 0 607 672 0
		 651 674 0 631 570 0 672 671 0 673 647 0 672 673 0 674 595 0 673 674 0 638 580 0 672 675 0
		 622 675 0 675 674 0 662 676 0 660 676 0 624 676 0 666 677 0 667 678 0 677 678 0 658 677 0
		 655 678 1 668 679 0 656 679 0 678 679 0 635 668 1 635 666 1 571 662 1 570 672 1 456 680 0
		 457 681 0 680 681 0 460 682 0 461 683 0 682 683 0 462 684 0 683 684 0 455 685 0 685 680 0
		 463 686 0 686 685 0 684 686 0 459 687 0 687 682 0 458 688 0 681 688 0;
	setAttr ".ed[1328:1493]" 517 689 0 518 690 0 689 690 0 519 691 0 520 692 0 691 692 0
		 521 693 0 692 693 0 516 694 0 694 689 0 522 695 0 695 694 0 693 695 0 687 691 0 690 688 0
		 696 697 0 696 730 0 697 731 0 698 733 0 699 732 0 700 704 0 701 705 0 698 699 1 699 700 0
		 700 701 1 701 698 0 702 698 0 703 699 0 704 706 0 705 707 0 702 703 1 703 704 0 704 705 1
		 705 702 0 706 708 0 707 709 0 706 707 1 707 728 1 708 713 0 709 710 0 708 709 1 709 722 1
		 712 717 0 714 721 0 724 728 0 722 724 1 722 716 1 725 708 1 726 729 0 725 726 1 725 719 1
		 712 714 1 713 710 1 716 719 1 721 717 1 724 726 1 712 711 0 711 715 1 715 714 0 711 710 0
		 713 715 0 716 718 0 718 720 1 720 719 0 718 717 0 721 720 0 724 723 0 723 727 1 727 726 0
		 723 716 0 719 727 0 723 722 1 727 725 1 728 702 0 729 706 1 729 703 0 729 728 0 730 701 0
		 731 700 0 732 737 0 733 734 0 730 731 1 731 732 1 732 733 0 733 730 1 736 696 0 738 697 0
		 736 738 1 737 734 1 736 735 0 735 739 1 739 738 0 735 734 0 737 739 0 740 741 0 740 774 0
		 741 775 0 742 777 0 743 776 0 744 748 0 745 749 0 742 743 1 743 744 0 744 745 1 745 742 0
		 746 742 0 747 743 0 748 750 0 749 751 0 746 747 1 747 748 0 748 749 1 749 746 0 750 752 0
		 751 753 0 750 751 1 751 772 1 752 757 0 753 754 0 752 753 1 753 766 1 756 761 0 758 765 0
		 768 772 0 766 768 1 766 760 1 769 752 1 770 773 0 769 770 1 769 763 1 756 758 1 757 754 1
		 760 763 1 765 761 1 768 770 1 756 755 0 755 759 1 759 758 0 755 754 0 757 759 0 760 762 0
		 762 764 1 764 763 0 762 761 0 765 764 0 768 767 0 767 771 1 771 770 0 767 760 0 763 771 0
		 767 766 1 771 769 1 772 746 0 773 750 1 773 747 0 773 772 0 774 745 0 775 744 0 776 781 0
		 777 778 0 774 775 1 775 776 1 776 777 0 777 774 1 780 740 0 782 741 0;
	setAttr ".ed[1494:1659]" 780 782 1 781 778 1 780 779 0 779 783 1 783 782 0 779 778 0
		 781 783 0 786 787 0 788 789 0 784 786 0 785 787 0 786 788 1 787 789 1 788 790 0 789 791 0
		 790 784 0 791 785 0 786 793 0 787 797 0 789 795 0 788 792 0 792 795 1 797 793 1 792 794 0
		 794 796 1 796 795 0 794 793 0 797 796 0 799 800 0 801 802 1 798 800 0 800 802 1 801 803 0
		 802 804 0 804 798 0 799 805 0 801 808 0 800 809 0 803 804 0 810 802 0 808 810 1 809 805 1
		 808 807 0 807 811 1 811 810 0 807 806 0 806 812 1 812 811 0 806 805 0 809 812 0 813 814 0
		 814 815 0 815 816 0 816 817 0 817 818 0 818 819 0 819 820 0 820 821 0 821 822 0 822 823 0
		 823 824 0 824 825 0 825 826 0 826 827 0 827 828 0 828 829 0 829 830 0 830 831 0 831 832 0
		 832 813 0 833 834 0 834 835 0 835 836 0 836 837 0 837 838 0 838 839 0 839 840 0 840 841 0
		 841 842 0 842 843 0 843 844 0 844 845 0 845 846 0 846 847 0 847 848 0 848 849 0 849 850 0
		 850 851 0 851 852 0 852 833 0 813 833 1 814 834 1 815 835 1 816 836 1 817 837 1 818 838 1
		 819 839 1 820 840 1 821 841 1 822 842 1 823 843 1 824 844 1 825 845 1 826 846 1 827 847 1
		 828 848 1 829 849 1 830 850 1 831 851 1 832 852 1 813 853 1 814 854 1 853 854 0 815 855 1
		 854 855 0 816 856 1 855 856 0 817 857 1 856 857 0 818 858 1 857 858 0 819 859 1 858 859 0
		 820 860 1 859 860 0 821 861 1 860 861 0 822 862 1 861 862 0 823 863 1 862 863 0 824 864 1
		 863 864 0 825 865 1 864 865 0 826 866 1 865 866 0 827 867 1 866 867 0 828 868 1 867 868 0
		 829 869 1 868 869 0 830 870 1 869 870 0 831 871 1 870 871 0 832 872 1 871 872 0 872 853 0
		 833 873 1 834 874 1 873 874 0 835 875 1 874 875 0 836 876 1 875 876 0 837 877 1 876 877 0
		 838 878 1 877 878 0 839 879 1 878 879 0 840 880 1 879 880 0 841 881 1;
	setAttr ".ed[1660:1812]" 880 881 0 842 882 1 881 882 0 843 883 1 882 883 0 844 884 1
		 883 884 0 845 885 1 884 885 0 846 886 1 885 886 0 847 887 1 886 887 0 848 888 1 887 888 0
		 849 889 1 888 889 0 850 890 1 889 890 0 851 891 1 890 891 0 852 892 1 891 892 0 892 873 0
		 895 896 0 897 898 0 893 895 0 894 896 0 895 897 1 896 898 1 897 899 0 898 900 0 899 893 0
		 900 894 0 895 902 0 896 906 0 898 904 0 897 901 0 901 904 1 906 902 1 901 903 0 903 905 1
		 905 904 0 903 902 0 906 905 0 908 909 0 910 911 1 907 909 0 909 911 1 910 912 0 911 913 0
		 913 907 0 908 914 0 910 917 0 909 918 0 912 913 0 919 911 0 917 919 1 918 914 1 917 916 0
		 916 920 1 920 919 0 916 915 0 915 921 1 921 920 0 915 914 0 918 921 0 924 925 0 926 927 0
		 922 924 0 923 925 0 924 926 1 925 927 1 926 928 0 927 929 0 928 922 0 929 923 0 924 931 0
		 925 935 0 927 933 0 926 930 0 930 933 1 935 931 1 930 932 0 932 934 1 934 933 0 932 931 0
		 935 934 0 937 938 0 939 940 1 936 938 0 938 940 1 939 941 0 940 942 0 942 936 0 937 943 0
		 939 946 0 938 947 0 941 942 0 948 940 0 946 948 1 947 943 1 946 945 0 945 949 1 949 948 0
		 945 944 0 944 950 1 950 949 0 944 943 0 947 950 0 953 954 0 955 956 0 951 953 0 952 954 0
		 953 955 1 954 956 1 955 957 0 956 958 0 957 951 0 958 952 0 953 960 0 954 964 0 956 962 0
		 955 959 0 959 962 1 964 960 1 959 961 0 961 963 1 963 962 0 961 960 0 964 963 0 966 967 0
		 968 969 1 965 967 0 967 969 1 968 970 0 969 971 0 971 965 0 966 972 0 968 975 0 967 976 0
		 970 971 0 977 969 0 975 977 1 976 972 1 975 974 0 974 978 1 978 977 0 974 973 0 973 979 1
		 979 978 0 973 972 0 976 979 0;
	setAttr -s 847 -ch 3386 ".fc";
	setAttr ".fc[0:499]" -type "polyFaces"
		f 4 0 19 -10 -19
		mu 0 4 0 1 2 3
		f 4 1 20 -11 -20
		mu 0 4 1 4 5 2
		f 4 2 21 -12 -21
		mu 0 4 4 6 7 5
		f 4 3 23 -13 -23
		mu 0 4 8 9 10 11
		f 4 4 24 -14 -24
		mu 0 4 9 12 13 10
		f 4 5 25 -15 -25
		mu 0 4 12 14 15 13
		f 4 6 26 -16 -26
		mu 0 4 14 16 17 15
		f 4 7 27 -17 -27
		mu 0 4 16 18 19 17
		f 4 8 18 -18 -28
		mu 0 4 18 0 3 19
		f 4 -1 28 30 -30
		mu 0 4 20 21 22 23
		f 4 -2 29 32 -32
		mu 0 4 24 20 23 25
		f 4 -3 31 34 -34
		mu 0 4 26 24 25 27
		f 4 -4 35 37 -37
		mu 0 4 28 29 30 31
		f 4 -5 36 39 -39
		mu 0 4 32 28 31 33
		f 4 -6 38 41 -41
		mu 0 4 34 32 33 35
		f 4 -7 40 43 -43
		mu 0 4 36 34 35 37
		f 4 -8 42 45 -45
		mu 0 4 38 36 37 39
		f 4 -9 44 46 -29
		mu 0 4 21 38 39 22
		f 4 9 48 -50 -48
		mu 0 4 40 41 42 43
		f 4 10 50 -52 -49
		mu 0 4 41 44 45 42
		f 4 71 73 -75 -51
		mu 0 4 44 46 47 45
		f 4 79 81 -83 -78
		mu 0 4 48 49 50 51
		f 4 84 86 -88 -82
		mu 0 4 49 52 53 50
		f 4 89 91 -93 -87
		mu 0 4 52 54 55 53
		f 4 94 96 -98 -92
		mu 0 4 54 56 57 55
		f 4 99 101 -103 -97
		mu 0 4 56 58 59 57
		f 4 17 47 -60 -58
		mu 0 4 60 40 43 61
		f 4 -31 61 49 -61
		mu 0 4 62 63 64 65
		f 4 -47 62 59 -62
		mu 0 4 63 66 67 64
		f 4 -46 63 58 -63
		mu 0 4 66 68 69 67
		f 4 -44 64 56 -64
		mu 0 4 68 70 71 69
		f 4 -42 65 55 -65
		mu 0 4 70 72 73 71
		f 4 -40 66 54 -66
		mu 0 4 72 74 75 73
		f 4 -38 67 53 -67
		mu 0 4 74 76 77 75
		f 4 -35 69 52 -69
		mu 0 4 78 79 80 81
		f 4 -33 60 51 -70
		mu 0 4 79 62 65 80
		f 3 11 70 -72
		mu 0 3 5 7 82
		f 3 -53 74 -73
		mu 0 3 81 80 83
		f 4 12 78 -80 -76
		mu 0 4 11 10 84 85
		f 4 -54 76 82 -81
		mu 0 4 75 77 86 87
		f 4 13 83 -85 -79
		mu 0 4 10 13 88 84
		f 4 -55 80 87 -86
		mu 0 4 73 75 87 89
		f 4 14 88 -90 -84
		mu 0 4 13 15 90 88
		f 4 -56 85 92 -91
		mu 0 4 71 73 89 91
		f 4 15 93 -95 -89
		mu 0 4 15 17 92 90
		f 4 -57 90 97 -96
		mu 0 4 69 71 91 93
		f 4 16 98 -100 -94
		mu 0 4 17 19 94 92
		f 4 57 100 -102 -99
		mu 0 4 95 96 97 98
		f 4 -59 95 102 -101
		mu 0 4 67 69 93 99
		f 4 103 128 -116 -128
		mu 0 4 100 101 102 103
		f 4 104 129 -117 -129
		mu 0 4 101 104 105 102
		f 4 105 130 -118 -130
		mu 0 4 106 107 108 109
		f 4 106 131 -119 -131
		mu 0 4 107 110 111 108
		f 4 107 132 -120 -132
		mu 0 4 110 112 113 111
		f 4 108 133 -121 -133
		mu 0 4 112 114 115 113
		f 4 109 134 -122 -134
		mu 0 4 114 116 117 115
		f 4 110 135 -123 -135
		mu 0 4 116 118 119 117
		f 4 111 136 -124 -136
		mu 0 4 118 120 121 119
		f 4 112 137 -125 -137
		mu 0 4 120 122 123 121
		f 4 113 138 -126 -138
		mu 0 4 122 124 125 123
		f 4 114 127 -127 -139
		mu 0 4 124 100 103 125
		f 4 115 140 -142 -140
		mu 0 4 126 127 128 129
		f 4 116 142 -144 -141
		mu 0 4 127 130 131 128
		f 4 117 144 -146 -143
		mu 0 4 130 132 133 131
		f 4 118 146 -148 -145
		mu 0 4 132 134 135 133
		f 4 119 148 -150 -147
		mu 0 4 134 136 137 135
		f 4 120 150 -152 -149
		mu 0 4 136 138 139 137
		f 4 121 152 -154 -151
		mu 0 4 138 140 141 139
		f 4 122 154 -156 -153
		mu 0 4 142 143 144 145
		f 4 123 156 -158 -155
		mu 0 4 143 146 147 144
		f 4 124 158 -160 -157
		mu 0 4 146 148 149 147
		f 4 125 160 -162 -159
		mu 0 4 148 150 151 149
		f 4 126 139 -163 -161
		mu 0 4 150 126 129 151
		f 4 -184 283 -234 284
		mu 0 4 152 153 154 155
		f 4 -185 -285 -230 285
		mu 0 4 156 152 155 157
		f 4 -186 -286 -226 286
		mu 0 4 158 156 157 159
		f 4 -187 -287 -222 287
		mu 0 4 160 158 159 161
		f 4 -188 -288 -218 288
		mu 0 4 162 160 161 163
		f 4 -189 -289 -214 289
		mu 0 4 164 162 163 165
		f 4 -190 -290 -206 290
		mu 0 4 166 164 165 167
		f 4 -191 -291 -209 291
		mu 0 4 168 166 167 169
		f 4 -192 -292 -282 292
		mu 0 4 170 168 169 171
		f 4 -193 -293 -278 293
		mu 0 4 172 170 171 173
		f 4 -194 -294 -274 294
		mu 0 4 174 172 173 175
		f 4 -195 -295 -270 295
		mu 0 4 176 174 175 177
		f 4 -196 -296 -266 296
		mu 0 4 178 176 177 179
		f 4 -197 -297 -262 297
		mu 0 4 180 181 182 183
		f 4 -198 -298 -258 298
		mu 0 4 184 180 183 185
		f 4 -199 -299 -254 299
		mu 0 4 186 184 185 187
		f 4 -200 -300 -250 300
		mu 0 4 188 186 187 189
		f 4 -201 -301 -246 301
		mu 0 4 190 188 189 191
		f 4 -202 -302 -242 302
		mu 0 4 192 190 191 193
		f 4 -203 -303 -238 -284
		mu 0 4 153 192 193 154
		f 4 -210 303 203 204
		mu 0 4 194 195 196 197
		f 4 -208 205 206 -304
		mu 0 4 195 167 165 196
		f 4 -204 304 211 212
		mu 0 4 197 196 198 199
		f 4 -207 213 214 -305
		mu 0 4 196 165 163 198
		f 4 -212 305 215 216
		mu 0 4 199 198 200 201
		f 4 -215 217 218 -306
		mu 0 4 198 163 161 200
		f 4 -216 306 219 220
		mu 0 4 201 200 202 203
		f 4 -219 221 222 -307
		mu 0 4 200 161 159 202
		f 4 -220 307 223 224
		mu 0 4 203 202 204 205
		f 4 -223 225 226 -308
		mu 0 4 202 159 157 204
		f 4 -224 308 227 228
		mu 0 4 205 204 206 207
		f 4 -227 229 230 -309
		mu 0 4 204 157 155 206
		f 4 -228 309 231 232
		mu 0 4 207 206 208 209
		f 4 -231 233 234 -310
		mu 0 4 206 155 154 208
		f 4 -232 310 235 236
		mu 0 4 209 208 210 211
		f 4 -235 237 238 -311
		mu 0 4 208 154 193 210
		f 4 -236 311 239 240
		mu 0 4 211 210 212 213
		f 4 -239 241 242 -312
		mu 0 4 210 193 191 212
		f 4 -240 312 243 244
		mu 0 4 213 212 214 215
		f 4 -243 245 246 -313
		mu 0 4 212 191 189 214
		f 4 -244 313 247 248
		mu 0 4 215 214 216 217
		f 4 -247 249 250 -314
		mu 0 4 214 189 187 216
		f 4 -248 314 251 252
		mu 0 4 217 216 218 219
		f 4 -251 253 254 -315
		mu 0 4 216 187 185 218
		f 4 -252 315 255 256
		mu 0 4 219 218 220 221
		f 4 -255 257 258 -316
		mu 0 4 218 185 183 220
		f 4 -256 316 259 260
		mu 0 4 221 220 222 223
		f 4 -259 261 262 -317
		mu 0 4 220 183 182 222
		f 4 -260 317 263 264
		mu 0 4 224 225 226 227
		f 4 -263 265 266 -318
		mu 0 4 225 179 177 226
		f 4 -264 318 267 268
		mu 0 4 227 226 228 229
		f 4 -267 269 270 -319
		mu 0 4 226 177 175 228
		f 4 -268 319 271 272
		mu 0 4 229 228 230 231
		f 4 -271 273 274 -320
		mu 0 4 228 175 173 230
		f 4 -272 320 275 276
		mu 0 4 231 230 232 233
		f 4 -275 277 278 -321
		mu 0 4 230 173 171 232
		f 4 -276 321 279 280
		mu 0 4 233 232 234 235
		f 4 -279 281 282 -322
		mu 0 4 232 171 169 234
		f 4 207 322 -283 208
		mu 0 4 167 195 234 169
		f 4 209 210 -280 -323
		mu 0 4 195 194 235 234
		f 4 -164 323 325 -325
		mu 0 4 236 237 238 239
		f 4 -165 324 327 -327
		mu 0 4 240 236 239 241
		f 4 -166 326 329 -329
		mu 0 4 242 240 241 243
		f 4 -167 328 331 -331
		mu 0 4 244 242 243 245
		f 4 -168 330 333 -333
		mu 0 4 246 244 245 247
		f 4 -169 332 335 -335
		mu 0 4 248 246 247 249
		f 4 -170 334 337 -337
		mu 0 4 250 248 249 251
		f 4 -171 336 339 -339
		mu 0 4 252 250 251 253
		f 4 -172 338 341 -341
		mu 0 4 254 252 253 255
		f 4 -173 340 343 -343
		mu 0 4 256 254 255 257
		f 4 -174 342 345 -345
		mu 0 4 258 256 257 259
		f 4 -175 344 347 -347
		mu 0 4 260 258 259 261
		f 4 -176 346 349 -349
		mu 0 4 262 260 261 263
		f 4 -177 348 351 -351
		mu 0 4 264 262 263 265
		f 4 -178 350 353 -353
		mu 0 4 266 267 268 269
		f 4 -179 352 355 -355
		mu 0 4 270 266 269 271
		f 4 -180 354 357 -357
		mu 0 4 272 270 271 273
		f 4 -181 356 359 -359
		mu 0 4 274 272 273 275
		f 4 -182 358 361 -361
		mu 0 4 276 274 275 277
		f 4 -183 360 362 -324
		mu 0 4 237 276 277 238
		f 4 -326 363 365 -365
		mu 0 4 278 279 280 281
		f 4 -328 364 367 -367
		mu 0 4 282 278 281 283
		f 4 -330 366 369 -369
		mu 0 4 284 282 283 285
		f 4 -332 368 371 -371
		mu 0 4 286 284 285 287
		f 4 -334 370 373 -373
		mu 0 4 288 286 287 289
		f 4 -336 372 375 -375
		mu 0 4 290 288 289 291
		f 4 -338 374 377 -377
		mu 0 4 292 290 291 293
		f 4 -340 376 379 -379
		mu 0 4 294 292 293 295
		f 4 -342 378 381 -381
		mu 0 4 296 294 295 297
		f 4 -344 380 383 -383
		mu 0 4 298 296 297 299
		f 4 -346 382 385 -385
		mu 0 4 300 298 299 301
		f 4 -348 384 387 -387
		mu 0 4 302 300 301 303
		f 4 -350 386 389 -389
		mu 0 4 304 302 303 305
		f 4 -352 388 391 -391
		mu 0 4 306 304 305 307
		f 4 -354 390 393 -393
		mu 0 4 308 309 310 311
		f 4 -356 392 395 -395
		mu 0 4 312 308 311 313
		f 4 -358 394 397 -397
		mu 0 4 314 312 313 315
		f 4 -360 396 399 -399
		mu 0 4 316 314 315 317
		f 4 -362 398 401 -401
		mu 0 4 318 316 317 319
		f 4 -363 400 402 -364
		mu 0 4 279 318 319 280
		f 4 -404 423 425 -425
		mu 0 4 320 321 322 323
		f 4 -405 424 427 -427
		mu 0 4 324 320 323 325
		f 4 -406 426 429 -429
		mu 0 4 326 324 325 327
		f 4 -407 428 431 -431
		mu 0 4 328 326 327 329
		f 4 -408 430 433 -433
		mu 0 4 330 328 329 331
		f 4 -409 432 435 -435
		mu 0 4 332 330 331 333
		f 4 -410 434 437 -437
		mu 0 4 334 332 333 335
		f 4 -411 436 439 -439
		mu 0 4 336 334 335 337
		f 4 -412 438 441 -441
		mu 0 4 338 336 337 339
		f 4 -413 440 443 -443
		mu 0 4 340 338 339 341
		f 4 -414 442 445 -445
		mu 0 4 342 340 341 343
		f 4 -415 444 447 -447
		mu 0 4 344 342 343 345
		f 4 -416 446 449 -449
		mu 0 4 346 344 345 347
		f 4 -417 448 451 -451
		mu 0 4 348 346 347 349
		f 4 -418 450 453 -453
		mu 0 4 350 351 352 353
		f 4 -419 452 455 -455
		mu 0 4 354 350 353 355
		f 4 -420 454 457 -457
		mu 0 4 356 354 355 357
		f 4 -421 456 459 -459
		mu 0 4 358 356 357 359
		f 4 -422 458 461 -461
		mu 0 4 360 358 359 361
		f 4 -423 460 462 -424
		mu 0 4 321 360 361 322
		f 3 -426 463 -465
		mu 0 3 362 363 364
		f 3 -428 464 -466
		mu 0 3 365 362 364
		f 3 -430 465 -467
		mu 0 3 366 365 364
		f 3 -432 466 -468
		mu 0 3 367 366 364
		f 3 -434 467 -469
		mu 0 3 368 367 364
		f 3 -436 468 -470
		mu 0 3 369 368 364
		f 3 -438 469 -471
		mu 0 3 370 369 364
		f 3 -440 470 -472
		mu 0 3 371 370 364
		f 3 -442 471 -473
		mu 0 3 372 371 364
		f 3 -444 472 -474
		mu 0 3 373 372 364
		f 3 -446 473 -475
		mu 0 3 374 373 364
		f 3 -448 474 -476
		mu 0 3 375 374 364
		f 3 -450 475 -477
		mu 0 3 376 375 364
		f 3 -452 476 -478
		mu 0 3 377 376 364
		f 3 -454 477 -479
		mu 0 3 378 377 364
		f 3 -456 478 -480
		mu 0 3 379 378 364
		f 3 -458 479 -481
		mu 0 3 380 379 364
		f 3 -460 480 -482
		mu 0 3 381 380 364
		f 3 -462 481 -483
		mu 0 3 382 381 364
		f 3 -463 482 -464
		mu 0 3 363 382 364
		f 4 164 484 188 -484
		mu 0 4 236 240 162 164
		f 4 513 515 517 -519
		mu 0 4 383 384 385 386
		f 4 520 522 523 -516
		mu 0 4 384 387 388 385
		f 4 525 527 528 -523
		mu 0 4 387 389 390 388
		f 4 530 532 533 -528
		mu 0 4 389 391 392 390
		f 4 169 486 183 -486
		mu 0 4 248 250 153 152
		f 4 536 538 540 -542
		mu 0 4 393 394 395 396
		f 4 543 545 546 -539
		mu 0 4 394 397 398 395
		f 4 548 550 551 -546
		mu 0 4 397 399 400 398
		f 4 553 555 556 -551
		mu 0 4 399 401 402 400
		f 4 174 488 198 -488
		mu 0 4 258 260 184 186
		f 4 559 561 563 -565
		mu 0 4 403 404 405 406
		f 4 566 568 569 -562
		mu 0 4 404 407 408 405
		f 4 571 573 574 -569
		mu 0 4 409 410 411 412
		f 4 576 578 579 -574
		mu 0 4 410 413 414 411
		f 4 179 490 193 -490
		mu 0 4 270 272 172 174
		f 4 582 584 586 -588
		mu 0 4 415 416 417 418
		f 4 589 591 592 -585
		mu 0 4 416 419 420 417
		f 4 594 596 597 -592
		mu 0 4 419 421 422 420
		f 4 599 601 602 -597
		mu 0 4 421 423 424 422
		f 4 -366 492 403 -492
		mu 0 4 425 426 427 428
		f 4 -403 493 422 -493
		mu 0 4 426 429 430 427
		f 4 -402 494 421 -494
		mu 0 4 429 431 432 430
		f 4 -400 495 420 -495
		mu 0 4 431 433 434 432
		f 4 -398 496 419 -496
		mu 0 4 433 435 436 434
		f 4 -396 497 418 -497
		mu 0 4 435 437 438 436
		f 4 -394 498 417 -498
		mu 0 4 437 439 440 438
		f 4 -392 499 416 -499
		mu 0 4 441 442 443 444
		f 4 -390 500 415 -500
		mu 0 4 442 445 446 443
		f 4 -388 501 414 -501
		mu 0 4 445 447 448 446
		f 4 -386 502 413 -502
		mu 0 4 447 449 450 448
		f 4 -384 503 412 -503
		mu 0 4 449 451 452 450
		f 4 -382 504 411 -504
		mu 0 4 451 453 454 452
		f 4 -380 505 410 -505
		mu 0 4 453 455 456 454
		f 4 -378 506 409 -506
		mu 0 4 455 457 458 456
		f 4 -376 507 408 -507
		mu 0 4 457 459 460 458
		f 4 -374 508 407 -508
		mu 0 4 459 461 462 460
		f 4 -372 509 406 -509
		mu 0 4 461 463 464 462
		f 4 -370 510 405 -510
		mu 0 4 463 465 466 464
		f 4 -368 491 404 -511
		mu 0 4 465 425 428 466
		f 4 165 512 -514 -512
		mu 0 4 467 468 384 383
		f 4 187 516 -518 -515
		mu 0 4 469 470 386 385
		f 4 -485 511 518 -517
		mu 0 4 470 467 383 386
		f 4 166 519 -521 -513
		mu 0 4 468 471 387 384
		f 4 186 514 -524 -522
		mu 0 4 472 469 385 388
		f 4 167 524 -526 -520
		mu 0 4 471 473 389 387
		f 4 185 521 -529 -527
		mu 0 4 474 472 388 390
		f 4 168 529 -531 -525
		mu 0 4 473 475 391 389
		f 4 485 531 -533 -530
		mu 0 4 475 476 392 391
		f 4 184 526 -534 -532
		mu 0 4 476 474 390 392
		f 4 170 535 -537 -535
		mu 0 4 477 478 394 393
		f 4 202 539 -541 -538
		mu 0 4 479 480 396 395
		f 4 -487 534 541 -540
		mu 0 4 480 477 393 396
		f 4 171 542 -544 -536
		mu 0 4 478 481 397 394
		f 4 201 537 -547 -545
		mu 0 4 482 479 395 398
		f 4 172 547 -549 -543
		mu 0 4 481 483 399 397
		f 4 200 544 -552 -550
		mu 0 4 484 482 398 400
		f 4 173 552 -554 -548
		mu 0 4 483 485 401 399
		f 4 487 554 -556 -553
		mu 0 4 485 486 402 401
		f 4 199 549 -557 -555
		mu 0 4 486 484 400 402
		f 4 175 558 -560 -558
		mu 0 4 487 488 404 403
		f 4 197 562 -564 -561
		mu 0 4 489 490 406 405
		f 4 -489 557 564 -563
		mu 0 4 490 487 403 406
		f 4 176 565 -567 -559
		mu 0 4 488 491 407 404
		f 4 196 560 -570 -568
		mu 0 4 492 489 405 408
		f 4 177 570 -572 -566
		mu 0 4 493 494 410 409
		f 4 195 567 -575 -573
		mu 0 4 495 496 412 411
		f 4 178 575 -577 -571
		mu 0 4 494 497 413 410
		f 4 489 577 -579 -576
		mu 0 4 497 498 414 413
		f 4 194 572 -580 -578
		mu 0 4 498 495 411 414
		f 4 180 581 -583 -581
		mu 0 4 499 500 416 415
		f 4 192 585 -587 -584
		mu 0 4 501 502 418 417
		f 4 -491 580 587 -586
		mu 0 4 502 499 415 418
		f 4 181 588 -590 -582
		mu 0 4 500 503 419 416
		f 4 191 583 -593 -591
		mu 0 4 504 501 417 420
		f 4 182 593 -595 -589
		mu 0 4 503 505 421 419
		f 4 190 590 -598 -596
		mu 0 4 506 504 420 422
		f 4 163 598 -600 -594
		mu 0 4 505 507 423 421
		f 4 483 600 -602 -599
		mu 0 4 507 508 424 423
		f 4 189 595 -603 -601
		mu 0 4 508 506 422 424
		f 4 603 628 -616 -628
		mu 0 4 509 510 511 512
		f 4 604 629 -617 -629
		mu 0 4 510 513 514 511
		f 4 605 630 -618 -630
		mu 0 4 513 515 516 514
		f 4 606 631 -619 -631
		mu 0 4 515 517 518 516
		f 4 607 632 -620 -632
		mu 0 4 517 519 520 518
		f 4 608 633 -621 -633
		mu 0 4 519 521 522 520
		f 4 609 634 -622 -634
		mu 0 4 521 523 524 522
		f 4 610 635 -623 -635
		mu 0 4 525 526 527 528
		f 4 611 636 -624 -636
		mu 0 4 526 529 530 527
		f 4 612 637 -625 -637
		mu 0 4 529 531 532 530
		f 4 613 638 -626 -638
		mu 0 4 531 533 534 532
		f 4 614 627 -627 -639
		mu 0 4 533 509 512 534
		f 4 -604 639 641 -641
		mu 0 4 535 536 537 538
		f 4 -605 640 643 -643
		mu 0 4 539 535 538 540
		f 4 -606 642 645 -645
		mu 0 4 541 539 540 542
		f 4 -607 644 647 -647
		mu 0 4 543 541 542 544
		f 4 -608 646 649 -649
		mu 0 4 545 543 544 546
		f 4 -609 648 651 -651
		mu 0 4 547 545 546 548
		f 4 -610 650 653 -653
		mu 0 4 549 547 548 550
		f 4 -611 652 655 -655
		mu 0 4 551 549 550 552
		f 4 -612 654 657 -657
		mu 0 4 553 554 555 556
		f 4 -613 656 659 -659
		mu 0 4 557 553 556 558
		f 4 -614 658 661 -661
		mu 0 4 559 557 558 560
		f 4 -615 660 662 -640
		mu 0 4 536 559 560 537
		f 4 615 664 -666 -664
		mu 0 4 561 562 563 564
		f 4 616 666 -668 -665
		mu 0 4 562 565 566 563
		f 4 617 668 -670 -667
		mu 0 4 565 567 568 566
		f 4 618 670 -672 -669
		mu 0 4 567 569 570 568
		f 4 619 672 -674 -671
		mu 0 4 569 571 572 570
		f 4 620 674 -676 -673
		mu 0 4 571 573 574 572
		f 4 621 676 -678 -675
		mu 0 4 573 575 576 574
		f 4 622 678 -680 -677
		mu 0 4 575 577 578 576
		f 4 623 680 -682 -679
		mu 0 4 579 580 581 582
		f 4 624 682 -684 -681
		mu 0 4 580 583 584 581
		f 4 625 684 -686 -683
		mu 0 4 583 585 586 584
		f 4 626 663 -687 -685
		mu 0 4 585 561 564 586
		f 4 -704 -688 721 688
		mu 0 4 587 588 589 590
		f 4 -705 -689 720 689
		mu 0 4 591 587 590 592
		f 4 -706 -690 719 690
		mu 0 4 593 591 592 594
		f 4 -707 -691 722 691
		mu 0 4 595 593 594 596
		f 4 -708 -692 723 692
		mu 0 4 597 595 596 598
		f 4 -709 -693 724 693
		mu 0 4 599 597 598 600
		f 4 -710 -694 725 694
		mu 0 4 601 599 600 602
		f 4 -711 -695 726 695
		mu 0 4 603 601 602 604
		f 4 -712 -696 727 696
		mu 0 4 605 603 604 606
		f 4 -713 -697 728 697
		mu 0 4 607 605 606 608
		f 4 -714 -698 729 698
		mu 0 4 609 607 608 610
		f 4 -715 -699 730 699
		mu 0 4 611 612 613 614
		f 4 -716 -700 731 700
		mu 0 4 615 611 614 616
		f 4 -717 -701 732 701
		mu 0 4 617 615 616 618
		f 4 -718 -702 733 702
		mu 0 4 619 617 618 620
		f 4 -719 -703 734 687
		mu 0 4 588 619 620 589
		f 4 703 736 -738 -736
		mu 0 4 621 622 623 624
		f 4 704 738 -740 -737
		mu 0 4 622 625 626 623
		f 4 705 740 -742 -739
		mu 0 4 625 627 628 626
		f 4 706 742 -744 -741
		mu 0 4 627 629 630 628
		f 4 707 744 -746 -743
		mu 0 4 629 631 632 630
		f 4 708 746 -748 -745
		mu 0 4 631 633 634 632
		f 4 709 748 -750 -747
		mu 0 4 633 635 636 634
		f 4 710 750 -752 -749
		mu 0 4 635 637 638 636
		f 4 711 752 -754 -751
		mu 0 4 637 639 640 638
		f 4 712 754 -756 -753
		mu 0 4 639 641 642 640
		f 4 713 756 -758 -755
		mu 0 4 641 643 644 642
		f 4 714 758 -760 -757
		mu 0 4 643 645 646 644
		f 4 715 760 -762 -759
		mu 0 4 647 648 649 650
		f 4 716 762 -764 -761
		mu 0 4 648 651 652 649
		f 4 717 764 -766 -763
		mu 0 4 651 653 654 652
		f 4 718 735 -767 -765
		mu 0 4 653 621 624 654
		f 4 737 768 -770 -768
		mu 0 4 655 656 657 658
		f 4 739 770 -772 -769
		mu 0 4 656 659 660 657
		f 4 741 772 -774 -771
		mu 0 4 659 661 662 660
		f 4 743 774 -776 -773
		mu 0 4 661 663 664 662
		f 4 745 776 -778 -775
		mu 0 4 663 665 666 664
		f 4 747 778 -780 -777
		mu 0 4 665 667 668 666
		f 4 749 780 -782 -779
		mu 0 4 667 669 670 668
		f 4 751 782 -784 -781
		mu 0 4 669 671 672 670
		f 4 753 784 -786 -783
		mu 0 4 671 673 674 672
		f 4 755 786 -788 -785
		mu 0 4 673 675 676 674
		f 4 757 788 -790 -787
		mu 0 4 675 677 678 676
		f 4 759 790 -792 -789
		mu 0 4 679 680 681 682
		f 4 761 792 -794 -791
		mu 0 4 680 683 684 681
		f 4 763 794 -796 -793
		mu 0 4 683 685 686 684
		f 4 765 796 -798 -795
		mu 0 4 685 687 688 686
		f 4 766 767 -799 -797
		mu 0 4 687 655 658 688
		f 4 -722 799 801 -801
		mu 0 4 689 690 691 692
		f 4 -721 800 803 -803
		mu 0 4 693 689 692 694
		f 4 -720 802 805 -805
		mu 0 4 695 693 694 696
		f 4 -723 804 807 -807
		mu 0 4 697 695 696 698
		f 4 -724 806 809 -809
		mu 0 4 699 697 698 700
		f 4 -725 808 811 -811
		mu 0 4 701 699 700 702
		f 4 -726 810 813 -813
		mu 0 4 703 701 702 704
		f 4 -727 812 815 -815
		mu 0 4 705 703 704 706
		f 4 -728 814 817 -817
		mu 0 4 707 705 706 708
		f 4 -729 816 819 -819
		mu 0 4 709 707 708 710
		f 4 -730 818 821 -821
		mu 0 4 711 709 710 712
		f 4 -731 820 823 -823
		mu 0 4 713 714 715 716
		f 4 -732 822 825 -825
		mu 0 4 717 713 716 718
		f 4 -733 824 827 -827
		mu 0 4 719 717 718 720
		f 4 -734 826 829 -829
		mu 0 4 721 719 720 722
		f 4 -735 828 830 -800
		mu 0 4 690 721 722 691
		f 4 -802 831 833 -833
		mu 0 4 723 724 725 726
		f 4 -804 832 835 -835
		mu 0 4 727 723 726 728
		f 4 -806 834 837 -837
		mu 0 4 729 727 728 730
		f 4 -808 836 839 -839
		mu 0 4 731 729 730 732
		f 4 -810 838 841 -841
		mu 0 4 733 731 732 734
		f 4 -812 840 843 -843
		mu 0 4 735 733 734 736
		f 4 -814 842 845 -845
		mu 0 4 737 735 736 738
		f 4 -816 844 847 -847
		mu 0 4 739 737 738 740
		f 4 -818 846 849 -849
		mu 0 4 741 739 740 742
		f 4 -820 848 851 -851
		mu 0 4 743 741 742 744
		f 4 -822 850 853 -853
		mu 0 4 745 743 744 746
		f 4 -824 852 855 -855
		mu 0 4 747 748 749 750
		f 4 -826 854 857 -857
		mu 0 4 751 747 750 752
		f 4 -828 856 859 -859
		mu 0 4 753 751 752 754
		f 4 -830 858 861 -861
		mu 0 4 755 753 754 756
		f 4 -831 860 862 -832
		mu 0 4 724 755 756 725
		f 4 889 -891 896 891
		mu 0 4 757 758 759 760
		f 4 897 892 888 -892
		mu 0 4 760 761 762 757
		f 4 899 894 887 -894
		mu 0 4 763 764 765 766
		f 4 900 895 886 -895
		mu 0 4 764 767 768 765
		f 4 913 -896 912 909
		mu 0 4 769 768 767 770
		f 4 -879 1074 1104 -1076
		mu 0 4 771 772 773 774
		f 4 -876 1075 1101 -1077
		mu 0 4 775 771 774 776
		f 4 -949 1076 1174 -1078
		mu 0 4 777 775 776 778
		f 4 -917 1078 1142 -1080
		mu 0 4 779 780 781 782
		f 4 -877 1079 1102 -1081
		mu 0 4 783 779 782 784
		f 4 -878 1080 1103 -1082
		mu 0 4 785 783 784 786
		f 4 -912 1081 1137 -1083
		mu 0 4 787 785 786 788
		f 4 -904 1082 1129 -1075
		mu 0 4 772 787 788 773
		f 4 967 937 932 -907
		mu 0 4 789 790 791 792
		f 3 968 930 929
		mu 0 3 789 793 794
		f 4 -887 881 927 -883
		mu 0 4 795 796 797 798
		f 4 -888 882 928 -884
		mu 0 4 799 795 798 800
		f 4 969 939 926 -920
		mu 0 4 801 802 800 803
		f 4 950 952 953 946
		mu 0 4 804 805 806 807
		f 4 936 934 -864 -934
		mu 0 4 808 809 810 811
		f 4 -933 935 933 -880
		mu 0 4 792 791 808 811
		f 4 -897 -867 878 867
		mu 0 4 760 759 812 813
		f 4 875 868 -898 -868
		mu 0 4 813 814 761 760
		f 5 948 869 -947 -942 -869
		mu 0 5 814 815 816 817 761
		f 5 -899 -871 916 871 -918
		mu 0 5 818 819 820 821 763
		f 4 876 872 -900 -872
		mu 0 4 821 822 764 763
		f 4 877 873 -901 -873
		mu 0 4 822 823 767 764
		f 5 -913 -874 911 874 -909
		mu 0 5 770 767 823 824 825
		f 5 -902 -875 903 866 -905
		mu 0 5 826 825 824 812 759
		f 4 902 -906 904 890
		mu 0 4 758 827 826 759
		f 4 915 -919 917 893
		mu 0 4 766 828 818 763
		f 4 898 957 -959 -956
		mu 0 4 829 830 831 832
		f 4 -928 924 -866 -926
		mu 0 4 798 797 833 834
		f 4 -929 925 -865 -927
		mu 0 4 800 798 834 803
		f 4 -962 -963 908 963
		mu 0 4 835 836 837 838
		f 4 901 965 -967 -964
		mu 0 4 838 839 840 835
		f 4 -936 -881 -890 885
		mu 0 4 808 791 841 842
		f 4 -889 884 -937 -886
		mu 0 4 842 843 809 808
		f 3 -941 921 970
		mu 0 3 844 845 846
		f 4 -938 -908 -903 880
		mu 0 4 791 790 847 841
		f 4 -939 -882 -914 910
		mu 0 4 793 797 796 848
		f 4 -940 -921 -916 883
		mu 0 4 800 802 849 799
		f 4 -945 -946 943 -885
		mu 0 4 843 850 844 809
		f 4 941 -948 944 -893
		mu 0 4 761 817 851 762
		f 4 940 951 -953 -950
		mu 0 4 852 853 854 855
		f 4 945 947 -954 -952
		mu 0 4 856 857 858 859
		f 4 920 956 -958 918
		mu 0 4 860 861 862 863
		f 4 -924 954 958 -957
		mu 0 4 864 865 866 867
		f 4 -931 959 961 -961
		mu 0 4 868 869 870 871
		f 4 -911 -910 962 -960
		mu 0 4 872 873 874 875
		f 4 907 964 -966 905
		mu 0 4 876 877 878 879
		f 4 -932 960 966 -965
		mu 0 4 880 868 871 881
		f 3 -930 931 -968
		mu 0 3 789 794 790
		f 4 -915 -925 938 -969
		mu 0 4 789 833 797 793
		f 3 -923 923 -970
		mu 0 3 801 882 802
		f 4 -971 -943 -935 -944
		mu 0 4 844 846 810 809
		f 4 -998 -1003 996 -996
		mu 0 4 883 884 885 886
		f 4 997 -995 -999 -1004
		mu 0 4 884 883 887 888
		f 4 999 -994 -1001 -1006
		mu 0 4 889 890 891 892
		f 4 1000 -993 -1002 -1007
		mu 0 4 892 891 893 894
		f 4 -1016 -1019 1001 -1020
		mu 0 4 895 896 894 893
		f 4 1012 -1037 -1042 -1068
		mu 0 4 897 898 899 900
		f 3 -1034 -1035 -1069
		mu 0 3 897 901 902
		f 4 988 -1032 -988 992
		mu 0 4 903 904 905 906
		f 4 989 -1033 -989 993
		mu 0 4 907 908 904 903
		f 4 1025 -1031 -1044 -1070
		mu 0 4 801 909 910 911
		f 4 -1051 -1056 -1055 -951
		mu 0 4 804 912 913 805
		f 4 1037 971 -1039 -1041
		mu 0 4 914 915 916 917
		f 4 985 -1038 -1040 1036
		mu 0 4 898 915 914 899
		f 4 -976 -985 974 1002
		mu 0 4 884 918 919 885
		f 4 975 1003 -977 -982
		mu 0 4 918 884 888 920
		f 5 976 1045 1050 -870 -1053
		mu 0 5 920 888 921 816 815
		f 5 1023 -978 -1023 870 1004
		mu 0 5 922 923 924 820 819
		f 4 977 1005 -979 -983
		mu 0 4 925 889 892 926
		f 4 978 1006 -980 -984
		mu 0 4 926 892 894 927
		f 5 1014 -981 -1018 979 1018
		mu 0 5 896 928 929 927 894
		f 5 1010 -975 -1010 980 1007
		mu 0 5 930 885 919 929 928
		f 4 -997 -1011 1011 -1009
		mu 0 4 886 885 930 931
		f 4 -1000 -1024 1024 -1022
		mu 0 4 932 923 922 933
		f 4 955 1058 -1058 -1005
		mu 0 4 829 832 934 935
		f 4 1029 973 -1029 1031
		mu 0 4 904 936 937 905
		f 4 1030 972 -1030 1032
		mu 0 4 908 938 936 904
		f 4 -1064 -1015 1062 1061
		mu 0 4 939 940 941 942
		f 4 1063 1066 -1066 -1008
		mu 0 4 940 939 943 944
		f 4 -992 995 986 1039
		mu 0 4 914 945 946 899
		f 4 991 1040 -991 994
		mu 0 4 945 914 917 947
		f 3 -1071 -922 1044
		mu 0 3 948 846 845
		f 4 -987 1008 1013 1041
		mu 0 4 899 946 949 900
		f 4 -1017 1019 987 1042
		mu 0 4 902 950 906 905
		f 4 -990 1021 1026 1043
		mu 0 4 910 951 952 911
		f 4 990 -1048 1049 1048
		mu 0 4 947 917 948 953;
	setAttr ".fc[500:846]"
		f 4 998 -1049 1051 -1046
		mu 0 4 888 887 954 921
		f 4 949 1054 -1054 -1045
		mu 0 4 852 855 955 956
		f 4 1053 1055 -1052 -1050
		mu 0 4 957 958 959 960
		f 4 -1025 1057 -1057 -1027
		mu 0 4 961 962 963 964
		f 4 1056 -1059 -955 1027
		mu 0 4 965 966 866 865
		f 4 1060 -1062 -1060 1034
		mu 0 4 967 968 969 970
		f 4 1059 -1063 1015 1016
		mu 0 4 971 972 973 974
		f 4 -1012 1065 -1065 -1014
		mu 0 4 975 976 977 978
		f 4 1064 -1067 -1061 1035
		mu 0 4 979 980 968 967
		f 3 1067 -1036 1033
		mu 0 3 897 900 901
		f 4 1068 -1043 1028 1020
		mu 0 4 897 902 905 937
		f 3 1069 -1028 922
		mu 0 3 801 911 882
		f 4 1047 1038 1046 1070
		mu 0 4 948 917 916 846
		f 4 -1118 -1123 1116 -1116
		mu 0 4 981 982 983 984
		f 4 1117 -1115 -1119 -1124
		mu 0 4 982 981 985 986
		f 4 1119 -1114 -1121 -1126
		mu 0 4 987 988 989 990
		f 4 1120 -1113 -1122 -1127
		mu 0 4 990 989 991 992
		f 4 -1136 -1139 1121 -1140
		mu 0 4 993 994 992 991
		f 3 1083 -1085 -1106
		mu 0 3 995 996 997
		f 3 1084 -1086 -1072
		mu 0 3 997 996 998
		f 3 1085 -1087 -1169
		mu 0 3 998 996 999
		f 3 1087 -1089 -1146
		mu 0 3 1000 996 1001
		f 3 1088 -1090 -1073
		mu 0 3 1001 996 1002
		f 3 1089 -1091 -1074
		mu 0 3 1002 996 1003
		f 3 1090 -1092 -1141
		mu 0 3 1003 996 1004
		f 3 1091 -1084 -1133
		mu 0 3 1004 996 995
		f 4 1132 -1159 -1164 -1194
		mu 0 4 1005 1006 1007 1008
		f 3 -1156 -1157 -1195
		mu 0 3 1005 1009 1010
		f 4 1108 -1154 -1108 1112
		mu 0 4 1011 1012 1013 1014
		f 4 1109 -1155 -1109 1113
		mu 0 4 1015 1016 1012 1011
		f 4 1145 -1153 -1166 -1196
		mu 0 4 1017 1018 1016 1019
		f 4 -1173 -1180 -1179 -1177
		mu 0 4 1020 1021 1022 1023
		f 4 1159 1071 -1161 -1163
		mu 0 4 1024 1025 1026 1027
		f 4 1105 -1160 -1162 1158
		mu 0 4 1006 1025 1024 1007
		f 4 -1094 -1105 1092 1122
		mu 0 4 982 1028 1029 983
		f 4 1093 1123 -1095 -1102
		mu 0 4 1028 982 986 1030
		f 5 1094 1167 1172 -1096 -1175
		mu 0 5 1030 986 1031 1032 1033
		f 5 1143 -1098 -1143 1096 1124
		mu 0 5 1034 987 1035 1036 1037
		f 4 1097 1125 -1099 -1103
		mu 0 4 1035 987 990 1038
		f 4 1098 1126 -1100 -1104
		mu 0 4 1038 990 992 1039
		f 5 1134 -1101 -1138 1099 1138
		mu 0 5 994 1040 1041 1039 992
		f 5 1130 -1093 -1130 1100 1127
		mu 0 5 1042 983 1029 1041 1040
		f 4 -1117 -1131 1131 -1129
		mu 0 4 984 983 1042 1043
		f 4 -1120 -1144 1144 -1142
		mu 0 4 988 987 1034 1044
		f 4 1181 1184 -1184 -1125
		mu 0 4 1045 1046 1047 1048
		f 4 1151 1073 -1151 1153
		mu 0 4 1012 1049 1050 1013
		f 4 1152 1072 -1152 1154
		mu 0 4 1016 1018 1049 1012
		f 4 -1190 -1135 1188 1187
		mu 0 4 1051 1052 1053 1054
		f 4 1189 1192 -1192 -1128
		mu 0 4 1052 1051 1055 1056
		f 4 -1112 1115 1106 1161
		mu 0 4 1024 1057 1058 1007
		f 4 1111 1162 -1111 1114
		mu 0 4 1057 1024 1027 1059
		f 3 -1197 -1148 1166
		mu 0 3 1060 1061 1062
		f 4 -1107 1128 1133 1163
		mu 0 4 1007 1058 1063 1008
		f 4 -1137 1139 1107 1164
		mu 0 4 1010 1064 1014 1013
		f 4 -1110 1141 1146 1165
		mu 0 4 1016 1015 1065 1019
		f 4 1110 -1170 1171 1170
		mu 0 4 1059 1027 1060 1066
		f 4 1118 -1171 1173 -1168
		mu 0 4 986 985 1067 1031
		f 4 1175 1178 -1178 -1167
		mu 0 4 1068 1069 1070 1071
		f 4 1177 1179 -1174 -1172
		mu 0 4 1072 1073 1074 1075
		f 4 -1145 1183 -1183 -1147
		mu 0 4 1076 1077 1078 1079
		f 4 1182 -1185 -1181 1149
		mu 0 4 1080 1081 1082 1083
		f 4 1186 -1188 -1186 1156
		mu 0 4 1084 1085 1086 1087
		f 4 1185 -1189 1135 1136
		mu 0 4 1088 1089 1090 1091
		f 4 -1132 1191 -1191 -1134
		mu 0 4 1092 1093 1094 1095
		f 4 1190 -1193 -1187 1157
		mu 0 4 1096 1097 1085 1084
		f 3 1193 -1158 1155
		mu 0 3 1005 1008 1009
		f 4 1194 -1165 1150 1140
		mu 0 4 1005 1010 1013 1050
		f 3 1195 -1150 1148
		mu 0 3 1017 1019 1098
		f 4 1169 1160 1168 1196
		mu 0 4 1060 1027 1026 1061
		f 4 1235 -1237 1242 1237
		mu 0 4 1099 1100 1101 1102
		f 4 1243 1238 1234 -1238
		mu 0 4 1102 1103 1104 1099
		f 4 1245 1240 1233 -1240
		mu 0 4 1105 1106 1107 1108
		f 4 1246 1241 1232 -1241
		mu 0 4 1106 1109 1110 1107
		f 4 1259 -1242 1258 1255
		mu 0 4 1111 1110 1109 1112
		f 3 1225 1208 -1208
		mu 0 3 1113 1114 996
		f 3 1197 1209 -1209
		mu 0 3 1114 1115 996
		f 3 1286 1086 -1210
		mu 0 3 1115 999 996
		f 3 1265 1210 -1088
		mu 0 3 1000 1116 996
		f 3 1198 1211 -1211
		mu 0 3 1116 1117 996
		f 3 1199 1212 -1212
		mu 0 3 1117 1118 996
		f 3 1260 1213 -1213
		mu 0 3 1118 1119 996
		f 3 1252 1207 -1214
		mu 0 3 1119 1113 996
		f 4 1201 -1225 -1201 984
		mu 0 4 1120 1121 1122 1123
		f 4 1202 -1222 -1202 981
		mu 0 4 1124 1125 1121 1120
		f 4 1077 -1293 -1203 1052
		mu 0 4 777 778 1125 1124
		f 4 1203 -1263 -1079 1022
		mu 0 4 1126 1127 781 780
		f 4 1204 -1223 -1204 982
		mu 0 4 1128 1129 1130 1131
		f 4 1205 -1224 -1205 983
		mu 0 4 1132 1133 1129 1128
		f 4 1206 -1258 -1206 1017
		mu 0 4 1134 1135 1133 1132
		f 4 1200 -1250 -1207 1009
		mu 0 4 1123 1122 1135 1134
		f 4 1307 1281 1276 -1253
		mu 0 4 1136 1137 1138 1139
		f 3 1308 1274 1273
		mu 0 3 1136 1140 1141
		f 4 -1233 1227 1271 -1229
		mu 0 4 1142 1143 1144 1145
		f 4 -1234 1228 1272 -1230
		mu 0 4 1146 1142 1145 1147
		f 4 1309 1283 1270 -1266
		mu 0 4 1017 1148 1149 1150
		f 4 1176 1294 1295 1290
		mu 0 4 1020 1023 1151 1152
		f 4 1280 1278 -1198 -1278
		mu 0 4 1153 1154 1155 1156
		f 4 -1277 1279 1277 -1226
		mu 0 4 1139 1138 1153 1156
		f 4 -1243 -1215 1224 1215
		mu 0 4 1102 1101 1157 1158
		f 4 1221 1216 -1244 -1216
		mu 0 4 1158 1159 1103 1102
		f 5 1292 1095 -1291 -1286 -1217
		mu 0 5 1159 1033 1032 1160 1103
		f 5 -1245 -1097 1262 1217 -1264
		mu 0 5 1161 1037 1036 1162 1163
		f 4 1222 1218 -1246 -1218
		mu 0 4 1164 1165 1106 1105
		f 4 1223 1219 -1247 -1219
		mu 0 4 1165 1166 1109 1106
		f 5 -1259 -1220 1257 1220 -1255
		mu 0 5 1112 1109 1166 1167 1168
		f 5 -1248 -1221 1249 1214 -1251
		mu 0 5 1169 1168 1167 1157 1101
		f 4 1248 -1252 1250 1236
		mu 0 4 1100 1170 1169 1101
		f 4 1261 -1265 1263 1239
		mu 0 4 1171 1172 1161 1163
		f 4 1244 1297 -1299 -1182
		mu 0 4 1045 1173 1174 1046
		f 4 -1272 1268 -1200 -1270
		mu 0 4 1145 1144 1175 1176
		f 4 -1273 1269 -1199 -1271
		mu 0 4 1147 1145 1176 1177
		f 4 -1302 -1303 1254 1303
		mu 0 4 1178 1179 1180 1181
		f 4 1247 1305 -1307 -1304
		mu 0 4 1181 1182 1183 1178
		f 4 -1280 -1227 -1236 1231
		mu 0 4 1153 1138 1184 1185
		f 4 -1235 1230 -1281 -1232
		mu 0 4 1185 1186 1154 1153
		f 3 -1285 1147 1310
		mu 0 3 1187 1062 1061
		f 4 -1282 -1254 -1249 1226
		mu 0 4 1138 1137 1188 1184
		f 4 -1283 -1228 -1260 1256
		mu 0 4 1140 1144 1143 1189
		f 4 -1284 -1267 -1262 1229
		mu 0 4 1149 1148 1190 1191
		f 4 -1289 -1290 1287 -1231
		mu 0 4 1186 1192 1187 1154
		f 4 1285 -1292 1288 -1239
		mu 0 4 1103 1160 1193 1104
		f 4 1284 1293 -1295 -1176
		mu 0 4 1068 1194 1195 1069
		f 4 1289 1291 -1296 -1294
		mu 0 4 1196 1197 1198 1199
		f 4 1266 1296 -1298 1264
		mu 0 4 1200 1201 1202 1203
		f 4 -1268 1180 1298 -1297
		mu 0 4 1204 1083 1082 1205
		f 4 -1275 1299 1301 -1301
		mu 0 4 1206 1207 1208 1209
		f 4 -1257 -1256 1302 -1300
		mu 0 4 1210 1211 1212 1213
		f 4 1253 1304 -1306 1251
		mu 0 4 1214 1215 1216 1217
		f 4 -1276 1300 1306 -1305
		mu 0 4 1218 1206 1209 1219
		f 3 -1274 1275 -1308
		mu 0 3 1136 1141 1137
		f 4 -1261 -1269 1282 -1309
		mu 0 4 1136 1175 1144 1140
		f 3 -1149 1267 -1310
		mu 0 3 1017 1098 1148
		f 4 -1311 -1287 -1279 -1288
		mu 0 4 1187 1061 1155 1154
		f 4 863 1312 -1314 -1312
		mu 0 4 1220 1221 1222 1223
		f 4 864 1315 -1317 -1315
		mu 0 4 1224 1225 1226 1227
		f 4 865 1317 -1319 -1316
		mu 0 4 1225 1228 1229 1226
		f 4 879 1311 -1321 -1320
		mu 0 4 1230 1220 1223 1231
		f 4 906 1319 -1323 -1322
		mu 0 4 1232 1230 1231 1233
		f 4 914 1321 -1324 -1318
		mu 0 4 1228 1232 1233 1229
		f 4 919 1314 -1326 -1325
		mu 0 4 1234 1224 1227 1235
		f 4 942 1326 -1328 -1313
		mu 0 4 1221 1236 1237 1222
		f 4 -972 1328 1330 -1330
		mu 0 4 1238 1239 1240 1241
		f 4 -973 1331 1333 -1333
		mu 0 4 1242 1243 1244 1245
		f 4 -974 1332 1335 -1335
		mu 0 4 1246 1242 1245 1247
		f 4 -986 1336 1337 -1329
		mu 0 4 1239 1248 1249 1240
		f 4 -1013 1338 1339 -1337
		mu 0 4 1248 1250 1251 1249
		f 4 -1021 1334 1340 -1339
		mu 0 4 1250 1246 1247 1251
		f 4 -1026 1324 1341 -1332
		mu 0 4 1252 1234 1235 1253
		f 4 -1047 1329 1342 -1327
		mu 0 4 1236 1238 1241 1237
		f 4 1379 1371 1382 -1371
		mu 0 4 1254 1255 1256 1257
		f 4 1350 1347 1411 -1347
		mu 0 4 1258 1259 1260 1261
		f 4 1415 1414 -1344 -1414
		mu 0 4 1262 1263 1264 1265
		f 4 1409 1406 1352 -1406
		mu 0 4 1266 1267 1268 1269
		f 4 1351 -1407 1410 -1348
		mu 0 4 1270 1271 1272 1273
		f 4 1412 1405 1353 1346
		mu 0 4 1274 1275 1276 1277
		f 4 1358 1355 -1351 -1355
		mu 0 4 1278 1279 1259 1258
		f 4 1359 -1349 -1352 -1356
		mu 0 4 1280 1281 1271 1270
		f 4 -1353 1348 1360 -1350
		mu 0 4 1269 1268 1282 1283
		f 4 -1354 1349 1361 1354
		mu 0 4 1277 1276 1284 1285
		f 4 -1405 1403 -1359 -1402
		mu 0 4 1286 1287 1279 1278
		f 4 -1361 1356 1364 -1358
		mu 0 4 1283 1282 1288 1289
		f 4 -1362 1357 1365 1401
		mu 0 4 1285 1284 1290 1291
		f 4 1383 1376 1404 -1373
		mu 0 4 1292 1293 1294 1295
		f 4 -1365 1362 1368 -1364
		mu 0 4 1289 1288 1296 1297
		f 4 -1369 1366 1380 -1368
		mu 0 4 1298 1299 1300 1301
		f 5 -1378 1375 -1363 -1403 -1377
		mu 0 5 1302 1303 1304 1305 1306
		f 4 1384 1385 1386 -1380
		mu 0 4 1254 1307 1308 1255
		f 4 1387 -1381 1388 -1386
		mu 0 4 1307 1301 1300 1308
		f 4 1389 1390 1391 -1382
		mu 0 4 1309 1310 1311 1312
		f 4 1392 -1383 1393 -1391
		mu 0 4 1310 1257 1256 1311
		f 4 1394 1395 1396 -1384
		mu 0 4 1292 1313 1314 1293
		f 4 1397 1381 1398 -1396
		mu 0 4 1313 1309 1312 1314
		f 8 -1375 -1370 1367 -1388 -1385 1370 -1393 -1390
		mu 0 8 1315 1316 1317 1318 1319 1320 1321 1322
		f 8 -1387 -1389 -1367 -1376 1378 -1392 -1394 -1372
		mu 0 8 1323 1324 1325 1304 1303 1326 1327 1328
		f 3 1374 -1398 1399
		mu 0 3 1316 1315 1329
		f 3 -1400 -1395 -1374
		mu 0 3 1316 1329 1330
		f 3 1377 -1397 1400
		mu 0 3 1303 1302 1331
		f 3 -1401 -1399 -1379
		mu 0 3 1303 1331 1326
		f 5 -1366 1363 1369 1373 1372
		mu 0 5 1291 1290 1317 1316 1330
		f 4 1402 -1357 -1360 -1404
		mu 0 4 1306 1305 1281 1280
		f 4 1343 1345 -1410 -1345
		mu 0 4 1332 1333 1267 1266
		f 4 -1412 1407 1416 -1409
		mu 0 4 1261 1260 1334 1335
		f 4 1417 1418 1419 -1416
		mu 0 4 1262 1336 1337 1263
		f 4 1420 -1417 1421 -1419
		mu 0 4 1336 1335 1334 1337
		f 6 1344 -1413 1408 -1421 -1418 1413
		mu 0 6 1338 1275 1274 1339 1340 1341
		f 6 -1408 -1411 -1346 -1415 -1420 -1422
		mu 0 6 1342 1273 1272 1343 1344 1345
		f 4 1449 -1462 -1451 -1459
		mu 0 4 1346 1347 1348 1349
		f 4 1425 -1491 -1427 -1430
		mu 0 4 1350 1351 1352 1353
		f 4 1492 1422 -1494 -1495
		mu 0 4 1354 1355 1356 1357
		f 4 1484 -1432 -1486 -1489
		mu 0 4 1358 1359 1360 1361
		f 4 1426 -1490 1485 -1431
		mu 0 4 1362 1363 1364 1365
		f 4 -1426 -1433 -1485 -1492
		mu 0 4 1366 1367 1368 1369
		f 4 1433 1429 -1435 -1438
		mu 0 4 1370 1350 1353 1371
		f 4 1434 1430 1427 -1439
		mu 0 4 1372 1362 1365 1373
		f 4 1428 -1440 -1428 1431
		mu 0 4 1359 1374 1375 1360
		f 4 -1434 -1441 -1429 1432
		mu 0 4 1367 1376 1377 1368
		f 4 1480 1437 -1483 1483
		mu 0 4 1378 1370 1371 1379
		f 4 1436 -1444 -1436 1439
		mu 0 4 1374 1380 1381 1375
		f 4 -1481 -1445 -1437 1440
		mu 0 4 1376 1382 1383 1377
		f 4 1451 -1484 -1456 -1463
		mu 0 4 1384 1385 1386 1387
		f 4 1442 -1448 -1442 1443
		mu 0 4 1380 1388 1389 1381
		f 4 1446 -1460 -1446 1447
		mu 0 4 1390 1391 1392 1393
		f 5 1455 1481 1441 -1455 1456
		mu 0 5 1394 1395 1396 1397 1398
		f 4 1458 -1466 -1465 -1464
		mu 0 4 1346 1349 1399 1400
		f 4 1464 -1468 1459 -1467
		mu 0 4 1400 1399 1392 1391
		f 4 1460 -1471 -1470 -1469
		mu 0 4 1401 1402 1403 1404
		f 4 1469 -1473 1461 -1472
		mu 0 4 1404 1403 1348 1347
		f 4 1462 -1476 -1475 -1474
		mu 0 4 1384 1387 1405 1406
		f 4 1474 -1478 -1461 -1477
		mu 0 4 1406 1405 1402 1401
		f 8 1468 1471 -1450 1463 1466 -1447 1448 1453
		mu 0 8 1407 1408 1409 1410 1411 1412 1413 1414
		f 8 1450 1472 1470 -1458 1454 1445 1467 1465
		mu 0 8 1415 1416 1417 1418 1398 1397 1419 1420
		f 3 -1479 1476 -1454
		mu 0 3 1414 1421 1407
		f 3 1452 1473 1478
		mu 0 3 1414 1422 1421
		f 3 -1480 1475 -1457
		mu 0 3 1398 1423 1394
		f 3 1457 1477 1479
		mu 0 3 1398 1418 1423
		f 5 -1452 -1453 -1449 -1443 1444
		mu 0 5 1382 1422 1414 1413 1383
		f 4 1482 1438 1435 -1482
		mu 0 4 1395 1372 1373 1396
		f 4 1423 1488 -1425 -1423
		mu 0 4 1424 1358 1361 1425
		f 4 1487 -1496 -1487 1490
		mu 0 4 1351 1426 1427 1352
		f 4 1494 -1499 -1498 -1497
		mu 0 4 1354 1357 1428 1429
		f 4 1497 -1501 1495 -1500
		mu 0 4 1429 1428 1427 1426
		f 6 -1493 1496 1499 -1488 1491 -1424
		mu 0 6 1430 1431 1432 1433 1366 1369
		f 6 1500 1498 1493 1424 1489 1486
		mu 0 6 1434 1435 1436 1437 1364 1363
		f 4 1504 1506 1508 1510
		mu 0 4 1438 1439 1440 1441
		f 4 -1508 -1506 -1504 -1510
		mu 0 4 1442 1443 1444 1445
		f 4 1513 -1516 -1515 1502
		mu 0 4 1446 1447 1448 1449
		f 5 1514 1517 1520 -1512 1505
		mu 0 5 1443 1450 1451 1452 1444
		f 4 -1502 1511 -1517 -1513
		mu 0 4 1453 1454 1455 1456
		f 4 1515 -1520 -1519 -1518
		mu 0 4 1448 1447 1457 1458
		f 4 1518 -1522 1516 -1521
		mu 0 4 1458 1457 1456 1455
		f 5 -1507 1512 1521 1519 -1514
		mu 0 5 1440 1439 1459 1460 1461
		f 4 1524 1525 1527 1528
		mu 0 4 1462 1463 1464 1465
		f 4 -1534 -1535 -1531 1523
		mu 0 4 1466 1467 1468 1469
		f 4 -1532 -1523 1529 -1536
		mu 0 4 1470 1471 1472 1473
		f 4 1532 -1528 -1524 1526
		mu 0 4 1474 1475 1466 1469
		f 4 1534 -1539 -1538 -1537
		mu 0 4 1468 1467 1476 1477
		f 4 1537 -1542 -1541 -1540
		mu 0 4 1477 1476 1478 1479
		f 4 1540 -1544 1535 -1543
		mu 0 4 1479 1478 1470 1473
		f 6 1543 1541 1538 1533 -1526 1531
		mu 0 6 1480 1481 1482 1483 1464 1463
		f 4 1544 1585 -1565 -1585
		mu 0 4 1484 1485 1486 1487
		f 4 1545 1586 -1566 -1586
		mu 0 4 1485 1488 1489 1486
		f 4 1546 1587 -1567 -1587
		mu 0 4 1488 1490 1491 1489
		f 4 1547 1588 -1568 -1588
		mu 0 4 1490 1492 1493 1491
		f 4 1548 1589 -1569 -1589
		mu 0 4 1492 1494 1495 1493
		f 4 1549 1590 -1570 -1590
		mu 0 4 1494 1496 1497 1495
		f 4 1550 1591 -1571 -1591
		mu 0 4 1496 1498 1499 1497
		f 4 1551 1592 -1572 -1592
		mu 0 4 1498 1500 1501 1499
		f 4 1552 1593 -1573 -1593
		mu 0 4 1500 1502 1503 1501
		f 4 1553 1594 -1574 -1594
		mu 0 4 1502 1504 1505 1503
		f 4 1554 1595 -1575 -1595
		mu 0 4 1504 1506 1507 1505
		f 4 1555 1596 -1576 -1596
		mu 0 4 1506 1508 1509 1507
		f 4 1556 1597 -1577 -1597
		mu 0 4 1508 1510 1511 1509
		f 4 1557 1598 -1578 -1598
		mu 0 4 1510 1512 1513 1511
		f 4 1558 1599 -1579 -1599
		mu 0 4 1514 1515 1516 1517
		f 4 1559 1600 -1580 -1600
		mu 0 4 1515 1518 1519 1516
		f 4 1560 1601 -1581 -1601
		mu 0 4 1518 1520 1521 1519
		f 4 1561 1602 -1582 -1602
		mu 0 4 1520 1522 1523 1521
		f 4 1562 1603 -1583 -1603
		mu 0 4 1522 1524 1525 1523
		f 4 1563 1584 -1584 -1604
		mu 0 4 1524 1484 1487 1525
		f 4 -1545 1604 1606 -1606
		mu 0 4 1526 1527 1528 1529
		f 4 -1546 1605 1608 -1608
		mu 0 4 1530 1526 1529 1531
		f 4 -1547 1607 1610 -1610
		mu 0 4 1532 1530 1531 1533
		f 4 -1548 1609 1612 -1612
		mu 0 4 1534 1532 1533 1535
		f 4 -1549 1611 1614 -1614
		mu 0 4 1536 1534 1535 1537
		f 4 -1550 1613 1616 -1616
		mu 0 4 1538 1536 1537 1539
		f 4 -1551 1615 1618 -1618
		mu 0 4 1540 1538 1539 1541
		f 4 -1552 1617 1620 -1620
		mu 0 4 1542 1540 1541 1543
		f 4 -1553 1619 1622 -1622
		mu 0 4 1544 1542 1543 1545
		f 4 -1554 1621 1624 -1624
		mu 0 4 1546 1544 1545 1547
		f 4 -1555 1623 1626 -1626
		mu 0 4 1548 1546 1547 1549
		f 4 -1556 1625 1628 -1628
		mu 0 4 1550 1548 1549 1551
		f 4 -1557 1627 1630 -1630
		mu 0 4 1552 1550 1551 1553
		f 4 -1558 1629 1632 -1632
		mu 0 4 1554 1552 1553 1555
		f 4 -1559 1631 1634 -1634
		mu 0 4 1556 1557 1558 1559
		f 4 -1560 1633 1636 -1636
		mu 0 4 1560 1556 1559 1561
		f 4 -1561 1635 1638 -1638
		mu 0 4 1562 1560 1561 1563
		f 4 -1562 1637 1640 -1640
		mu 0 4 1564 1562 1563 1565
		f 4 -1563 1639 1642 -1642
		mu 0 4 1566 1564 1565 1567
		f 4 -1564 1641 1643 -1605
		mu 0 4 1527 1566 1567 1528
		f 4 1564 1645 -1647 -1645
		mu 0 4 1568 1569 1570 1571
		f 4 1565 1647 -1649 -1646
		mu 0 4 1569 1572 1573 1570
		f 4 1566 1649 -1651 -1648
		mu 0 4 1572 1574 1575 1573
		f 4 1567 1651 -1653 -1650
		mu 0 4 1574 1576 1577 1575
		f 4 1568 1653 -1655 -1652
		mu 0 4 1576 1578 1579 1577
		f 4 1569 1655 -1657 -1654
		mu 0 4 1578 1580 1581 1579
		f 4 1570 1657 -1659 -1656
		mu 0 4 1580 1582 1583 1581
		f 4 1571 1659 -1661 -1658
		mu 0 4 1582 1584 1585 1583
		f 4 1572 1661 -1663 -1660
		mu 0 4 1584 1586 1587 1585
		f 4 1573 1663 -1665 -1662
		mu 0 4 1586 1588 1589 1587
		f 4 1574 1665 -1667 -1664
		mu 0 4 1588 1590 1591 1589
		f 4 1575 1667 -1669 -1666
		mu 0 4 1590 1592 1593 1591
		f 4 1576 1669 -1671 -1668
		mu 0 4 1592 1594 1595 1593
		f 4 1577 1671 -1673 -1670
		mu 0 4 1594 1596 1597 1595
		f 4 1578 1673 -1675 -1672
		mu 0 4 1598 1599 1600 1601
		f 4 1579 1675 -1677 -1674
		mu 0 4 1599 1602 1603 1600
		f 4 1580 1677 -1679 -1676
		mu 0 4 1602 1604 1605 1603
		f 4 1581 1679 -1681 -1678
		mu 0 4 1604 1606 1607 1605
		f 4 1582 1681 -1683 -1680
		mu 0 4 1606 1608 1609 1607
		f 4 1583 1644 -1684 -1682
		mu 0 4 1608 1568 1571 1609
		f 4 1687 1689 1691 1693
		mu 0 4 1610 1611 1612 1613
		f 4 -1691 -1689 -1687 -1693
		mu 0 4 1614 1615 1616 1617
		f 4 1696 -1699 -1698 1685
		mu 0 4 1618 1619 1620 1621
		f 5 1697 1700 1703 -1695 1688
		mu 0 5 1615 1622 1623 1624 1616
		f 4 -1685 1694 -1700 -1696
		mu 0 4 1625 1626 1627 1628
		f 4 1698 -1703 -1702 -1701
		mu 0 4 1620 1619 1629 1630
		f 4 1701 -1705 1699 -1704
		mu 0 4 1630 1629 1628 1627
		f 5 -1690 1695 1704 1702 -1697
		mu 0 5 1612 1611 1631 1632 1633
		f 4 1707 1708 1710 1711
		mu 0 4 1634 1635 1636 1637
		f 4 -1717 -1718 -1714 1706
		mu 0 4 1638 1639 1640 1641
		f 4 -1715 -1706 1712 -1719
		mu 0 4 1642 1643 1644 1645
		f 4 1715 -1711 -1707 1709
		mu 0 4 1646 1647 1638 1641
		f 4 1717 -1722 -1721 -1720
		mu 0 4 1640 1639 1648 1649
		f 4 1720 -1725 -1724 -1723
		mu 0 4 1649 1648 1650 1651
		f 4 1723 -1727 1718 -1726
		mu 0 4 1651 1650 1642 1645
		f 6 1726 1724 1721 1716 -1709 1714
		mu 0 6 1652 1653 1654 1655 1636 1635
		f 4 -1737 -1735 -1733 -1731
		mu 0 4 1656 1657 1658 1659
		f 4 1735 1729 1731 1733
		mu 0 4 1660 1661 1662 1663
		f 4 -1729 1740 1741 -1740
		mu 0 4 1664 1665 1666 1667
		f 5 -1732 1737 -1747 -1744 -1741
		mu 0 5 1663 1662 1668 1669 1670
		f 4 1738 1742 -1738 1727
		mu 0 4 1671 1672 1673 1674
		f 4 1743 1744 1745 -1742
		mu 0 4 1666 1675 1676 1667
		f 4 1746 -1743 1747 -1745
		mu 0 4 1675 1673 1672 1676
		f 5 1739 -1746 -1748 -1739 1732
		mu 0 5 1658 1677 1678 1679 1659
		f 4 -1755 -1754 -1752 -1751
		mu 0 4 1680 1681 1682 1683
		f 4 -1750 1756 1760 1759
		mu 0 4 1684 1685 1686 1687
		f 4 1761 -1756 1748 1757
		mu 0 4 1688 1689 1690 1691
		f 4 -1753 1749 1753 -1759
		mu 0 4 1692 1685 1684 1693
		f 4 1762 1763 1764 -1761
		mu 0 4 1686 1694 1695 1687
		f 4 1765 1766 1767 -1764
		mu 0 4 1694 1696 1697 1695
		f 4 1768 -1762 1769 -1767
		mu 0 4 1696 1689 1688 1697
		f 6 -1758 1751 -1760 -1765 -1768 -1770
		mu 0 6 1698 1683 1682 1699 1700 1701
		f 4 -1780 -1778 -1776 -1774
		mu 0 4 1702 1703 1704 1705
		f 4 1778 1772 1774 1776
		mu 0 4 1706 1707 1708 1709
		f 4 -1772 1783 1784 -1783
		mu 0 4 1710 1711 1712 1713
		f 5 -1775 1780 -1790 -1787 -1784
		mu 0 5 1709 1708 1714 1715 1716
		f 4 1781 1785 -1781 1770
		mu 0 4 1717 1718 1719 1720
		f 4 1786 1787 1788 -1785
		mu 0 4 1712 1721 1722 1713
		f 4 1789 -1786 1790 -1788
		mu 0 4 1721 1719 1718 1722
		f 5 1782 -1789 -1791 -1782 1775
		mu 0 5 1704 1723 1724 1725 1705
		f 4 -1798 -1797 -1795 -1794
		mu 0 4 1726 1727 1728 1729
		f 4 -1793 1799 1803 1802
		mu 0 4 1730 1731 1732 1733
		f 4 1804 -1799 1791 1800
		mu 0 4 1734 1735 1736 1737
		f 4 -1796 1792 1796 -1802
		mu 0 4 1738 1731 1730 1739
		f 4 1805 1806 1807 -1804
		mu 0 4 1732 1740 1741 1733
		f 4 1808 1809 1810 -1807
		mu 0 4 1740 1742 1743 1741
		f 4 1811 -1805 1812 -1810
		mu 0 4 1742 1735 1734 1743
		f 6 -1801 1794 -1803 -1808 -1811 -1813
		mu 0 6 1744 1729 1728 1745 1746 1747;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "fertilizer_coupling_1" -p "hose_main_component1";
	rename -uid "05DD4AFC-4116-E08D-590F-45A27D39707A";
	addAttr -ci true -sn "i3D_xmlIdentifier" -ln "i3D_xmlIdentifier" -dt "string";
	addAttr -ci true -sn "i3D_objectMask" -ln "i3D_objectMask" -at "long";
	addAttr -ci true -sn "i3D_dynamic" -ln "i3D_dynamic" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_joint" -ln "i3D_joint" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_dynamicFriction" -ln "i3D_dynamicFriction" -at "float";
	addAttr -ci true -sn "i3D_ccd" -ln "i3D_ccd" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_density" -ln "i3D_density" -at "float";
	addAttr -ci true -sn "i3D_splitType" -ln "i3D_splitType" -at "long";
	addAttr -ci true -sn "i3D_splitMinU" -ln "i3D_splitMinU" -at "float";
	addAttr -ci true -sn "i3D_splitMinV" -ln "i3D_splitMinV" -at "float";
	addAttr -ci true -sn "i3D_driveForceLimit" -ln "i3D_driveForceLimit" -at "float";
	addAttr -ci true -sn "i3D_angularDamping" -ln "i3D_angularDamping" -at "float";
	addAttr -ci true -sn "i3D_splitUvWorldScale" -ln "i3D_splitUvWorldScale" -at "float";
	addAttr -ci true -sn "i3D_projection" -ln "i3D_projection" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_driveSpring" -ln "i3D_driveSpring" -at "float";
	addAttr -ci true -sn "i3D_breakableJoint" -ln "i3D_breakableJoint" -min 0 -max 1
		-at "bool";
	addAttr -ci true -sn "i3D_projDistance" -ln "i3D_projDistance" -at "float";
	addAttr -ci true -sn "i3D_driveDamping" -ln "i3D_driveDamping" -at "float";
	addAttr -ci true -sn "i3D_xAxisDrive" -ln "i3D_xAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_compound" -ln "i3D_compound" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_clipDistance" -ln "i3D_clipDistance" -at "float";
	addAttr -ci true -sn "i3D_collision" -ln "i3D_collision" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_scaled" -ln "i3D_scaled" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_projAngle" -ln "i3D_projAngle" -at "float";
	addAttr -ci true -sn "i3D_mergeGroupRoot" -ln "i3D_mergeGroupRoot" -min 0 -max 1
		-at "bool";
	addAttr -ci true -sn "i3D_jointBreakTorque" -ln "i3D_jointBreakTorque" -at "float";
	addAttr -ci true -sn "i3D_restitution" -ln "i3D_restitution" -at "float";
	addAttr -ci true -sn "i3D_yAxisDrive" -ln "i3D_yAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeGroup" -ln "i3D_mergeGroup" -at "long";
	addAttr -ci true -sn "i3D_jointBreakForce" -ln "i3D_jointBreakForce" -at "float";
	addAttr -ci true -sn "i3D_lod1" -ln "i3D_lod1" -at "float";
	addAttr -ci true -sn "i3D_lod2" -ln "i3D_lod2" -at "float";
	addAttr -ci true -sn "i3D_oc" -ln "i3D_oc" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_kinematic" -ln "i3D_kinematic" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_trigger" -ln "i3D_trigger" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_static" -ln "i3D_static" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lightMask" -ln "i3D_lightMask" -dt "string";
	addAttr -ci true -sn "i3D_linearDamping" -ln "i3D_linearDamping" -at "float";
	addAttr -ci true -sn "i3D_lod3" -ln "i3D_lod3" -at "float";
	addAttr -ci true -sn "i3D_drivePos" -ln "i3D_drivePos" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lod" -ln "i3D_lod" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_solverIterationCount" -ln "i3D_solverIterationCount" -at "long";
	addAttr -ci true -sn "i3D_nonRenderable" -ln "i3D_nonRenderable" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_boundingVolume" -ln "i3D_boundingVolume" -dt "string";
	addAttr -ci true -sn "i3D_collisionMask" -ln "i3D_collisionMask" -at "long";
	addAttr -ci true -sn "i3D_zAxisDrive" -ln "i3D_zAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_cpuMesh" -ln "i3D_cpuMesh" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_staticFriction" -ln "i3D_staticFriction" -at "float";
	addAttr -ci true -sn "i3D_decalLayer" -ln "i3D_decalLayer" -at "long";
	addAttr -ci true -sn "i3D_splitMaxV" -ln "i3D_splitMaxV" -at "float";
	addAttr -ci true -sn "i3D_splitMaxU" -ln "i3D_splitMaxU" -at "float";
	addAttr -ci true -sn "i3D_compoundChild" -ln "i3D_compoundChild" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.5265566588595856e-16 1.4714896678924561e-07 0 ;
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".i3D_xmlIdentifier" -type "string" "fertilizer_coupling_1";
	setAttr ".i3D_objectMask" 255;
	setAttr ".i3D_dynamicFriction" 0.5;
	setAttr ".i3D_density" 1;
	setAttr ".i3D_driveForceLimit" 100000;
	setAttr ".i3D_angularDamping" 0.0099999997764825821;
	setAttr ".i3D_splitUvWorldScale" 1;
	setAttr ".i3D_driveSpring" 1;
	setAttr ".i3D_projDistance" 0.0099999997764825821;
	setAttr ".i3D_driveDamping" 0.0099999997764825821;
	setAttr ".i3D_clipDistance" 300;
	setAttr ".i3D_projAngle" 0.0099999997764825821;
	setAttr ".i3D_lightMask" -type "string" "FFFF";
	setAttr ".i3D_solverIterationCount" 4;
	setAttr ".i3D_boundingVolume" -type "string" "";
	setAttr ".i3D_collisionMask" 255;
	setAttr ".i3D_staticFriction" 0.5;
	setAttr ".i3D_splitMaxV" 1;
	setAttr ".i3D_splitMaxU" 1;
createNode mesh -n "fertilizer_coupling_1Shape" -p "fertilizer_coupling_1";
	rename -uid "1A088CDA-46E5-1218-0308-5596F2CA87D7";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:363]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 769 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 4.86492395 0.58965021 4.8892436
		 0.58937627 4.88928127 0.59549111 4.86492395 0.59553915 4.84146309 0.59545416 4.84161711
		 0.58944517 4.98785448 0.59553933 4.96266508 0.59553921 4.96266508 0.5897404 4.98785448
		 0.58974022 4.93800306 0.59553933 4.93800306 0.58974016 4.91607237 0.58944148 4.91660786
		 0.59531122 4.89239359 0.63271642 4.86842728 0.6327343 4.86840582 0.60431039 4.89237261
		 0.60429269 4.84446049 0.63275206 4.84443951 0.60432804 4.82049417 0.63276976 4.82047319
		 0.60434574 4.6287632 0.63291132 4.60479641 0.63292897 4.60477543 0.60450542 4.62874222
		 0.60448754 4.98825884 0.63264573 4.96429253 0.63266331 4.96427155 0.60423934 4.98823833
		 0.60422164 4.94032621 0.63268101 4.94030523 0.60425699 4.9163599 0.63269871 4.91633892
		 0.60427511 4.9112854 0.5561949 4.88927841 0.55635297 4.88920832 0.54957432 4.91368055
		 0.54924583 4.91367626 0.55494362 4.91605663 0.55620801 4.93800306 0.54993135 4.93800306
		 0.55663872 4.96266508 0.55663866 4.98785448 0.55663866 4.86492395 0.5566386 4.84082556
		 0.55663854 4.84082556 0.54993135 4.86492395 0.54993117 4.88929081 0.59871924 4.86492395
		 0.598719 4.8414402 0.59870219 4.81854248 0.59858054 4.81854248 0.59587127 4.82169294
		 0.59533119 4.62626648 0.59546506 4.6293726 0.59560192 4.629457 0.59867811 4.60517979
		 0.59871912 4.60517979 0.59553921 4.98785448 0.598719 4.96266508 0.59871936 4.93800306
		 0.59871918 4.91354179 0.59872633 4.91348219 0.59561241 4.9106884 0.59554297 4.91117811
		 0.58951014 4.60517979 0.58941138 4.62671471 0.58948791 4.96266508 0.54993129 4.98785448
		 0.54993129 4.68853188 0.23885113 4.68636513 0.2389062 4.6853776 0.20948148 4.68818426
		 0.20940906 4.69096184 0.20941532 4.69066763 0.23885512 4.60517979 0.55663872 4.62678051
		 0.55660558 4.82111931 0.58945864 4.82075739 0.55661368 4.68868303 0.24736089 4.68598223
		 0.24788982 4.68598223 0.24369174 4.68868351 0.24317408 4.67652798 0.23900241 4.67658854
		 0.20947075 4.68201637 0.2094931 4.67983866 0.23900861 4.700243 0.20933968 4.69976282
		 0.23877779 4.69646263 0.23872325 4.69483185 0.20926253 4.69120407 0.24787852 4.69138432
		 0.24368054 4.60421419 0.63970339 4.63063288 0.63970339 4.63063288 0.65404016 4.60421419
		 0.65404016 4.97459221 0.63970339 4.98882103 0.63970339 4.98882055 0.6540398 4.97459221
		 0.6540401 4.94822598 0.63970339 4.94916534 0.65362865 4.92585659 0.6396274 4.92590523
		 0.65315384 4.90296841 0.63970339 4.9026742 0.65352386 4.87663937 0.63970339 4.87663937
		 0.65404004 4.85348845 0.63970339 4.85348845 0.65404016 4.83829594 0.63970339 4.83829594
		 0.6540401 4.60335827 0.67351854 4.62818289 0.67351872 4.62818289 0.69092172 4.60335827
		 0.69092143 4.96947622 0.67343658 4.9890008 0.67343652 4.9890008 0.68712407 4.96947622
		 0.68712407 4.94995117 0.67343652 4.94995117 0.68712437 4.8789897 0.67354417 4.90122366
		 0.67354363 4.90122366 0.68913066 4.87899017 0.68913072 4.85675621 0.67354363 4.85675621
		 0.68913019 4.83452225 0.67354369 4.83452225 0.68913019 4.60364056 0.69908476 4.62934113
		 0.69908446 4.62934113 0.71662945 4.60364056 0.71662951 4.96898174 0.70035672 4.99038029
		 0.70035672 4.99038029 0.71565306 4.96898174 0.71565306 4.9475832 0.70035672 4.9475832
		 0.715653 4.61416864 0.1067057 4.61162329 0.12588659 4.60583973 0.1239703 4.60800743
		 0.10663643 4.61190891 0.087361008 4.60604572 0.089242488 4.87859297 0.69998157 4.90116978
		 0.69998163 4.90116978 0.71558619 4.87859297 0.71558607 4.85646629 0.69998175 4.85646629
		 0.71558607 4.83436728 0.69998175 4.83436728 0.71558607 4.60332489 0.72092962 4.62787342
		 0.72092968 4.62787342 0.73499161 4.60332489 0.73499072 4.96833038 0.72213167 4.99060059
		 0.72213155 4.99060059 0.73633873 4.96832943 0.73633796 4.94605923 0.72213149 4.9460597
		 0.7363379 4.87864256 0.72190106 4.90072012 0.72190094 4.90072012 0.73598409 4.87864256
		 0.73598421 4.85656452 0.72190088 4.85656452 0.73598421 4.83448696 0.72190082 4.83448696
		 0.73598421 4.60290289 0.75457454 4.62752962 0.75457454 4.62752962 0.77184534 4.60290289
		 0.77184522 4.96548223 0.75457454 4.99013186 0.75457454 4.99013186 0.77184564 4.96548223
		 0.77184516 4.94128323 0.75457448 4.94128323 0.77184522 4.91714859 0.75457454 4.91714859
		 0.77184522 4.89299393 0.7545746 4.89299393 0.77184522 4.86883593 0.75457454 4.86883593
		 0.77184522 4.84471226 0.75457448 4.84471226 0.77184516 4.8205719 0.75457454 4.8205719
		 0.77184534 4.60233688 0.79443473 4.62660933 0.79443461 4.62660933 0.8848632 4.60233688
		 0.8848632 4.96642542 0.79443467 4.99069786 0.79443467 4.99069786 0.88486314 4.96642542
		 0.88486314 4.9421525 0.79443467 4.9421525 0.88486326 4.91788006 0.79443461 4.91788006
		 0.8848632 4.89360762 0.79443461 4.89360762 0.8848632 4.86933517 0.79443461 4.86933517
		 0.8848632 4.84506226 0.79443461 4.84506226 0.8848632 4.82078981 0.79443461 4.82078981
		 0.88486326 4.47995806 0.53047413 4.48890066 0.51911873 4.51297283 0.54727501 4.47604132
		 0.54438704 4.47774792 0.55873984 4.48481655 0.57134694 4.49617195 0.58028954 4.51008415
		 0.58420593 4.5244379 0.5824998 4.53704453 0.57543117 4.60288334 0.74291277 4.62473297
		 0.74291283 4.62473297 0.74792504 4.60288334 0.7479251 4.62380266 0.78528047 4.60195923
		 0.78528011 4.60195923 0.77814925 4.62380266 0.77814925 4.96955872 0.74291307 4.99181318
		 0.74291241 4.99181318 0.74792558 4.96955872 0.74792504 4.99107552 0.78528047 4.96892405
		 0.78528047 4.96892405 0.77814949 4.99107552 0.77814949 4.9503417 0.74291283 4.9503417
		 0.74792504 4.94654226 0.78528035 4.94654226 0.77814949 4.92410564 0.74291277 4.92410564
		 0.74792498 4.92516661 0.78528035 4.92516661 0.77814943 4.90087414 0.74291283 4.90087461
		 0.7479251;
	setAttr ".uvst[0].uvsp[250:499]" 4.90041351 0.78528005 4.90041351 0.77814919
		 4.86749554 0.74291277 4.86749554 0.74792486 4.8779707 0.78528035 4.87797022 0.77814949
		 4.84649086 0.74291283 4.84649086 0.7479251 4.85585403 0.78528053 4.85585403 0.77814966
		 4.824121 0.74291277 4.824121 0.74792522 4.83453941 0.78528053 4.83453941 0.77814966
		 4.64348745 0.10690203 4.64486885 0.12393716 4.63862085 0.12451831 4.63698292 0.10677853
		 4.64545345 0.089890391 4.63921881 0.088964731 4.58476257 0.120958 4.58581686 0.10643461
		 4.59563637 0.10656658 4.59440804 0.12144485 4.58511066 0.092062742 4.5945816 0.09164241
		 4.62497902 0.1066238 4.62497902 0.1264222 4.62007713 0.1264222 4.62007713 0.1066238
		 4.62497902 0.086825639 4.62007713 0.086825639 4.94746685 0.66058654 4.9259243 0.65916151
		 4.90462494 0.66041535 4.6315012 0.10660258 4.63415718 0.0871723 4.63260365 0.12607542
		 4.48487329 0.93791485 4.49598885 0.94530219 4.4969511 0.95596051 4.48480511 0.9540934
		 4.506042 0.92215884 4.50594616 0.9453429 4.48493958 0.92207187 4.5188446 0.92213988
		 4.53984737 0.92218941 4.52873564 0.9452374 4.51878929 0.94521314 4.53981161 0.93795687
		 4.53977489 0.95405781 4.52925444 0.95584261 4.60395479 0.10659125 4.60133362 0.10659221
		 4.59989452 0.091100365 4.60228491 0.090451628 4.59871864 0.10658935 4.59747314 0.091449648
		 4.59732294 0.12166014 4.60212326 0.12275234 4.53487062 0.96536613 4.52846956 0.96713877
		 4.51875257 0.96396935 4.51876974 0.9558208 4.53976488 0.95903611 4.53839779 0.96300459
		 4.50589991 0.95599848 4.5058651 0.96418607 4.49608088 0.96730876 4.48966169 0.96548641
		 4.48613262 0.96309143 4.48478317 0.95909548 4.59973097 0.12205735 4.78019238 0.20917749
		 4.78065825 0.23887521 4.77824306 0.23894256 4.7770896 0.20926391 4.71918011 0.20923424
		 4.72229815 0.20928109 4.72156763 0.23898792 4.71918011 0.23895133 4.78053999 0.24579126
		 4.77818489 0.24625427 4.77816534 0.24271065 4.78054142 0.24224693 4.7663126 0.23842674
		 4.76676416 0.20880228 4.77220821 0.20889872 4.76984644 0.23847955 4.73097992 0.20899004
		 4.73094177 0.23861176 4.72762203 0.23860735 4.72553539 0.20899653 4.72223091 0.24609256
		 4.71987152 0.24556923 4.71987152 0.24223781 4.72220659 0.24276161 4.77272272 0.58957624
		 4.772892 0.59553933 4.74903345 0.59551263 4.7491312 0.58942628 4.79561901 0.58962703
		 4.79580402 0.59562701 4.65360308 0.59549165 4.65375519 0.58940148 4.67805195 0.58971238
		 4.67805195 0.59553921 4.70177126 0.58952463 4.70189095 0.59548938 4.72308064 0.58956754
		 4.72263336 0.59554005 4.74859524 0.63282275 4.74857426 0.60439909 4.77254057 0.6043812
		 4.77256155 0.63280499 4.79650688 0.60436362 4.79652786 0.63278735 4.65270853 0.6044699
		 4.65272951 0.63289368 4.67667484 0.60445201 4.67669582 0.63287592 4.70064116 0.60443437
		 4.70066261 0.63285816 4.72460747 0.60441661 4.72462845 0.63284051 4.67805195 0.5566386
		 4.70175648 0.55662727 4.65380239 0.55662274 4.78329659 0.20916648 4.78307438 0.23886693
		 4.77230358 0.55663162 4.77231932 0.54994416 4.79536867 0.54997611 4.7953558 0.55665749
		 4.749053 0.54992956 4.74907923 0.55663812 4.772892 0.59871924 4.74903059 0.59877741
		 4.79582691 0.59887546 4.81539154 0.59534615 4.6327877 0.59520817 4.65359974 0.59876084
		 4.67805195 0.59871912 4.70193291 0.5986743 4.72537041 0.59561086 4.7254343 0.59870553
		 4.72837543 0.59529805 4.72783375 0.58946347 4.63225269 0.58937871 4.71679354 0.23898792
		 4.71606255 0.20928109 4.67805195 0.54993129 4.70175695 0.54995561 4.65382004 0.54997182
		 4.74854565 0.23906103 4.74854517 0.20933923 4.75137949 0.20937911 4.75073195 0.23909083
		 4.74638939 0.23909035 4.74574184 0.20937863 4.7277112 0.55662131 4.72308016 0.55662274
		 4.63220024 0.55660498 4.81570387 0.55661303 4.81586409 0.58949673 4.78291702 0.24271232
		 4.78289509 0.24625595 4.79300022 0.23874301 4.78946733 0.23868495 4.78803587 0.2090444
		 4.79348087 0.20911914 4.70651722 0.20968223 4.71196079 0.20964569 4.71011066 0.23927218
		 4.70679092 0.23930287 4.71751261 0.24609254 4.7175374 0.24276161 4.74862623 0.24706134
		 4.74849701 0.24373159 4.75066376 0.24406299 4.75072908 0.24739513 4.75999308 0.23870239
		 4.75667048 0.23868904 4.75465822 0.20905909 4.76010513 0.20906863 4.73738909 0.20944461
		 4.74283504 0.20935729 4.7412467 0.23901287 4.73792553 0.23907378 4.74658585 0.24755034
		 4.74639177 0.24422345 4.72541237 0.55627918 4.72540855 0.54990733 4.65066242 0.63970345
		 4.65066242 0.65404016 4.67656612 0.63970333 4.67656612 0.6540401 4.70292664 0.63970339
		 4.7039299 0.65438324 4.72799206 0.63970333 4.73068857 0.65454304 4.7619586 0.63970339
		 4.75976038 0.65447456 4.78565979 0.63970333 4.78565979 0.65404016 4.81187677 0.63970339
		 4.8118763 0.65404016 4.65300655 0.67351884 4.65300703 0.69092131 4.67783117 0.67351896
		 4.67783117 0.69092137 4.70265532 0.67351884 4.70265532 0.69092131 4.7900548 0.67354363
		 4.7900548 0.68913019 4.76782131 0.68913019 4.76782131 0.67354363 4.81228828 0.67354363
		 4.81228828 0.68913019 4.65412045 0.69908488 4.65412045 0.71662962 4.67959309 0.69908452
		 4.67959309 0.71662968 4.70188141 0.6990847 4.70188141 0.71662951 4.63492966 0.22159684
		 4.64109135 0.2215845 4.64312315 0.23894137 4.63732529 0.24081248 4.63734055 0.20228577
		 4.64318895 0.20421296 4.79012775 0.69998151 4.79012775 0.71558607 4.76756001 0.71558607
		 4.76756001 0.69998133 4.81226444 0.69998151 4.81226444 0.71558607 4.65242195 0.72092962
		 4.65242195 0.73499155 4.67697096 0.72092968 4.67697096 0.73499155 4.70151949 0.72092968
		 4.70151949 0.73499149 4.79033136 0.72190088 4.79033136 0.73598427 4.76825333 0.73598421
		 4.76825333 0.72190094 4.81240892 0.72190082 4.81240892 0.73598421 4.65167713 0.75457454;
	setAttr ".uvst[0].uvsp[500:749]" 4.65167713 0.77184534 4.67579556 0.75457454
		 4.67579556 0.77184534 4.69993591 0.75457454 4.69993591 0.77184534 4.72404575 0.75457507
		 4.72404575 0.77184582 4.74819517 0.75457448 4.74819517 0.77184528 4.77231169 0.75457448
		 4.77231169 0.77184528 4.79643154 0.75457448 4.79643154 0.77184528 4.65088177 0.79443461
		 4.65088177 0.8848632 4.67515469 0.79443467 4.67515469 0.88486326 4.69942713 0.79443467
		 4.69942713 0.88486326 4.72369957 0.79443467 4.72369957 0.88486326 4.74797201 0.79443461
		 4.74797201 0.88486326 4.77224493 0.79443467 4.77224493 0.88486326 4.79651737 0.79443461
		 4.79651737 0.88486326 4.50150824 0.51205021 4.51586103 0.51034409 4.52977324 0.51426059
		 4.54112864 0.52320319 4.54819727 0.53581029 4.54990387 0.55016297 4.54598713 0.56407589
		 4.65531063 0.74291277 4.65531063 0.74792504 4.64624453 0.77814925 4.64624453 0.78528023
		 4.68452358 0.74291283 4.68452358 0.74792504 4.66804361 0.77814919 4.66804361 0.78528005
		 4.70773506 0.74291277 4.70773506 0.74792516 4.71428156 0.77814919 4.71428156 0.78528029
		 4.73356819 0.74291283 4.73356819 0.74792528 4.74246836 0.77814966 4.74246836 0.78528053
		 4.75509405 0.74291277 4.75509405 0.74792504 4.76921844 0.77814966 4.76921844 0.78528059
		 4.77778196 0.74291277 4.77778196 0.74792504 4.78999043 0.77814966 4.78999043 0.78528059
		 4.80100489 0.74291283 4.80100489 0.7479251 4.81217289 0.77814966 4.81217289 0.78528053
		 4.60492134 0.22208327 4.61142063 0.22179514 4.61023283 0.23957062 4.60397196 0.23914808
		 4.60252523 0.20512694 4.60873413 0.20404357 4.66422367 0.23609388 4.65457439 0.23650545
		 4.65346289 0.22161806 4.66328287 0.22156268 4.65463352 0.20670247 4.66410112 0.20719689
		 4.62339163 0.22154915 4.62829351 0.22154915 4.62829351 0.24134761 4.62339163 0.24134761
		 4.62339163 0.2017507 4.62829351 0.2017507 4.73102427 0.6609202 4.70639658 0.66167605
		 4.75727081 0.66211832 4.61689615 0.22148037 4.61374855 0.20212334 4.61628771 0.24097484
		 4.72763872 0.70815033 4.74437141 0.70816082 4.74624157 0.72073209 4.73522329 0.71968359
		 4.71123791 0.72996533 4.71125317 0.70813984 4.73521519 0.72998202 4.7108717 0.67773753
		 4.73484945 0.67766082 4.73488283 0.68799627 4.71093988 0.69956267 4.74590397 0.68852717
		 4.74405766 0.69946206 4.72732544 0.69951266 4.64514446 0.22157764 4.64694023 0.20545149
		 4.64932537 0.20611894 4.64776516 0.22159904 4.65174389 0.20648724 4.65038013 0.22161651
		 4.65165806 0.23669785 4.64684916 0.23775256 4.75580502 0.6943562 4.75335407 0.69802356
		 4.74923086 0.69944704 4.7458725 0.67763144 4.75434065 0.67760718 4.75764179 0.68770319
		 4.74954462 0.70816422 4.75367069 0.70957851 4.75613022 0.71324039 4.75798225 0.71988946
		 4.754704 0.72999239 4.74623585 0.72998726 4.64924717 0.23707616 4.54933119 0.50449538
		 4.53885889 0.49749792 4.56168461 0.47467184 4.59396553 0.47467172 4.59150839 0.48702556
		 4.58451033 0.49749798 4.56168461 0.5069527 4.57403755 0.5044955 4.59150839 0.46231794
		 4.53186131 0.48702532 4.52940369 0.47467196 4.53186083 0.46231872 4.57403755 0.44484812
		 4.58451033 0.45184547 4.56168413 0.44239104 4.53885841 0.45184606 4.54933119 0.44484842
		 4.60517979 0.54993129 4.62949657 0.549891 4.62949276 0.55617499 4.81822443 0.54987693
		 4.81823015 0.55621684 3.14279222 2.65184355 3.16563511 2.65184331 3.16563511 2.66580772
		 3.14279222 2.66580796 3.18843174 2.65184355 3.18843174 2.66580772 3.21123695 2.65184355
		 3.21123695 2.66580772 3.23398733 2.65184355 3.23398685 2.66580772 3.25670815 2.65184379
		 3.25670815 2.66580796 3.27942324 2.65184379 3.27942324 2.66580772 3.30213881 2.65184379
		 3.30213881 2.66580796 3.32485342 2.65184379 3.32485342 2.66580796 3.34756756 2.65184331
		 3.34756756 2.66580796 3.37028408 2.65184331 3.37028408 2.66580796 3.39303589 2.65184331
		 3.39303589 2.66580796 3.41607571 2.65184331 3.41607571 2.66580796 3.43961143 2.65184331
		 3.43961143 2.66580796 3.46389771 2.65184331 3.46389771 2.66580796 3.0040884018 2.65184379
		 3.028375626 2.65184379 3.028375626 2.66580772 3.0040884018 2.66580772 3.051929951
		 2.65184379 3.051929951 2.66580772 3.07514286 2.65184331 3.07514286 2.66580772 3.098121643
		 2.65184355 3.098121643 2.66580772 3.12070751 2.65184355 3.12070751 2.66580772 3.16601801
		 2.64533567 3.14347887 2.64533567 3.14347887 2.63953853 3.16601801 2.63953853 3.18952703
		 2.64533567 3.18952703 2.63953853 3.2120657 2.64533567 3.2120657 2.63953853 3.23477173
		 2.64533567 3.23477173 2.63953853 3.25745964 2.64533567 3.25745964 2.63953853 3.28014612
		 2.64533567 3.28014612 2.63953853 3.3028326 2.64533567 3.3028326 2.63953853 3.32551861
		 2.64533567 3.32551861 2.63953853 3.34820652 2.64533567 3.34820652 2.63953853 3.37089252
		 2.64533567 3.37089252 2.63953853 3.39357853 2.64533567 3.39357853 2.63953853 3.41620731
		 2.64533567 3.41620731 2.63953853 3.43993664 2.64533567 3.43993664 2.63953853 3.46458626
		 2.64533567 3.46458626 2.63953853 3.029747486 2.64533567 3.0047893524 2.64564562 3.0047893524
		 2.63922882 3.029747486 2.63953853 3.053365707 2.64533567 3.053365707 2.63953853 3.076060295
		 2.64533567 3.076060295 2.63953853 3.099107265 2.64533567 3.099107265 2.63953853 3.12186193
		 2.64533567 3.12186193 2.63953853 3.14337301 2.67203212 3.16573238 2.67203188 3.16573238
		 2.67806864 3.14337301 2.67806864 3.18745899 2.67203212 3.18745899 2.6780684 3.21020699
		 2.67203259 3.21020699 2.6780684 3.23320198 2.67203259 3.23320198 2.67806888 3.25594044
		 2.67203259 3.25594044 2.67806888 3.27857971 2.67203259 3.27857971 2.67806888 3.30122614
		 2.67203259 3.30122614 2.67806888 3.32387352 2.67203259 3.32387352 2.67806888 3.34651852
		 2.67203355 3.34651852 2.67806983 3.36916733 2.67203355 3.36916733 2.67806983 3.39181328
		 2.67203355;
	setAttr ".uvst[0].uvsp[750:768]" 3.39181328 2.67806983 3.41437912 2.67203355
		 3.41437912 2.67806983 3.43788338 2.67203355 3.43788338 2.67806983 3.46265697 2.6718061
		 3.46265697 2.67829728 3.0040636063 2.67203259 3.028565884 2.67203259 3.028565884
		 2.67806888 3.0040636063 2.67806888 3.05216217 2.67203164 3.05216217 2.67806792 3.074756622
		 2.67203307 3.074756622 2.6780684 3.0974226 2.67203259 3.0974226 2.6780684 3.11993599
		 2.67203212 3.11993599 2.6780684;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 388 ".pt";
	setAttr ".pt[0:165]" -type "float3"  -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228;
	setAttr ".pt[166:331]" -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228;
	setAttr ".pt[332:387]" -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228;
	setAttr -s 388 ".vt";
	setAttr ".vt[0:165]"  1.4551919e-09 0.048248276 -5.1896553 4.6599581e-16 -0.048247818 -5.1896553
		 4.6637862e-16 0.05569154 -5.21855164 4.6637862e-16 -0.055691246 -5.21855164 -1.746225e-10 0.053034481 -5.21855164
		 4.6637862e-16 -0.053034194 -5.21855164 -0.0026977928 -0.052449811 -5.21855164 -0.0020716283 -0.047665566 -5.21855164
		 4.6027728e-16 0.048227005 -5.19498062 4.6027712e-16 -0.048220225 -5.19497967 -0.0020806489 0.047817029 -5.19497967
		 -0.00207166 0.047727861 -5.21855164 0.044575363 0.018463854 -5.1896553 0.034116518 0.034116618 -5.1896553
		 0.01846374 0.044575382 -5.1896553 0.01846371 -0.044575259 -5.1896553 0.034116495 -0.034116372 -5.1896553
		 0.044575352 -0.018463625 -5.1896553 0.048248008 -4.6368598e-10 -5.1896553 0.05145216 0.021312421 -5.21855164
		 0.039379794 0.039379872 -5.21855164 0.021312207 0.051452428 -5.21855164 0.021312173 -0.051451977 -5.21855164
		 0.039379772 -0.039379641 -5.21855164 0.051452149 -0.021312203 -5.21855164 0.05569141 9.2967412e-11 -5.21855164
		 0.044462308 0.01841696 -5.21855164 0.044462308 -0.018416731 -5.21855164 0.034029976 -0.034029882 -5.21855164
		 0.018416883 -0.044462234 -5.21855164 0.018416915 0.044462353 -5.21855164 0.034029994 0.034030128 -5.21855164
		 0.048997402 0.020295504 -5.21855164 0.037501 0.037501179 -5.21855164 0.020295413 0.048997499 -5.21855164
		 0.020295378 -0.048997208 -5.21855164 0.037500981 -0.037500795 -5.21855164 0.048997391 -0.020295272 -5.21855164
		 0.053034399 -1.0581402e-10 -5.21855164 0.052550185 0.0024343752 -5.21855164 0.047765996 0.0018080923 -5.21855164
		 0.05254494 -0.002460612 -5.21855164 0.047760751 -0.0018343267 -5.21855164 0.0026977928 -0.052449811 -5.21855164
		 0.044539671 -0.018448904 -5.19497967 0.034089189 -0.034089036 -5.19497967 0.01844893 -0.044539571 -5.19497967
		 0.047831945 -0.0018435866 -5.19497967 0.0481987 -4.6746607e-10 -5.19497967 0.047837198 0.001817657 -5.19497967
		 0.044527423 0.018444039 -5.19497967 0.034079824 0.03407985 -5.19497967 0.018443881 0.044527467 -5.19497967
		 0.00207166 0.047727861 -5.21855164 0.0026978278 0.05251212 -5.21855164 0.050774291 -0.0019007702 -5.19498825
		 0.051141042 -2.9971119e-09 -5.19498825 0.050779544 0.0018745287 -5.19498825 4.7269081e-16 -0.055691246 -5.24432278
		 0.021312173 -0.051451977 -5.24432278 0.039379772 -0.039379641 -5.24432278 0.051452149 -0.021312203 -5.24432278
		 0.05569141 9.2967412e-11 -5.24432278 0.05145216 0.021312421 -5.24432278 0.039379794 0.039379872 -5.24432278
		 0.021312207 0.051452428 -5.24432278 4.7269081e-16 0.05569154 -5.24432278 4.7269081e-16 -0.044948053 -5.24432278
		 0.017200949 -0.041526675 -5.24432278 0.031783219 -0.031783 -5.24432278 0.041526772 -0.017200775 -5.24432278
		 0.044948261 2.697405e-09 -5.24432278 0.041526783 0.017200999 -5.24432278 0.031783238 0.031783238 -5.24432278
		 0.017200978 0.041526817 -5.24432278 4.7269081e-16 0.044948339 -5.24432278 4.696794e-16 -0.044948053 -5.23202801
		 0.017200949 -0.041526675 -5.23202801 0.031783219 -0.031783 -5.23202801 0.041526772 -0.017200775 -5.23202801
		 0.041526783 0.017200999 -5.23202801 0.031783238 0.031783238 -5.23202801 0.017200978 0.041526817 -5.23202801
		 4.696794e-16 0.044948339 -5.23202801 4.7118505e-16 -0.033756949 -5.23202801 0.012918313 -0.031187374 -5.23202801
		 0.023869939 -0.023869956 -5.23202801 0.031187572 -0.012918122 -5.23202801 0.031187579 0.012918357 -5.23202801
		 0.02386995 0.023869911 -5.23202801 0.012918338 0.031187689 -5.23202801 4.7118505e-16 0.033757232 -5.23202801
		 4.7221399e-16 -0.033756949 -5.24042988 0.012918313 -0.031187374 -5.24042988 0.023869939 -0.023869956 -5.24042988
		 0.031187572 -0.012918122 -5.24042988 0.033757191 6.0379648e-09 -5.24042988 0.031187579 0.012918357 -5.24042988
		 0.02386995 0.023869911 -5.24042988 0.012918338 0.031187689 -5.24042988 4.7221399e-16 0.033757232 -5.24042988
		 4.7173727e-16 -0.022953041 -5.24042988 0.0087837838 -0.021205917 -5.24042988 0.01623033 -0.016230274 -5.24042988
		 0.021205934 -0.0087835286 -5.24042988 0.022953145 6.8933588e-09 -5.24042988 0.021205939 0.0087837726 -5.24042988
		 0.016230328 0.016230561 -5.24042988 0.008783807 0.021205936 -5.24042988 4.7221399e-16 0.022953317 -5.24042988
		 4.6356509e-16 -0.022953041 -5.20706463 0.0087837838 -0.021205917 -5.20706463 0.01623033 -0.016230274 -5.20706463
		 0.021205934 -0.0087835286 -5.20706463 0.022953145 6.999386e-09 -5.20706463 0.021205939 0.0087837726 -5.20706463
		 0.016230328 0.016230561 -5.20706463 0.008783807 0.021205936 -5.20706463 4.681279e-16 0.022953317 -5.20706463
		 4.5928604e-16 -9.4977821e-09 -5.1908617 4.7249848e-16 -0.032662615 -5.24275303 4.7230626e-16 -0.024706956 -5.24275303
		 0.012499494 -0.030176168 -5.24275303 0.0094549302 -0.022826061 -5.24275303 0.023096062 -0.023096021 -5.24275303
		 0.017470447 -0.017470431 -5.24275303 0.030176453 -0.012499413 -5.24275303 0.022826225 -0.0094547225 -5.24275303
		 0.032662764 5.5312768e-09 -5.24275303 0.024706937 8.5192653e-09 -5.24275303 0.030176461 0.01249965 -5.24275303
		 0.022826232 0.0094549647 -5.24275303 0.023096073 0.023096288 -5.24275303 0.017470445 0.017470716 -5.24275303
		 0.012499519 0.030176478 -5.24275303 0.0094549553 0.022826388 -5.24275303 4.7249848e-16 0.032662898 -5.24275303
		 4.7249848e-16 0.024706924 -5.24275303 0.041526772 -0.017200775 -5.24997234 0.044948261 2.697405e-09 -5.24997234
		 0.031187572 -0.012918122 -5.24901009 0.033757191 5.9942238e-09 -5.24901009 0.041526783 0.017200999 -5.24997234
		 0.031187579 0.012918357 -5.24901009 0.041526772 -0.017200775 -5.25431442 0.044948261 2.697405e-09 -5.25431442
		 0.041526783 0.017200999 -5.25431442 0.036672689 -0.015073634 -5.24432278 0.040094178 3.4466723e-09 -5.24432278
		 0.036365308 -0.015062761 -5.24997234 0.040094178 3.4466723e-09 -5.24997234 0.0366727 0.015122492 -5.24432278
		 0.037142154 0.015385006 -5.24997234 0.036739629 -0.015217941 -5.25599289 0.039766695 4.2238639e-09 -5.25599289
		 0.03673964 0.015218169 -5.25599289 0.033590358 -0.013913386 -5.25504112 0.031187572 -0.012918122 -5.25166225
		 0.031856295 -0.013195137 -5.25377846 0.033757191 5.9942238e-09 -5.25166225 0.034481011 5.7809899e-09 -5.25377846
		 0.036357947 5.2280456e-09 -5.25504112 0.033590365 0.013913614 -5.25504112 0.031856302 0.013195369 -5.25377846
		 0.031187579 0.012918357 -5.25166225 -0.044575363 0.018463854 -5.1896553;
	setAttr ".vt[166:331]" -0.034116518 0.034116618 -5.1896553 -0.01846374 0.044575382 -5.1896553
		 -0.01846371 -0.044575259 -5.1896553 -0.034116495 -0.034116372 -5.1896553 -0.044575352 -0.018463625 -5.1896553
		 -0.048248008 -4.6368598e-10 -5.1896553 -0.05145216 0.021312421 -5.21855164 -0.039379794 0.039379872 -5.21855164
		 -0.021312207 0.051452428 -5.21855164 -0.021312173 -0.051451977 -5.21855164 -0.039379772 -0.039379641 -5.21855164
		 -0.051452149 -0.021312203 -5.21855164 -0.05569141 9.2967412e-11 -5.21855164 -0.044462308 0.01841696 -5.21855164
		 -0.044462308 -0.018416731 -5.21855164 -0.034029976 -0.034029882 -5.21855164 -0.018416883 -0.044462234 -5.21855164
		 -0.018416915 0.044462353 -5.21855164 -0.034029994 0.034030128 -5.21855164 -0.048997402 0.020295504 -5.21855164
		 -0.037501 0.037501179 -5.21855164 -0.020295413 0.048997499 -5.21855164 -0.020295378 -0.048997208 -5.21855164
		 -0.037500981 -0.037500795 -5.21855164 -0.048997391 -0.020295272 -5.21855164 -0.053034399 -1.0581402e-10 -5.21855164
		 -0.052550185 0.0024343752 -5.21855164 -0.047765996 0.0018080923 -5.21855164 -0.05254494 -0.002460612 -5.21855164
		 -0.047760751 -0.0018343267 -5.21855164 -0.044539671 -0.018448904 -5.19497967 -0.034089189 -0.034089036 -5.19497967
		 -0.01844893 -0.044539571 -5.19497967 -0.047831945 -0.0018435866 -5.19497967 -0.0481987 -4.6746607e-10 -5.19497967
		 -0.047837198 0.001817657 -5.19497967 -0.044527423 0.018444039 -5.19497967 -0.034079824 0.03407985 -5.19497967
		 -0.018443881 0.044527467 -5.19497967 -0.050774291 -0.0019007702 -5.19498825 -0.051141042 -2.9971119e-09 -5.19498825
		 -0.050779544 0.0018745287 -5.19498825 -0.021312173 -0.051451977 -5.24432278 -0.039379772 -0.039379641 -5.24432278
		 -0.051452149 -0.021312203 -5.24432278 -0.05569141 9.2967412e-11 -5.24432278 -0.05145216 0.021312421 -5.24432278
		 -0.039379794 0.039379872 -5.24432278 -0.021312207 0.051452428 -5.24432278 -0.017200949 -0.041526675 -5.24432278
		 -0.031783219 -0.031783 -5.24432278 -0.041526772 -0.017200775 -5.24432278 -0.044948261 2.697405e-09 -5.24432278
		 -0.041526783 0.017200999 -5.24432278 -0.031783238 0.031783238 -5.24432278 -0.017200978 0.041526817 -5.24432278
		 -0.017200949 -0.041526675 -5.23202801 -0.031783219 -0.031783 -5.23202801 -0.041526772 -0.017200775 -5.23202801
		 -0.041526783 0.017200999 -5.23202801 -0.031783238 0.031783238 -5.23202801 -0.017200978 0.041526817 -5.23202801
		 -0.012918313 -0.031187374 -5.23202801 -0.023869939 -0.023869956 -5.23202801 -0.031187572 -0.012918122 -5.23202801
		 -0.031187579 0.012918357 -5.23202801 -0.02386995 0.023869911 -5.23202801 -0.012918338 0.031187689 -5.23202801
		 -0.012918313 -0.031187374 -5.24042988 -0.023869939 -0.023869956 -5.24042988 -0.031187572 -0.012918122 -5.24042988
		 -0.033757191 6.0379648e-09 -5.24042988 -0.031187579 0.012918357 -5.24042988 -0.02386995 0.023869911 -5.24042988
		 -0.012918338 0.031187689 -5.24042988 -0.0087837838 -0.021205917 -5.24042988 -0.01623033 -0.016230274 -5.24042988
		 -0.021205934 -0.0087835286 -5.24042988 -0.022953145 6.8933588e-09 -5.24042988 -0.021205939 0.0087837726 -5.24042988
		 -0.016230328 0.016230561 -5.24042988 -0.008783807 0.021205936 -5.24042988 -0.0087837838 -0.021205917 -5.20706463
		 -0.01623033 -0.016230274 -5.20706463 -0.021205934 -0.0087835286 -5.20706463 -0.022953145 6.999386e-09 -5.20706463
		 -0.021205939 0.0087837726 -5.20706463 -0.016230328 0.016230561 -5.20706463 -0.008783807 0.021205936 -5.20706463
		 -0.012499494 -0.030176168 -5.24275303 -0.0094549302 -0.022826061 -5.24275303 -0.023096062 -0.023096021 -5.24275303
		 -0.017470447 -0.017470431 -5.24275303 -0.030176453 -0.012499413 -5.24275303 -0.022826225 -0.0094547225 -5.24275303
		 -0.032662764 5.5312768e-09 -5.24275303 -0.024706937 8.5192653e-09 -5.24275303 -0.030176461 0.01249965 -5.24275303
		 -0.022826232 0.0094549647 -5.24275303 -0.023096073 0.023096288 -5.24275303 -0.017470445 0.017470716 -5.24275303
		 -0.012499519 0.030176478 -5.24275303 -0.0094549553 0.022826388 -5.24275303 -0.041526772 -0.017200775 -5.24997234
		 -0.044948261 2.697405e-09 -5.24997234 -0.031187572 -0.012918122 -5.24901009 -0.033757191 5.9942238e-09 -5.24901009
		 -0.041526783 0.017200999 -5.24997234 -0.031187579 0.012918357 -5.24901009 -0.041526772 -0.017200775 -5.25431442
		 -0.044948261 2.697405e-09 -5.25431442 -0.041526783 0.017200999 -5.25431442 -0.036672689 -0.015073634 -5.24432278
		 -0.040094178 3.4466723e-09 -5.24432278 -0.036365308 -0.015062761 -5.24997234 -0.040094178 3.4466723e-09 -5.24997234
		 -0.0366727 0.015122492 -5.24432278 -0.037142154 0.015385006 -5.24997234 -0.036739629 -0.015217941 -5.25599289
		 -0.039766695 4.2238639e-09 -5.25599289 -0.03673964 0.015218169 -5.25599289 -0.033590358 -0.013913386 -5.25504112
		 -0.031187572 -0.012918122 -5.25166225 -0.031856295 -0.013195137 -5.25377846 -0.033757191 5.9942238e-09 -5.25166225
		 -0.034481011 5.7809899e-09 -5.25377846 -0.036357947 5.2280456e-09 -5.25504112 -0.033590365 0.013913614 -5.25504112
		 -0.031856302 0.013195369 -5.25377846 -0.031187579 0.012918357 -5.25166225 4.6597718e-16 2.5336118e-07 -5.18950319
		 -0.0020837178 -0.047758028 -5.19498062 -0.0026978278 0.05251212 -5.21855164 4.6027987e-16 0.051357709 -5.19499111
		 -0.0020991487 0.050947681 -5.19499111 4.6027966e-16 -0.051162682 -5.19499016 -0.0020621503 -0.050700355 -5.19499016
		 0.0020716283 -0.047665566 -5.21855164 0.0020837178 -0.047758028 -5.19498062 0.0020806489 0.047817029 -5.19497967
		 0.0020991487 0.050947681 -5.19499111 0.0020621503 -0.050700355 -5.19499016 -0.042172767 0.013702986 -5.17266273
		 -0.035874303 0.026064251 -5.17266273 -0.026064202 0.03587446 -5.17266273 -0.013702759 0.042172823 -5.17266273
		 4.6391486e-16 0.044343188 -5.17266273 0.013702759 0.042172823 -5.17266273 0.026064191 0.035874411 -5.17266273
		 0.035874277 0.026064217 -5.17266273 0.042172745 0.013702977 -5.17266273 0.044343047 0 -5.17266273
		 0.042172745 -0.013702672 -5.17266273 0.035874274 -0.026063908 -5.17266273 0.026064187 -0.035874087 -5.17266273
		 0.013702757 -0.042172641 -5.17266273 1.321526e-09 -0.044342857 -5.17266273 -0.01370275 -0.042172641 -5.17266273
		 -0.026064182 -0.035874076 -5.17266273 -0.03587427 -0.026063899 -5.17266273 -0.042172741 -0.013702657 -5.17266273
		 -0.044343043 0 -5.17266273 -0.042172767 0.013702986 -5.18111801 -0.035874303 0.026064251 -5.18111801
		 -0.026064202 0.03587446 -5.18111801 -0.013702759 0.042172823 -5.18111801;
	setAttr ".vt[332:387]" 4.6495025e-16 0.044343188 -5.18111801 0.013702759 0.042172823 -5.18111801
		 0.026064191 0.035874411 -5.18111801 0.035874277 0.026064217 -5.18111801 0.042172745 0.013702977 -5.18111801
		 0.044343047 0 -5.18111801 0.042172745 -0.013702672 -5.18111801 0.035874274 -0.026063908 -5.18111801
		 0.026064187 -0.035874087 -5.18111801 0.013702757 -0.042172641 -5.18111801 1.321526e-09 -0.044342857 -5.18111801
		 -0.01370275 -0.042172641 -5.18111801 -0.026064182 -0.035874076 -5.18111801 -0.03587427 -0.026063899 -5.18111801
		 -0.042172741 -0.013702657 -5.18111801 -0.044343043 0 -5.18111801 -0.03998873 0.012993175 -5.17266273
		 -0.034016445 0.024714492 -5.17266273 -0.024714397 0.03401652 -5.17266273 -0.012993125 0.039988901 -5.17266273
		 4.6391486e-16 0.042046685 -5.17266273 0.012993124 0.039988901 -5.17266273 0.024714386 0.03401649 -5.17266273
		 0.03401643 0.024714462 -5.17266273 0.039988723 0.01299315 -5.17266273 0.042046621 0 -5.17266273
		 0.039988723 -0.012992846 -5.17266273 0.034016427 -0.02471415 -5.17266273 0.024714382 -0.03401617 -5.17266273
		 0.012993122 -0.039988577 -5.17266273 1.3824323e-09 -0.042046495 -5.17266273 -0.012993115 -0.039988577 -5.17266273
		 -0.024714377 -0.034016158 -5.17266273 -0.034016423 -0.024714138 -5.17266273 -0.039988704 -0.012992841 -5.17266273
		 -0.042046614 5.8068963e-09 -5.17266273 -0.03998873 0.012993175 -5.18111801 -0.034016445 0.024714492 -5.18111801
		 -0.024714397 0.03401652 -5.18111801 -0.012993125 0.039988901 -5.18111801 4.6495025e-16 0.042046685 -5.18111801
		 0.012993124 0.039988901 -5.18111801 0.024714386 0.03401649 -5.18111801 0.03401643 0.024714462 -5.18111801
		 0.039988723 0.01299315 -5.18111801 0.042046621 0 -5.18111801 0.039988723 -0.012992846 -5.18111801
		 0.034016427 -0.02471415 -5.18111801 0.024714382 -0.03401617 -5.18111801 0.012993122 -0.039988577 -5.18111801
		 1.3824323e-09 -0.042046495 -5.18111801 -0.012993115 -0.039988577 -5.18111801 -0.024714377 -0.034016158 -5.18111801
		 -0.034016423 -0.024714138 -5.18111801 -0.039988704 -0.012992841 -5.18111801 -0.042046614 5.8068963e-09 -5.18111801;
	setAttr -s 750 ".ed";
	setAttr ".ed[0:165]"  3 5 0 7 297 0 4 299 0 13 14 0 15 16 0 16 17 0 19 32 0
		 20 33 0 21 34 0 22 35 0 23 36 0 24 37 0 25 38 0 20 21 0 22 23 0 23 24 0 19 20 0 12 13 0
		 26 50 1 27 44 1 28 45 1 29 46 1 30 52 1 31 51 1 27 28 0 28 29 0 30 31 0 31 26 0 32 26 0
		 33 31 0 34 30 0 35 29 0 36 28 0 37 27 0 32 33 0 33 34 0 5 43 0 35 36 0 36 37 0 38 39 0
		 26 40 0 25 19 0 39 32 0 39 40 0 18 12 0 40 49 0 41 38 0 41 42 0 42 47 0 24 25 0 37 41 0
		 42 27 0 17 18 0 3 22 0 1 15 0 9 304 0 44 17 1 45 16 1 46 15 1 44 45 0 45 46 0 48 18 1
		 47 48 0 48 49 0 50 12 1 51 13 1 52 14 1 50 51 0 51 52 0 49 50 0 44 47 0 14 0 0 54 4 0
		 53 54 0 21 2 0 299 306 0 306 54 0 43 307 0 47 55 0 48 56 0 55 56 0 41 55 0 38 56 1
		 49 57 0 39 57 0 56 57 0 58 3 1 59 22 1 60 23 1 61 24 1 62 25 1 63 19 1 64 20 1 65 21 1
		 66 2 1 58 59 0 59 60 0 60 61 0 61 62 0 62 63 0 63 64 0 64 65 0 65 66 0 58 67 0 59 68 1
		 67 68 0 60 69 1 68 69 0 61 70 1 69 70 0 62 71 1 70 71 1 63 72 1 71 72 1 64 73 1 72 73 0
		 65 74 1 73 74 0 66 75 0 74 75 0 67 76 1 68 77 1 76 77 0 69 78 1 77 78 0 70 79 0 78 79 0
		 72 80 0 73 81 1 80 81 0 74 82 1 81 82 0 75 83 1 82 83 0 76 84 0 77 85 1 84 85 0 78 86 1
		 85 86 0 79 87 0 86 87 0 80 88 0 81 89 1 88 89 0 82 90 1 89 90 0 83 91 0 90 91 0 84 92 1
		 85 93 1 92 93 0 86 94 1 93 94 0 87 95 0 94 95 0 95 96 0 88 97 0 96 97 0 89 98 1 97 98 0
		 90 99 1 98 99 0 91 100 1 99 100 0 101 102 0 102 103 0;
	setAttr ".ed[166:331]" 103 104 0 104 105 0 105 106 0 106 107 0 107 108 0 108 109 0
		 101 110 1 102 111 1 110 111 1 103 112 1 111 112 1 104 113 1 112 113 1 105 114 1 113 114 1
		 106 115 1 114 115 1 107 116 1 115 116 1 108 117 1 116 117 1 109 118 1 117 118 1 110 119 1
		 111 119 1 112 119 1 113 119 1 114 119 1 115 119 1 116 119 1 117 119 1 118 119 1 92 120 1
		 101 121 1 120 121 0 93 122 1 120 122 0 102 123 1 121 123 0 122 123 1 94 124 1 122 124 0
		 103 125 1 123 125 0 124 125 1 95 126 1 124 126 0 104 127 1 125 127 0 126 127 1 96 128 1
		 126 128 0 105 129 1 127 129 0 128 129 1 97 130 1 128 130 0 106 131 1 129 131 0 130 131 1
		 98 132 1 130 132 0 107 133 1 131 133 0 132 133 1 99 134 1 132 134 0 108 135 1 133 135 0
		 134 135 1 100 136 1 134 136 0 109 137 1 135 137 0 136 137 0 138 139 0 140 141 1 139 142 0
		 141 143 1 96 141 1 95 140 0 97 143 0 138 144 0 139 145 1 144 145 0 140 157 0 144 153 0
		 145 154 1 142 146 0 145 146 0 143 164 0 146 155 0 70 147 0 71 148 1 147 148 0 147 149 0
		 139 150 0 149 150 0 148 150 1 72 151 0 148 151 0 142 152 0 150 152 0 151 152 0 138 149 0
		 149 140 1 152 143 1 97 151 1 87 147 1 153 156 0 155 162 0 153 154 1 154 155 1 156 158 0
		 161 156 1 158 157 0 157 159 1 161 160 1 160 163 1 163 162 0 162 161 1 160 159 1 159 164 1
		 164 163 0 141 159 1 161 154 1 158 160 1 166 167 0 168 169 0 169 170 0 172 185 0 173 186 0
		 174 187 0 175 188 0 176 189 0 177 190 0 178 191 0 173 174 0 175 176 0 176 177 0 172 173 0
		 165 166 0 179 202 1 180 196 1 181 197 1 182 198 1 183 204 1 184 203 1 180 181 0 181 182 0
		 183 184 0 184 179 0 185 179 0 186 184 0 187 183 0 188 182 0 189 181 0 190 180 0 185 186 0
		 186 187 0 188 189 0 189 190 0 191 192 0 179 193 0 178 172 0 192 185 0;
	setAttr ".ed[332:497]" 192 193 0 171 165 0 193 201 0 194 191 0 194 195 0 195 199 0
		 177 178 0 190 194 0 195 180 0 170 171 0 182 7 0 3 175 0 6 188 0 1 168 0 196 170 1
		 197 169 1 198 168 1 196 197 0 197 198 0 200 171 1 199 200 0 200 201 0 202 165 1 203 166 1
		 204 167 1 202 203 0 203 204 0 201 202 0 196 199 0 297 198 0 187 298 0 167 0 0 10 204 0
		 11 183 0 174 2 0 199 205 0 200 206 0 205 206 0 194 205 0 191 206 1 201 207 0 192 207 0
		 206 207 0 208 175 1 209 176 1 210 177 1 211 178 1 212 172 1 213 173 1 214 174 1 58 208 0
		 208 209 0 209 210 0 210 211 0 211 212 0 212 213 0 213 214 0 214 66 0 208 215 1 67 215 0
		 209 216 1 215 216 0 210 217 1 216 217 0 211 218 1 217 218 1 212 219 1 218 219 1 213 220 1
		 219 220 0 214 221 1 220 221 0 221 75 0 215 222 1 76 222 0 216 223 1 222 223 0 217 224 0
		 223 224 0 219 225 0 220 226 1 225 226 0 221 227 1 226 227 0 227 83 0 222 228 1 84 228 0
		 223 229 1 228 229 0 224 230 0 229 230 0 225 231 0 226 232 1 231 232 0 227 233 1 232 233 0
		 233 91 0 228 234 1 92 234 0 229 235 1 234 235 0 230 236 0 235 236 0 236 237 0 231 238 0
		 237 238 0 232 239 1 238 239 0 233 240 1 239 240 0 240 100 0 101 241 0 241 242 0 242 243 0
		 243 244 0 244 245 0 245 246 0 246 247 0 247 109 0 241 248 1 110 248 1 242 249 1 248 249 1
		 243 250 1 249 250 1 244 251 1 250 251 1 245 252 1 251 252 1 246 253 1 252 253 1 247 254 1
		 253 254 1 254 118 1 248 119 1 249 119 1 250 119 1 251 119 1 252 119 1 253 119 1 254 119 1
		 234 255 1 120 255 0 241 256 1 121 256 0 255 256 1 235 257 1 255 257 0 242 258 1 256 258 0
		 257 258 1 236 259 1 257 259 0 243 260 1 258 260 0 259 260 1 237 261 1 259 261 0 244 262 1
		 260 262 0 261 262 1 238 263 1 261 263 0 245 264 1 262 264 0 263 264 1;
	setAttr ".ed[498:663]" 239 265 1 263 265 0 246 266 1 264 266 0 265 266 1 240 267 1
		 265 267 0 247 268 1 266 268 0 267 268 1 267 136 0 268 137 0 269 270 0 271 272 1 270 273 0
		 272 274 1 237 272 1 236 271 0 238 274 0 269 275 0 270 276 1 275 276 0 271 288 0 275 284 0
		 276 285 1 273 277 0 276 277 0 274 295 0 277 286 0 217 278 0 218 279 1 278 279 0 278 280 0
		 270 281 0 280 281 0 279 281 1 219 282 0 279 282 0 273 283 0 281 283 0 282 283 0 269 280 0
		 280 271 1 283 274 1 238 282 1 230 278 1 284 287 0 286 293 0 284 285 1 285 286 1 287 289 0
		 292 287 1 289 288 0 288 290 1 292 291 1 291 294 1 294 293 0 293 292 1 291 290 1 290 295 1
		 295 294 0 272 290 1 292 285 1 289 291 1 298 4 0 2 4 0 6 302 0 6 7 0 8 10 0 9 301 0
		 10 300 0 43 35 0 53 30 0 34 54 0 13 296 1 14 296 1 15 296 1 16 296 1 17 296 1 12 296 1
		 18 296 1 1 296 1 0 296 1 166 296 1 167 296 1 168 296 1 169 296 1 170 296 1 165 296 1
		 171 296 1 9 1 0 8 0 0 5 6 0 5 301 0 8 305 0 8 299 0 9 297 0 297 302 0 10 11 0 11 298 0
		 300 298 0 299 300 0 301 302 0 301 307 0 43 303 0 303 304 0 29 303 0 304 307 0 304 46 0
		 305 53 0 305 306 0 305 52 0 308 309 0 309 310 0 310 311 0 311 312 0 312 313 0 313 314 0
		 314 315 0 315 316 0 316 317 0 317 318 0 318 319 0 319 320 0 320 321 0 321 322 0 322 323 0
		 323 324 0 324 325 0 325 326 0 326 327 0 327 308 0 328 329 0 329 330 0 330 331 0 331 332 0
		 332 333 0 333 334 0 334 335 0 335 336 0 336 337 0 337 338 0 338 339 0 339 340 0 340 341 0
		 341 342 0 342 343 0 343 344 0 344 345 0 345 346 0 346 347 0 347 328 0 308 328 1 309 329 1
		 310 330 1 311 331 1 312 332 1 313 333 1 314 334 1 315 335 1 316 336 1 317 337 1 318 338 1
		 319 339 1 320 340 1 321 341 1;
	setAttr ".ed[664:749]" 322 342 1 323 343 1 324 344 1 325 345 1 326 346 1 327 347 1
		 308 348 1 309 349 1 348 349 0 310 350 1 349 350 0 311 351 1 350 351 0 312 352 1 351 352 0
		 313 353 1 352 353 0 314 354 1 353 354 0 315 355 1 354 355 0 316 356 1 355 356 0 317 357 1
		 356 357 0 318 358 1 357 358 0 319 359 1 358 359 0 320 360 1 359 360 0 321 361 1 360 361 0
		 322 362 1 361 362 0 323 363 1 362 363 0 324 364 1 363 364 0 325 365 1 364 365 0 326 366 1
		 365 366 0 327 367 1 366 367 0 367 348 0 328 368 1 329 369 1 368 369 0 330 370 1 369 370 0
		 331 371 1 370 371 0 332 372 1 371 372 0 333 373 1 372 373 0 334 374 1 373 374 0 335 375 1
		 374 375 0 336 376 1 375 376 0 337 377 1 376 377 0 338 378 1 377 378 0 339 379 1 378 379 0
		 340 380 1 379 380 0 341 381 1 380 381 0 342 382 1 381 382 0 343 383 1 382 383 0 344 384 1
		 383 384 0 345 385 1 384 385 0 346 386 1 385 386 0 347 387 1 386 387 0 387 368 0;
	setAttr -s 364 -ch 1460 ".fc[0:363]" -type "polyFaces"
		f 4 27 -29 34 29
		mu 0 4 0 1 2 3
		f 4 35 30 26 -30
		mu 0 4 3 4 5 0
		f 4 37 32 25 -32
		mu 0 4 6 7 8 9
		f 4 38 33 24 -33
		mu 0 4 7 10 11 8
		f 4 51 -34 50 47
		mu 0 4 12 11 10 13
		f 4 100 92 -17 -92
		mu 0 4 14 15 16 17
		f 4 101 93 -14 -93
		mu 0 4 15 18 19 16
		f 4 102 94 -75 -94
		mu 0 4 18 20 21 19
		f 4 95 87 -54 -87
		mu 0 4 22 23 24 25
		f 4 96 88 -15 -88
		mu 0 4 26 27 28 29
		f 4 97 89 -16 -89
		mu 0 4 27 30 31 28
		f 4 98 90 -50 -90
		mu 0 4 30 32 33 31
		f 4 99 91 -42 -91
		mu 0 4 32 14 17 33
		f 5 69 64 -45 -62 63
		mu 0 5 34 35 36 37 38
		f 5 62 61 -53 -57 70
		mu 0 5 39 38 37 40 41
		f 4 -25 19 59 -21
		mu 0 4 8 11 41 42
		f 4 -26 20 60 -22
		mu 0 4 9 8 42 43
		f 4 68 66 -4 -66
		mu 0 4 44 45 46 47
		f 4 -65 67 65 -18
		mu 0 4 36 35 44 47
		f 4 -35 -7 16 7
		mu 0 4 3 2 48 49
		f 4 13 8 -36 -8
		mu 0 4 49 50 4 3
		f 5 74 563 -73 -572 -9
		mu 0 5 50 51 52 53 4
		f 5 -37 -1 53 9 -570
		mu 0 5 54 55 56 57 58
		f 4 14 10 -38 -10
		mu 0 4 59 60 7 6
		f 4 15 11 -39 -11
		mu 0 4 60 61 10 7
		f 5 -51 -12 49 12 -47
		mu 0 5 13 10 61 62 63
		f 5 -40 -13 41 6 -43
		mu 0 5 64 63 62 48 2
		f 4 40 -44 42 28
		mu 0 4 1 65 64 2
		f 4 604 -603 569 31
		mu 0 4 66 67 54 58
		f 4 -60 56 -6 -58
		mu 0 4 42 41 40 68
		f 4 -61 57 -5 -59
		mu 0 4 43 42 68 69
		f 4 -81 -82 46 82
		mu 0 4 70 71 72 73
		f 4 39 84 -86 -83
		mu 0 4 73 74 75 70
		f 4 -68 -19 -28 23
		mu 0 4 44 35 1 0
		f 4 -27 22 -69 -24
		mu 0 4 0 5 45 44
		f 4 -70 -46 -41 18
		mu 0 4 35 34 65 1
		f 4 -71 -20 -52 48
		mu 0 4 39 41 11 12
		f 4 -607 -604 -605 21
		mu 0 4 76 77 67 66
		f 4 -571 -608 609 -23
		mu 0 4 5 78 79 45
		f 4 571 -74 570 -31
		mu 0 4 4 53 78 5
		f 4 -63 78 80 -80
		mu 0 4 80 81 82 83
		f 4 -49 -48 81 -79
		mu 0 4 84 85 86 87
		f 4 45 83 -85 43
		mu 0 4 88 89 90 91
		f 4 -64 79 85 -84
		mu 0 4 92 80 83 93
		f 4 -96 103 105 -105
		mu 0 4 94 95 96 97
		f 4 -97 104 107 -107
		mu 0 4 98 99 100 101
		f 4 -98 106 109 -109
		mu 0 4 102 98 101 103
		f 4 -99 108 111 -111
		mu 0 4 104 102 103 105
		f 4 -100 110 113 -113
		mu 0 4 106 104 105 107
		f 4 -101 112 115 -115
		mu 0 4 108 106 107 109
		f 4 -102 114 117 -117
		mu 0 4 110 108 109 111
		f 4 -103 116 119 -119
		mu 0 4 112 110 111 113
		f 4 -106 120 122 -122
		mu 0 4 114 115 116 117
		f 4 -108 121 124 -124
		mu 0 4 118 119 120 121
		f 4 -110 123 126 -126
		mu 0 4 122 118 121 123
		f 4 -116 127 129 -129
		mu 0 4 124 125 126 127
		f 4 -118 128 131 -131
		mu 0 4 128 124 127 129
		f 4 -120 130 133 -133
		mu 0 4 130 128 129 131
		f 4 -123 134 136 -136
		mu 0 4 132 133 134 135
		f 4 -125 135 138 -138
		mu 0 4 136 137 138 139
		f 4 -127 137 140 -140
		mu 0 4 140 136 139 141
		f 4 -251 252 277 -254
		mu 0 4 142 143 144 145
		f 4 -256 253 278 -258
		mu 0 4 146 142 145 147
		f 4 -130 141 143 -143
		mu 0 4 148 149 150 151
		f 4 -132 142 145 -145
		mu 0 4 152 148 151 153
		f 4 -134 144 147 -147
		mu 0 4 154 152 153 155
		f 4 -137 148 150 -150
		mu 0 4 156 157 158 159
		f 4 -139 149 152 -152
		mu 0 4 160 161 162 163
		f 4 -141 151 154 -154
		mu 0 4 164 160 163 165
		f 4 -144 156 159 -159
		mu 0 4 166 167 168 169
		f 4 -146 158 161 -161
		mu 0 4 170 166 169 171
		f 4 -148 160 163 -163
		mu 0 4 172 170 171 173
		f 4 -203 200 204 -206
		mu 0 4 174 175 176 177
		f 4 -208 205 209 -211
		mu 0 4 178 179 180 181
		f 4 -213 210 214 -216
		mu 0 4 182 178 181 183
		f 4 -218 215 219 -221
		mu 0 4 184 182 183 185
		f 4 -223 220 224 -226
		mu 0 4 186 184 185 187
		f 4 -228 225 229 -231
		mu 0 4 188 186 187 189
		f 4 -233 230 234 -236
		mu 0 4 190 188 189 191
		f 4 -238 235 239 -241
		mu 0 4 192 190 191 193
		f 4 -165 172 174 -174
		mu 0 4 194 195 196 197
		f 4 -166 173 176 -176
		mu 0 4 198 199 200 201
		f 4 -167 175 178 -178
		mu 0 4 202 198 201 203
		f 4 -168 177 180 -180
		mu 0 4 204 202 203 205
		f 4 -169 179 182 -182
		mu 0 4 206 204 205 207
		f 4 -170 181 184 -184
		mu 0 4 208 206 207 209
		f 4 -171 183 186 -186
		mu 0 4 210 208 209 211
		f 4 -172 185 188 -188
		mu 0 4 212 210 211 213
		f 3 -175 189 -191
		mu 0 3 214 215 216
		f 3 -177 190 -192
		mu 0 3 217 214 216
		f 3 -179 191 -193
		mu 0 3 218 217 216
		f 3 -181 192 -194
		mu 0 3 219 218 216
		f 3 -183 193 -195
		mu 0 3 220 219 216
		f 3 -185 194 -196
		mu 0 3 221 220 216
		f 3 -187 195 -197
		mu 0 3 222 221 216
		f 3 -189 196 -198
		mu 0 3 223 222 216
		f 4 -151 198 202 -202
		mu 0 4 224 225 226 227
		f 4 164 203 -205 -200
		mu 0 4 228 229 230 231
		f 4 -153 201 207 -207
		mu 0 4 232 233 234 235
		f 4 165 208 -210 -204
		mu 0 4 236 237 238 239
		f 4 -155 206 212 -212
		mu 0 4 240 232 235 241
		f 4 166 213 -215 -209
		mu 0 4 237 242 243 238
		f 4 -156 211 217 -217
		mu 0 4 244 240 241 245
		f 4 167 218 -220 -214
		mu 0 4 242 246 247 243
		f 4 -158 216 222 -222
		mu 0 4 248 244 245 249
		f 4 168 223 -225 -219
		mu 0 4 246 250 251 247
		f 4 -160 221 227 -227
		mu 0 4 252 248 249 253
		f 4 169 228 -230 -224
		mu 0 4 250 254 255 251
		f 4 -162 226 232 -232
		mu 0 4 256 252 253 257
		f 4 170 233 -235 -229
		mu 0 4 254 258 259 255
		f 4 -164 231 237 -237
		mu 0 4 260 256 257 261
		f 4 171 238 -240 -234
		mu 0 4 258 262 263 259
		f 4 -261 261 263 -265
		mu 0 4 264 265 266 267
		f 4 -267 264 268 -270
		mu 0 4 268 264 267 269
		f 4 155 245 -243 -247
		mu 0 4 270 271 272 273
		f 4 157 247 -245 -246
		mu 0 4 271 274 275 272
		f 4 -242 248 250 -250
		mu 0 4 276 277 278 279
		f 4 -244 249 255 -255
		mu 0 4 280 276 279 281
		f 4 -112 258 260 -260
		mu 0 4 105 103 282 283
		f 4 -114 259 266 -266
		mu 0 4 107 105 283 284
		f 4 243 267 -269 -263
		mu 0 4 285 286 269 267
		f 4 241 262 -264 -271
		mu 0 4 287 285 267 266
		f 4 273 269 272 -248
		mu 0 4 288 289 290 291
		f 5 -128 265 -274 -157 -142
		mu 0 5 292 293 289 288 294
		f 4 139 274 -259 125
		mu 0 4 295 296 297 298
		f 5 -275 153 246 -272 -262
		mu 0 5 297 296 299 300 301
		f 4 283 284 285 286
		mu 0 4 302 303 304 305
		f 4 287 288 289 -285
		mu 0 4 303 306 307 304
		f 4 242 290 -283 -252
		mu 0 4 273 272 306 308
		f 4 244 256 -289 -291
		mu 0 4 272 275 307 306
		f 4 -278 275 -281 291
		mu 0 4 145 144 309 302
		f 4 -279 -292 -287 -277
		mu 0 4 147 145 302 305
		f 8 -276 -253 -249 270 271 251 -282 -280
		mu 0 8 310 311 312 313 301 300 314 315
		f 8 -273 -268 254 257 276 -286 -290 -257
		mu 0 8 291 290 316 317 318 319 320 321
		f 4 279 292 -284 280
		mu 0 4 309 322 303 302
		f 4 281 282 -288 -293
		mu 0 4 322 308 306 303
		f 4 2 75 76 72
		mu 0 4 323 324 325 326
		f 4 36 77 -602 -592
		mu 0 4 327 328 329 330
		f 4 592 608 -76 -594
		mu 0 4 331 332 333 334
		f 4 607 73 -77 -609
		mu 0 4 335 336 337 338
		f 4 603 605 -78 602
		mu 0 4 339 340 341 342
		f 4 -56 567 601 -606
		mu 0 4 343 344 345 346
		f 4 -320 -325 318 -318
		mu 0 4 347 348 349 350
		f 4 319 -317 -321 -326
		mu 0 4 348 347 351 352
		f 4 321 -316 -323 -327
		mu 0 4 353 354 355 356
		f 4 322 -315 -324 -328
		mu 0 4 356 355 357 358
		f 4 -337 -340 323 -341
		mu 0 4 359 360 358 357
		f 4 379 306 -381 -388
		mu 0 4 361 362 363 364
		f 4 380 303 -382 -389
		mu 0 4 364 363 365 366
		f 4 381 366 -95 -390
		mu 0 4 366 365 21 20
		f 4 86 343 -376 -383
		mu 0 4 22 25 367 368
		f 4 375 304 -377 -384
		mu 0 4 368 367 369 370
		f 4 376 305 -378 -385
		mu 0 4 370 369 371 372
		f 4 377 338 -379 -386
		mu 0 4 372 371 373 374
		f 4 378 330 -380 -387
		mu 0 4 374 373 362 361
		f 4 310 -350 -310 314
		mu 0 4 355 375 376 357
		f 4 311 -351 -311 315
		mu 0 4 354 377 375 355
		f 4 -563 -599 -600 -3
		mu 0 4 323 378 379 324
		f 4 355 293 -357 -359
		mu 0 4 380 381 382 383
		f 4 307 -356 -358 354
		mu 0 4 384 381 380 385
		f 4 -298 -307 296 324
		mu 0 4 348 386 387 349
		f 4 297 325 -299 -304
		mu 0 4 386 348 352 388
		f 5 298 362 562 -564 -367
		mu 0 5 388 352 389 52 51
		f 5 344 -300 -344 0 590
		mu 0 5 390 353 391 56 55
		f 4 299 326 -301 -305
		mu 0 4 391 353 356 392
		f 4 300 327 -302 -306
		mu 0 4 392 356 358 393
		f 5 335 -303 -339 301 339
		mu 0 5 360 394 395 393 358
		f 5 331 -297 -331 302 328
		mu 0 5 396 349 387 395 394
		f 4 -319 -332 332 -330
		mu 0 4 350 349 396 397
		f 4 -322 -345 565 -343
		mu 0 4 354 353 390 398
		f 4 591 600 -565 -591
		mu 0 4 327 330 399 400
		f 4 347 295 -347 349
		mu 0 4 375 401 402 376
		f 4 348 294 -348 350
		mu 0 4 377 403 401 375
		f 4 -372 -336 370 369
		mu 0 4 404 405 406 407
		f 4 371 374 -374 -329
		mu 0 4 405 404 408 409
		f 4 -314 317 308 357
		mu 0 4 380 347 350 385
		f 4 313 358 -313 316
		mu 0 4 347 380 383 351
		f 4 -309 329 334 359
		mu 0 4 385 350 397 410
		f 4 -338 340 309 360
		mu 0 4 411 359 357 376
		f 4 -312 342 1 361
		mu 0 4 377 354 398 412
		f 4 312 -365 596 365
		mu 0 4 351 383 413 414
		f 4 320 -366 597 -363
		mu 0 4 352 351 414 389
		f 4 593 599 -569 -567
		mu 0 4 331 334 415 416
		f 4 568 598 -598 -597
		mu 0 4 417 418 419 420
		f 4 -566 564 -596 -2
		mu 0 4 421 422 423 424
		f 4 595 -601 -568 594
		mu 0 4 425 426 345 344
		f 4 368 -370 -368 352
		mu 0 4 427 428 429 430
		f 4 367 -371 336 337
		mu 0 4 431 432 433 434
		f 4 -333 373 -373 -335
		mu 0 4 435 436 437 438
		f 4 372 -375 -369 353
		mu 0 4 439 440 428 427
		f 5 -354 351 333 -355 -360
		mu 0 5 410 441 442 384 385
		f 5 -361 346 341 -352 -353
		mu 0 5 411 376 402 442 441
		f 4 390 -392 -104 382
		mu 0 4 443 444 96 95
		f 4 392 -394 -391 383
		mu 0 4 445 446 444 443
		f 4 394 -396 -393 384
		mu 0 4 447 448 446 445
		f 4 396 -398 -395 385
		mu 0 4 449 450 448 447
		f 4 398 -400 -397 386
		mu 0 4 451 452 450 449
		f 4 400 -402 -399 387
		mu 0 4 453 454 452 451
		f 4 402 -404 -401 388
		mu 0 4 455 456 454 453
		f 4 118 -405 -403 389
		mu 0 4 112 113 456 455
		f 4 405 -407 -121 391
		mu 0 4 457 458 116 115
		f 4 407 -409 -406 393
		mu 0 4 459 460 458 457
		f 4 409 -411 -408 395
		mu 0 4 461 462 460 459
		f 4 412 -414 -412 401
		mu 0 4 463 464 465 466
		f 4 414 -416 -413 403
		mu 0 4 467 468 464 463
		f 4 132 -417 -415 404
		mu 0 4 130 131 468 467
		f 4 417 -419 -135 406
		mu 0 4 469 470 134 133
		f 4 419 -421 -418 408
		mu 0 4 471 472 470 469
		f 4 421 -423 -420 410
		mu 0 4 473 474 472 471
		f 4 522 -547 -522 519
		mu 0 4 475 476 477 478
		f 4 526 -548 -523 524
		mu 0 4 479 480 476 475
		f 4 424 -426 -424 413
		mu 0 4 481 482 483 484
		f 4 426 -428 -425 415
		mu 0 4 485 486 482 481
		f 4 146 -429 -427 416
		mu 0 4 154 155 486 485
		f 4 429 -431 -149 418
		mu 0 4 487 488 158 157
		f 4 431 -433 -430 420
		mu 0 4 489 490 488 487
		f 4 433 -435 -432 422
		mu 0 4 491 492 490 489
		f 4 438 -440 -437 425
		mu 0 4 493 494 495 496
		f 4 440 -442 -439 427
		mu 0 4 497 498 494 493
		f 4 162 -443 -441 428
		mu 0 4 172 173 498 497
		f 4 477 -477 -201 474
		mu 0 4 499 500 176 175
		f 4 482 -482 -478 479
		mu 0 4 501 502 500 499
		f 4 487 -487 -483 484
		mu 0 4 503 504 502 501
		f 4 492 -492 -488 489
		mu 0 4 505 506 504 503
		f 4 497 -497 -493 494
		mu 0 4 507 508 506 505
		f 4 502 -502 -498 499
		mu 0 4 509 510 508 507
		f 4 507 -507 -503 504
		mu 0 4 511 512 510 509
		f 4 240 -510 -508 508
		mu 0 4 192 193 512 511
		f 4 451 -453 -173 443
		mu 0 4 513 514 196 195
		f 4 453 -455 -452 444
		mu 0 4 515 516 514 513
		f 4 455 -457 -454 445
		mu 0 4 517 518 516 515
		f 4 457 -459 -456 446
		mu 0 4 519 520 518 517
		f 4 459 -461 -458 447
		mu 0 4 521 522 520 519
		f 4 461 -463 -460 448
		mu 0 4 523 524 522 521
		f 4 463 -465 -462 449
		mu 0 4 525 526 524 523
		f 4 187 -466 -464 450
		mu 0 4 212 213 526 525
		f 3 466 -190 452
		mu 0 3 527 216 215
		f 3 467 -467 454
		mu 0 3 528 216 527
		f 3 468 -468 456
		mu 0 3 529 216 528
		f 3 469 -469 458
		mu 0 3 530 216 529
		f 3 470 -470 460
		mu 0 3 531 216 530
		f 3 471 -471 462
		mu 0 3 532 216 531
		f 3 472 -472 464
		mu 0 3 533 216 532
		f 3 197 -473 465
		mu 0 3 223 216 533
		f 4 473 -475 -199 430
		mu 0 4 534 535 226 225
		f 4 199 476 -476 -444
		mu 0 4 228 231 536 537
		f 4 478 -480 -474 432
		mu 0 4 538 539 535 534
		f 4 475 481 -481 -445
		mu 0 4 537 536 540 541
		f 4 483 -485 -479 434
		mu 0 4 542 543 539 538
		f 4 480 486 -486 -446
		mu 0 4 541 540 544 545
		f 4 488 -490 -484 435
		mu 0 4 546 547 543 542
		f 4 485 491 -491 -447
		mu 0 4 545 544 548 549
		f 4 493 -495 -489 437
		mu 0 4 550 551 547 546
		f 4 490 496 -496 -448
		mu 0 4 549 548 552 553
		f 4 498 -500 -494 439
		mu 0 4 554 555 551 550
		f 4 495 501 -501 -449
		mu 0 4 553 552 556 557
		f 4 503 -505 -499 441
		mu 0 4 558 559 555 554
		f 4 500 506 -506 -450
		mu 0 4 557 556 560 561
		f 4 236 -509 -504 442
		mu 0 4 260 261 559 558
		f 4 505 509 -239 -451
		mu 0 4 561 560 263 262
		f 4 533 -533 -531 529
		mu 0 4 562 563 564 565
		f 4 538 -538 -534 535
		mu 0 4 566 567 563 562
		f 4 515 511 -515 -436
		mu 0 4 568 569 570 571
		f 4 514 513 -517 -438
		mu 0 4 571 570 572 573
		f 4 518 -520 -518 510
		mu 0 4 574 575 576 577
		f 4 523 -525 -519 512
		mu 0 4 578 579 575 574
		f 4 528 -530 -528 397
		mu 0 4 450 580 581 448
		f 4 534 -536 -529 399
		mu 0 4 452 582 580 450
		f 4 531 537 -537 -513
		mu 0 4 583 563 567 584
		f 4 539 532 -532 -511
		mu 0 4 585 564 563 583
		f 4 516 -542 -539 -543
		mu 0 4 586 587 588 589
		f 5 423 436 542 -535 411
		mu 0 5 590 591 586 589 592
		f 4 -410 527 -544 -422
		mu 0 4 593 594 595 596
		f 5 530 540 -516 -434 543
		mu 0 5 595 597 598 599 596
		f 4 -556 -555 -554 -553
		mu 0 4 600 601 602 603
		f 4 553 -559 -558 -557
		mu 0 4 603 602 604 605
		f 4 520 551 -560 -512
		mu 0 4 569 606 605 570
		f 4 559 557 -526 -514
		mu 0 4 570 605 604 572
		f 4 -561 549 -545 546
		mu 0 4 476 600 607 477
		f 4 545 555 560 547
		mu 0 4 480 601 600 476
		f 8 548 550 -521 -541 -540 517 521 544
		mu 0 8 608 609 610 598 597 611 612 613
		f 8 525 558 554 -546 -527 -524 536 541
		mu 0 8 587 614 615 616 617 618 619 588
		f 4 -550 552 -562 -549
		mu 0 4 607 600 603 620
		f 4 561 556 -552 -551
		mu 0 4 620 603 605 606
		f 3 3 573 -573
		mu 0 3 621 622 623
		f 3 4 575 -575
		mu 0 3 624 625 623
		f 3 5 576 -576
		mu 0 3 625 626 623
		f 3 17 572 -578
		mu 0 3 627 621 623
		f 3 44 577 -579
		mu 0 3 628 627 623
		f 3 52 578 -577
		mu 0 3 626 628 623
		f 3 54 574 -580
		mu 0 3 629 624 623
		f 3 71 580 -574
		mu 0 3 622 630 623
		f 3 -294 581 -583
		mu 0 3 631 632 623
		f 3 -295 583 -585
		mu 0 3 633 634 623
		f 3 -296 584 -586
		mu 0 3 635 633 623
		f 3 -308 586 -582
		mu 0 3 632 636 623
		f 3 -334 587 -587
		mu 0 3 636 637 623
		f 3 -342 585 -588
		mu 0 3 637 635 623
		f 3 -346 579 -584
		mu 0 3 634 629 623
		f 3 -364 582 -581
		mu 0 3 630 631 623
		f 5 -55 -589 55 606 58
		mu 0 5 638 639 640 77 76
		f 5 345 -349 -362 -595 588
		mu 0 5 639 403 377 412 640
		f 5 363 -590 566 364 356
		mu 0 5 382 641 642 413 383
		f 5 -72 -67 -610 -593 589
		mu 0 5 641 46 45 79 642
		f 4 610 651 -631 -651
		mu 0 4 643 644 645 646
		f 4 611 652 -632 -652
		mu 0 4 644 647 648 645
		f 4 612 653 -633 -653
		mu 0 4 647 649 650 648
		f 4 613 654 -634 -654
		mu 0 4 649 651 652 650
		f 4 614 655 -635 -655
		mu 0 4 651 653 654 652
		f 4 615 656 -636 -656
		mu 0 4 653 655 656 654
		f 4 616 657 -637 -657
		mu 0 4 655 657 658 656
		f 4 617 658 -638 -658
		mu 0 4 657 659 660 658
		f 4 618 659 -639 -659
		mu 0 4 659 661 662 660
		f 4 619 660 -640 -660
		mu 0 4 661 663 664 662
		f 4 620 661 -641 -661
		mu 0 4 663 665 666 664
		f 4 621 662 -642 -662
		mu 0 4 665 667 668 666
		f 4 622 663 -643 -663
		mu 0 4 667 669 670 668
		f 4 623 664 -644 -664
		mu 0 4 669 671 672 670
		f 4 624 665 -645 -665
		mu 0 4 673 674 675 676
		f 4 625 666 -646 -666
		mu 0 4 674 677 678 675
		f 4 626 667 -647 -667
		mu 0 4 677 679 680 678
		f 4 627 668 -648 -668
		mu 0 4 679 681 682 680
		f 4 628 669 -649 -669
		mu 0 4 681 683 684 682
		f 4 629 650 -650 -670
		mu 0 4 683 643 646 684
		f 4 -611 670 672 -672
		mu 0 4 685 686 687 688
		f 4 -612 671 674 -674
		mu 0 4 689 685 688 690
		f 4 -613 673 676 -676
		mu 0 4 691 689 690 692
		f 4 -614 675 678 -678
		mu 0 4 693 691 692 694
		f 4 -615 677 680 -680
		mu 0 4 695 693 694 696
		f 4 -616 679 682 -682
		mu 0 4 697 695 696 698
		f 4 -617 681 684 -684
		mu 0 4 699 697 698 700
		f 4 -618 683 686 -686
		mu 0 4 701 699 700 702
		f 4 -619 685 688 -688
		mu 0 4 703 701 702 704
		f 4 -620 687 690 -690
		mu 0 4 705 703 704 706
		f 4 -621 689 692 -692
		mu 0 4 707 705 706 708
		f 4 -622 691 694 -694
		mu 0 4 709 707 708 710
		f 4 -623 693 696 -696
		mu 0 4 711 709 710 712
		f 4 -624 695 698 -698
		mu 0 4 713 711 712 714
		f 4 -625 697 700 -700
		mu 0 4 715 716 717 718
		f 4 -626 699 702 -702
		mu 0 4 719 715 718 720
		f 4 -627 701 704 -704
		mu 0 4 721 719 720 722
		f 4 -628 703 706 -706
		mu 0 4 723 721 722 724
		f 4 -629 705 708 -708
		mu 0 4 725 723 724 726
		f 4 -630 707 709 -671
		mu 0 4 686 725 726 687
		f 4 630 711 -713 -711
		mu 0 4 727 728 729 730
		f 4 631 713 -715 -712
		mu 0 4 728 731 732 729
		f 4 632 715 -717 -714
		mu 0 4 731 733 734 732
		f 4 633 717 -719 -716
		mu 0 4 733 735 736 734
		f 4 634 719 -721 -718
		mu 0 4 735 737 738 736
		f 4 635 721 -723 -720
		mu 0 4 737 739 740 738
		f 4 636 723 -725 -722
		mu 0 4 739 741 742 740
		f 4 637 725 -727 -724
		mu 0 4 741 743 744 742
		f 4 638 727 -729 -726
		mu 0 4 743 745 746 744
		f 4 639 729 -731 -728
		mu 0 4 745 747 748 746
		f 4 640 731 -733 -730
		mu 0 4 747 749 750 748
		f 4 641 733 -735 -732
		mu 0 4 749 751 752 750
		f 4 642 735 -737 -734
		mu 0 4 751 753 754 752
		f 4 643 737 -739 -736
		mu 0 4 753 755 756 754
		f 4 644 739 -741 -738
		mu 0 4 757 758 759 760
		f 4 645 741 -743 -740
		mu 0 4 758 761 762 759
		f 4 646 743 -745 -742
		mu 0 4 761 763 764 762
		f 4 647 745 -747 -744
		mu 0 4 763 765 766 764
		f 4 648 747 -749 -746
		mu 0 4 765 767 768 766
		f 4 649 710 -750 -748
		mu 0 4 767 727 730 768;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "fertilizer_hose" -p "hose_main_component1";
	rename -uid "F7003F72-439B-00A5-1179-2DB54D972192";
	addAttr -ci true -sn "i3D_objectMask" -ln "i3D_objectMask" -at "long";
	addAttr -ci true -sn "i3D_dynamic" -ln "i3D_dynamic" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_joint" -ln "i3D_joint" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_dynamicFriction" -ln "i3D_dynamicFriction" -at "float";
	addAttr -ci true -sn "i3D_ccd" -ln "i3D_ccd" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_density" -ln "i3D_density" -at "float";
	addAttr -ci true -sn "i3D_splitType" -ln "i3D_splitType" -at "long";
	addAttr -ci true -sn "i3D_splitMinU" -ln "i3D_splitMinU" -at "float";
	addAttr -ci true -sn "i3D_splitMinV" -ln "i3D_splitMinV" -at "float";
	addAttr -ci true -sn "i3D_driveForceLimit" -ln "i3D_driveForceLimit" -at "float";
	addAttr -ci true -sn "i3D_angularDamping" -ln "i3D_angularDamping" -at "float";
	addAttr -ci true -sn "i3D_splitUvWorldScale" -ln "i3D_splitUvWorldScale" -at "float";
	addAttr -ci true -sn "i3D_projection" -ln "i3D_projection" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_driveSpring" -ln "i3D_driveSpring" -at "float";
	addAttr -ci true -sn "i3D_breakableJoint" -ln "i3D_breakableJoint" -min 0 -max 1
		-at "bool";
	addAttr -ci true -sn "i3D_projDistance" -ln "i3D_projDistance" -at "float";
	addAttr -ci true -sn "i3D_driveDamping" -ln "i3D_driveDamping" -at "float";
	addAttr -ci true -sn "i3D_xAxisDrive" -ln "i3D_xAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_compound" -ln "i3D_compound" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_clipDistance" -ln "i3D_clipDistance" -at "float";
	addAttr -ci true -sn "i3D_collision" -ln "i3D_collision" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_scaled" -ln "i3D_scaled" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_projAngle" -ln "i3D_projAngle" -at "float";
	addAttr -ci true -sn "i3D_mergeGroupRoot" -ln "i3D_mergeGroupRoot" -min 0 -max 1
		-at "bool";
	addAttr -ci true -sn "i3D_jointBreakTorque" -ln "i3D_jointBreakTorque" -at "float";
	addAttr -ci true -sn "i3D_restitution" -ln "i3D_restitution" -at "float";
	addAttr -ci true -sn "i3D_yAxisDrive" -ln "i3D_yAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeGroup" -ln "i3D_mergeGroup" -at "long";
	addAttr -ci true -sn "i3D_jointBreakForce" -ln "i3D_jointBreakForce" -at "float";
	addAttr -ci true -sn "i3D_lod1" -ln "i3D_lod1" -at "float";
	addAttr -ci true -sn "i3D_lod2" -ln "i3D_lod2" -at "float";
	addAttr -ci true -sn "i3D_oc" -ln "i3D_oc" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_kinematic" -ln "i3D_kinematic" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_trigger" -ln "i3D_trigger" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_static" -ln "i3D_static" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lightMask" -ln "i3D_lightMask" -dt "string";
	addAttr -ci true -sn "i3D_linearDamping" -ln "i3D_linearDamping" -at "float";
	addAttr -ci true -sn "i3D_lod3" -ln "i3D_lod3" -at "float";
	addAttr -ci true -sn "i3D_drivePos" -ln "i3D_drivePos" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lod" -ln "i3D_lod" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_solverIterationCount" -ln "i3D_solverIterationCount" -at "long";
	addAttr -ci true -sn "i3D_nonRenderable" -ln "i3D_nonRenderable" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_boundingVolume" -ln "i3D_boundingVolume" -dt "string";
	addAttr -ci true -sn "i3D_collisionMask" -ln "i3D_collisionMask" -at "long";
	addAttr -ci true -sn "i3D_zAxisDrive" -ln "i3D_zAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_cpuMesh" -ln "i3D_cpuMesh" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_staticFriction" -ln "i3D_staticFriction" -at "float";
	addAttr -ci true -sn "i3D_decalLayer" -ln "i3D_decalLayer" -at "long";
	addAttr -ci true -sn "i3D_splitMaxV" -ln "i3D_splitMaxV" -at "float";
	addAttr -ci true -sn "i3D_splitMaxU" -ln "i3D_splitMaxU" -at "float";
	addAttr -ci true -sn "i3D_compoundChild" -ln "i3D_compoundChild" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_xmlIdentifier" -ln "i3D_xmlIdentifier" -dt "string";
	setAttr ".t" -type "double3" 1.1175870918921271e-08 1.3038516044616699e-08 -0.242 ;
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".rpt" -type "double3" 8.1571104543527599e-49 0 0 ;
	setAttr ".i3D_objectMask" 255;
	setAttr ".i3D_dynamicFriction" 0.5;
	setAttr ".i3D_density" 1;
	setAttr ".i3D_driveForceLimit" 100000;
	setAttr ".i3D_angularDamping" 0.0099999997764825821;
	setAttr ".i3D_splitUvWorldScale" 1;
	setAttr ".i3D_driveSpring" 1;
	setAttr ".i3D_projDistance" 0.0099999997764825821;
	setAttr ".i3D_driveDamping" 0.0099999997764825821;
	setAttr ".i3D_clipDistance" 300;
	setAttr ".i3D_projAngle" 0.0099999997764825821;
	setAttr ".i3D_lightMask" -type "string" "FFFF";
	setAttr ".i3D_solverIterationCount" 4;
	setAttr ".i3D_boundingVolume" -type "string" "";
	setAttr ".i3D_collisionMask" 255;
	setAttr ".i3D_staticFriction" 0.5;
	setAttr ".i3D_splitMaxV" 1;
	setAttr ".i3D_splitMaxU" 1;
	setAttr ".i3D_xmlIdentifier" -type "string" "fertilizer_hose";
createNode mesh -n "fertilizer_hoseShape" -p "fertilizer_hose";
	rename -uid "D314BA13-4FD7-2544-74A1-1E8E4D368CA7";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.77500003576278687 0.061849428340792656 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 966 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 1.35000002 -1 1.37499988 -1
		 1.37499988 -0.96221071 1.35000002 -0.96221071 1.4000001 -1 1.4000001 -0.96221071
		 1.37499988 -0.91409045 1.35000002 -0.91409045 1.32499993 -1 1.32499993 -0.96221071
		 1.4000001 -0.91409045 1.37499988 -0.86597013 1.35000002 -0.86597013 1.32499993 -0.91409045
		 1.30000007 -1 1.30000007 -0.96221071 1.4000001 -0.86597013 1.37499988 -0.81784976
		 1.35000002 -0.81784976 1.32499993 -0.86597013 1.30000007 -0.91409045 1.2750001 -1
		 1.2750001 -0.96221071 1.4000001 -0.81784976 1.37499988 -0.76972944 1.35000002 -0.76972944
		 1.32499993 -0.81784976 1.30000007 -0.86597013 1.2750001 -0.91409045 1.25 -1 1.25
		 -0.96221071 1.4000001 -0.76972944 1.37499988 -0.72160912 1.35000002 -0.72160912 1.32499993
		 -0.76972944 1.30000007 -0.81784976 1.2750001 -0.86597013 1.25 -0.91409045 1.4000001
		 -0.72160912 1.37499988 -0.6734888 1.35000002 -0.6734888 1.32499993 -0.72160912 1.30000007
		 -0.76972944 1.2750001 -0.81784976 1.25 -0.86597013 1.4000001 -0.6734888 1.37499988
		 -0.62536848 1.35000002 -0.62536848 1.32499993 -0.6734888 1.30000007 -0.72160912 1.2750001
		 -0.76972944 1.25 -0.81784976 1.4000001 -0.62536848 1.37499988 -0.5772481 1.35000002
		 -0.5772481 1.32499993 -0.62536848 1.30000007 -0.6734888 1.2750001 -0.72160912 1.25
		 -0.76972944 1.4000001 -0.5772481 1.37499988 -0.52912778 1.35000002 -0.52912778 1.32499993
		 -0.5772481 1.30000007 -0.62536848 1.2750001 -0.6734888 1.25 -0.72160912 1.4000001
		 -0.52912778 1.37499988 -0.48100746 1.35000002 -0.48100746 1.32499993 -0.52912778
		 1.30000007 -0.5772481 1.2750001 -0.62536848 1.25 -0.6734888 1.4000001 -0.48100746
		 1.37499988 -0.43288708 1.35000002 -0.43288708 1.32499993 -0.48100746 1.30000007 -0.52912778
		 1.2750001 -0.5772481 1.25 -0.62536848 1.4000001 -0.43288708 1.37499988 -0.38476682
		 1.35000002 -0.38476682 1.32499993 -0.43288708 1.30000007 -0.48100746 1.2750001 -0.52912778
		 1.25 -0.5772481 1.4000001 -0.38476682 1.37499988 -0.33664644 1.35000002 -0.33664644
		 1.32499993 -0.38476682 1.30000007 -0.43288708 1.2750001 -0.48100746 1.25 -0.52912778
		 1.4000001 -0.33664644 1.37499988 -0.28852618 1.35000002 -0.28852618 1.32499993 -0.33664644
		 1.30000007 -0.38476682 1.2750001 -0.43288708 1.25 -0.48100746 1.4000001 -0.28852618
		 1.37499988 -0.24040574 1.35000002 -0.24040574 1.32499993 -0.28852618 1.30000007 -0.33664644
		 1.2750001 -0.38476682 1.25 -0.43288708 1.4000001 -0.24040574 1.37499988 -0.19228548
		 1.35000002 -0.19228548 1.32499993 -0.24040574 1.30000007 -0.28852618 1.2750001 -0.33664644
		 1.25 -0.38476682 1.4000001 -0.19228548 1.37499988 -0.14416516 1.35000002 -0.14416516
		 1.32499993 -0.19228548 1.30000007 -0.24040574 1.2750001 -0.28852618 1.25 -0.33664644
		 1.4000001 -0.14416516 1.37499988 -0.096044719 1.35000002 -0.096044719 1.32499993
		 -0.14416516 1.30000007 -0.19228548 1.2750001 -0.24040574 1.25 -0.28852618 1.4000001
		 -0.096044719 1.37499988 -0.047924519 1.35000002 -0.047924519 1.32499993 -0.096044719
		 1.30000007 -0.14416516 1.2750001 -0.19228548 1.25 -0.24040574 1.4000001 -0.047924519
		 1.37499988 0 1.35000002 0 1.32499993 -0.047924519 1.30000007 -0.096044719 1.2750001
		 -0.14416516 1.25 -0.19228548 1.4000001 0 1.32499993 0 1.30000007 -0.047924519 1.2750001
		 -0.096044719 1.25 -0.14416516 1.30000007 0 1.2750001 -0.047924519 1.25 -0.096044719
		 1.2750001 0 1.25 -0.047924519 1.25 0 1.52499998 -1 1.54999995 -1 1.54999995 -0.96221071
		 1.52499998 -0.96221071 1.57499993 -1 1.57499993 -0.96221071 1.54999995 -0.91409045
		 1.52499998 -0.91409045 1.5 -1 1.5 -0.96221071 1.60000002 -1 1.60000002 -0.96221071
		 1.57499993 -0.91409045 1.54999995 -0.86597013 1.52499998 -0.86597013 1.5 -0.91409045
		 1.625 -1 1.625 -0.96221071 1.60000002 -0.91409045 1.57499993 -0.86597013 1.54999995
		 -0.81784976 1.52499998 -0.81784976 1.5 -0.86597013 1.64999998 -1 1.64999998 -0.96221071
		 1.625 -0.91409045 1.60000002 -0.86597013 1.57499993 -0.81784976 1.54999995 -0.76972944
		 1.52499998 -0.76972944 1.5 -0.81784976 1.64999998 -0.91409045 1.625 -0.86597013 1.60000002
		 -0.81784976 1.57499993 -0.76972944 1.54999995 -0.72160912 1.52499998 -0.72160912
		 1.5 -0.76972944 1.64999998 -0.86597013 1.625 -0.81784976 1.60000002 -0.76972944 1.57499993
		 -0.72160912 1.54999995 -0.6734888 1.52499998 -0.6734888 1.5 -0.72160912 1.64999998
		 -0.81784976 1.625 -0.76972944 1.60000002 -0.72160912 1.57499993 -0.6734888 1.54999995
		 -0.62536848 1.52499998 -0.62536848 1.5 -0.6734888 1.64999998 -0.76972944 1.625 -0.72160912
		 1.60000002 -0.6734888 1.57499993 -0.62536848 1.54999995 -0.5772481 1.52499998 -0.5772481
		 1.5 -0.62536848 1.64999998 -0.72160912 1.625 -0.6734888 1.60000002 -0.62536848 1.57499993
		 -0.5772481 1.54999995 -0.52912778 1.52499998 -0.52912778 1.5 -0.5772481 1.64999998
		 -0.6734888 1.625 -0.62536848 1.60000002 -0.5772481 1.57499993 -0.52912778 1.54999995
		 -0.48100746 1.52499998 -0.48100746 1.5 -0.52912778 1.64999998 -0.62536848 1.625 -0.5772481
		 1.60000002 -0.52912778 1.57499993 -0.48100746 1.54999995 -0.43288708 1.52499998 -0.43288708
		 1.5 -0.48100746 1.64999998 -0.5772481 1.625 -0.52912778 1.60000002 -0.48100746 1.57499993
		 -0.43288708 1.54999995 -0.38476682 1.52499998 -0.38476682 1.5 -0.43288708 1.64999998
		 -0.52912778 1.625 -0.48100746 1.60000002 -0.43288708 1.57499993 -0.38476682 1.54999995
		 -0.33664644 1.52499998 -0.33664644 1.5 -0.38476682 1.64999998 -0.48100746 1.625 -0.43288708;
	setAttr ".uvst[0].uvsp[250:499]" 1.60000002 -0.38476682 1.57499993 -0.33664644
		 1.54999995 -0.28852618 1.52499998 -0.28852618 1.5 -0.33664644 1.64999998 -0.43288708
		 1.625 -0.38476682 1.60000002 -0.33664644 1.57499993 -0.28852618 1.54999995 -0.24040574
		 1.52499998 -0.24040574 1.5 -0.28852618 1.64999998 -0.38476682 1.625 -0.33664644 1.60000002
		 -0.28852618 1.57499993 -0.24040574 1.54999995 -0.19228548 1.52499998 -0.19228548
		 1.5 -0.24040574 1.64999998 -0.33664644 1.625 -0.28852618 1.60000002 -0.24040574 1.57499993
		 -0.19228548 1.54999995 -0.14416516 1.52499998 -0.14416516 1.5 -0.19228548 1.64999998
		 -0.28852618 1.625 -0.24040574 1.60000002 -0.19228548 1.57499993 -0.14416516 1.54999995
		 -0.096044719 1.52499998 -0.096044719 1.5 -0.14416516 1.64999998 -0.24040574 1.625
		 -0.19228548 1.60000002 -0.14416516 1.57499993 -0.096044719 1.54999995 -0.047924519
		 1.52499998 -0.047924519 1.5 -0.096044719 1.64999998 -0.19228548 1.625 -0.14416516
		 1.60000002 -0.096044719 1.57499993 -0.047924519 1.54999995 0 1.52499998 0 1.5 -0.047924519
		 1.64999998 -0.14416516 1.625 -0.096044719 1.60000002 -0.047924519 1.57499993 0 1.5
		 0 1.64999998 -0.096044719 1.625 -0.047924519 1.60000002 0 1.64999998 -0.047924519
		 1.625 0 1.64999998 0 1.42500007 -1 1.42500007 -0.96221071 1.44999993 -1 1.44999993
		 -0.96221071 1.42500007 -0.91409045 1.4749999 -1 1.4749999 -0.96221071 1.44999993
		 -0.91409045 1.42500007 -0.86597013 1.4749999 -0.91409045 1.44999993 -0.86597013 1.42500007
		 -0.81784976 1.4749999 -0.86597013 1.44999993 -0.81784976 1.42500007 -0.76972944 1.4749999
		 -0.81784976 1.44999993 -0.76972944 1.42500007 -0.72160912 1.4749999 -0.76972944 1.44999993
		 -0.72160912 1.42500007 -0.6734888 1.4749999 -0.72160912 1.44999993 -0.6734888 1.42500007
		 -0.62536848 1.4749999 -0.6734888 1.44999993 -0.62536848 1.42500007 -0.5772481 1.4749999
		 -0.62536848 1.44999993 -0.5772481 1.42500007 -0.52912778 1.4749999 -0.5772481 1.44999993
		 -0.52912778 1.42500007 -0.48100746 1.4749999 -0.52912778 1.44999993 -0.48100746 1.42500007
		 -0.43288708 1.4749999 -0.48100746 1.44999993 -0.43288708 1.42500007 -0.38476682 1.4749999
		 -0.43288708 1.44999993 -0.38476682 1.42500007 -0.33664644 1.4749999 -0.38476682 1.44999993
		 -0.33664644 1.42500007 -0.28852618 1.4749999 -0.33664644 1.44999993 -0.28852618 1.42500007
		 -0.24040574 1.4749999 -0.28852618 1.44999993 -0.24040574 1.42500007 -0.19228548 1.4749999
		 -0.24040574 1.44999993 -0.19228548 1.42500007 -0.14416516 1.4749999 -0.19228548 1.44999993
		 -0.14416516 1.42500007 -0.096044719 1.4749999 -0.14416516 1.44999993 -0.096044719
		 1.42500007 -0.047924519 1.4749999 -0.096044719 1.44999993 -0.047924519 1.42500007
		 0 1.4749999 -0.047924519 1.44999993 0 1.4749999 0 1.67499995 -1 1.67499995 -0.96221071
		 1.70000005 -1 1.70000005 -0.96221071 1.67499995 -0.91409045 1.7249999 -1 1.7249999
		 -0.96221071 1.70000005 -0.91409045 1.67499995 -0.86597013 1.75 -1 1.75 -0.96221071
		 1.7249999 -0.91409045 1.70000005 -0.86597013 1.67499995 -0.81784976 1.75 -0.91409045
		 1.7249999 -0.86597013 1.70000005 -0.81784976 1.67499995 -0.76972944 1.75 -0.86597013
		 1.7249999 -0.81784976 1.70000005 -0.76972944 1.67499995 -0.72160912 1.75 -0.81784976
		 1.7249999 -0.76972944 1.70000005 -0.72160912 1.67499995 -0.6734888 1.75 -0.76972944
		 1.7249999 -0.72160912 1.70000005 -0.6734888 1.67499995 -0.62536848 1.75 -0.72160912
		 1.7249999 -0.6734888 1.70000005 -0.62536848 1.67499995 -0.5772481 1.75 -0.6734888
		 1.7249999 -0.62536848 1.70000005 -0.5772481 1.67499995 -0.52912778 1.75 -0.62536848
		 1.7249999 -0.5772481 1.70000005 -0.52912778 1.67499995 -0.48100746 1.75 -0.5772481
		 1.7249999 -0.52912778 1.70000005 -0.48100746 1.67499995 -0.43288708 1.75 -0.52912778
		 1.7249999 -0.48100746 1.70000005 -0.43288708 1.67499995 -0.38476682 1.75 -0.48100746
		 1.7249999 -0.43288708 1.70000005 -0.38476682 1.67499995 -0.33664644 1.75 -0.43288708
		 1.7249999 -0.38476682 1.70000005 -0.33664644 1.67499995 -0.28852618 1.75 -0.38476682
		 1.7249999 -0.33664644 1.70000005 -0.28852618 1.67499995 -0.24040574 1.75 -0.33664644
		 1.7249999 -0.28852618 1.70000005 -0.24040574 1.67499995 -0.19228548 1.75 -0.28852618
		 1.7249999 -0.24040574 1.70000005 -0.19228548 1.67499995 -0.14416516 1.75 -0.24040574
		 1.7249999 -0.19228548 1.70000005 -0.14416516 1.67499995 -0.096044719 1.75 -0.19228548
		 1.7249999 -0.14416516 1.70000005 -0.096044719 1.67499995 -0.047924519 1.75 -0.14416516
		 1.7249999 -0.096044719 1.70000005 -0.047924519 1.67499995 0 1.75 -0.096044719 1.7249999
		 -0.047924519 1.70000005 0 1.75 -0.047924519 1.7249999 0 1.75 0 0.64999992 0.069869474
		 0.60000002 0.069869474 0.55000001 0.069869474 0.49999994 0.069869474 0.44999996 0.069869474
		 0.39999998 0.069869474 0.34999999 0.069869474 0.30000004 0.069869474 0.24999991 0.069869474
		 0.20000005 0.069869474 0.15000002 0.069869474 0.099999964 0.069869474 0.050000016
		 0.069869474 1 0.069869474 2.7755576e-17 0.069869474 0.94999993 0.069869474 0.89999998
		 0.069869474 0.84999996 0.069869474 0.80000001 0.069869474 0.75000006 0.069869474
		 0.69999999 0.069869474 0.64999992 0.053829379 0.60000002 0.053829379 0.55000001 0.053829379
		 0.49999994 0.053829379 0.44999996 0.053829379 0.39999998 0.053829379 0.34999999 0.053829379
		 0.30000004 0.053829379 0.24999991 0.053829379 0.20000005 0.053829379 0.15000002 0.053829379
		 0.099999964 0.053829379 0.050000016 0.053829379 1 0.053829379 2.7755576e-17 0.053829379
		 0.94999993 0.053829379 0.89999998 0.053829379;
	setAttr ".uvst[0].uvsp[500:749]" 0.84999996 0.053829379 0.80000001 0.053829379
		 0.75000006 0.053829379 0.69999999 0.053829379 0.55000001 0.06184943 0.49999994 0.06184943
		 0.44999996 0.06184943 0.39999998 0.06184943 0.34999999 0.06184943 0.30000004 0.06184943
		 0.24999991 0.06184943 0.20000005 0.06184943 0.15000002 0.06184943 0.099999972 0.06184943
		 0.050000016 0.06184943 1 0.06184943 2.7755576e-17 0.06184943 0.94999993 0.06184943
		 0.89999998 0.06184943 0.84999996 0.06184943 0.80000001 0.06184943 0.75000006 0.06184943
		 0.69999999 0.06184943 0.64999992 0.06184943 0.60000002 0.06184943 1.52499998 -0.98110533
		 1.5 -0.98110533 1.4749999 -0.98110533 1.44999993 -0.98110533 1.42500007 -0.98110533
		 1.4000001 -0.98110533 1.37499988 -0.98110533 1.35000002 -0.98110533 1.32499993 -0.98110533
		 1.30000007 -0.98110533 1.2750001 -0.98110533 1.75 -0.98110533 1.25 -0.98110533 1.7249999
		 -0.98110533 1.70000005 -0.98110533 1.67499995 -0.98110533 1.64999998 -0.98110533
		 1.625 -0.98110533 1.60000002 -0.98110533 1.57499993 -0.98110533 1.54999995 -0.98110533
		 1.54999995 -0.93815058 1.52499998 -0.93815058 1.5 -0.93815058 1.4749999 -0.93815058
		 1.44999993 -0.93815058 1.42500007 -0.93815058 1.4000001 -0.93815058 1.37499988 -0.93815058
		 1.35000002 -0.93815058 1.32499993 -0.93815058 1.30000007 -0.93815058 1.2750001 -0.93815058
		 1.75 -0.93815058 1.25 -0.93815058 1.7249999 -0.93815058 1.70000005 -0.93815058 1.67499995
		 -0.93815058 1.64999998 -0.93815058 1.625 -0.93815058 1.60000002 -0.93815058 1.57499993
		 -0.93815058 1.54999995 -0.89003026 1.52499998 -0.89003026 1.5 -0.89003026 1.4749999
		 -0.89003026 1.44999993 -0.89003026 1.42500007 -0.89003026 1.4000001 -0.89003026 1.37499988
		 -0.89003026 1.35000002 -0.89003026 1.32499993 -0.89003026 1.30000007 -0.89003026
		 1.2750001 -0.89003026 1.75 -0.89003026 1.25 -0.89003026 1.7249999 -0.89003026 1.70000005
		 -0.89003026 1.67499995 -0.89003026 1.64999998 -0.89003026 1.625 -0.89003026 1.60000002
		 -0.89003026 1.57499993 -0.89003026 1.54999995 -0.84190995 1.52499998 -0.84190995
		 1.5 -0.84190995 1.4749999 -0.84190995 1.44999993 -0.84190995 1.42500007 -0.84190995
		 1.4000001 -0.84190995 1.37499988 -0.84190995 1.35000002 -0.84190995 1.32499993 -0.84190995
		 1.30000007 -0.84190995 1.2750001 -0.84190995 1.75 -0.84190995 1.25 -0.84190995 1.7249999
		 -0.84190995 1.70000005 -0.84190995 1.67499995 -0.84190995 1.64999998 -0.84190995
		 1.625 -0.84190995 1.60000002 -0.84190995 1.57499993 -0.84190995 1.54999995 -0.79378963
		 1.52499998 -0.79378963 1.5 -0.79378963 1.4749999 -0.79378963 1.44999993 -0.79378963
		 1.42500007 -0.79378963 1.4000001 -0.79378963 1.37499988 -0.79378963 1.35000002 -0.79378963
		 1.32499993 -0.79378963 1.30000007 -0.79378963 1.2750001 -0.79378963 1.75 -0.79378963
		 1.25 -0.79378963 1.7249999 -0.79378963 1.70000005 -0.79378963 1.67499995 -0.79378963
		 1.64999998 -0.79378963 1.625 -0.79378963 1.60000002 -0.79378963 1.57499993 -0.79378963
		 1.54999995 -0.74566925 1.52499998 -0.74566925 1.5 -0.74566925 1.4749999 -0.74566925
		 1.44999993 -0.74566925 1.42500007 -0.74566925 1.4000001 -0.74566925 1.37499988 -0.74566925
		 1.35000002 -0.74566925 1.32499993 -0.74566925 1.30000007 -0.74566925 1.2750001 -0.74566925
		 1.75 -0.74566925 1.25 -0.74566925 1.7249999 -0.74566925 1.70000005 -0.74566925 1.67499995
		 -0.74566925 1.64999998 -0.74566925 1.625 -0.74566925 1.60000002 -0.74566925 1.57499993
		 -0.74566925 1.52499998 -0.69754899 1.5 -0.69754899 1.4749999 -0.69754899 1.44999993
		 -0.69754899 1.42500007 -0.69754899 1.4000001 -0.69754899 1.37499988 -0.69754899 1.35000002
		 -0.69754899 1.32499993 -0.69754899 1.30000007 -0.69754899 1.2750001 -0.69754899 1.75
		 -0.69754899 1.25 -0.69754899 1.7249999 -0.69754899 1.70000005 -0.69754899 1.67499995
		 -0.69754899 1.64999998 -0.69754899 1.625 -0.69754899 1.60000002 -0.69754899 1.57499993
		 -0.69754899 1.54999995 -0.69754899 1.52499998 -0.64942861 1.5 -0.64942861 1.4749999
		 -0.64942861 1.44999993 -0.64942861 1.42500007 -0.64942861 1.4000001 -0.64942861 1.37499988
		 -0.64942861 1.35000002 -0.64942861 1.32499993 -0.64942861 1.30000007 -0.64942861
		 1.2750001 -0.64942861 1.75 -0.64942861 1.25 -0.64942861 1.7249999 -0.64942861 1.70000005
		 -0.64942861 1.67499995 -0.64942861 1.64999998 -0.64942861 1.625 -0.64942861 1.60000002
		 -0.64942861 1.57499993 -0.64942861 1.54999995 -0.64942861 1.52499998 -0.60130829
		 1.5 -0.60130829 1.4749999 -0.60130829 1.44999993 -0.60130829 1.42500007 -0.60130829
		 1.4000001 -0.60130829 1.37499988 -0.60130829 1.35000002 -0.60130829 1.32499993 -0.60130829
		 1.30000007 -0.60130829 1.2750001 -0.60130829 1.75 -0.60130829 1.25 -0.60130829 1.7249999
		 -0.60130829 1.70000005 -0.60130829 1.67499995 -0.60130829 1.64999998 -0.60130829
		 1.625 -0.60130829 1.60000002 -0.60130829 1.57499993 -0.60130829 1.54999995 -0.60130829
		 1.52499998 -0.55318797 1.5 -0.55318797 1.4749999 -0.55318797 1.44999993 -0.55318797
		 1.42500007 -0.55318797 1.4000001 -0.55318797 1.37499988 -0.55318797 1.35000002 -0.55318797
		 1.32499993 -0.55318797 1.30000007 -0.55318797 1.2750001 -0.55318797 1.75 -0.55318797
		 1.25 -0.55318797 1.7249999 -0.55318797 1.70000005 -0.55318797 1.67499995 -0.55318797
		 1.64999998 -0.55318797 1.625 -0.55318797 1.60000002 -0.55318797 1.57499993 -0.55318797
		 1.54999995 -0.55318797 1.32499993 -0.50506759 1.30000007 -0.50506759 1.2750001 -0.50506759
		 1.75 -0.50506759 1.25 -0.50506759 1.7249999 -0.50506759 1.70000005 -0.50506759 1.67499995
		 -0.50506759 1.64999998 -0.50506759 1.625 -0.50506759 1.60000002 -0.50506759 1.57499993
		 -0.50506759 1.54999995 -0.50506759 1.52499998 -0.50506759 1.5 -0.50506759;
	setAttr ".uvst[0].uvsp[750:965]" 1.4749999 -0.50506759 1.44999993 -0.50506759
		 1.42500007 -0.50506759 1.4000001 -0.50506759 1.37499988 -0.50506759 1.35000002 -0.50506759
		 1.5 -0.45694727 1.4749999 -0.45694727 1.44999993 -0.45694727 1.42500007 -0.45694727
		 1.4000001 -0.45694727 1.37499988 -0.45694727 1.35000002 -0.45694727 1.32499993 -0.45694727
		 1.30000007 -0.45694727 1.2750001 -0.45694727 1.75 -0.45694727 1.25 -0.45694727 1.7249999
		 -0.45694727 1.70000005 -0.45694727 1.67499995 -0.45694727 1.64999998 -0.45694727
		 1.625 -0.45694727 1.60000002 -0.45694727 1.57499993 -0.45694727 1.54999995 -0.45694727
		 1.52499998 -0.45694727 1.5 -0.40882695 1.4749999 -0.40882695 1.44999993 -0.40882695
		 1.42500007 -0.40882695 1.4000001 -0.40882695 1.37499988 -0.40882695 1.35000002 -0.40882695
		 1.32499993 -0.40882695 1.30000007 -0.40882695 1.2750001 -0.40882695 1.75 -0.40882695
		 1.25 -0.40882695 1.7249999 -0.40882695 1.70000005 -0.40882695 1.67499995 -0.40882695
		 1.64999998 -0.40882695 1.625 -0.40882695 1.60000002 -0.40882695 1.57499993 -0.40882695
		 1.54999995 -0.40882695 1.52499998 -0.40882695 1.5 -0.36070663 1.4749999 -0.36070663
		 1.44999993 -0.36070663 1.42500007 -0.36070663 1.4000001 -0.36070663 1.37499988 -0.36070663
		 1.35000002 -0.36070663 1.32499993 -0.36070663 1.30000007 -0.36070663 1.2750001 -0.36070663
		 1.75 -0.36070663 1.25 -0.36070663 1.7249999 -0.36070663 1.70000005 -0.36070663 1.67499995
		 -0.36070663 1.64999998 -0.36070663 1.625 -0.36070663 1.60000002 -0.36070663 1.57499993
		 -0.36070663 1.54999995 -0.36070663 1.52499998 -0.36070663 1.30000007 -0.31258631
		 1.2750001 -0.31258631 1.75 -0.31258631 1.25 -0.31258631 1.7249999 -0.31258631 1.70000005
		 -0.31258631 1.67499995 -0.31258631 1.64999998 -0.31258631 1.625 -0.31258631 1.60000002
		 -0.31258631 1.57499993 -0.31258631 1.54999995 -0.31258631 1.52499998 -0.31258631
		 1.5 -0.31258631 1.4749999 -0.31258631 1.44999993 -0.31258631 1.42500007 -0.31258631
		 1.4000001 -0.31258631 1.37499988 -0.31258631 1.35000002 -0.31258631 1.32499993 -0.31258631
		 1.52499998 -0.26446593 1.5 -0.26446593 1.4749999 -0.26446593 1.44999993 -0.26446593
		 1.42500007 -0.26446593 1.4000001 -0.26446593 1.37499988 -0.26446593 1.35000002 -0.26446593
		 1.32499993 -0.26446593 1.30000007 -0.26446593 1.2750001 -0.26446593 1.75 -0.26446593
		 1.25 -0.26446593 1.7249999 -0.26446593 1.70000005 -0.26446593 1.67499995 -0.26446593
		 1.64999998 -0.26446593 1.625 -0.26446593 1.60000002 -0.26446593 1.57499993 -0.26446593
		 1.54999995 -0.26446593 1.52499998 -0.21634561 1.5 -0.21634561 1.4749999 -0.21634561
		 1.44999993 -0.21634561 1.42500007 -0.21634561 1.4000001 -0.21634561 1.37499988 -0.21634561
		 1.35000002 -0.21634561 1.32499993 -0.21634561 1.30000007 -0.21634561 1.2750001 -0.21634561
		 1.75 -0.21634561 1.25 -0.21634561 1.7249999 -0.21634561 1.70000005 -0.21634561 1.67499995
		 -0.21634561 1.64999998 -0.21634561 1.625 -0.21634561 1.60000002 -0.21634561 1.57499993
		 -0.21634561 1.54999995 -0.21634561 1.52499998 -0.16822529 1.5 -0.16822529 1.4749999
		 -0.16822529 1.44999993 -0.16822529 1.42500007 -0.16822529 1.4000001 -0.16822529 1.37499988
		 -0.16822529 1.35000002 -0.16822529 1.32499993 -0.16822529 1.30000007 -0.16822529
		 1.2750001 -0.16822529 1.75 -0.16822529 1.25 -0.16822529 1.7249999 -0.16822529 1.70000005
		 -0.16822529 1.67499995 -0.16822529 1.64999998 -0.16822529 1.625 -0.16822529 1.60000002
		 -0.16822529 1.57499993 -0.16822529 1.54999995 -0.16822529 1.52499998 -0.12010491
		 1.5 -0.12010491 1.4749999 -0.12010491 1.44999993 -0.12010491 1.42500007 -0.12010491
		 1.4000001 -0.12010491 1.37499988 -0.12010491 1.35000002 -0.12010491 1.32499993 -0.12010491
		 1.30000007 -0.12010491 1.2750001 -0.12010491 1.75 -0.12010491 1.25 -0.12010491 1.7249999
		 -0.12010491 1.70000005 -0.12010491 1.67499995 -0.12010491 1.64999998 -0.12010491
		 1.625 -0.12010491 1.60000002 -0.12010491 1.57499993 -0.12010491 1.54999995 -0.12010491
		 1.32499993 -0.071984649 1.30000007 -0.071984649 1.2750001 -0.071984649 1.75 -0.071984649
		 1.25 -0.071984649 1.7249999 -0.071984649 1.70000005 -0.071984649 1.67499995 -0.071984649
		 1.64999998 -0.071984649 1.625 -0.071984649 1.60000002 -0.071984649 1.57499993 -0.071984649
		 1.54999995 -0.071984649 1.52499998 -0.071984649 1.5 -0.071984649 1.4749999 -0.071984649
		 1.44999993 -0.071984649 1.42500007 -0.071984649 1.4000001 -0.071984649 1.37499988
		 -0.071984649 1.35000002 -0.071984649 1.5 -0.023962259 1.4749999 -0.023962259 1.44999993
		 -0.023962259 1.42500007 -0.023962259 1.4000001 -0.023962259 1.37499988 -0.023962259
		 1.35000002 -0.023962259 1.32499993 -0.023962259 1.30000007 -0.023962259 1.2750001
		 -0.023962259 1.75 -0.023962259 1.25 -0.023962259 1.7249999 -0.023962259 1.70000005
		 -0.023962259 1.67499995 -0.023962259 1.64999998 -0.023962259 1.625 -0.023962259 1.60000002
		 -0.023962259 1.57499993 -0.023962259 1.54999995 -0.023962259 1.52499998 -0.023962259;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".op" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 860 ".vt";
	setAttr ".vt[0:165]"  0.041273601 0.013410609 -4.1536987e-07 0.035109445 0.02550848 -4.1536987e-07
		 0.025508489 0.035109416 -4.1536987e-07 0.013410628 0.041273579 -4.1536987e-07 1.1175871e-08 0.043397613 -4.1536987e-07
		 -0.013410576 0.041273572 -4.1536987e-07 -0.025508456 0.035109416 -4.1536987e-07 -0.035109408 0.02550848 -4.1536987e-07
		 -0.041273557 0.013410594 -4.1536987e-07 -0.043397605 -1.3038516e-08 -4.1536987e-07
		 -0.041273557 -0.013410621 -4.1536987e-07 -0.035109401 -0.025508495 -4.1536987e-07
		 -0.025508452 -0.035109401 -4.1536987e-07 -0.01341057 -0.041273586 -4.1536987e-07
		 9.8561266e-09 -0.043397613 -4.1536987e-07 0.013410619 -0.041273579 -4.1536987e-07
		 0.025508478 -0.035109431 -4.1536987e-07 0.035109416 -0.025508491 -4.1536987e-07 0.041273564 -0.013410615 -4.1536987e-07
		 0.043397613 -1.3038516e-08 -4.1536987e-07 0.041273601 0.013410609 5 0.035109445 0.02550848 5
		 0.025508489 0.035109416 5 0.013410628 0.041273579 5 1.117587e-08 0.043397613 5 -0.013410576 0.041273572 5
		 -0.025508456 0.035109416 5 -0.035109408 0.02550848 5 -0.041273557 0.013410594 5 -0.043397605 -1.3038518e-08 5
		 -0.041273557 -0.013410621 5 -0.035109401 -0.025508495 5 -0.025508452 -0.035109401 5
		 -0.01341057 -0.041273586 5 9.8561248e-09 -0.043397613 5 0.013410619 -0.041273579 5
		 0.025508478 -0.035109431 5 0.035109416 -0.025508491 5 0.041273564 -0.013410615 5
		 0.043397613 -1.3038518e-08 5 0.043397613 -1.3038517e-08 4.80500269 0.041273564 -0.013410615 4.80500269
		 0.035109416 -0.025508495 4.80500269 0.025508478 -0.035109431 4.80500269 0.013410619 -0.041273579 4.80500269
		 9.8561248e-09 -0.043397613 4.80500269 -0.01341057 -0.041273586 4.80500269 -0.025508452 -0.035109401 4.80500269
		 -0.035109401 -0.025508495 4.80500269 -0.041273549 -0.013410621 4.80500269 -0.043397605 -1.3038517e-08 4.80500269
		 -0.041273549 0.013410594 4.80500269 -0.035109408 0.02550848 4.80500269 -0.025508456 0.035109416 4.80500269
		 -0.013410576 0.041273572 4.80500269 1.117587e-08 0.043397613 4.80500269 0.013410628 0.041273579 4.80500269
		 0.025508489 0.035109416 4.80500269 0.035109445 0.02550848 4.80500269 0.041273601 0.013410609 4.80500269
		 0.043397613 -1.3038517e-08 4.56214714 0.041273564 -0.013410615 4.56214714 0.035109416 -0.025508495 4.56214714
		 0.025508478 -0.035109431 4.56214714 0.013410619 -0.041273579 4.56214714 9.8561248e-09 -0.043397613 4.56214714
		 -0.01341057 -0.041273586 4.56214714 -0.025508452 -0.035109401 4.56214714 -0.035109401 -0.025508495 4.56214714
		 -0.041273549 -0.013410621 4.56214714 -0.043397605 -1.3038517e-08 4.56214714 -0.041273549 0.013410594 4.56214714
		 -0.035109408 0.02550848 4.56214714 -0.025508456 0.035109416 4.56214714 -0.013410576 0.041273572 4.56214714
		 1.117587e-08 0.043397613 4.56214714 0.013410628 0.041273579 4.56214714 0.025508489 0.035109416 4.56214714
		 0.035109445 0.02550848 4.56214714 0.041273601 0.013410609 4.56214714 0.043397613 -1.3038517e-08 4.31928825
		 0.041273564 -0.013410615 4.31928825 0.035109416 -0.025508495 4.31928825 0.025508478 -0.035109431 4.31928825
		 0.013410619 -0.041273579 4.31928825 9.8561266e-09 -0.043397613 4.31928825 -0.01341057 -0.041273586 4.31928825
		 -0.025508452 -0.035109401 4.31928825 -0.035109401 -0.025508495 4.31928825 -0.041273549 -0.013410621 4.31928825
		 -0.043397605 -1.3038517e-08 4.31928825 -0.041273549 0.013410594 4.31928825 -0.035109408 0.02550848 4.31928825
		 -0.025508456 0.035109416 4.31928825 -0.013410576 0.041273572 4.31928825 1.117587e-08 0.043397613 4.31928825
		 0.013410628 0.041273579 4.31928825 0.025508489 0.035109416 4.31928825 0.035109445 0.02550848 4.31928825
		 0.041273601 0.013410609 4.31928825 0.043397613 -1.3038517e-08 4.076432228 0.041273564 -0.013410615 4.076432228
		 0.035109416 -0.025508495 4.076432228 0.025508478 -0.035109431 4.076432228 0.013410619 -0.041273579 4.076432228
		 9.8561266e-09 -0.043397613 4.076432228 -0.01341057 -0.041273586 4.076432228 -0.025508452 -0.035109401 4.076432228
		 -0.035109401 -0.025508495 4.076432228 -0.041273549 -0.013410621 4.076432228 -0.043397605 -1.3038517e-08 4.076432228
		 -0.041273549 0.013410594 4.076432228 -0.035109408 0.02550848 4.076432228 -0.025508456 0.035109416 4.076432228
		 -0.013410576 0.041273572 4.076432228 1.117587e-08 0.043397613 4.076432228 0.013410628 0.041273579 4.076432228
		 0.025508489 0.035109416 4.076432228 0.035109445 0.02550848 4.076432228 0.041273601 0.013410609 4.076432228
		 0.043397613 -1.3038517e-08 3.83357453 0.041273564 -0.013410615 3.83357453 0.035109416 -0.025508495 3.83357453
		 0.025508478 -0.035109431 3.83357453 0.013410619 -0.041273579 3.83357453 9.8561266e-09 -0.043397613 3.83357453
		 -0.01341057 -0.041273586 3.83357453 -0.025508452 -0.035109401 3.83357453 -0.035109401 -0.025508495 3.83357453
		 -0.041273549 -0.013410621 3.83357453 -0.043397605 -1.3038517e-08 3.83357453 -0.041273549 0.013410594 3.83357453
		 -0.035109408 0.025508484 3.83357453 -0.025508456 0.035109416 3.83357453 -0.013410576 0.041273572 3.83357453
		 1.117587e-08 0.043397613 3.83357453 0.013410628 0.041273579 3.83357453 0.025508489 0.035109416 3.83357453
		 0.035109445 0.02550848 3.83357453 0.041273601 0.013410609 3.83357453 0.043397613 -1.3038517e-08 3.59071732
		 0.041273564 -0.013410615 3.59071732 0.035109416 -0.025508495 3.59071732 0.025508478 -0.035109431 3.59071732
		 0.013410619 -0.041273579 3.59071732 9.8561266e-09 -0.043397613 3.59071732 -0.01341057 -0.041273586 3.59071732
		 -0.025508452 -0.035109401 3.59071732 -0.035109401 -0.025508495 3.59071732 -0.041273549 -0.013410621 3.59071732
		 -0.043397605 -1.3038517e-08 3.59071732 -0.041273549 0.013410594 3.59071732 -0.035109408 0.025508484 3.59071732
		 -0.025508456 0.035109416 3.59071732 -0.013410576 0.041273572 3.59071732 1.1175871e-08 0.043397613 3.59071732
		 0.013410628 0.041273579 3.59071732 0.025508489 0.035109416 3.59071732 0.035109445 0.02550848 3.59071732
		 0.041273601 0.013410609 3.59071732 0.043397613 -1.3038517e-08 3.34786034 0.041273564 -0.013410615 3.34786034
		 0.035109416 -0.025508495 3.34786034 0.025508478 -0.035109431 3.34786034 0.013410619 -0.041273579 3.34786034
		 9.8561266e-09 -0.043397613 3.34786034;
	setAttr ".vt[166:331]" -0.01341057 -0.041273586 3.34786034 -0.025508452 -0.035109401 3.34786034
		 -0.035109401 -0.025508495 3.34786034 -0.041273549 -0.013410621 3.34786034 -0.043397605 -1.3038517e-08 3.34786034
		 -0.041273549 0.013410594 3.34786034 -0.035109408 0.025508484 3.34786034 -0.025508456 0.035109416 3.34786034
		 -0.013410576 0.041273572 3.34786034 1.1175871e-08 0.043397613 3.34786034 0.013410628 0.041273579 3.34786034
		 0.025508489 0.035109416 3.34786034 0.035109445 0.02550848 3.34786034 0.041273601 0.013410609 3.34786034
		 0.043397613 -1.3038517e-08 3.10500336 0.041273572 -0.013410615 3.10500336 0.035109416 -0.025508495 3.10500336
		 0.025508478 -0.035109431 3.10500336 0.013410619 -0.041273579 3.10500336 9.8561266e-09 -0.043397613 3.10500336
		 -0.01341057 -0.041273586 3.10500336 -0.025508452 -0.035109401 3.10500336 -0.035109401 -0.025508495 3.10500336
		 -0.041273549 -0.013410621 3.10500336 -0.043397605 -1.3038517e-08 3.10500336 -0.041273549 0.013410594 3.10500336
		 -0.035109408 0.025508484 3.10500336 -0.025508456 0.035109416 3.10500336 -0.013410576 0.041273572 3.10500336
		 1.1175871e-08 0.043397613 3.10500336 0.013410628 0.041273579 3.10500336 0.025508489 0.035109416 3.10500336
		 0.035109445 0.02550848 3.10500336 0.041273601 0.013410609 3.10500336 0.043397613 -1.3038517e-08 2.86214638
		 0.041273572 -0.013410615 2.86214638 0.035109416 -0.025508495 2.86214638 0.025508478 -0.035109431 2.86214638
		 0.013410619 -0.041273579 2.86214638 9.8561266e-09 -0.043397613 2.86214638 -0.01341057 -0.041273586 2.86214638
		 -0.025508452 -0.035109401 2.86214638 -0.035109401 -0.025508495 2.86214638 -0.041273549 -0.013410621 2.86214638
		 -0.043397605 -1.3038517e-08 2.86214638 -0.041273549 0.013410594 2.86214638 -0.035109408 0.025508484 2.86214638
		 -0.025508456 0.035109416 2.86214638 -0.013410576 0.041273572 2.86214638 1.1175871e-08 0.043397613 2.86214638
		 0.013410628 0.041273579 2.86214638 0.025508489 0.035109416 2.86214638 0.035109445 0.02550848 2.86214638
		 0.041273601 0.013410609 2.86214638 0.043397613 -1.3038517e-08 2.61928868 0.041273572 -0.013410615 2.61928868
		 0.035109423 -0.025508495 2.61928868 0.025508478 -0.035109431 2.61928868 0.013410619 -0.041273579 2.61928868
		 9.8561266e-09 -0.043397613 2.61928868 -0.01341057 -0.041273586 2.61928868 -0.025508452 -0.035109401 2.61928868
		 -0.035109401 -0.025508495 2.61928868 -0.041273549 -0.013410621 2.61928868 -0.043397605 -1.3038517e-08 2.61928868
		 -0.041273549 0.013410594 2.61928868 -0.035109408 0.025508484 2.61928868 -0.025508456 0.035109416 2.61928868
		 -0.013410576 0.041273572 2.61928868 1.1175871e-08 0.043397613 2.61928868 0.013410628 0.041273579 2.61928868
		 0.025508489 0.035109416 2.61928868 0.035109445 0.02550848 2.61928868 0.041273601 0.013410609 2.61928868
		 0.043397613 -1.3038517e-08 2.37643147 0.041273572 -0.013410615 2.37643147 0.035109423 -0.025508495 2.37643147
		 0.025508478 -0.035109431 2.37643147 0.013410619 -0.041273579 2.37643147 9.8561266e-09 -0.043397613 2.37643147
		 -0.01341057 -0.041273586 2.37643147 -0.025508452 -0.035109431 2.37643147 -0.035109401 -0.025508495 2.37643147
		 -0.041273549 -0.013410621 2.37643147 -0.043397605 -1.3038517e-08 2.37643147 -0.041273549 0.013410594 2.37643147
		 -0.035109408 0.025508484 2.37643147 -0.025508456 0.035109416 2.37643147 -0.013410576 0.041273572 2.37643147
		 1.1175871e-08 0.043397613 2.37643147 0.013410628 0.041273579 2.37643147 0.025508489 0.035109416 2.37643147
		 0.035109445 0.02550848 2.37643147 0.041273601 0.013410609 2.37643147 0.043397613 -1.3038517e-08 2.13357449
		 0.041273572 -0.013410615 2.13357449 0.035109423 -0.025508495 2.13357449 0.025508478 -0.035109431 2.13357449
		 0.013410619 -0.041273579 2.13357449 9.8561266e-09 -0.043397613 2.13357449 -0.01341057 -0.041273586 2.13357449
		 -0.025508452 -0.035109431 2.13357449 -0.035109401 -0.025508495 2.13357449 -0.041273549 -0.013410621 2.13357449
		 -0.043397605 -1.3038517e-08 2.13357449 -0.041273549 0.013410594 2.13357449 -0.035109408 0.025508484 2.13357449
		 -0.025508456 0.035109416 2.13357449 -0.013410576 0.041273572 2.13357449 1.1175871e-08 0.043397613 2.13357449
		 0.013410628 0.041273579 2.13357449 0.025508489 0.035109416 2.13357449 0.035109445 0.02550848 2.13357449
		 0.041273601 0.013410609 2.13357449 0.043397613 -1.3038517e-08 1.89071751 0.041273572 -0.013410615 1.89071751
		 0.035109423 -0.025508495 1.89071751 0.025508478 -0.035109431 1.89071751 0.013410619 -0.041273579 1.89071751
		 9.8561266e-09 -0.043397613 1.89071751 -0.01341057 -0.041273586 1.89071751 -0.025508452 -0.035109431 1.89071751
		 -0.035109401 -0.025508495 1.89071751 -0.041273549 -0.013410621 1.89071751 -0.043397605 -1.3038517e-08 1.89071751
		 -0.041273549 0.013410594 1.89071751 -0.035109408 0.025508484 1.89071751 -0.025508456 0.035109416 1.89071751
		 -0.013410576 0.041273572 1.89071751 1.1175871e-08 0.043397613 1.89071751 0.013410628 0.041273579 1.89071751
		 0.025508489 0.035109416 1.89071751 0.035109445 0.02550848 1.89071751 0.041273601 0.013410609 1.89071751
		 0.043397613 -1.3038517e-08 1.64786017 0.041273572 -0.013410615 1.64786017 0.035109423 -0.025508495 1.64786017
		 0.025508478 -0.035109431 1.64786017 0.013410619 -0.041273579 1.64786017 9.8561266e-09 -0.043397613 1.64786017
		 -0.01341057 -0.041273586 1.64786017 -0.025508452 -0.035109431 1.64786017 -0.035109401 -0.025508495 1.64786017
		 -0.041273557 -0.013410621 1.64786017 -0.043397605 -1.3038517e-08 1.64786017 -0.041273557 0.013410594 1.64786017
		 -0.035109408 0.02550848 1.64786017 -0.025508456 0.035109416 1.64786017 -0.013410576 0.041273572 1.64786017
		 1.1175871e-08 0.043397613 1.64786017 0.013410628 0.041273579 1.64786017 0.025508489 0.035109416 1.64786017
		 0.035109445 0.02550848 1.64786017 0.041273601 0.013410609 1.64786017 0.043397613 -1.3038516e-08 1.40500307
		 0.041273572 -0.013410615 1.40500307 0.035109423 -0.025508495 1.40500307 0.025508478 -0.035109431 1.40500307
		 0.013410619 -0.041273579 1.40500307 9.8561266e-09 -0.043397613 1.40500307 -0.01341057 -0.041273586 1.40500307
		 -0.025508452 -0.035109431 1.40500307 -0.035109401 -0.025508495 1.40500307 -0.041273549 -0.013410621 1.40500307
		 -0.043397605 -1.3038516e-08 1.40500307 -0.041273549 0.013410594 1.40500307;
	setAttr ".vt[332:497]" -0.035109408 0.02550848 1.40500307 -0.025508456 0.035109416 1.40500307
		 -0.013410576 0.041273572 1.40500307 1.1175871e-08 0.043397613 1.40500307 0.013410628 0.041273579 1.40500307
		 0.025508489 0.035109416 1.40500307 0.035109445 0.02550848 1.40500307 0.041273601 0.013410609 1.40500307
		 0.043397613 -1.3038516e-08 1.16214585 0.041273572 -0.013410615 1.16214585 0.035109423 -0.025508495 1.16214585
		 0.025508478 -0.035109431 1.16214585 0.013410619 -0.041273579 1.16214585 9.8561266e-09 -0.043397613 1.16214585
		 -0.01341057 -0.041273586 1.16214585 -0.025508452 -0.035109431 1.16214585 -0.035109401 -0.025508495 1.16214585
		 -0.041273549 -0.013410621 1.16214585 -0.043397605 -1.3038516e-08 1.16214585 -0.041273549 0.013410594 1.16214585
		 -0.035109416 0.02550848 1.16214585 -0.025508456 0.035109416 1.16214585 -0.013410576 0.041273572 1.16214585
		 1.1175871e-08 0.043397613 1.16214585 0.013410628 0.041273594 1.16214585 0.025508489 0.035109416 1.16214585
		 0.035109445 0.02550848 1.16214585 0.041273601 0.013410609 1.16214585 0.043397613 -1.3038516e-08 0.91928875
		 0.041273572 -0.013410615 0.91928875 0.035109423 -0.025508495 0.91928875 0.025508478 -0.035109431 0.91928875
		 0.013410619 -0.041273579 0.91928875 9.8561266e-09 -0.043397613 0.91928875 -0.01341057 -0.041273586 0.91928875
		 -0.025508452 -0.035109431 0.91928875 -0.035109401 -0.025508495 0.91928875 -0.041273549 -0.013410621 0.91928875
		 -0.043397605 -1.3038516e-08 0.91928875 -0.041273549 0.013410594 0.91928875 -0.035109416 0.02550848 0.91928875
		 -0.025508456 0.035109416 0.91928875 -0.013410576 0.041273572 0.91928875 1.1175871e-08 0.043397613 0.91928875
		 0.013410628 0.041273594 0.91928875 0.025508489 0.035109416 0.91928875 0.035109445 0.02550848 0.91928875
		 0.041273601 0.013410609 0.91928875 0.043397613 -1.3038516e-08 0.67643166 0.041273572 -0.013410615 0.67643166
		 0.035109416 -0.025508495 0.67643166 0.025508478 -0.035109431 0.67643166 0.013410619 -0.041273579 0.67643166
		 9.8561266e-09 -0.043397613 0.67643166 -0.01341057 -0.041273586 0.67643166 -0.025508452 -0.035109431 0.67643166
		 -0.035109401 -0.025508495 0.67643166 -0.041273549 -0.013410621 0.67643166 -0.043397605 -1.3038516e-08 0.67643166
		 -0.041273549 0.013410594 0.67643166 -0.035109416 0.02550848 0.67643166 -0.025508456 0.035109416 0.67643166
		 -0.013410576 0.041273572 0.67643166 1.1175871e-08 0.043397613 0.67643166 0.013410628 0.041273594 0.67643166
		 0.025508489 0.035109416 0.67643166 0.035109445 0.02550848 0.67643166 0.041273601 0.013410609 0.67643166
		 0.043397613 -1.3038516e-08 0.4335745 0.041273572 -0.013410615 0.4335745 0.035109423 -0.025508495 0.4335745
		 0.025508478 -0.035109431 0.4335745 0.013410619 -0.041273579 0.4335745 9.8561266e-09 -0.043397613 0.4335745
		 -0.01341057 -0.041273586 0.4335745 -0.025508452 -0.035109431 0.4335745 -0.035109401 -0.025508495 0.4335745
		 -0.041273549 -0.013410621 0.4335745 -0.043397605 -1.3038516e-08 0.4335745 -0.041273549 0.013410594 0.4335745
		 -0.035109416 0.02550848 0.4335745 -0.025508456 0.035109416 0.4335745 -0.013410576 0.041273572 0.4335745
		 1.1175871e-08 0.043397613 0.4335745 0.013410628 0.041273594 0.4335745 0.025508489 0.035109416 0.4335745
		 0.035109445 0.02550848 0.4335745 0.041273601 0.013410609 0.4335745 0.043397613 -1.3038516e-08 0.19071737
		 0.041273572 -0.013410615 0.19071737 0.035109423 -0.025508495 0.19071737 0.025508478 -0.035109431 0.19071737
		 0.013410619 -0.041273579 0.19071737 9.8561266e-09 -0.043397613 0.19071737 -0.01341057 -0.041273586 0.19071737
		 -0.025508452 -0.035109431 0.19071737 -0.035109401 -0.025508495 0.19071737 -0.041273549 -0.013410621 0.19071737
		 -0.043397605 -1.3038516e-08 0.19071737 -0.041273549 0.013410594 0.19071737 -0.035109416 0.02550848 0.19071737
		 -0.025508456 0.035109416 0.19071737 -0.013410576 0.041273572 0.19071737 1.1175871e-08 0.043397613 0.19071737
		 0.013410628 0.041273594 0.19071737 0.025508489 0.035109416 0.19071737 0.035109445 0.02550848 0.19071737
		 0.041273601 0.013410609 0.19071737 -0.035109412 0.02550848 0.095358476 -0.025508456 0.035109416 0.095358476
		 -0.013410576 0.041273572 0.095358476 1.1175871e-08 0.043397613 0.095358476 0.013410628 0.041273586 0.095358476
		 0.025508489 0.035109416 0.095358476 0.035109445 0.02550848 0.095358476 0.041273601 0.013410609 0.095358476
		 0.043397613 -1.3038516e-08 0.095358476 0.041273568 -0.013410615 0.095358476 0.035109419 -0.025508493 0.095358476
		 0.025508478 -0.035109431 0.095358476 0.013410619 -0.041273579 0.095358476 9.8561266e-09 -0.043397613 0.095358476
		 -0.01341057 -0.041273586 0.095358476 -0.025508452 -0.035109416 0.095358476 -0.035109401 -0.025508495 0.095358476
		 -0.041273553 -0.013410621 0.095358476 -0.043397605 -1.3038516e-08 0.095358476 -0.041273553 0.013410594 0.095358476
		 -0.041273549 0.013410594 0.31214595 -0.035109416 0.02550848 0.31214595 -0.025508456 0.035109416 0.31214595
		 -0.013410576 0.041273572 0.31214595 1.1175871e-08 0.043397613 0.31214595 0.013410628 0.041273594 0.31214595
		 0.025508489 0.035109416 0.31214595 0.035109445 0.02550848 0.31214595 0.041273601 0.013410609 0.31214595
		 0.043397613 -1.3038516e-08 0.31214595 0.041273572 -0.013410615 0.31214595 0.035109423 -0.025508495 0.31214595
		 0.025508478 -0.035109431 0.31214595 0.013410619 -0.041273579 0.31214595 9.8561266e-09 -0.043397613 0.31214595
		 -0.01341057 -0.041273586 0.31214595 -0.025508452 -0.035109431 0.31214595 -0.035109401 -0.025508495 0.31214595
		 -0.041273549 -0.013410621 0.31214595 -0.043397605 -1.3038516e-08 0.31214595 -0.041273549 0.013410594 0.55500305
		 -0.035109416 0.02550848 0.55500305 -0.025508456 0.035109416 0.55500305 -0.013410576 0.041273572 0.55500305
		 1.1175871e-08 0.043397613 0.55500305 0.013410628 0.041273594 0.55500305 0.025508489 0.035109416 0.55500305
		 0.035109445 0.02550848 0.55500305 0.041273601 0.013410609 0.55500305 0.043397613 -1.3038516e-08 0.55500305
		 0.041273572 -0.013410615 0.55500305 0.035109419 -0.025508495 0.55500305 0.025508478 -0.035109431 0.55500305
		 0.013410619 -0.041273579 0.55500305 9.8561266e-09 -0.043397613 0.55500305 -0.01341057 -0.041273586 0.55500305
		 -0.025508452 -0.035109431 0.55500305 -0.035109401 -0.025508495 0.55500305;
	setAttr ".vt[498:663]" -0.041273549 -0.013410621 0.55500305 -0.043397605 -1.3038516e-08 0.55500305
		 -0.041273549 0.013410594 0.79786021 -0.035109416 0.02550848 0.79786021 -0.025508456 0.035109416 0.79786021
		 -0.013410576 0.041273572 0.79786021 1.1175871e-08 0.043397613 0.79786021 0.013410628 0.041273594 0.79786021
		 0.025508489 0.035109416 0.79786021 0.035109445 0.02550848 0.79786021 0.041273601 0.013410609 0.79786021
		 0.043397613 -1.3038516e-08 0.79786021 0.041273572 -0.013410615 0.79786021 0.035109419 -0.025508495 0.79786021
		 0.025508478 -0.035109431 0.79786021 0.013410619 -0.041273579 0.79786021 9.8561266e-09 -0.043397613 0.79786021
		 -0.01341057 -0.041273586 0.79786021 -0.025508452 -0.035109431 0.79786021 -0.035109401 -0.025508495 0.79786021
		 -0.041273549 -0.013410621 0.79786021 -0.043397605 -1.3038516e-08 0.79786021 -0.041273549 0.013410594 1.040717363
		 -0.035109416 0.02550848 1.040717363 -0.025508456 0.035109416 1.040717363 -0.013410576 0.041273572 1.040717363
		 1.1175871e-08 0.043397613 1.040717363 0.013410628 0.041273594 1.040717363 0.025508489 0.035109416 1.040717363
		 0.035109445 0.02550848 1.040717363 0.041273601 0.013410609 1.040717363 0.043397613 -1.3038516e-08 1.040717363
		 0.041273572 -0.013410615 1.040717363 0.035109423 -0.025508495 1.040717363 0.025508478 -0.035109431 1.040717363
		 0.013410619 -0.041273579 1.040717363 9.8561266e-09 -0.043397613 1.040717363 -0.01341057 -0.041273586 1.040717363
		 -0.025508452 -0.035109431 1.040717363 -0.035109401 -0.025508495 1.040717363 -0.041273549 -0.013410621 1.040717363
		 -0.043397605 -1.3038516e-08 1.040717363 -0.041273549 0.013410594 1.28357446 -0.035109412 0.02550848 1.28357446
		 -0.025508456 0.035109416 1.28357446 -0.013410576 0.041273572 1.28357446 1.1175871e-08 0.043397613 1.28357446
		 0.013410628 0.041273586 1.28357446 0.025508489 0.035109416 1.28357446 0.035109445 0.02550848 1.28357446
		 0.041273601 0.013410609 1.28357446 0.043397613 -1.3038516e-08 1.28357446 0.041273572 -0.013410615 1.28357446
		 0.035109423 -0.025508495 1.28357446 0.025508478 -0.035109431 1.28357446 0.013410619 -0.041273579 1.28357446
		 9.8561266e-09 -0.043397613 1.28357446 -0.01341057 -0.041273586 1.28357446 -0.025508452 -0.035109431 1.28357446
		 -0.035109401 -0.025508495 1.28357446 -0.041273549 -0.013410621 1.28357446 -0.043397605 -1.3038516e-08 1.28357446
		 -0.035109408 0.02550848 1.52643156 -0.025508456 0.035109416 1.52643156 -0.013410576 0.041273572 1.52643156
		 1.1175871e-08 0.043397613 1.52643156 0.013410628 0.041273579 1.52643156 0.025508489 0.035109416 1.52643156
		 0.035109445 0.02550848 1.52643156 0.041273601 0.013410609 1.52643156 0.043397613 -1.3038516e-08 1.52643156
		 0.041273572 -0.013410615 1.52643156 0.035109423 -0.025508495 1.52643156 0.025508478 -0.035109431 1.52643156
		 0.013410619 -0.041273579 1.52643156 9.8561266e-09 -0.043397613 1.52643156 -0.01341057 -0.041273586 1.52643156
		 -0.025508452 -0.035109431 1.52643156 -0.035109401 -0.025508495 1.52643156 -0.041273553 -0.013410621 1.52643156
		 -0.043397605 -1.3038516e-08 1.52643156 -0.041273553 0.013410594 1.52643156 -0.035109408 0.025508482 1.76928878
		 -0.025508456 0.035109416 1.76928878 -0.013410576 0.041273572 1.76928878 1.1175871e-08 0.043397613 1.76928878
		 0.013410628 0.041273579 1.76928878 0.025508489 0.035109416 1.76928878 0.035109445 0.02550848 1.76928878
		 0.041273601 0.013410609 1.76928878 0.043397613 -1.3038517e-08 1.76928878 0.041273572 -0.013410615 1.76928878
		 0.035109423 -0.025508495 1.76928878 0.025508478 -0.035109431 1.76928878 0.013410619 -0.041273579 1.76928878
		 9.8561266e-09 -0.043397613 1.76928878 -0.01341057 -0.041273586 1.76928878 -0.025508452 -0.035109431 1.76928878
		 -0.035109401 -0.025508495 1.76928878 -0.041273553 -0.013410621 1.76928878 -0.043397605 -1.3038517e-08 1.76928878
		 -0.041273553 0.013410594 1.76928878 -0.035109408 0.025508484 2.012145996 -0.025508456 0.035109416 2.012145996
		 -0.013410576 0.041273572 2.012145996 1.1175871e-08 0.043397613 2.012145996 0.013410628 0.041273579 2.012145996
		 0.025508489 0.035109416 2.012145996 0.035109445 0.02550848 2.012145996 0.041273601 0.013410609 2.012145996
		 0.043397613 -1.3038517e-08 2.012145996 0.041273572 -0.013410615 2.012145996 0.035109423 -0.025508495 2.012145996
		 0.025508478 -0.035109431 2.012145996 0.013410619 -0.041273579 2.012145996 9.8561266e-09 -0.043397613 2.012145996
		 -0.01341057 -0.041273586 2.012145996 -0.025508452 -0.035109431 2.012145996 -0.035109401 -0.025508495 2.012145996
		 -0.041273549 -0.013410621 2.012145996 -0.043397605 -1.3038517e-08 2.012145996 -0.041273549 0.013410594 2.012145996
		 -0.035109408 0.025508484 2.25500298 -0.025508456 0.035109416 2.25500298 -0.013410576 0.041273572 2.25500298
		 1.1175871e-08 0.043397613 2.25500298 0.013410628 0.041273579 2.25500298 0.025508489 0.035109416 2.25500298
		 0.035109445 0.02550848 2.25500298 0.041273601 0.013410609 2.25500298 0.043397613 -1.3038517e-08 2.25500298
		 0.041273572 -0.013410615 2.25500298 0.035109423 -0.025508495 2.25500298 0.025508478 -0.035109431 2.25500298
		 0.013410619 -0.041273579 2.25500298 9.8561266e-09 -0.043397613 2.25500298 -0.01341057 -0.041273586 2.25500298
		 -0.025508452 -0.035109431 2.25500298 -0.035109401 -0.025508495 2.25500298 -0.041273549 -0.013410621 2.25500298
		 -0.043397605 -1.3038517e-08 2.25500298 -0.041273549 0.013410594 2.25500298 0.043397613 -1.3038517e-08 2.49785995
		 0.041273572 -0.013410615 2.49785995 0.035109423 -0.025508495 2.49785995 0.025508478 -0.035109431 2.49785995
		 0.013410619 -0.041273579 2.49785995 9.8561266e-09 -0.043397613 2.49785995 -0.01341057 -0.041273586 2.49785995
		 -0.025508452 -0.035109416 2.49785995 -0.035109401 -0.025508495 2.49785995 -0.041273549 -0.013410621 2.49785995
		 -0.043397605 -1.3038517e-08 2.49785995 -0.041273549 0.013410594 2.49785995 -0.035109408 0.025508484 2.49785995
		 -0.025508456 0.035109416 2.49785995 -0.013410576 0.041273572 2.49785995 1.1175871e-08 0.043397613 2.49785995
		 0.013410628 0.041273579 2.49785995 0.025508489 0.035109416 2.49785995 0.035109445 0.02550848 2.49785995
		 0.041273601 0.013410609 2.49785995 -0.025508456 0.035109416 2.74071741 -0.013410576 0.041273572 2.74071741
		 1.1175871e-08 0.043397613 2.74071741 0.013410628 0.041273579 2.74071741;
	setAttr ".vt[664:829]" 0.025508489 0.035109416 2.74071741 0.035109445 0.02550848 2.74071741
		 0.041273601 0.013410609 2.74071741 0.043397613 -1.3038517e-08 2.74071741 0.041273572 -0.013410615 2.74071741
		 0.035109419 -0.025508495 2.74071741 0.025508478 -0.035109431 2.74071741 0.013410619 -0.041273579 2.74071741
		 9.8561266e-09 -0.043397613 2.74071741 -0.01341057 -0.041273586 2.74071741 -0.025508452 -0.035109401 2.74071741
		 -0.035109401 -0.025508495 2.74071741 -0.041273549 -0.013410621 2.74071741 -0.043397605 -1.3038517e-08 2.74071741
		 -0.041273549 0.013410594 2.74071741 -0.035109408 0.025508484 2.74071741 -0.025508456 0.035109416 2.98357487
		 -0.013410576 0.041273572 2.98357487 1.1175871e-08 0.043397613 2.98357487 0.013410628 0.041273579 2.98357487
		 0.025508489 0.035109416 2.98357487 0.035109445 0.02550848 2.98357487 0.041273601 0.013410609 2.98357487
		 0.043397613 -1.3038517e-08 2.98357487 0.041273572 -0.013410615 2.98357487 0.035109416 -0.025508495 2.98357487
		 0.025508478 -0.035109431 2.98357487 0.013410619 -0.041273579 2.98357487 9.8561266e-09 -0.043397613 2.98357487
		 -0.01341057 -0.041273586 2.98357487 -0.025508452 -0.035109401 2.98357487 -0.035109401 -0.025508495 2.98357487
		 -0.041273549 -0.013410621 2.98357487 -0.043397605 -1.3038517e-08 2.98357487 -0.041273549 0.013410594 2.98357487
		 -0.035109408 0.025508484 2.98357487 -0.025508456 0.035109416 3.22643185 -0.013410576 0.041273572 3.22643185
		 1.1175871e-08 0.043397613 3.22643185 0.013410628 0.041273579 3.22643185 0.025508489 0.035109416 3.22643185
		 0.035109445 0.02550848 3.22643185 0.041273601 0.013410609 3.22643185 0.043397613 -1.3038517e-08 3.22643185
		 0.041273568 -0.013410615 3.22643185 0.035109416 -0.025508495 3.22643185 0.025508478 -0.035109431 3.22643185
		 0.013410619 -0.041273579 3.22643185 9.8561266e-09 -0.043397613 3.22643185 -0.01341057 -0.041273586 3.22643185
		 -0.025508452 -0.035109401 3.22643185 -0.035109401 -0.025508495 3.22643185 -0.041273549 -0.013410621 3.22643185
		 -0.043397605 -1.3038517e-08 3.22643185 -0.041273549 0.013410594 3.22643185 -0.035109408 0.025508484 3.22643185
		 0.041273564 -0.013410615 3.46928883 0.035109416 -0.025508495 3.46928883 0.025508478 -0.035109431 3.46928883
		 0.013410619 -0.041273579 3.46928883 9.8561266e-09 -0.043397613 3.46928883 -0.01341057 -0.041273586 3.46928883
		 -0.025508452 -0.035109401 3.46928883 -0.035109401 -0.025508495 3.46928883 -0.041273549 -0.013410621 3.46928883
		 -0.043397605 -1.3038517e-08 3.46928883 -0.041273549 0.013410594 3.46928883 -0.035109408 0.025508484 3.46928883
		 -0.025508456 0.035109416 3.46928883 -0.013410576 0.041273572 3.46928883 1.1175871e-08 0.043397613 3.46928883
		 0.013410628 0.041273579 3.46928883 0.025508489 0.035109416 3.46928883 0.035109445 0.02550848 3.46928883
		 0.041273601 0.013410609 3.46928883 0.043397613 -1.3038517e-08 3.46928883 -0.035109408 0.025508484 3.71214581
		 -0.025508456 0.035109416 3.71214581 -0.013410576 0.041273572 3.71214581 1.1175871e-08 0.043397613 3.71214581
		 0.013410628 0.041273579 3.71214581 0.025508489 0.035109416 3.71214581 0.035109445 0.02550848 3.71214581
		 0.041273601 0.013410609 3.71214581 0.043397613 -1.3038517e-08 3.71214581 0.041273564 -0.013410615 3.71214581
		 0.035109416 -0.025508495 3.71214581 0.025508478 -0.035109431 3.71214581 0.013410619 -0.041273579 3.71214581
		 9.8561266e-09 -0.043397613 3.71214581 -0.01341057 -0.041273586 3.71214581 -0.025508452 -0.035109401 3.71214581
		 -0.035109401 -0.025508495 3.71214581 -0.041273549 -0.013410621 3.71214581 -0.043397605 -1.3038517e-08 3.71214581
		 -0.041273549 0.013410594 3.71214581 -0.035109408 0.025508482 3.95500326 -0.025508456 0.035109416 3.95500326
		 -0.013410576 0.041273572 3.95500326 1.117587e-08 0.043397613 3.95500326 0.013410628 0.041273579 3.95500326
		 0.025508489 0.035109416 3.95500326 0.035109445 0.02550848 3.95500326 0.041273601 0.013410609 3.95500326
		 0.043397613 -1.3038517e-08 3.95500326 0.041273564 -0.013410615 3.95500326 0.035109416 -0.025508495 3.95500326
		 0.025508478 -0.035109431 3.95500326 0.013410619 -0.041273579 3.95500326 9.8561266e-09 -0.043397613 3.95500326
		 -0.01341057 -0.041273586 3.95500326 -0.025508452 -0.035109401 3.95500326 -0.035109401 -0.025508495 3.95500326
		 -0.041273549 -0.013410621 3.95500326 -0.043397605 -1.3038517e-08 3.95500326 -0.041273549 0.013410594 3.95500326
		 -0.035109408 0.02550848 4.19786024 -0.025508456 0.035109416 4.19786024 -0.013410576 0.041273572 4.19786024
		 1.117587e-08 0.043397613 4.19786024 0.013410628 0.041273579 4.19786024 0.025508489 0.035109416 4.19786024
		 0.035109445 0.02550848 4.19786024 0.041273601 0.013410609 4.19786024 0.043397613 -1.3038517e-08 4.19786024
		 0.041273564 -0.013410615 4.19786024 0.035109416 -0.025508495 4.19786024 0.025508478 -0.035109431 4.19786024
		 0.013410619 -0.041273579 4.19786024 9.8561266e-09 -0.043397613 4.19786024 -0.01341057 -0.041273586 4.19786024
		 -0.025508452 -0.035109401 4.19786024 -0.035109401 -0.025508495 4.19786024 -0.041273549 -0.013410621 4.19786024
		 -0.043397605 -1.3038517e-08 4.19786024 -0.041273549 0.013410594 4.19786024 -0.035109408 0.02550848 4.4407177
		 -0.025508456 0.035109416 4.4407177 -0.013410576 0.041273572 4.4407177 1.117587e-08 0.043397613 4.4407177
		 0.013410628 0.041273579 4.4407177 0.025508489 0.035109416 4.4407177 0.035109445 0.02550848 4.4407177
		 0.041273601 0.013410609 4.4407177 0.043397613 -1.3038517e-08 4.4407177 0.041273564 -0.013410615 4.4407177
		 0.035109416 -0.025508495 4.4407177 0.025508478 -0.035109431 4.4407177 0.013410619 -0.041273579 4.4407177
		 9.8561257e-09 -0.043397613 4.4407177 -0.01341057 -0.041273586 4.4407177 -0.025508452 -0.035109401 4.4407177
		 -0.035109401 -0.025508495 4.4407177 -0.041273549 -0.013410621 4.4407177 -0.043397605 -1.3038517e-08 4.4407177
		 -0.041273549 0.013410594 4.4407177 0.043397613 -1.3038517e-08 4.68357468 0.041273564 -0.013410615 4.68357468
		 0.035109416 -0.025508495 4.68357468 0.025508478 -0.035109431 4.68357468 0.013410619 -0.041273579 4.68357468
		 9.8561248e-09 -0.043397613 4.68357468 -0.01341057 -0.041273586 4.68357468 -0.025508452 -0.035109401 4.68357468
		 -0.035109401 -0.025508495 4.68357468 -0.041273549 -0.013410621 4.68357468;
	setAttr ".vt[830:859]" -0.043397605 -1.3038517e-08 4.68357468 -0.041273549 0.013410594 4.68357468
		 -0.035109408 0.02550848 4.68357468 -0.025508456 0.035109416 4.68357468 -0.013410576 0.041273572 4.68357468
		 1.117587e-08 0.043397613 4.68357468 0.013410628 0.041273579 4.68357468 0.025508489 0.035109416 4.68357468
		 0.035109445 0.02550848 4.68357468 0.041273601 0.013410609 4.68357468 -0.025508456 0.035109416 4.90250111
		 -0.013410576 0.041273572 4.90250111 1.117587e-08 0.043397613 4.90250111 0.013410628 0.041273579 4.90250111
		 0.025508489 0.035109416 4.90250111 0.035109445 0.02550848 4.90250111 0.041273601 0.013410609 4.90250111
		 0.043397613 -1.3038518e-08 4.90250111 0.041273564 -0.013410615 4.90250111 0.035109416 -0.025508493 4.90250111
		 0.025508478 -0.035109431 4.90250111 0.013410619 -0.041273579 4.90250111 9.8561248e-09 -0.043397613 4.90250111
		 -0.01341057 -0.041273586 4.90250111 -0.025508452 -0.035109401 4.90250111 -0.035109401 -0.025508495 4.90250111
		 -0.041273553 -0.013410621 4.90250111 -0.043397605 -1.3038518e-08 4.90250111 -0.041273553 0.013410594 4.90250111
		 -0.035109408 0.02550848 4.90250111;
	setAttr -s 1700 ".ed";
	setAttr ".ed[0:165]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0 7 8 0 8 9 0
		 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0 18 19 0 19 0 0
		 20 21 0 21 22 0 22 23 0 23 24 0 24 25 0 25 26 0 26 27 0 27 28 0 28 29 0 29 30 0 30 31 0
		 31 32 0 32 33 0 33 34 0 34 35 0 35 36 0 36 37 0 37 38 0 38 39 0 39 20 0 0 447 1 1 446 1
		 2 445 1 3 444 1 4 443 1 5 442 1 6 441 1 7 440 1 8 459 1 9 458 1 10 457 1 11 456 1
		 12 455 1 13 454 1 14 453 1 15 452 1 16 451 1 17 450 1 18 449 1 19 448 1 40 847 1
		 41 848 1 40 41 1 42 849 1 41 42 1 43 850 1 42 43 1 44 851 1 43 44 1 45 852 1 44 45 1
		 46 853 1 45 46 1 47 854 1 46 47 1 48 855 1 47 48 1 49 856 1 48 49 1 50 857 1 49 50 1
		 51 858 1 50 51 1 52 859 1 51 52 1 53 840 1 52 53 1 54 841 1 53 54 1 55 842 1 54 55 1
		 56 843 1 55 56 1 57 844 1 56 57 1 58 845 1 57 58 1 59 846 1 58 59 1 59 40 1 60 820 1
		 61 821 1 60 61 1 62 822 1 61 62 1 63 823 1 62 63 1 64 824 1 63 64 1 65 825 1 64 65 1
		 66 826 1 65 66 1 67 827 1 66 67 1 68 828 1 67 68 1 69 829 1 68 69 1 70 830 1 69 70 1
		 71 831 1 70 71 1 72 832 1 71 72 1 73 833 1 72 73 1 74 834 1 73 74 1 75 835 1 74 75 1
		 76 836 1 75 76 1 77 837 1 76 77 1 78 838 1 77 78 1 79 839 1 78 79 1 79 60 1 80 808 1
		 81 809 1 80 81 1 82 810 1 81 82 1 83 811 1 82 83 1 84 812 1 83 84 1 85 813 1 84 85 1
		 86 814 1 85 86 1 87 815 1 86 87 1 88 816 1 87 88 1 89 817 1 88 89 1 90 818 1 89 90 1
		 91 819 1 90 91 1 92 800 1 91 92 1 93 801 1;
	setAttr ".ed[166:331]" 92 93 1 94 802 1 93 94 1 95 803 1 94 95 1 96 804 1 95 96 1
		 97 805 1 96 97 1 98 806 1 97 98 1 99 807 1 98 99 1 99 80 1 100 788 1 101 789 1 100 101 1
		 102 790 1 101 102 1 103 791 1 102 103 1 104 792 1 103 104 1 105 793 1 104 105 1 106 794 1
		 105 106 1 107 795 1 106 107 1 108 796 1 107 108 1 109 797 1 108 109 1 110 798 1 109 110 1
		 111 799 1 110 111 1 112 780 1 111 112 1 113 781 1 112 113 1 114 782 1 113 114 1 115 783 1
		 114 115 1 116 784 1 115 116 1 117 785 1 116 117 1 118 786 1 117 118 1 119 787 1 118 119 1
		 119 100 1 120 768 1 121 769 1 120 121 1 122 770 1 121 122 1 123 771 1 122 123 1 124 772 1
		 123 124 1 125 773 1 124 125 1 126 774 1 125 126 1 127 775 1 126 127 1 128 776 1 127 128 1
		 129 777 1 128 129 1 130 778 1 129 130 1 131 779 1 130 131 1 132 760 1 131 132 1 133 761 1
		 132 133 1 134 762 1 133 134 1 135 763 1 134 135 1 136 764 1 135 136 1 137 765 1 136 137 1
		 138 766 1 137 138 1 139 767 1 138 139 1 139 120 1 140 748 1 141 749 1 140 141 1 142 750 1
		 141 142 1 143 751 1 142 143 1 144 752 1 143 144 1 145 753 1 144 145 1 146 754 1 145 146 1
		 147 755 1 146 147 1 148 756 1 147 148 1 149 757 1 148 149 1 150 758 1 149 150 1 151 759 1
		 150 151 1 152 740 1 151 152 1 153 741 1 152 153 1 154 742 1 153 154 1 155 743 1 154 155 1
		 156 744 1 155 156 1 157 745 1 156 157 1 158 746 1 157 158 1 159 747 1 158 159 1 159 140 1
		 160 739 1 161 720 1 160 161 1 162 721 1 161 162 1 163 722 1 162 163 1 164 723 1 163 164 1
		 165 724 1 164 165 1 166 725 1 165 166 1 167 726 1 166 167 1 168 727 1 167 168 1 169 728 1
		 168 169 1 170 729 1 169 170 1 171 730 1 170 171 1 172 731 1 171 172 1 173 732 1 172 173 1
		 174 733 1 173 174 1 175 734 1 174 175 1 176 735 1;
	setAttr ".ed[332:497]" 175 176 1 177 736 1 176 177 1 178 737 1 177 178 1 179 738 1
		 178 179 1 179 160 1 180 707 1 181 708 1 180 181 1 182 709 1 181 182 1 183 710 1 182 183 1
		 184 711 1 183 184 1 185 712 1 184 185 1 186 713 1 185 186 1 187 714 1 186 187 1 188 715 1
		 187 188 1 189 716 1 188 189 1 190 717 1 189 190 1 191 718 1 190 191 1 192 719 1 191 192 1
		 193 700 1 192 193 1 194 701 1 193 194 1 195 702 1 194 195 1 196 703 1 195 196 1 197 704 1
		 196 197 1 198 705 1 197 198 1 199 706 1 198 199 1 199 180 1 200 687 1 201 688 1 200 201 1
		 202 689 1 201 202 1 203 690 1 202 203 1 204 691 1 203 204 1 205 692 1 204 205 1 206 693 1
		 205 206 1 207 694 1 206 207 1 208 695 1 207 208 1 209 696 1 208 209 1 210 697 1 209 210 1
		 211 698 1 210 211 1 212 699 1 211 212 1 213 680 1 212 213 1 214 681 1 213 214 1 215 682 1
		 214 215 1 216 683 1 215 216 1 217 684 1 216 217 1 218 685 1 217 218 1 219 686 1 218 219 1
		 219 200 1 220 667 1 221 668 1 220 221 1 222 669 1 221 222 1 223 670 1 222 223 1 224 671 1
		 223 224 1 225 672 1 224 225 1 226 673 1 225 226 1 227 674 1 226 227 1 228 675 1 227 228 1
		 229 676 1 228 229 1 230 677 1 229 230 1 231 678 1 230 231 1 232 679 1 231 232 1 233 660 1
		 232 233 1 234 661 1 233 234 1 235 662 1 234 235 1 236 663 1 235 236 1 237 664 1 236 237 1
		 238 665 1 237 238 1 239 666 1 238 239 1 239 220 1 240 640 1 241 641 1 240 241 1 242 642 1
		 241 242 1 243 643 1 242 243 1 244 644 1 243 244 1 245 645 1 244 245 1 246 646 1 245 246 1
		 247 647 1 246 247 1 248 648 1 247 248 1 249 649 1 248 249 1 250 650 1 249 250 1 251 651 1
		 250 251 1 252 652 1 251 252 1 253 653 1 252 253 1 254 654 1 253 254 1 255 655 1 254 255 1
		 256 656 1 255 256 1 257 657 1 256 257 1 258 658 1 257 258 1 259 659 1;
	setAttr ".ed[498:663]" 258 259 1 259 240 1 260 628 1 261 629 1 260 261 1 262 630 1
		 261 262 1 263 631 1 262 263 1 264 632 1 263 264 1 265 633 1 264 265 1 266 634 1 265 266 1
		 267 635 1 266 267 1 268 636 1 267 268 1 269 637 1 268 269 1 270 638 1 269 270 1 271 639 1
		 270 271 1 272 620 1 271 272 1 273 621 1 272 273 1 274 622 1 273 274 1 275 623 1 274 275 1
		 276 624 1 275 276 1 277 625 1 276 277 1 278 626 1 277 278 1 279 627 1 278 279 1 279 260 1
		 280 608 1 281 609 1 280 281 1 282 610 1 281 282 1 283 611 1 282 283 1 284 612 1 283 284 1
		 285 613 1 284 285 1 286 614 1 285 286 1 287 615 1 286 287 1 288 616 1 287 288 1 289 617 1
		 288 289 1 290 618 1 289 290 1 291 619 1 290 291 1 292 600 1 291 292 1 293 601 1 292 293 1
		 294 602 1 293 294 1 295 603 1 294 295 1 296 604 1 295 296 1 297 605 1 296 297 1 298 606 1
		 297 298 1 299 607 1 298 299 1 299 280 1 300 588 1 301 589 1 300 301 1 302 590 1 301 302 1
		 303 591 1 302 303 1 304 592 1 303 304 1 305 593 1 304 305 1 306 594 1 305 306 1 307 595 1
		 306 307 1 308 596 1 307 308 1 309 597 1 308 309 1 310 598 1 309 310 1 311 599 1 310 311 1
		 312 580 1 311 312 1 313 581 1 312 313 1 314 582 1 313 314 1 315 583 1 314 315 1 316 584 1
		 315 316 1 317 585 1 316 317 1 318 586 1 317 318 1 319 587 1 318 319 1 319 300 1 320 568 1
		 321 569 1 320 321 1 322 570 1 321 322 1 323 571 1 322 323 1 324 572 1 323 324 1 325 573 1
		 324 325 1 326 574 1 325 326 1 327 575 1 326 327 1 328 576 1 327 328 1 329 577 1 328 329 1
		 330 578 1 329 330 1 331 579 1 330 331 1 332 560 1 331 332 1 333 561 1 332 333 1 334 562 1
		 333 334 1 335 563 1 334 335 1 336 564 1 335 336 1 337 565 1 336 337 1 338 566 1 337 338 1
		 339 567 1 338 339 1 339 320 1 340 549 1 341 550 1 340 341 1 342 551 1;
	setAttr ".ed[664:829]" 341 342 1 343 552 1 342 343 1 344 553 1 343 344 1 345 554 1
		 344 345 1 346 555 1 345 346 1 347 556 1 346 347 1 348 557 1 347 348 1 349 558 1 348 349 1
		 350 559 1 349 350 1 351 540 1 350 351 1 352 541 1 351 352 1 353 542 1 352 353 1 354 543 1
		 353 354 1 355 544 1 354 355 1 356 545 1 355 356 1 357 546 1 356 357 1 358 547 1 357 358 1
		 359 548 1 358 359 1 359 340 1 360 529 1 361 530 1 360 361 1 362 531 1 361 362 1 363 532 1
		 362 363 1 364 533 1 363 364 1 365 534 1 364 365 1 366 535 1 365 366 1 367 536 1 366 367 1
		 368 537 1 367 368 1 369 538 1 368 369 1 370 539 1 369 370 1 371 520 1 370 371 1 372 521 1
		 371 372 1 373 522 1 372 373 1 374 523 1 373 374 1 375 524 1 374 375 1 376 525 1 375 376 1
		 377 526 1 376 377 1 378 527 1 377 378 1 379 528 1 378 379 1 379 360 1 380 509 1 381 510 1
		 380 381 1 382 511 1 381 382 1 383 512 1 382 383 1 384 513 1 383 384 1 385 514 1 384 385 1
		 386 515 1 385 386 1 387 516 1 386 387 1 388 517 1 387 388 1 389 518 1 388 389 1 390 519 1
		 389 390 1 391 500 1 390 391 1 392 501 1 391 392 1 393 502 1 392 393 1 394 503 1 393 394 1
		 395 504 1 394 395 1 396 505 1 395 396 1 397 506 1 396 397 1 398 507 1 397 398 1 399 508 1
		 398 399 1 399 380 1 400 489 1 401 490 1 400 401 1 402 491 1 401 402 1 403 492 1 402 403 1
		 404 493 1 403 404 1 405 494 1 404 405 1 406 495 1 405 406 1 407 496 1 406 407 1 408 497 1
		 407 408 1 409 498 1 408 409 1 410 499 1 409 410 1 411 480 1 410 411 1 412 481 1 411 412 1
		 413 482 1 412 413 1 414 483 1 413 414 1 415 484 1 414 415 1 416 485 1 415 416 1 417 486 1
		 416 417 1 418 487 1 417 418 1 419 488 1 418 419 1 419 400 1 420 469 1 421 470 1 420 421 1
		 422 471 1 421 422 1 423 472 1 422 423 1 424 473 1 423 424 1 425 474 1;
	setAttr ".ed[830:995]" 424 425 1 426 475 1 425 426 1 427 476 1 426 427 1 428 477 1
		 427 428 1 429 478 1 428 429 1 430 479 1 429 430 1 431 460 1 430 431 1 432 461 1 431 432 1
		 433 462 1 432 433 1 434 463 1 433 434 1 435 464 1 434 435 1 436 465 1 435 436 1 437 466 1
		 436 437 1 438 467 1 437 438 1 439 468 1 438 439 1 439 420 1 440 432 1 441 433 1 440 441 1
		 442 434 1 441 442 1 443 435 1 442 443 1 444 436 1 443 444 1 445 437 1 444 445 1 446 438 1
		 445 446 1 447 439 1 446 447 1 448 420 1 447 448 1 449 421 1 448 449 1 450 422 1 449 450 1
		 451 423 1 450 451 1 452 424 1 451 452 1 453 425 1 452 453 1 454 426 1 453 454 1 455 427 1
		 454 455 1 456 428 1 455 456 1 457 429 1 456 457 1 458 430 1 457 458 1 459 431 1 458 459 1
		 459 440 1 460 411 1 461 412 1 460 461 1 462 413 1 461 462 1 463 414 1 462 463 1 464 415 1
		 463 464 1 465 416 1 464 465 1 466 417 1 465 466 1 467 418 1 466 467 1 468 419 1 467 468 1
		 469 400 1 468 469 1 470 401 1 469 470 1 471 402 1 470 471 1 472 403 1 471 472 1 473 404 1
		 472 473 1 474 405 1 473 474 1 475 406 1 474 475 1 476 407 1 475 476 1 477 408 1 476 477 1
		 478 409 1 477 478 1 479 410 1 478 479 1 479 460 1 480 391 1 481 392 1 480 481 1 482 393 1
		 481 482 1 483 394 1 482 483 1 484 395 1 483 484 1 485 396 1 484 485 1 486 397 1 485 486 1
		 487 398 1 486 487 1 488 399 1 487 488 1 489 380 1 488 489 1 490 381 1 489 490 1 491 382 1
		 490 491 1 492 383 1 491 492 1 493 384 1 492 493 1 494 385 1 493 494 1 495 386 1 494 495 1
		 496 387 1 495 496 1 497 388 1 496 497 1 498 389 1 497 498 1 499 390 1 498 499 1 499 480 1
		 500 371 1 501 372 1 500 501 1 502 373 1 501 502 1 503 374 1 502 503 1 504 375 1 503 504 1
		 505 376 1 504 505 1 506 377 1 505 506 1 507 378 1 506 507 1 508 379 1;
	setAttr ".ed[996:1161]" 507 508 1 509 360 1 508 509 1 510 361 1 509 510 1 511 362 1
		 510 511 1 512 363 1 511 512 1 513 364 1 512 513 1 514 365 1 513 514 1 515 366 1 514 515 1
		 516 367 1 515 516 1 517 368 1 516 517 1 518 369 1 517 518 1 519 370 1 518 519 1 519 500 1
		 520 351 1 521 352 1 520 521 1 522 353 1 521 522 1 523 354 1 522 523 1 524 355 1 523 524 1
		 525 356 1 524 525 1 526 357 1 525 526 1 527 358 1 526 527 1 528 359 1 527 528 1 529 340 1
		 528 529 1 530 341 1 529 530 1 531 342 1 530 531 1 532 343 1 531 532 1 533 344 1 532 533 1
		 534 345 1 533 534 1 535 346 1 534 535 1 536 347 1 535 536 1 537 348 1 536 537 1 538 349 1
		 537 538 1 539 350 1 538 539 1 539 520 1 540 331 1 541 332 1 540 541 1 542 333 1 541 542 1
		 543 334 1 542 543 1 544 335 1 543 544 1 545 336 1 544 545 1 546 337 1 545 546 1 547 338 1
		 546 547 1 548 339 1 547 548 1 549 320 1 548 549 1 550 321 1 549 550 1 551 322 1 550 551 1
		 552 323 1 551 552 1 553 324 1 552 553 1 554 325 1 553 554 1 555 326 1 554 555 1 556 327 1
		 555 556 1 557 328 1 556 557 1 558 329 1 557 558 1 559 330 1 558 559 1 559 540 1 560 312 1
		 561 313 1 560 561 1 562 314 1 561 562 1 563 315 1 562 563 1 564 316 1 563 564 1 565 317 1
		 564 565 1 566 318 1 565 566 1 567 319 1 566 567 1 568 300 1 567 568 1 569 301 1 568 569 1
		 570 302 1 569 570 1 571 303 1 570 571 1 572 304 1 571 572 1 573 305 1 572 573 1 574 306 1
		 573 574 1 575 307 1 574 575 1 576 308 1 575 576 1 577 309 1 576 577 1 578 310 1 577 578 1
		 579 311 1 578 579 1 579 560 1 580 292 1 581 293 1 580 581 1 582 294 1 581 582 1 583 295 1
		 582 583 1 584 296 1 583 584 1 585 297 1 584 585 1 586 298 1 585 586 1 587 299 1 586 587 1
		 588 280 1 587 588 1 589 281 1 588 589 1 590 282 1 589 590 1 591 283 1;
	setAttr ".ed[1162:1327]" 590 591 1 592 284 1 591 592 1 593 285 1 592 593 1 594 286 1
		 593 594 1 595 287 1 594 595 1 596 288 1 595 596 1 597 289 1 596 597 1 598 290 1 597 598 1
		 599 291 1 598 599 1 599 580 1 600 272 1 601 273 1 600 601 1 602 274 1 601 602 1 603 275 1
		 602 603 1 604 276 1 603 604 1 605 277 1 604 605 1 606 278 1 605 606 1 607 279 1 606 607 1
		 608 260 1 607 608 1 609 261 1 608 609 1 610 262 1 609 610 1 611 263 1 610 611 1 612 264 1
		 611 612 1 613 265 1 612 613 1 614 266 1 613 614 1 615 267 1 614 615 1 616 268 1 615 616 1
		 617 269 1 616 617 1 618 270 1 617 618 1 619 271 1 618 619 1 619 600 1 620 252 1 621 253 1
		 620 621 1 622 254 1 621 622 1 623 255 1 622 623 1 624 256 1 623 624 1 625 257 1 624 625 1
		 626 258 1 625 626 1 627 259 1 626 627 1 628 240 1 627 628 1 629 241 1 628 629 1 630 242 1
		 629 630 1 631 243 1 630 631 1 632 244 1 631 632 1 633 245 1 632 633 1 634 246 1 633 634 1
		 635 247 1 634 635 1 636 248 1 635 636 1 637 249 1 636 637 1 638 250 1 637 638 1 639 251 1
		 638 639 1 639 620 1 640 220 1 641 221 1 640 641 1 642 222 1 641 642 1 643 223 1 642 643 1
		 644 224 1 643 644 1 645 225 1 644 645 1 646 226 1 645 646 1 647 227 1 646 647 1 648 228 1
		 647 648 1 649 229 1 648 649 1 650 230 1 649 650 1 651 231 1 650 651 1 652 232 1 651 652 1
		 653 233 1 652 653 1 654 234 1 653 654 1 655 235 1 654 655 1 656 236 1 655 656 1 657 237 1
		 656 657 1 658 238 1 657 658 1 659 239 1 658 659 1 659 640 1 660 213 1 661 214 1 660 661 1
		 662 215 1 661 662 1 663 216 1 662 663 1 664 217 1 663 664 1 665 218 1 664 665 1 666 219 1
		 665 666 1 667 200 1 666 667 1 668 201 1 667 668 1 669 202 1 668 669 1 670 203 1 669 670 1
		 671 204 1 670 671 1 672 205 1 671 672 1 673 206 1 672 673 1 674 207 1;
	setAttr ".ed[1328:1493]" 673 674 1 675 208 1 674 675 1 676 209 1 675 676 1 677 210 1
		 676 677 1 678 211 1 677 678 1 679 212 1 678 679 1 679 660 1 680 193 1 681 194 1 680 681 1
		 682 195 1 681 682 1 683 196 1 682 683 1 684 197 1 683 684 1 685 198 1 684 685 1 686 199 1
		 685 686 1 687 180 1 686 687 1 688 181 1 687 688 1 689 182 1 688 689 1 690 183 1 689 690 1
		 691 184 1 690 691 1 692 185 1 691 692 1 693 186 1 692 693 1 694 187 1 693 694 1 695 188 1
		 694 695 1 696 189 1 695 696 1 697 190 1 696 697 1 698 191 1 697 698 1 699 192 1 698 699 1
		 699 680 1 700 173 1 701 174 1 700 701 1 702 175 1 701 702 1 703 176 1 702 703 1 704 177 1
		 703 704 1 705 178 1 704 705 1 706 179 1 705 706 1 707 160 1 706 707 1 708 161 1 707 708 1
		 709 162 1 708 709 1 710 163 1 709 710 1 711 164 1 710 711 1 712 165 1 711 712 1 713 166 1
		 712 713 1 714 167 1 713 714 1 715 168 1 714 715 1 716 169 1 715 716 1 717 170 1 716 717 1
		 718 171 1 717 718 1 719 172 1 718 719 1 719 700 1 720 141 1 721 142 1 720 721 1 722 143 1
		 721 722 1 723 144 1 722 723 1 724 145 1 723 724 1 725 146 1 724 725 1 726 147 1 725 726 1
		 727 148 1 726 727 1 728 149 1 727 728 1 729 150 1 728 729 1 730 151 1 729 730 1 731 152 1
		 730 731 1 732 153 1 731 732 1 733 154 1 732 733 1 734 155 1 733 734 1 735 156 1 734 735 1
		 736 157 1 735 736 1 737 158 1 736 737 1 738 159 1 737 738 1 739 140 1 738 739 1 739 720 1
		 740 132 1 741 133 1 740 741 1 742 134 1 741 742 1 743 135 1 742 743 1 744 136 1 743 744 1
		 745 137 1 744 745 1 746 138 1 745 746 1 747 139 1 746 747 1 748 120 1 747 748 1 749 121 1
		 748 749 1 750 122 1 749 750 1 751 123 1 750 751 1 752 124 1 751 752 1 753 125 1 752 753 1
		 754 126 1 753 754 1 755 127 1 754 755 1 756 128 1 755 756 1 757 129 1;
	setAttr ".ed[1494:1659]" 756 757 1 758 130 1 757 758 1 759 131 1 758 759 1 759 740 1
		 760 112 1 761 113 1 760 761 1 762 114 1 761 762 1 763 115 1 762 763 1 764 116 1 763 764 1
		 765 117 1 764 765 1 766 118 1 765 766 1 767 119 1 766 767 1 768 100 1 767 768 1 769 101 1
		 768 769 1 770 102 1 769 770 1 771 103 1 770 771 1 772 104 1 771 772 1 773 105 1 772 773 1
		 774 106 1 773 774 1 775 107 1 774 775 1 776 108 1 775 776 1 777 109 1 776 777 1 778 110 1
		 777 778 1 779 111 1 778 779 1 779 760 1 780 92 1 781 93 1 780 781 1 782 94 1 781 782 1
		 783 95 1 782 783 1 784 96 1 783 784 1 785 97 1 784 785 1 786 98 1 785 786 1 787 99 1
		 786 787 1 788 80 1 787 788 1 789 81 1 788 789 1 790 82 1 789 790 1 791 83 1 790 791 1
		 792 84 1 791 792 1 793 85 1 792 793 1 794 86 1 793 794 1 795 87 1 794 795 1 796 88 1
		 795 796 1 797 89 1 796 797 1 798 90 1 797 798 1 799 91 1 798 799 1 799 780 1 800 72 1
		 801 73 1 800 801 1 802 74 1 801 802 1 803 75 1 802 803 1 804 76 1 803 804 1 805 77 1
		 804 805 1 806 78 1 805 806 1 807 79 1 806 807 1 808 60 1 807 808 1 809 61 1 808 809 1
		 810 62 1 809 810 1 811 63 1 810 811 1 812 64 1 811 812 1 813 65 1 812 813 1 814 66 1
		 813 814 1 815 67 1 814 815 1 816 68 1 815 816 1 817 69 1 816 817 1 818 70 1 817 818 1
		 819 71 1 818 819 1 819 800 1 820 40 1 821 41 1 820 821 1 822 42 1 821 822 1 823 43 1
		 822 823 1 824 44 1 823 824 1 825 45 1 824 825 1 826 46 1 825 826 1 827 47 1 826 827 1
		 828 48 1 827 828 1 829 49 1 828 829 1 830 50 1 829 830 1 831 51 1 830 831 1 832 52 1
		 831 832 1 833 53 1 832 833 1 834 54 1 833 834 1 835 55 1 834 835 1 836 56 1 835 836 1
		 837 57 1 836 837 1 838 58 1 837 838 1 839 59 1 838 839 1 839 820 1;
	setAttr ".ed[1660:1699]" 840 26 1 841 25 1 840 841 1 842 24 1 841 842 1 843 23 1
		 842 843 1 844 22 1 843 844 1 845 21 1 844 845 1 846 20 1 845 846 1 847 39 1 846 847 1
		 848 38 1 847 848 1 849 37 1 848 849 1 850 36 1 849 850 1 851 35 1 850 851 1 852 34 1
		 851 852 1 853 33 1 852 853 1 854 32 1 853 854 1 855 31 1 854 855 1 856 30 1 855 856 1
		 857 29 1 856 857 1 858 28 1 857 858 1 859 27 1 858 859 1 859 840 1;
	setAttr -s 840 -ch 3360 ".fc";
	setAttr ".fc[0:499]" -type "polyFaces"
		f 4 0 41 874 -41
		mu 0 4 0 1 531 532
		f 4 1 42 872 -42
		mu 0 4 1 4 530 531
		f 4 2 43 870 -43
		mu 0 4 4 308 529 530
		f 4 3 44 868 -44
		mu 0 4 308 310 528 529
		f 4 4 45 866 -45
		mu 0 4 310 313 527 528
		f 4 5 46 864 -46
		mu 0 4 313 162 526 527
		f 4 6 47 862 -47
		mu 0 4 162 154 525 526
		f 4 7 48 899 -48
		mu 0 4 154 155 545 525
		f 4 8 49 898 -49
		mu 0 4 155 158 544 545
		f 4 9 50 896 -50
		mu 0 4 158 164 543 544
		f 4 10 51 894 -51
		mu 0 4 164 170 542 543
		f 4 11 52 892 -52
		mu 0 4 170 177 541 542
		f 4 12 53 890 -53
		mu 0 4 177 374 540 541
		f 4 13 54 888 -54
		mu 0 4 374 376 539 540
		f 4 14 55 886 -55
		mu 0 4 376 379 538 539
		f 4 15 56 884 -56
		mu 0 4 379 383 536 538
		f 4 16 57 882 -57
		mu 0 4 29 21 535 537
		f 4 17 58 880 -58
		mu 0 4 21 14 534 535
		f 4 18 59 878 -59
		mu 0 4 14 8 533 534
		f 4 19 40 876 -60
		mu 0 4 8 0 532 533
		f 4 -63 60 1676 -62
		mu 0 4 145 139 952 953
		f 4 -65 61 1678 -64
		mu 0 4 149 145 953 954
		f 4 -67 63 1680 -66
		mu 0 4 152 149 954 956
		f 4 -69 65 1682 -68
		mu 0 4 457 459 955 957
		f 4 -71 67 1684 -70
		mu 0 4 454 457 957 958
		f 4 -73 69 1686 -72
		mu 0 4 451 454 958 959
		f 4 -75 71 1688 -74
		mu 0 4 305 451 959 960
		f 4 -77 73 1690 -76
		mu 0 4 303 305 960 961
		f 4 -79 75 1692 -78
		mu 0 4 299 303 961 962
		f 4 -81 77 1694 -80
		mu 0 4 293 299 962 963
		f 4 -83 79 1696 -82
		mu 0 4 287 293 963 964
		f 4 -85 81 1698 -84
		mu 0 4 288 287 964 965
		f 4 -87 83 1699 -86
		mu 0 4 296 288 965 945
		f 4 -89 85 1662 -88
		mu 0 4 371 296 945 946
		f 4 -91 87 1664 -90
		mu 0 4 369 371 946 947
		f 4 -93 89 1666 -92
		mu 0 4 367 369 947 948
		f 4 -95 91 1668 -94
		mu 0 4 136 367 948 949
		f 4 -97 93 1670 -96
		mu 0 4 130 136 949 950
		f 4 -99 95 1672 -98
		mu 0 4 131 130 950 951
		f 4 -100 97 1674 -61
		mu 0 4 139 131 951 952
		f 4 -103 100 1622 -102
		mu 0 4 140 132 924 925
		f 4 -105 101 1624 -104
		mu 0 4 146 140 925 926
		f 4 -107 103 1626 -106
		mu 0 4 150 146 926 928
		f 4 -109 105 1628 -108
		mu 0 4 453 456 927 929
		f 4 -111 107 1630 -110
		mu 0 4 450 453 929 930
		f 4 -113 109 1632 -112
		mu 0 4 447 450 930 931
		f 4 -115 111 1634 -114
		mu 0 4 302 447 931 932
		f 4 -117 113 1636 -116
		mu 0 4 298 302 932 933
		f 4 -119 115 1638 -118
		mu 0 4 292 298 933 934
		f 4 -121 117 1640 -120
		mu 0 4 286 292 934 935
		f 4 -123 119 1642 -122
		mu 0 4 280 286 935 936
		f 4 -125 121 1644 -124
		mu 0 4 281 280 936 937
		f 4 -127 123 1646 -126
		mu 0 4 289 281 937 938
		f 4 -129 125 1648 -128
		mu 0 4 368 289 938 939
		f 4 -131 127 1650 -130
		mu 0 4 366 368 939 940
		f 4 -133 129 1652 -132
		mu 0 4 364 366 940 941
		f 4 -135 131 1654 -134
		mu 0 4 129 364 941 942
		f 4 -137 133 1656 -136
		mu 0 4 123 129 942 943
		f 4 -139 135 1658 -138
		mu 0 4 124 123 943 944
		f 4 -140 137 1659 -101
		mu 0 4 132 124 944 924
		f 4 -143 140 1598 -142
		mu 0 4 133 125 911 912
		f 4 -145 141 1600 -144
		mu 0 4 141 133 912 913
		f 4 -147 143 1602 -146
		mu 0 4 147 141 913 915
		f 4 -149 145 1604 -148
		mu 0 4 449 452 914 916
		f 4 -151 147 1606 -150
		mu 0 4 446 449 916 917
		f 4 -153 149 1608 -152
		mu 0 4 443 446 917 918
		f 4 -155 151 1610 -154
		mu 0 4 297 443 918 919
		f 4 -157 153 1612 -156
		mu 0 4 291 297 919 920
		f 4 -159 155 1614 -158
		mu 0 4 285 291 920 921
		f 4 -161 157 1616 -160
		mu 0 4 279 285 921 922
		f 4 -163 159 1618 -162
		mu 0 4 273 279 922 923
		f 4 -165 161 1619 -164
		mu 0 4 274 273 923 903
		f 4 -167 163 1582 -166
		mu 0 4 282 274 903 904
		f 4 -169 165 1584 -168
		mu 0 4 365 282 904 905
		f 4 -171 167 1586 -170
		mu 0 4 363 365 905 906
		f 4 -173 169 1588 -172
		mu 0 4 361 363 906 907
		f 4 -175 171 1590 -174
		mu 0 4 122 361 907 908
		f 4 -177 173 1592 -176
		mu 0 4 116 122 908 909
		f 4 -179 175 1594 -178
		mu 0 4 117 116 909 910
		f 4 -180 177 1596 -141
		mu 0 4 125 117 910 911
		f 4 -183 180 1558 -182
		mu 0 4 126 118 890 891
		f 4 -185 181 1560 -184
		mu 0 4 134 126 891 892
		f 4 -187 183 1562 -186
		mu 0 4 142 134 892 894
		f 4 -189 185 1564 -188
		mu 0 4 445 448 893 895
		f 4 -191 187 1566 -190
		mu 0 4 442 445 895 896
		f 4 -193 189 1568 -192
		mu 0 4 439 442 896 897
		f 4 -195 191 1570 -194
		mu 0 4 290 439 897 898
		f 4 -197 193 1572 -196
		mu 0 4 284 290 898 899
		f 4 -199 195 1574 -198
		mu 0 4 278 284 899 900
		f 4 -201 197 1576 -200
		mu 0 4 272 278 900 901
		f 4 -203 199 1578 -202
		mu 0 4 266 272 901 902
		f 4 -205 201 1579 -204
		mu 0 4 267 266 902 882
		f 4 -207 203 1542 -206
		mu 0 4 275 267 882 883
		f 4 -209 205 1544 -208
		mu 0 4 362 275 883 884
		f 4 -211 207 1546 -210
		mu 0 4 360 362 884 885
		f 4 -213 209 1548 -212
		mu 0 4 358 360 885 886
		f 4 -215 211 1550 -214
		mu 0 4 115 358 886 887
		f 4 -217 213 1552 -216
		mu 0 4 109 115 887 888
		f 4 -219 215 1554 -218
		mu 0 4 110 109 888 889
		f 4 -220 217 1556 -181
		mu 0 4 118 110 889 890
		f 4 -223 220 1518 -222
		mu 0 4 119 111 869 870
		f 4 -225 221 1520 -224
		mu 0 4 127 119 870 871
		f 4 -227 223 1522 -226
		mu 0 4 135 127 871 873
		f 4 -229 225 1524 -228
		mu 0 4 441 444 872 874
		f 4 -231 227 1526 -230
		mu 0 4 438 441 874 875
		f 4 -233 229 1528 -232
		mu 0 4 435 438 875 876
		f 4 -235 231 1530 -234
		mu 0 4 283 435 876 877
		f 4 -237 233 1532 -236
		mu 0 4 277 283 877 878
		f 4 -239 235 1534 -238
		mu 0 4 271 277 878 879
		f 4 -241 237 1536 -240
		mu 0 4 265 271 879 880
		f 4 -243 239 1538 -242
		mu 0 4 259 265 880 881
		f 4 -245 241 1539 -244
		mu 0 4 260 259 881 861
		f 4 -247 243 1502 -246
		mu 0 4 268 260 861 862
		f 4 -249 245 1504 -248
		mu 0 4 359 268 862 863
		f 4 -251 247 1506 -250
		mu 0 4 357 359 863 864
		f 4 -253 249 1508 -252
		mu 0 4 355 357 864 865
		f 4 -255 251 1510 -254
		mu 0 4 108 355 865 866
		f 4 -257 253 1512 -256
		mu 0 4 102 108 866 867
		f 4 -259 255 1514 -258
		mu 0 4 103 102 867 868
		f 4 -260 257 1516 -221
		mu 0 4 111 103 868 869
		f 4 -263 260 1478 -262
		mu 0 4 112 104 848 849
		f 4 -265 261 1480 -264
		mu 0 4 120 112 849 850
		f 4 -267 263 1482 -266
		mu 0 4 128 120 850 852
		f 4 -269 265 1484 -268
		mu 0 4 437 440 851 853
		f 4 -271 267 1486 -270
		mu 0 4 434 437 853 854
		f 4 -273 269 1488 -272
		mu 0 4 431 434 854 855
		f 4 -275 271 1490 -274
		mu 0 4 276 431 855 856
		f 4 -277 273 1492 -276
		mu 0 4 270 276 856 857
		f 4 -279 275 1494 -278
		mu 0 4 264 270 857 858
		f 4 -281 277 1496 -280
		mu 0 4 258 264 858 859
		f 4 -283 279 1498 -282
		mu 0 4 252 258 859 860
		f 4 -285 281 1499 -284
		mu 0 4 253 252 860 840
		f 4 -287 283 1462 -286
		mu 0 4 261 253 840 841
		f 4 -289 285 1464 -288
		mu 0 4 356 261 841 842
		f 4 -291 287 1466 -290
		mu 0 4 354 356 842 843
		f 4 -293 289 1468 -292
		mu 0 4 352 354 843 844
		f 4 -295 291 1470 -294
		mu 0 4 101 352 844 845
		f 4 -297 293 1472 -296
		mu 0 4 95 101 845 846
		f 4 -299 295 1474 -298
		mu 0 4 96 95 846 847
		f 4 -300 297 1476 -261
		mu 0 4 104 96 847 848
		f 4 -303 300 1459 -302
		mu 0 4 105 97 839 819
		f 4 -305 301 1422 -304
		mu 0 4 113 105 819 820
		f 4 -307 303 1424 -306
		mu 0 4 121 113 820 822
		f 4 -309 305 1426 -308
		mu 0 4 433 436 821 823
		f 4 -311 307 1428 -310
		mu 0 4 430 433 823 824
		f 4 -313 309 1430 -312
		mu 0 4 427 430 824 825
		f 4 -315 311 1432 -314
		mu 0 4 269 427 825 826
		f 4 -317 313 1434 -316
		mu 0 4 263 269 826 827
		f 4 -319 315 1436 -318
		mu 0 4 257 263 827 828
		f 4 -321 317 1438 -320
		mu 0 4 251 257 828 829
		f 4 -323 319 1440 -322
		mu 0 4 245 251 829 830
		f 4 -325 321 1442 -324
		mu 0 4 246 245 830 831
		f 4 -327 323 1444 -326
		mu 0 4 254 246 831 832
		f 4 -329 325 1446 -328
		mu 0 4 353 254 832 833
		f 4 -331 327 1448 -330
		mu 0 4 351 353 833 834
		f 4 -333 329 1450 -332
		mu 0 4 349 351 834 835
		f 4 -335 331 1452 -334
		mu 0 4 94 349 835 836
		f 4 -337 333 1454 -336
		mu 0 4 88 94 836 837
		f 4 -339 335 1456 -338
		mu 0 4 89 88 837 838
		f 4 -340 337 1458 -301
		mu 0 4 97 89 838 839
		f 4 -343 340 1396 -342
		mu 0 4 98 90 805 806
		f 4 -345 341 1398 -344
		mu 0 4 106 98 806 807
		f 4 -347 343 1400 -346
		mu 0 4 114 106 807 809
		f 4 -349 345 1402 -348
		mu 0 4 429 432 808 810
		f 4 -351 347 1404 -350
		mu 0 4 426 429 810 811
		f 4 -353 349 1406 -352
		mu 0 4 423 426 811 812
		f 4 -355 351 1408 -354
		mu 0 4 262 423 812 813
		f 4 -357 353 1410 -356
		mu 0 4 256 262 813 814
		f 4 -359 355 1412 -358
		mu 0 4 250 256 814 815
		f 4 -361 357 1414 -360
		mu 0 4 244 250 815 816
		f 4 -363 359 1416 -362
		mu 0 4 238 244 816 817
		f 4 -365 361 1418 -364
		mu 0 4 239 238 817 818
		f 4 -367 363 1419 -366
		mu 0 4 247 239 818 798
		f 4 -369 365 1382 -368
		mu 0 4 350 247 798 799
		f 4 -371 367 1384 -370
		mu 0 4 348 350 799 800
		f 4 -373 369 1386 -372
		mu 0 4 346 348 800 801
		f 4 -375 371 1388 -374
		mu 0 4 87 346 801 802
		f 4 -377 373 1390 -376
		mu 0 4 81 87 802 803
		f 4 -379 375 1392 -378
		mu 0 4 82 81 803 804
		f 4 -380 377 1394 -341
		mu 0 4 90 82 804 805
		f 4 -383 380 1356 -382
		mu 0 4 91 83 784 785
		f 4 -385 381 1358 -384
		mu 0 4 99 91 785 786
		f 4 -387 383 1360 -386
		mu 0 4 107 99 786 788
		f 4 -389 385 1362 -388
		mu 0 4 425 428 787 789
		f 4 -391 387 1364 -390
		mu 0 4 422 425 789 790
		f 4 -393 389 1366 -392
		mu 0 4 419 422 790 791
		f 4 -395 391 1368 -394
		mu 0 4 255 419 791 792
		f 4 -397 393 1370 -396
		mu 0 4 249 255 792 793
		f 4 -399 395 1372 -398
		mu 0 4 243 249 793 794
		f 4 -401 397 1374 -400
		mu 0 4 237 243 794 795
		f 4 -403 399 1376 -402
		mu 0 4 231 237 795 796
		f 4 -405 401 1378 -404
		mu 0 4 232 231 796 797
		f 4 -407 403 1379 -406
		mu 0 4 240 232 797 777
		f 4 -409 405 1342 -408
		mu 0 4 347 240 777 778
		f 4 -411 407 1344 -410
		mu 0 4 345 347 778 779
		f 4 -413 409 1346 -412
		mu 0 4 343 345 779 780
		f 4 -415 411 1348 -414
		mu 0 4 80 343 780 781
		f 4 -417 413 1350 -416
		mu 0 4 74 80 781 782
		f 4 -419 415 1352 -418
		mu 0 4 75 74 782 783
		f 4 -420 417 1354 -381
		mu 0 4 83 75 783 784
		f 4 -423 420 1316 -422
		mu 0 4 84 76 763 764
		f 4 -425 421 1318 -424
		mu 0 4 92 84 764 765
		f 4 -427 423 1320 -426
		mu 0 4 100 92 765 767
		f 4 -429 425 1322 -428
		mu 0 4 421 424 766 768
		f 4 -431 427 1324 -430
		mu 0 4 418 421 768 769
		f 4 -433 429 1326 -432
		mu 0 4 415 418 769 770
		f 4 -435 431 1328 -434
		mu 0 4 248 415 770 771
		f 4 -437 433 1330 -436
		mu 0 4 242 248 771 772
		f 4 -439 435 1332 -438
		mu 0 4 236 242 772 773
		f 4 -441 437 1334 -440
		mu 0 4 230 236 773 774
		f 4 -443 439 1336 -442
		mu 0 4 224 230 774 775
		f 4 -445 441 1338 -444
		mu 0 4 225 224 775 776
		f 4 -447 443 1339 -446
		mu 0 4 233 225 776 756
		f 4 -449 445 1302 -448
		mu 0 4 344 233 756 757
		f 4 -451 447 1304 -450
		mu 0 4 342 344 757 758
		f 4 -453 449 1306 -452
		mu 0 4 340 342 758 759
		f 4 -455 451 1308 -454
		mu 0 4 73 340 759 760
		f 4 -457 453 1310 -456
		mu 0 4 67 73 760 761
		f 4 -459 455 1312 -458
		mu 0 4 68 67 761 762
		f 4 -460 457 1314 -421
		mu 0 4 76 68 762 763
		f 4 -463 460 1262 -462
		mu 0 4 77 69 735 736
		f 4 -465 461 1264 -464
		mu 0 4 85 77 736 737
		f 4 -467 463 1266 -466
		mu 0 4 93 85 737 739
		f 4 -469 465 1268 -468
		mu 0 4 417 420 738 740
		f 4 -471 467 1270 -470
		mu 0 4 414 417 740 741
		f 4 -473 469 1272 -472
		mu 0 4 411 414 741 742
		f 4 -475 471 1274 -474
		mu 0 4 241 411 742 743
		f 4 -477 473 1276 -476
		mu 0 4 235 241 743 744
		f 4 -479 475 1278 -478
		mu 0 4 229 235 744 745
		f 4 -481 477 1280 -480
		mu 0 4 223 229 745 746
		f 4 -483 479 1282 -482
		mu 0 4 217 223 746 747
		f 4 -485 481 1284 -484
		mu 0 4 218 217 747 748
		f 4 -487 483 1286 -486
		mu 0 4 226 218 748 749
		f 4 -489 485 1288 -488
		mu 0 4 341 226 749 750
		f 4 -491 487 1290 -490
		mu 0 4 339 341 750 751
		f 4 -493 489 1292 -492
		mu 0 4 337 339 751 752
		f 4 -495 491 1294 -494
		mu 0 4 66 337 752 753
		f 4 -497 493 1296 -496
		mu 0 4 60 66 753 754
		f 4 -499 495 1298 -498
		mu 0 4 61 60 754 755
		f 4 -500 497 1299 -461
		mu 0 4 69 61 755 735
		f 4 -503 500 1238 -502
		mu 0 4 70 62 722 723
		f 4 -505 501 1240 -504
		mu 0 4 78 70 723 724
		f 4 -507 503 1242 -506
		mu 0 4 86 78 724 726
		f 4 -509 505 1244 -508
		mu 0 4 413 416 725 727
		f 4 -511 507 1246 -510
		mu 0 4 410 413 727 728
		f 4 -513 509 1248 -512
		mu 0 4 407 410 728 729
		f 4 -515 511 1250 -514
		mu 0 4 234 407 729 730
		f 4 -517 513 1252 -516
		mu 0 4 228 234 730 731
		f 4 -519 515 1254 -518
		mu 0 4 222 228 731 732
		f 4 -521 517 1256 -520
		mu 0 4 216 222 732 733
		f 4 -523 519 1258 -522
		mu 0 4 210 216 733 734
		f 4 -525 521 1259 -524
		mu 0 4 211 210 734 714
		f 4 -527 523 1222 -526
		mu 0 4 219 211 714 715
		f 4 -529 525 1224 -528
		mu 0 4 338 219 715 716
		f 4 -531 527 1226 -530
		mu 0 4 336 338 716 717
		f 4 -533 529 1228 -532
		mu 0 4 334 336 717 718
		f 4 -535 531 1230 -534
		mu 0 4 59 334 718 719
		f 4 -537 533 1232 -536
		mu 0 4 53 59 719 720
		f 4 -539 535 1234 -538
		mu 0 4 54 53 720 721
		f 4 -540 537 1236 -501
		mu 0 4 62 54 721 722
		f 4 -543 540 1198 -542
		mu 0 4 63 55 701 702
		f 4 -545 541 1200 -544
		mu 0 4 71 63 702 703
		f 4 -547 543 1202 -546
		mu 0 4 79 71 703 705
		f 4 -549 545 1204 -548
		mu 0 4 409 412 704 706
		f 4 -551 547 1206 -550
		mu 0 4 406 409 706 707
		f 4 -553 549 1208 -552
		mu 0 4 403 406 707 708
		f 4 -555 551 1210 -554
		mu 0 4 227 403 708 709
		f 4 -557 553 1212 -556
		mu 0 4 221 227 709 710
		f 4 -559 555 1214 -558
		mu 0 4 215 221 710 711
		f 4 -561 557 1216 -560
		mu 0 4 209 215 711 712
		f 4 -563 559 1218 -562
		mu 0 4 203 209 712 713
		f 4 -565 561 1219 -564
		mu 0 4 204 203 713 693
		f 4 -567 563 1182 -566
		mu 0 4 212 204 693 694
		f 4 -569 565 1184 -568
		mu 0 4 335 212 694 695
		f 4 -571 567 1186 -570
		mu 0 4 333 335 695 696
		f 4 -573 569 1188 -572
		mu 0 4 331 333 696 697
		f 4 -575 571 1190 -574
		mu 0 4 52 331 697 698
		f 4 -577 573 1192 -576
		mu 0 4 46 52 698 699
		f 4 -579 575 1194 -578
		mu 0 4 47 46 699 700
		f 4 -580 577 1196 -541
		mu 0 4 55 47 700 701
		f 4 -583 580 1158 -582
		mu 0 4 56 48 680 681
		f 4 -585 581 1160 -584
		mu 0 4 64 56 681 682
		f 4 -587 583 1162 -586
		mu 0 4 72 64 682 684
		f 4 -589 585 1164 -588
		mu 0 4 405 408 683 685
		f 4 -591 587 1166 -590
		mu 0 4 402 405 685 686
		f 4 -593 589 1168 -592
		mu 0 4 399 402 686 687
		f 4 -595 591 1170 -594
		mu 0 4 220 399 687 688
		f 4 -597 593 1172 -596
		mu 0 4 214 220 688 689
		f 4 -599 595 1174 -598
		mu 0 4 208 214 689 690
		f 4 -601 597 1176 -600
		mu 0 4 202 208 690 691
		f 4 -603 599 1178 -602
		mu 0 4 196 202 691 692
		f 4 -605 601 1179 -604
		mu 0 4 197 196 692 672
		f 4 -607 603 1142 -606
		mu 0 4 205 197 672 673
		f 4 -609 605 1144 -608
		mu 0 4 332 205 673 674
		f 4 -611 607 1146 -610
		mu 0 4 330 332 674 675
		f 4 -613 609 1148 -612
		mu 0 4 328 330 675 676
		f 4 -615 611 1150 -614
		mu 0 4 45 328 676 677
		f 4 -617 613 1152 -616
		mu 0 4 39 45 677 678
		f 4 -619 615 1154 -618
		mu 0 4 40 39 678 679
		f 4 -620 617 1156 -581
		mu 0 4 48 40 679 680
		f 4 -623 620 1118 -622
		mu 0 4 49 41 659 660
		f 4 -625 621 1120 -624
		mu 0 4 57 49 660 661
		f 4 -627 623 1122 -626
		mu 0 4 65 57 661 663
		f 4 -629 625 1124 -628
		mu 0 4 401 404 662 664
		f 4 -631 627 1126 -630
		mu 0 4 398 401 664 665
		f 4 -633 629 1128 -632
		mu 0 4 395 398 665 666
		f 4 -635 631 1130 -634
		mu 0 4 213 395 666 667
		f 4 -637 633 1132 -636
		mu 0 4 207 213 667 668
		f 4 -639 635 1134 -638
		mu 0 4 201 207 668 669
		f 4 -641 637 1136 -640
		mu 0 4 195 201 669 670
		f 4 -643 639 1138 -642
		mu 0 4 189 195 670 671
		f 4 -645 641 1139 -644
		mu 0 4 190 189 671 651
		f 4 -647 643 1102 -646
		mu 0 4 198 190 651 652
		f 4 -649 645 1104 -648
		mu 0 4 329 198 652 653
		f 4 -651 647 1106 -650
		mu 0 4 327 329 653 654
		f 4 -653 649 1108 -652
		mu 0 4 325 327 654 655
		f 4 -655 651 1110 -654
		mu 0 4 38 325 655 656
		f 4 -657 653 1112 -656
		mu 0 4 32 38 656 657
		f 4 -659 655 1114 -658
		mu 0 4 33 32 657 658
		f 4 -660 657 1116 -621
		mu 0 4 41 33 658 659
		f 4 -663 660 1080 -662
		mu 0 4 42 34 639 640
		f 4 -665 661 1082 -664
		mu 0 4 50 42 640 641
		f 4 -667 663 1084 -666
		mu 0 4 58 50 641 643
		f 4 -669 665 1086 -668
		mu 0 4 397 400 642 644
		f 4 -671 667 1088 -670
		mu 0 4 394 397 644 645
		f 4 -673 669 1090 -672
		mu 0 4 391 394 645 646
		f 4 -675 671 1092 -674
		mu 0 4 206 391 646 647
		f 4 -677 673 1094 -676
		mu 0 4 200 206 647 648
		f 4 -679 675 1096 -678
		mu 0 4 194 200 648 649
		f 4 -681 677 1098 -680
		mu 0 4 188 194 649 650
		f 4 -683 679 1099 -682
		mu 0 4 182 188 650 630
		f 4 -685 681 1062 -684
		mu 0 4 183 182 630 631
		f 4 -687 683 1064 -686
		mu 0 4 191 183 631 632
		f 4 -689 685 1066 -688
		mu 0 4 326 191 632 633
		f 4 -691 687 1068 -690
		mu 0 4 324 326 633 634
		f 4 -693 689 1070 -692
		mu 0 4 322 324 634 635
		f 4 -695 691 1072 -694
		mu 0 4 31 322 635 636
		f 4 -697 693 1074 -696
		mu 0 4 24 31 636 637
		f 4 -699 695 1076 -698
		mu 0 4 25 24 637 638
		f 4 -700 697 1078 -661
		mu 0 4 34 25 638 639
		f 4 -703 700 1040 -702
		mu 0 4 35 26 618 619
		f 4 -705 701 1042 -704
		mu 0 4 43 35 619 620
		f 4 -707 703 1044 -706
		mu 0 4 51 43 620 622
		f 4 -709 705 1046 -708
		mu 0 4 393 396 621 623
		f 4 -711 707 1048 -710
		mu 0 4 390 393 623 624
		f 4 -713 709 1050 -712
		mu 0 4 387 390 624 625
		f 4 -715 711 1052 -714
		mu 0 4 199 387 625 626
		f 4 -717 713 1054 -716
		mu 0 4 193 199 626 627
		f 4 -719 715 1056 -718
		mu 0 4 187 193 627 628
		f 4 -721 717 1058 -720
		mu 0 4 181 187 628 629
		f 4 -723 719 1059 -722
		mu 0 4 174 181 629 609
		f 4 -725 721 1022 -724
		mu 0 4 175 174 609 610
		f 4 -727 723 1024 -726
		mu 0 4 184 175 610 611
		f 4 -729 725 1026 -728
		mu 0 4 323 184 611 612
		f 4 -731 727 1028 -730
		mu 0 4 321 323 612 613
		f 4 -733 729 1030 -732
		mu 0 4 319 321 613 614
		f 4 -735 731 1032 -734
		mu 0 4 23 319 614 615
		f 4 -737 733 1034 -736
		mu 0 4 17 23 615 616
		f 4 -739 735 1036 -738
		mu 0 4 18 17 616 617
		f 4 -740 737 1038 -701
		mu 0 4 26 18 617 618
		f 4 -743 740 1000 -742
		mu 0 4 27 19 597 598
		f 4 -745 741 1002 -744
		mu 0 4 36 27 598 599
		f 4 -747 743 1004 -746
		mu 0 4 44 36 599 601
		f 4 -749 745 1006 -748
		mu 0 4 389 392 600 602
		f 4 -751 747 1008 -750
		mu 0 4 386 389 602 603
		f 4 -753 749 1010 -752
		mu 0 4 382 386 603 604
		f 4 -755 751 1012 -754
		mu 0 4 192 382 604 605
		f 4 -757 753 1014 -756
		mu 0 4 186 192 605 606
		f 4 -759 755 1016 -758
		mu 0 4 180 186 606 607
		f 4 -761 757 1018 -760
		mu 0 4 173 180 607 608
		f 4 -763 759 1019 -762
		mu 0 4 167 173 608 588
		f 4 -765 761 982 -764
		mu 0 4 168 167 588 589
		f 4 -767 763 984 -766
		mu 0 4 176 168 589 590
		f 4 -769 765 986 -768
		mu 0 4 320 176 590 591
		f 4 -771 767 988 -770
		mu 0 4 318 320 591 592
		f 4 -773 769 990 -772
		mu 0 4 316 318 592 593
		f 4 -775 771 992 -774
		mu 0 4 16 316 593 594
		f 4 -777 773 994 -776
		mu 0 4 11 16 594 595
		f 4 -779 775 996 -778
		mu 0 4 12 11 595 596
		f 4 -780 777 998 -741
		mu 0 4 19 12 596 597
		f 4 -783 780 960 -782
		mu 0 4 20 13 576 577
		f 4 -785 781 962 -784
		mu 0 4 28 20 577 578
		f 4 -787 783 964 -786
		mu 0 4 37 28 578 580
		f 4 -789 785 966 -788
		mu 0 4 385 388 579 581
		f 4 -791 787 968 -790
		mu 0 4 381 385 581 582
		f 4 -793 789 970 -792
		mu 0 4 378 381 582 583
		f 4 -795 791 972 -794
		mu 0 4 185 378 583 584
		f 4 -797 793 974 -796
		mu 0 4 179 185 584 585
		f 4 -799 795 976 -798
		mu 0 4 172 179 585 586
		f 4 -801 797 978 -800
		mu 0 4 166 172 586 587
		f 4 -803 799 979 -802
		mu 0 4 160 166 587 567
		f 4 -805 801 942 -804
		mu 0 4 161 160 567 568
		f 4 -807 803 944 -806
		mu 0 4 169 161 568 569
		f 4 -809 805 946 -808
		mu 0 4 317 169 569 570
		f 4 -811 807 948 -810
		mu 0 4 315 317 570 571
		f 4 -813 809 950 -812
		mu 0 4 312 315 571 572
		f 4 -815 811 952 -814
		mu 0 4 10 312 572 573
		f 4 -817 813 954 -816
		mu 0 4 6 10 573 574
		f 4 -819 815 956 -818
		mu 0 4 7 6 574 575
		f 4 -820 817 958 -781
		mu 0 4 13 7 575 576
		f 4 -823 820 920 -822
		mu 0 4 15 9 555 556
		f 4 -825 821 922 -824
		mu 0 4 22 15 556 557
		f 4 -827 823 924 -826
		mu 0 4 30 22 557 559
		f 4 -829 825 926 -828
		mu 0 4 380 384 558 560
		f 4 -831 827 928 -830
		mu 0 4 377 380 560 561
		f 4 -833 829 930 -832
		mu 0 4 375 377 561 562
		f 4 -835 831 932 -834
		mu 0 4 178 375 562 563
		f 4 -837 833 934 -836
		mu 0 4 171 178 563 564
		f 4 -839 835 936 -838
		mu 0 4 165 171 564 565
		f 4 -841 837 938 -840
		mu 0 4 159 165 565 566
		f 4 -843 839 939 -842
		mu 0 4 156 159 566 546
		f 4 -845 841 902 -844
		mu 0 4 157 156 546 547
		f 4 -847 843 904 -846
		mu 0 4 163 157 547 548
		f 4 -849 845 906 -848
		mu 0 4 314 163 548 549
		f 4 -851 847 908 -850
		mu 0 4 311 314 549 550
		f 4 -853 849 910 -852
		mu 0 4 309 311 550 551
		f 4 -855 851 912 -854
		mu 0 4 5 309 551 552
		f 4 -857 853 914 -856
		mu 0 4 2 5 552 553
		f 4 -859 855 916 -858
		mu 0 4 3 2 553 554
		f 4 -860 857 918 -821
		mu 0 4 9 3 554 555
		f 4 -863 860 846 -862
		mu 0 4 526 525 157 163
		f 4 -865 861 848 -864
		mu 0 4 527 526 163 314
		f 4 -867 863 850 -866
		mu 0 4 528 527 314 311
		f 4 -869 865 852 -868
		mu 0 4 529 528 311 309
		f 4 -871 867 854 -870
		mu 0 4 530 529 309 5
		f 4 -873 869 856 -872
		mu 0 4 531 530 5 2
		f 4 -875 871 858 -874
		mu 0 4 532 531 2 3
		f 4 -877 873 859 -876
		mu 0 4 533 532 3 9
		f 4 -879 875 822 -878
		mu 0 4 534 533 9 15
		f 4 -881 877 824 -880
		mu 0 4 535 534 15 22
		f 4 -883 879 826 -882
		mu 0 4 537 535 22 30
		f 4 -885 881 828 -884
		mu 0 4 538 536 384 380
		f 4 -887 883 830 -886
		mu 0 4 539 538 380 377
		f 4 -889 885 832 -888
		mu 0 4 540 539 377 375
		f 4 -891 887 834 -890
		mu 0 4 541 540 375 178
		f 4 -893 889 836 -892
		mu 0 4 542 541 178 171
		f 4 -895 891 838 -894
		mu 0 4 543 542 171 165
		f 4 -897 893 840 -896
		mu 0 4 544 543 165 159
		f 4 -899 895 842 -898
		mu 0 4 545 544 159 156
		f 4 -900 897 844 -861
		mu 0 4 525 545 156 157
		f 4 -903 900 804 -902
		mu 0 4 547 546 160 161
		f 4 -905 901 806 -904
		mu 0 4 548 547 161 169
		f 4 -907 903 808 -906
		mu 0 4 549 548 169 317
		f 4 -909 905 810 -908
		mu 0 4 550 549 317 315
		f 4 -911 907 812 -910
		mu 0 4 551 550 315 312
		f 4 -913 909 814 -912
		mu 0 4 552 551 312 10
		f 4 -915 911 816 -914
		mu 0 4 553 552 10 6
		f 4 -917 913 818 -916
		mu 0 4 554 553 6 7
		f 4 -919 915 819 -918
		mu 0 4 555 554 7 13
		f 4 -921 917 782 -920
		mu 0 4 556 555 13 20
		f 4 -923 919 784 -922
		mu 0 4 557 556 20 28
		f 4 -925 921 786 -924
		mu 0 4 559 557 28 37
		f 4 -927 923 788 -926
		mu 0 4 560 558 388 385
		f 4 -929 925 790 -928
		mu 0 4 561 560 385 381
		f 4 -931 927 792 -930
		mu 0 4 562 561 381 378
		f 4 -933 929 794 -932
		mu 0 4 563 562 378 185
		f 4 -935 931 796 -934
		mu 0 4 564 563 185 179
		f 4 -937 933 798 -936
		mu 0 4 565 564 179 172
		f 4 -939 935 800 -938
		mu 0 4 566 565 172 166
		f 4 -940 937 802 -901
		mu 0 4 546 566 166 160
		f 4 -943 940 764 -942
		mu 0 4 568 567 167 168
		f 4 -945 941 766 -944
		mu 0 4 569 568 168 176
		f 4 -947 943 768 -946
		mu 0 4 570 569 176 320
		f 4 -949 945 770 -948
		mu 0 4 571 570 320 318
		f 4 -951 947 772 -950
		mu 0 4 572 571 318 316
		f 4 -953 949 774 -952
		mu 0 4 573 572 316 16
		f 4 -955 951 776 -954
		mu 0 4 574 573 16 11
		f 4 -957 953 778 -956
		mu 0 4 575 574 11 12
		f 4 -959 955 779 -958
		mu 0 4 576 575 12 19
		f 4 -961 957 742 -960
		mu 0 4 577 576 19 27
		f 4 -963 959 744 -962
		mu 0 4 578 577 27 36
		f 4 -965 961 746 -964
		mu 0 4 580 578 36 44
		f 4 -967 963 748 -966
		mu 0 4 581 579 392 389
		f 4 -969 965 750 -968
		mu 0 4 582 581 389 386
		f 4 -971 967 752 -970
		mu 0 4 583 582 386 382
		f 4 -973 969 754 -972
		mu 0 4 584 583 382 192
		f 4 -975 971 756 -974
		mu 0 4 585 584 192 186
		f 4 -977 973 758 -976
		mu 0 4 586 585 186 180
		f 4 -979 975 760 -978
		mu 0 4 587 586 180 173
		f 4 -980 977 762 -941
		mu 0 4 567 587 173 167
		f 4 -983 980 724 -982
		mu 0 4 589 588 174 175
		f 4 -985 981 726 -984
		mu 0 4 590 589 175 184
		f 4 -987 983 728 -986
		mu 0 4 591 590 184 323
		f 4 -989 985 730 -988
		mu 0 4 592 591 323 321
		f 4 -991 987 732 -990
		mu 0 4 593 592 321 319
		f 4 -993 989 734 -992
		mu 0 4 594 593 319 23
		f 4 -995 991 736 -994
		mu 0 4 595 594 23 17
		f 4 -997 993 738 -996
		mu 0 4 596 595 17 18
		f 4 -999 995 739 -998
		mu 0 4 597 596 18 26
		f 4 -1001 997 702 -1000
		mu 0 4 598 597 26 35
		f 4 -1003 999 704 -1002
		mu 0 4 599 598 35 43
		f 4 -1005 1001 706 -1004
		mu 0 4 601 599 43 51
		f 4 -1007 1003 708 -1006
		mu 0 4 602 600 396 393
		f 4 -1009 1005 710 -1008
		mu 0 4 603 602 393 390
		f 4 -1011 1007 712 -1010
		mu 0 4 604 603 390 387
		f 4 -1013 1009 714 -1012
		mu 0 4 605 604 387 199
		f 4 -1015 1011 716 -1014
		mu 0 4 606 605 199 193
		f 4 -1017 1013 718 -1016
		mu 0 4 607 606 193 187
		f 4 -1019 1015 720 -1018
		mu 0 4 608 607 187 181
		f 4 -1020 1017 722 -981
		mu 0 4 588 608 181 174;
	setAttr ".fc[500:839]"
		f 4 -1023 1020 684 -1022
		mu 0 4 610 609 182 183
		f 4 -1025 1021 686 -1024
		mu 0 4 611 610 183 191
		f 4 -1027 1023 688 -1026
		mu 0 4 612 611 191 326
		f 4 -1029 1025 690 -1028
		mu 0 4 613 612 326 324
		f 4 -1031 1027 692 -1030
		mu 0 4 614 613 324 322
		f 4 -1033 1029 694 -1032
		mu 0 4 615 614 322 31
		f 4 -1035 1031 696 -1034
		mu 0 4 616 615 31 24
		f 4 -1037 1033 698 -1036
		mu 0 4 617 616 24 25
		f 4 -1039 1035 699 -1038
		mu 0 4 618 617 25 34
		f 4 -1041 1037 662 -1040
		mu 0 4 619 618 34 42
		f 4 -1043 1039 664 -1042
		mu 0 4 620 619 42 50
		f 4 -1045 1041 666 -1044
		mu 0 4 622 620 50 58
		f 4 -1047 1043 668 -1046
		mu 0 4 623 621 400 397
		f 4 -1049 1045 670 -1048
		mu 0 4 624 623 397 394
		f 4 -1051 1047 672 -1050
		mu 0 4 625 624 394 391
		f 4 -1053 1049 674 -1052
		mu 0 4 626 625 391 206
		f 4 -1055 1051 676 -1054
		mu 0 4 627 626 206 200
		f 4 -1057 1053 678 -1056
		mu 0 4 628 627 200 194
		f 4 -1059 1055 680 -1058
		mu 0 4 629 628 194 188
		f 4 -1060 1057 682 -1021
		mu 0 4 609 629 188 182
		f 4 -1063 1060 644 -1062
		mu 0 4 631 630 189 190
		f 4 -1065 1061 646 -1064
		mu 0 4 632 631 190 198
		f 4 -1067 1063 648 -1066
		mu 0 4 633 632 198 329
		f 4 -1069 1065 650 -1068
		mu 0 4 634 633 329 327
		f 4 -1071 1067 652 -1070
		mu 0 4 635 634 327 325
		f 4 -1073 1069 654 -1072
		mu 0 4 636 635 325 38
		f 4 -1075 1071 656 -1074
		mu 0 4 637 636 38 32
		f 4 -1077 1073 658 -1076
		mu 0 4 638 637 32 33
		f 4 -1079 1075 659 -1078
		mu 0 4 639 638 33 41
		f 4 -1081 1077 622 -1080
		mu 0 4 640 639 41 49
		f 4 -1083 1079 624 -1082
		mu 0 4 641 640 49 57
		f 4 -1085 1081 626 -1084
		mu 0 4 643 641 57 65
		f 4 -1087 1083 628 -1086
		mu 0 4 644 642 404 401
		f 4 -1089 1085 630 -1088
		mu 0 4 645 644 401 398
		f 4 -1091 1087 632 -1090
		mu 0 4 646 645 398 395
		f 4 -1093 1089 634 -1092
		mu 0 4 647 646 395 213
		f 4 -1095 1091 636 -1094
		mu 0 4 648 647 213 207
		f 4 -1097 1093 638 -1096
		mu 0 4 649 648 207 201
		f 4 -1099 1095 640 -1098
		mu 0 4 650 649 201 195
		f 4 -1100 1097 642 -1061
		mu 0 4 630 650 195 189
		f 4 -1103 1100 606 -1102
		mu 0 4 652 651 197 205
		f 4 -1105 1101 608 -1104
		mu 0 4 653 652 205 332
		f 4 -1107 1103 610 -1106
		mu 0 4 654 653 332 330
		f 4 -1109 1105 612 -1108
		mu 0 4 655 654 330 328
		f 4 -1111 1107 614 -1110
		mu 0 4 656 655 328 45
		f 4 -1113 1109 616 -1112
		mu 0 4 657 656 45 39
		f 4 -1115 1111 618 -1114
		mu 0 4 658 657 39 40
		f 4 -1117 1113 619 -1116
		mu 0 4 659 658 40 48
		f 4 -1119 1115 582 -1118
		mu 0 4 660 659 48 56
		f 4 -1121 1117 584 -1120
		mu 0 4 661 660 56 64
		f 4 -1123 1119 586 -1122
		mu 0 4 663 661 64 72
		f 4 -1125 1121 588 -1124
		mu 0 4 664 662 408 405
		f 4 -1127 1123 590 -1126
		mu 0 4 665 664 405 402
		f 4 -1129 1125 592 -1128
		mu 0 4 666 665 402 399
		f 4 -1131 1127 594 -1130
		mu 0 4 667 666 399 220
		f 4 -1133 1129 596 -1132
		mu 0 4 668 667 220 214
		f 4 -1135 1131 598 -1134
		mu 0 4 669 668 214 208
		f 4 -1137 1133 600 -1136
		mu 0 4 670 669 208 202
		f 4 -1139 1135 602 -1138
		mu 0 4 671 670 202 196
		f 4 -1140 1137 604 -1101
		mu 0 4 651 671 196 197
		f 4 -1143 1140 566 -1142
		mu 0 4 673 672 204 212
		f 4 -1145 1141 568 -1144
		mu 0 4 674 673 212 335
		f 4 -1147 1143 570 -1146
		mu 0 4 675 674 335 333
		f 4 -1149 1145 572 -1148
		mu 0 4 676 675 333 331
		f 4 -1151 1147 574 -1150
		mu 0 4 677 676 331 52
		f 4 -1153 1149 576 -1152
		mu 0 4 678 677 52 46
		f 4 -1155 1151 578 -1154
		mu 0 4 679 678 46 47
		f 4 -1157 1153 579 -1156
		mu 0 4 680 679 47 55
		f 4 -1159 1155 542 -1158
		mu 0 4 681 680 55 63
		f 4 -1161 1157 544 -1160
		mu 0 4 682 681 63 71
		f 4 -1163 1159 546 -1162
		mu 0 4 684 682 71 79
		f 4 -1165 1161 548 -1164
		mu 0 4 685 683 412 409
		f 4 -1167 1163 550 -1166
		mu 0 4 686 685 409 406
		f 4 -1169 1165 552 -1168
		mu 0 4 687 686 406 403
		f 4 -1171 1167 554 -1170
		mu 0 4 688 687 403 227
		f 4 -1173 1169 556 -1172
		mu 0 4 689 688 227 221
		f 4 -1175 1171 558 -1174
		mu 0 4 690 689 221 215
		f 4 -1177 1173 560 -1176
		mu 0 4 691 690 215 209
		f 4 -1179 1175 562 -1178
		mu 0 4 692 691 209 203
		f 4 -1180 1177 564 -1141
		mu 0 4 672 692 203 204
		f 4 -1183 1180 526 -1182
		mu 0 4 694 693 211 219
		f 4 -1185 1181 528 -1184
		mu 0 4 695 694 219 338
		f 4 -1187 1183 530 -1186
		mu 0 4 696 695 338 336
		f 4 -1189 1185 532 -1188
		mu 0 4 697 696 336 334
		f 4 -1191 1187 534 -1190
		mu 0 4 698 697 334 59
		f 4 -1193 1189 536 -1192
		mu 0 4 699 698 59 53
		f 4 -1195 1191 538 -1194
		mu 0 4 700 699 53 54
		f 4 -1197 1193 539 -1196
		mu 0 4 701 700 54 62
		f 4 -1199 1195 502 -1198
		mu 0 4 702 701 62 70
		f 4 -1201 1197 504 -1200
		mu 0 4 703 702 70 78
		f 4 -1203 1199 506 -1202
		mu 0 4 705 703 78 86
		f 4 -1205 1201 508 -1204
		mu 0 4 706 704 416 413
		f 4 -1207 1203 510 -1206
		mu 0 4 707 706 413 410
		f 4 -1209 1205 512 -1208
		mu 0 4 708 707 410 407
		f 4 -1211 1207 514 -1210
		mu 0 4 709 708 407 234
		f 4 -1213 1209 516 -1212
		mu 0 4 710 709 234 228
		f 4 -1215 1211 518 -1214
		mu 0 4 711 710 228 222
		f 4 -1217 1213 520 -1216
		mu 0 4 712 711 222 216
		f 4 -1219 1215 522 -1218
		mu 0 4 713 712 216 210
		f 4 -1220 1217 524 -1181
		mu 0 4 693 713 210 211
		f 4 -1223 1220 486 -1222
		mu 0 4 715 714 218 226
		f 4 -1225 1221 488 -1224
		mu 0 4 716 715 226 341
		f 4 -1227 1223 490 -1226
		mu 0 4 717 716 341 339
		f 4 -1229 1225 492 -1228
		mu 0 4 718 717 339 337
		f 4 -1231 1227 494 -1230
		mu 0 4 719 718 337 66
		f 4 -1233 1229 496 -1232
		mu 0 4 720 719 66 60
		f 4 -1235 1231 498 -1234
		mu 0 4 721 720 60 61
		f 4 -1237 1233 499 -1236
		mu 0 4 722 721 61 69
		f 4 -1239 1235 462 -1238
		mu 0 4 723 722 69 77
		f 4 -1241 1237 464 -1240
		mu 0 4 724 723 77 85
		f 4 -1243 1239 466 -1242
		mu 0 4 726 724 85 93
		f 4 -1245 1241 468 -1244
		mu 0 4 727 725 420 417
		f 4 -1247 1243 470 -1246
		mu 0 4 728 727 417 414
		f 4 -1249 1245 472 -1248
		mu 0 4 729 728 414 411
		f 4 -1251 1247 474 -1250
		mu 0 4 730 729 411 241
		f 4 -1253 1249 476 -1252
		mu 0 4 731 730 241 235
		f 4 -1255 1251 478 -1254
		mu 0 4 732 731 235 229
		f 4 -1257 1253 480 -1256
		mu 0 4 733 732 229 223
		f 4 -1259 1255 482 -1258
		mu 0 4 734 733 223 217
		f 4 -1260 1257 484 -1221
		mu 0 4 714 734 217 218
		f 4 -1263 1260 422 -1262
		mu 0 4 736 735 76 84
		f 4 -1265 1261 424 -1264
		mu 0 4 737 736 84 92
		f 4 -1267 1263 426 -1266
		mu 0 4 739 737 92 100
		f 4 -1269 1265 428 -1268
		mu 0 4 740 738 424 421
		f 4 -1271 1267 430 -1270
		mu 0 4 741 740 421 418
		f 4 -1273 1269 432 -1272
		mu 0 4 742 741 418 415
		f 4 -1275 1271 434 -1274
		mu 0 4 743 742 415 248
		f 4 -1277 1273 436 -1276
		mu 0 4 744 743 248 242
		f 4 -1279 1275 438 -1278
		mu 0 4 745 744 242 236
		f 4 -1281 1277 440 -1280
		mu 0 4 746 745 236 230
		f 4 -1283 1279 442 -1282
		mu 0 4 747 746 230 224
		f 4 -1285 1281 444 -1284
		mu 0 4 748 747 224 225
		f 4 -1287 1283 446 -1286
		mu 0 4 749 748 225 233
		f 4 -1289 1285 448 -1288
		mu 0 4 750 749 233 344
		f 4 -1291 1287 450 -1290
		mu 0 4 751 750 344 342
		f 4 -1293 1289 452 -1292
		mu 0 4 752 751 342 340
		f 4 -1295 1291 454 -1294
		mu 0 4 753 752 340 73
		f 4 -1297 1293 456 -1296
		mu 0 4 754 753 73 67
		f 4 -1299 1295 458 -1298
		mu 0 4 755 754 67 68
		f 4 -1300 1297 459 -1261
		mu 0 4 735 755 68 76
		f 4 -1303 1300 408 -1302
		mu 0 4 757 756 240 347
		f 4 -1305 1301 410 -1304
		mu 0 4 758 757 347 345
		f 4 -1307 1303 412 -1306
		mu 0 4 759 758 345 343
		f 4 -1309 1305 414 -1308
		mu 0 4 760 759 343 80
		f 4 -1311 1307 416 -1310
		mu 0 4 761 760 80 74
		f 4 -1313 1309 418 -1312
		mu 0 4 762 761 74 75
		f 4 -1315 1311 419 -1314
		mu 0 4 763 762 75 83
		f 4 -1317 1313 382 -1316
		mu 0 4 764 763 83 91
		f 4 -1319 1315 384 -1318
		mu 0 4 765 764 91 99
		f 4 -1321 1317 386 -1320
		mu 0 4 767 765 99 107
		f 4 -1323 1319 388 -1322
		mu 0 4 768 766 428 425
		f 4 -1325 1321 390 -1324
		mu 0 4 769 768 425 422
		f 4 -1327 1323 392 -1326
		mu 0 4 770 769 422 419
		f 4 -1329 1325 394 -1328
		mu 0 4 771 770 419 255
		f 4 -1331 1327 396 -1330
		mu 0 4 772 771 255 249
		f 4 -1333 1329 398 -1332
		mu 0 4 773 772 249 243
		f 4 -1335 1331 400 -1334
		mu 0 4 774 773 243 237
		f 4 -1337 1333 402 -1336
		mu 0 4 775 774 237 231
		f 4 -1339 1335 404 -1338
		mu 0 4 776 775 231 232
		f 4 -1340 1337 406 -1301
		mu 0 4 756 776 232 240
		f 4 -1343 1340 368 -1342
		mu 0 4 778 777 247 350
		f 4 -1345 1341 370 -1344
		mu 0 4 779 778 350 348
		f 4 -1347 1343 372 -1346
		mu 0 4 780 779 348 346
		f 4 -1349 1345 374 -1348
		mu 0 4 781 780 346 87
		f 4 -1351 1347 376 -1350
		mu 0 4 782 781 87 81
		f 4 -1353 1349 378 -1352
		mu 0 4 783 782 81 82
		f 4 -1355 1351 379 -1354
		mu 0 4 784 783 82 90
		f 4 -1357 1353 342 -1356
		mu 0 4 785 784 90 98
		f 4 -1359 1355 344 -1358
		mu 0 4 786 785 98 106
		f 4 -1361 1357 346 -1360
		mu 0 4 788 786 106 114
		f 4 -1363 1359 348 -1362
		mu 0 4 789 787 432 429
		f 4 -1365 1361 350 -1364
		mu 0 4 790 789 429 426
		f 4 -1367 1363 352 -1366
		mu 0 4 791 790 426 423
		f 4 -1369 1365 354 -1368
		mu 0 4 792 791 423 262
		f 4 -1371 1367 356 -1370
		mu 0 4 793 792 262 256
		f 4 -1373 1369 358 -1372
		mu 0 4 794 793 256 250
		f 4 -1375 1371 360 -1374
		mu 0 4 795 794 250 244
		f 4 -1377 1373 362 -1376
		mu 0 4 796 795 244 238
		f 4 -1379 1375 364 -1378
		mu 0 4 797 796 238 239
		f 4 -1380 1377 366 -1341
		mu 0 4 777 797 239 247
		f 4 -1383 1380 328 -1382
		mu 0 4 799 798 254 353
		f 4 -1385 1381 330 -1384
		mu 0 4 800 799 353 351
		f 4 -1387 1383 332 -1386
		mu 0 4 801 800 351 349
		f 4 -1389 1385 334 -1388
		mu 0 4 802 801 349 94
		f 4 -1391 1387 336 -1390
		mu 0 4 803 802 94 88
		f 4 -1393 1389 338 -1392
		mu 0 4 804 803 88 89
		f 4 -1395 1391 339 -1394
		mu 0 4 805 804 89 97
		f 4 -1397 1393 302 -1396
		mu 0 4 806 805 97 105
		f 4 -1399 1395 304 -1398
		mu 0 4 807 806 105 113
		f 4 -1401 1397 306 -1400
		mu 0 4 809 807 113 121
		f 4 -1403 1399 308 -1402
		mu 0 4 810 808 436 433
		f 4 -1405 1401 310 -1404
		mu 0 4 811 810 433 430
		f 4 -1407 1403 312 -1406
		mu 0 4 812 811 430 427
		f 4 -1409 1405 314 -1408
		mu 0 4 813 812 427 269
		f 4 -1411 1407 316 -1410
		mu 0 4 814 813 269 263
		f 4 -1413 1409 318 -1412
		mu 0 4 815 814 263 257
		f 4 -1415 1411 320 -1414
		mu 0 4 816 815 257 251
		f 4 -1417 1413 322 -1416
		mu 0 4 817 816 251 245
		f 4 -1419 1415 324 -1418
		mu 0 4 818 817 245 246
		f 4 -1420 1417 326 -1381
		mu 0 4 798 818 246 254
		f 4 -1423 1420 264 -1422
		mu 0 4 820 819 112 120
		f 4 -1425 1421 266 -1424
		mu 0 4 822 820 120 128
		f 4 -1427 1423 268 -1426
		mu 0 4 823 821 440 437
		f 4 -1429 1425 270 -1428
		mu 0 4 824 823 437 434
		f 4 -1431 1427 272 -1430
		mu 0 4 825 824 434 431
		f 4 -1433 1429 274 -1432
		mu 0 4 826 825 431 276
		f 4 -1435 1431 276 -1434
		mu 0 4 827 826 276 270
		f 4 -1437 1433 278 -1436
		mu 0 4 828 827 270 264
		f 4 -1439 1435 280 -1438
		mu 0 4 829 828 264 258
		f 4 -1441 1437 282 -1440
		mu 0 4 830 829 258 252
		f 4 -1443 1439 284 -1442
		mu 0 4 831 830 252 253
		f 4 -1445 1441 286 -1444
		mu 0 4 832 831 253 261
		f 4 -1447 1443 288 -1446
		mu 0 4 833 832 261 356
		f 4 -1449 1445 290 -1448
		mu 0 4 834 833 356 354
		f 4 -1451 1447 292 -1450
		mu 0 4 835 834 354 352
		f 4 -1453 1449 294 -1452
		mu 0 4 836 835 352 101
		f 4 -1455 1451 296 -1454
		mu 0 4 837 836 101 95
		f 4 -1457 1453 298 -1456
		mu 0 4 838 837 95 96
		f 4 -1459 1455 299 -1458
		mu 0 4 839 838 96 104
		f 4 -1460 1457 262 -1421
		mu 0 4 819 839 104 112
		f 4 -1463 1460 246 -1462
		mu 0 4 841 840 260 268
		f 4 -1465 1461 248 -1464
		mu 0 4 842 841 268 359
		f 4 -1467 1463 250 -1466
		mu 0 4 843 842 359 357
		f 4 -1469 1465 252 -1468
		mu 0 4 844 843 357 355
		f 4 -1471 1467 254 -1470
		mu 0 4 845 844 355 108
		f 4 -1473 1469 256 -1472
		mu 0 4 846 845 108 102
		f 4 -1475 1471 258 -1474
		mu 0 4 847 846 102 103
		f 4 -1477 1473 259 -1476
		mu 0 4 848 847 103 111
		f 4 -1479 1475 222 -1478
		mu 0 4 849 848 111 119
		f 4 -1481 1477 224 -1480
		mu 0 4 850 849 119 127
		f 4 -1483 1479 226 -1482
		mu 0 4 852 850 127 135
		f 4 -1485 1481 228 -1484
		mu 0 4 853 851 444 441
		f 4 -1487 1483 230 -1486
		mu 0 4 854 853 441 438
		f 4 -1489 1485 232 -1488
		mu 0 4 855 854 438 435
		f 4 -1491 1487 234 -1490
		mu 0 4 856 855 435 283
		f 4 -1493 1489 236 -1492
		mu 0 4 857 856 283 277
		f 4 -1495 1491 238 -1494
		mu 0 4 858 857 277 271
		f 4 -1497 1493 240 -1496
		mu 0 4 859 858 271 265
		f 4 -1499 1495 242 -1498
		mu 0 4 860 859 265 259
		f 4 -1500 1497 244 -1461
		mu 0 4 840 860 259 260
		f 4 -1503 1500 206 -1502
		mu 0 4 862 861 267 275
		f 4 -1505 1501 208 -1504
		mu 0 4 863 862 275 362
		f 4 -1507 1503 210 -1506
		mu 0 4 864 863 362 360
		f 4 -1509 1505 212 -1508
		mu 0 4 865 864 360 358
		f 4 -1511 1507 214 -1510
		mu 0 4 866 865 358 115
		f 4 -1513 1509 216 -1512
		mu 0 4 867 866 115 109
		f 4 -1515 1511 218 -1514
		mu 0 4 868 867 109 110
		f 4 -1517 1513 219 -1516
		mu 0 4 869 868 110 118
		f 4 -1519 1515 182 -1518
		mu 0 4 870 869 118 126
		f 4 -1521 1517 184 -1520
		mu 0 4 871 870 126 134
		f 4 -1523 1519 186 -1522
		mu 0 4 873 871 134 142
		f 4 -1525 1521 188 -1524
		mu 0 4 874 872 448 445
		f 4 -1527 1523 190 -1526
		mu 0 4 875 874 445 442
		f 4 -1529 1525 192 -1528
		mu 0 4 876 875 442 439
		f 4 -1531 1527 194 -1530
		mu 0 4 877 876 439 290
		f 4 -1533 1529 196 -1532
		mu 0 4 878 877 290 284
		f 4 -1535 1531 198 -1534
		mu 0 4 879 878 284 278
		f 4 -1537 1533 200 -1536
		mu 0 4 880 879 278 272
		f 4 -1539 1535 202 -1538
		mu 0 4 881 880 272 266
		f 4 -1540 1537 204 -1501
		mu 0 4 861 881 266 267
		f 4 -1543 1540 166 -1542
		mu 0 4 883 882 274 282
		f 4 -1545 1541 168 -1544
		mu 0 4 884 883 282 365
		f 4 -1547 1543 170 -1546
		mu 0 4 885 884 365 363
		f 4 -1549 1545 172 -1548
		mu 0 4 886 885 363 361
		f 4 -1551 1547 174 -1550
		mu 0 4 887 886 361 122
		f 4 -1553 1549 176 -1552
		mu 0 4 888 887 122 116
		f 4 -1555 1551 178 -1554
		mu 0 4 889 888 116 117
		f 4 -1557 1553 179 -1556
		mu 0 4 890 889 117 125
		f 4 -1559 1555 142 -1558
		mu 0 4 891 890 125 133
		f 4 -1561 1557 144 -1560
		mu 0 4 892 891 133 141
		f 4 -1563 1559 146 -1562
		mu 0 4 894 892 141 147
		f 4 -1565 1561 148 -1564
		mu 0 4 895 893 452 449
		f 4 -1567 1563 150 -1566
		mu 0 4 896 895 449 446
		f 4 -1569 1565 152 -1568
		mu 0 4 897 896 446 443
		f 4 -1571 1567 154 -1570
		mu 0 4 898 897 443 297
		f 4 -1573 1569 156 -1572
		mu 0 4 899 898 297 291
		f 4 -1575 1571 158 -1574
		mu 0 4 900 899 291 285
		f 4 -1577 1573 160 -1576
		mu 0 4 901 900 285 279
		f 4 -1579 1575 162 -1578
		mu 0 4 902 901 279 273
		f 4 -1580 1577 164 -1541
		mu 0 4 882 902 273 274
		f 4 -1583 1580 126 -1582
		mu 0 4 904 903 281 289
		f 4 -1585 1581 128 -1584
		mu 0 4 905 904 289 368
		f 4 -1587 1583 130 -1586
		mu 0 4 906 905 368 366
		f 4 -1589 1585 132 -1588
		mu 0 4 907 906 366 364
		f 4 -1591 1587 134 -1590
		mu 0 4 908 907 364 129
		f 4 -1593 1589 136 -1592
		mu 0 4 909 908 129 123
		f 4 -1595 1591 138 -1594
		mu 0 4 910 909 123 124
		f 4 -1597 1593 139 -1596
		mu 0 4 911 910 124 132
		f 4 -1599 1595 102 -1598
		mu 0 4 912 911 132 140
		f 4 -1601 1597 104 -1600
		mu 0 4 913 912 140 146
		f 4 -1603 1599 106 -1602
		mu 0 4 915 913 146 150
		f 4 -1605 1601 108 -1604
		mu 0 4 916 914 456 453
		f 4 -1607 1603 110 -1606
		mu 0 4 917 916 453 450
		f 4 -1609 1605 112 -1608
		mu 0 4 918 917 450 447
		f 4 -1611 1607 114 -1610
		mu 0 4 919 918 447 302
		f 4 -1613 1609 116 -1612
		mu 0 4 920 919 302 298
		f 4 -1615 1611 118 -1614
		mu 0 4 921 920 298 292
		f 4 -1617 1613 120 -1616
		mu 0 4 922 921 292 286
		f 4 -1619 1615 122 -1618
		mu 0 4 923 922 286 280
		f 4 -1620 1617 124 -1581
		mu 0 4 903 923 280 281
		f 4 -1623 1620 62 -1622
		mu 0 4 925 924 139 145
		f 4 -1625 1621 64 -1624
		mu 0 4 926 925 145 149
		f 4 -1627 1623 66 -1626
		mu 0 4 928 926 149 152
		f 4 -1629 1625 68 -1628
		mu 0 4 929 927 459 457
		f 4 -1631 1627 70 -1630
		mu 0 4 930 929 457 454
		f 4 -1633 1629 72 -1632
		mu 0 4 931 930 454 451
		f 4 -1635 1631 74 -1634
		mu 0 4 932 931 451 305
		f 4 -1637 1633 76 -1636
		mu 0 4 933 932 305 303
		f 4 -1639 1635 78 -1638
		mu 0 4 934 933 303 299
		f 4 -1641 1637 80 -1640
		mu 0 4 935 934 299 293
		f 4 -1643 1639 82 -1642
		mu 0 4 936 935 293 287
		f 4 -1645 1641 84 -1644
		mu 0 4 937 936 287 288
		f 4 -1647 1643 86 -1646
		mu 0 4 938 937 288 296
		f 4 -1649 1645 88 -1648
		mu 0 4 939 938 296 371
		f 4 -1651 1647 90 -1650
		mu 0 4 940 939 371 369
		f 4 -1653 1649 92 -1652
		mu 0 4 941 940 369 367
		f 4 -1655 1651 94 -1654
		mu 0 4 942 941 367 136
		f 4 -1657 1653 96 -1656
		mu 0 4 943 942 136 130
		f 4 -1659 1655 98 -1658
		mu 0 4 944 943 130 131
		f 4 -1660 1657 99 -1621
		mu 0 4 924 944 131 139
		f 4 -1663 1660 -26 -1662
		mu 0 4 946 945 301 373
		f 4 -1665 1661 -25 -1664
		mu 0 4 947 946 373 372
		f 4 -1667 1663 -24 -1666
		mu 0 4 948 947 372 370
		f 4 -1669 1665 -23 -1668
		mu 0 4 949 948 370 143
		f 4 -1671 1667 -22 -1670
		mu 0 4 950 949 143 137
		f 4 -1673 1669 -21 -1672
		mu 0 4 951 950 137 138
		f 4 -1675 1671 -40 -1674
		mu 0 4 952 951 138 144
		f 4 -1677 1673 -39 -1676
		mu 0 4 953 952 144 148
		f 4 -1679 1675 -38 -1678
		mu 0 4 954 953 148 151
		f 4 -1681 1677 -37 -1680
		mu 0 4 956 954 151 153
		f 4 -1683 1679 -36 -1682
		mu 0 4 957 955 461 460
		f 4 -1685 1681 -35 -1684
		mu 0 4 958 957 460 458
		f 4 -1687 1683 -34 -1686
		mu 0 4 959 958 458 455
		f 4 -1689 1685 -33 -1688
		mu 0 4 960 959 455 307
		f 4 -1691 1687 -32 -1690
		mu 0 4 961 960 307 306
		f 4 -1693 1689 -31 -1692
		mu 0 4 962 961 306 304
		f 4 -1695 1691 -30 -1694
		mu 0 4 963 962 304 300
		f 4 -1697 1693 -29 -1696
		mu 0 4 964 963 300 294
		f 4 -1699 1695 -28 -1698
		mu 0 4 965 964 294 295
		f 4 -1700 1697 -27 -1661
		mu 0 4 945 965 295 301;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
createNode transform -n "grabNode1" -p "hose_main_component1";
	rename -uid "BC3A886A-4CDC-15D5-FEA8-2E903C24A515";
	addAttr -ci true -sn "i3D_xmlIdentifier" -ln "i3D_xmlIdentifier" -dt "string";
	setAttr ".t" -type "double3" 0 1.5777218104420236e-30 3.8857805861880487e-15 ;
	setAttr ".i3D_xmlIdentifier" -type "string" "grabNode1";
createNode transform -n "baseNode" -p "hose_main_component1";
	rename -uid "6AD6364F-4293-337F-84F9-6BA2A0BFEB9B";
	addAttr -ci true -sn "i3D_xmlIdentifier" -ln "i3D_xmlIdentifier" -dt "string";
	setAttr ".t" -type "double3" 1.7167190056720391e-32 1.4791141972893975e-30 0 ;
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".i3D_xmlIdentifier" -type "string" "baseNode";
createNode transform -n "componentJoint1" -p "hose_main_component1";
	rename -uid "5C079AB8-4CA5-E2C5-1986-A1BCE6412101";
	addAttr -ci true -sn "i3D_xmlIdentifier" -ln "i3D_xmlIdentifier" -dt "string";
	setAttr ".t" -type "double3" 2.8939936098462151e-09 1.4469968001584728e-09 -1.8479999999999959 ;
	setAttr ".i3D_xmlIdentifier" -type "string" "componentJoint1";
createNode transform -n "pCylinder1" -p "hose_main_component1";
	rename -uid "56B3059C-4062-67FA-D00A-1584C9384D13";
	addAttr -ci true -sn "i3D_objectMask" -ln "i3D_objectMask" -at "long";
	addAttr -ci true -sn "i3D_dynamic" -ln "i3D_dynamic" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_joint" -ln "i3D_joint" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_dynamicFriction" -ln "i3D_dynamicFriction" -at "float";
	addAttr -ci true -sn "i3D_ccd" -ln "i3D_ccd" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_density" -ln "i3D_density" -at "float";
	addAttr -ci true -sn "i3D_splitType" -ln "i3D_splitType" -at "long";
	addAttr -ci true -sn "i3D_splitMinU" -ln "i3D_splitMinU" -at "float";
	addAttr -ci true -sn "i3D_splitMinV" -ln "i3D_splitMinV" -at "float";
	addAttr -ci true -sn "i3D_driveForceLimit" -ln "i3D_driveForceLimit" -at "float";
	addAttr -ci true -sn "i3D_angularDamping" -ln "i3D_angularDamping" -at "float";
	addAttr -ci true -sn "i3D_splitUvWorldScale" -ln "i3D_splitUvWorldScale" -at "float";
	addAttr -ci true -sn "i3D_projection" -ln "i3D_projection" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_driveSpring" -ln "i3D_driveSpring" -at "float";
	addAttr -ci true -sn "i3D_breakableJoint" -ln "i3D_breakableJoint" -min 0 -max 1
		-at "bool";
	addAttr -ci true -sn "i3D_projDistance" -ln "i3D_projDistance" -at "float";
	addAttr -ci true -sn "i3D_driveDamping" -ln "i3D_driveDamping" -at "float";
	addAttr -ci true -sn "i3D_xAxisDrive" -ln "i3D_xAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_compound" -ln "i3D_compound" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_clipDistance" -ln "i3D_clipDistance" -at "float";
	addAttr -ci true -sn "i3D_collision" -ln "i3D_collision" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_scaled" -ln "i3D_scaled" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_projAngle" -ln "i3D_projAngle" -at "float";
	addAttr -ci true -sn "i3D_mergeGroupRoot" -ln "i3D_mergeGroupRoot" -min 0 -max 1
		-at "bool";
	addAttr -ci true -sn "i3D_jointBreakTorque" -ln "i3D_jointBreakTorque" -at "float";
	addAttr -ci true -sn "i3D_restitution" -ln "i3D_restitution" -at "float";
	addAttr -ci true -sn "i3D_yAxisDrive" -ln "i3D_yAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeGroup" -ln "i3D_mergeGroup" -at "long";
	addAttr -ci true -sn "i3D_jointBreakForce" -ln "i3D_jointBreakForce" -at "float";
	addAttr -ci true -sn "i3D_lod1" -ln "i3D_lod1" -at "float";
	addAttr -ci true -sn "i3D_lod2" -ln "i3D_lod2" -at "float";
	addAttr -ci true -sn "i3D_oc" -ln "i3D_oc" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_kinematic" -ln "i3D_kinematic" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_trigger" -ln "i3D_trigger" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_static" -ln "i3D_static" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lightMask" -ln "i3D_lightMask" -dt "string";
	addAttr -ci true -sn "i3D_linearDamping" -ln "i3D_linearDamping" -at "float";
	addAttr -ci true -sn "i3D_lod3" -ln "i3D_lod3" -at "float";
	addAttr -ci true -sn "i3D_drivePos" -ln "i3D_drivePos" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lod" -ln "i3D_lod" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_solverIterationCount" -ln "i3D_solverIterationCount" -at "long";
	addAttr -ci true -sn "i3D_nonRenderable" -ln "i3D_nonRenderable" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_boundingVolume" -ln "i3D_boundingVolume" -dt "string";
	addAttr -ci true -sn "i3D_collisionMask" -ln "i3D_collisionMask" -at "long";
	addAttr -ci true -sn "i3D_zAxisDrive" -ln "i3D_zAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_cpuMesh" -ln "i3D_cpuMesh" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_staticFriction" -ln "i3D_staticFriction" -at "float";
	addAttr -ci true -sn "i3D_decalLayer" -ln "i3D_decalLayer" -at "long";
	addAttr -ci true -sn "i3D_splitMaxV" -ln "i3D_splitMaxV" -at "float";
	addAttr -ci true -sn "i3D_splitMaxU" -ln "i3D_splitMaxU" -at "float";
	addAttr -ci true -sn "i3D_compoundChild" -ln "i3D_compoundChild" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.7252902984619141e-09 -1.862645149230957e-09 -0.064493370742649506 ;
	setAttr ".i3D_objectMask" 255;
	setAttr ".i3D_dynamic" yes;
	setAttr ".i3D_dynamicFriction" 0.5;
	setAttr ".i3D_density" 0.0010000000474974513;
	setAttr ".i3D_driveForceLimit" 100000;
	setAttr ".i3D_angularDamping" 0.0099999997764825821;
	setAttr ".i3D_splitUvWorldScale" 1;
	setAttr ".i3D_driveSpring" 1;
	setAttr ".i3D_projDistance" 0.0099999997764825821;
	setAttr ".i3D_driveDamping" 0.0099999997764825821;
	setAttr ".i3D_collision" yes;
	setAttr ".i3D_projAngle" 0.0099999997764825821;
	setAttr ".i3D_lightMask" -type "string" "FFFF";
	setAttr ".i3D_solverIterationCount" 4;
	setAttr ".i3D_nonRenderable" yes;
	setAttr ".i3D_boundingVolume" -type "string" "";
	setAttr ".i3D_collisionMask" 8194;
	setAttr ".i3D_staticFriction" 0.5;
	setAttr ".i3D_splitMaxV" 1;
	setAttr ".i3D_splitMaxU" 1;
	setAttr ".i3D_compoundChild" yes;
createNode mesh -n "pCylinderShape1" -p "pCylinder1";
	rename -uid "8D9BEF97-48C0-5C88-C495-CCB66500C432";
	setAttr -k off ".v";
	setAttr ".tmp" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr -s 10 ".gtag";
	setAttr ".gtag[0].gtagnm" -type "string" "bottom";
	setAttr ".gtag[0].gtagcmp" -type "componentList" 1 "f[8:15]";
	setAttr ".gtag[1].gtagnm" -type "string" "bottomRing";
	setAttr ".gtag[1].gtagcmp" -type "componentList" 1 "e[0:7]";
	setAttr ".gtag[2].gtagnm" -type "string" "cylBottomCap";
	setAttr ".gtag[2].gtagcmp" -type "componentList" 2 "vtx[0:7]" "vtx[16]";
	setAttr ".gtag[3].gtagnm" -type "string" "cylBottomRing";
	setAttr ".gtag[3].gtagcmp" -type "componentList" 1 "vtx[0:7]";
	setAttr ".gtag[4].gtagnm" -type "string" "cylSides";
	setAttr ".gtag[4].gtagcmp" -type "componentList" 1 "vtx[0:15]";
	setAttr ".gtag[5].gtagnm" -type "string" "cylTopCap";
	setAttr ".gtag[5].gtagcmp" -type "componentList" 2 "vtx[8:15]" "vtx[17]";
	setAttr ".gtag[6].gtagnm" -type "string" "cylTopRing";
	setAttr ".gtag[6].gtagcmp" -type "componentList" 1 "vtx[8:15]";
	setAttr ".gtag[7].gtagnm" -type "string" "sides";
	setAttr ".gtag[7].gtagcmp" -type "componentList" 1 "f[0:7]";
	setAttr ".gtag[8].gtagnm" -type "string" "top";
	setAttr ".gtag[8].gtagcmp" -type "componentList" 1 "f[16:23]";
	setAttr ".gtag[9].gtagnm" -type "string" "topRing";
	setAttr ".gtag[9].gtagcmp" -type "componentList" 1 "e[8:15]";
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 36 ".uvst[0].uvsp[0:35]" -type "float2" 0.61048543 0.04576458
		 0.5 1.4901161e-08 0.38951457 0.04576458 0.34375 0.15625 0.38951457 0.26673543 0.5
		 0.3125 0.61048543 0.26673543 0.65625 0.15625 0.375 0.3125 0.40625 0.3125 0.4375 0.3125
		 0.46875 0.3125 0.5 0.3125 0.53125 0.3125 0.5625 0.3125 0.59375 0.3125 0.625 0.3125
		 0.375 0.68843985 0.40625 0.68843985 0.4375 0.68843985 0.46875 0.68843985 0.5 0.68843985
		 0.53125 0.68843985 0.5625 0.68843985 0.59375 0.68843985 0.625 0.68843985 0.61048543
		 0.73326457 0.5 0.6875 0.38951457 0.73326457 0.34375 0.84375 0.38951457 0.95423543
		 0.5 1 0.61048543 0.95423543 0.65625 0.84375 0.5 0.15000001 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 18 ".vt[0:17]"  0.043555837 0.043555841 -0.061597269 -3.7252903e-09 0.061597265 -0.061597269
		 -0.043555845 0.043555841 -0.061597269 -0.061597265 1.8626451e-09 -0.061597269 -0.043555845 -0.043555841 -0.061597269
		 -3.7252903e-09 -0.061597265 -0.061597269 0.043555841 -0.043555841 -0.061597269 0.061597265 1.8626451e-09 -0.061597269
		 0.043555837 0.043555841 0.061597269 -3.7252903e-09 0.061597265 0.061597269 -0.043555845 0.043555841 0.061597269
		 -0.061597265 1.8626451e-09 0.061597269 -0.043555845 -0.043555841 0.061597269 -3.7252903e-09 -0.061597265 0.061597269
		 0.043555841 -0.043555841 0.061597269 0.061597265 1.8626451e-09 0.061597269 -3.7252903e-09 1.8626451e-09 -0.061597269
		 -3.7252903e-09 1.8626451e-09 0.061597269;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 0 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 8 0 0 8 0 1 9 0 2 10 0
		 3 11 0 4 12 0 5 13 0 6 14 0 7 15 0 16 0 1 16 1 1 16 2 1 16 3 1 16 4 1 16 5 1 16 6 1
		 16 7 1 8 17 1 9 17 1 10 17 1 11 17 1 12 17 1 13 17 1 14 17 1 15 17 1;
	setAttr -s 24 -ch 80 ".fc[0:23]" -type "polyFaces"
		f 4 0 17 -9 -17
		mu 0 4 8 9 18 17
		f 4 1 18 -10 -18
		mu 0 4 9 10 19 18
		f 4 2 19 -11 -19
		mu 0 4 10 11 20 19
		f 4 3 20 -12 -20
		mu 0 4 11 12 21 20
		f 4 4 21 -13 -21
		mu 0 4 12 13 22 21
		f 4 5 22 -14 -22
		mu 0 4 13 14 23 22
		f 4 6 23 -15 -23
		mu 0 4 14 15 24 23
		f 4 7 16 -16 -24
		mu 0 4 15 16 25 24
		f 3 -1 -25 25
		mu 0 3 1 0 34
		f 3 -2 -26 26
		mu 0 3 2 1 34
		f 3 -3 -27 27
		mu 0 3 3 2 34
		f 3 -4 -28 28
		mu 0 3 4 3 34
		f 3 -5 -29 29
		mu 0 3 5 4 34
		f 3 -6 -30 30
		mu 0 3 6 5 34
		f 3 -7 -31 31
		mu 0 3 7 6 34
		f 3 -8 -32 24
		mu 0 3 0 7 34
		f 3 8 33 -33
		mu 0 3 32 31 35
		f 3 9 34 -34
		mu 0 3 31 30 35
		f 3 10 35 -35
		mu 0 3 30 29 35
		f 3 11 36 -36
		mu 0 3 29 28 35
		f 3 12 37 -37
		mu 0 3 28 27 35
		f 3 13 38 -38
		mu 0 3 27 26 35
		f 3 14 39 -39
		mu 0 3 26 33 35
		f 3 15 32 -40
		mu 0 3 33 32 35;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "hose_main_component2";
	rename -uid "A0BB9E3A-4423-D9C9-438C-D8873A051DCB";
	addAttr -ci true -sn "i3D_lightMask" -ln "i3D_lightMask" -dt "string";
	addAttr -ci true -sn "i3D_xmlIdentifier" -ln "i3D_xmlIdentifier" -dt "string";
	addAttr -ci true -sn "i3D_static" -ln "i3D_static" -nn "i3D_static" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_dynamic" -ln "i3D_dynamic" -nn "i3D_dynamic" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_kinematic" -ln "i3D_kinematic" -nn "i3D_kinematic" -min
		0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_compound" -ln "i3D_compound" -nn "i3D_compound" -min 0
		-max 1 -at "bool";
	addAttr -ci true -sn "i3D_compoundChild" -ln "i3D_compoundChild" -nn "i3D_compoundChild"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_collision" -ln "i3D_collision" -nn "i3D_collision" -min
		0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_collisionMask" -ln "i3D_collisionMask" -nn "i3D_collisionMask"
		-dt "string";
	addAttr -ci true -sn "i3D_solverIterationCount" -ln "i3D_solverIterationCount" -nn "i3D_solverIterationCount"
		-at "long";
	addAttr -ci true -sn "i3D_restitution" -ln "i3D_restitution" -nn "i3D_restitution"
		-at "float";
	addAttr -ci true -sn "i3D_staticFriction" -ln "i3D_staticFriction" -nn "i3D_staticFriction"
		-at "float";
	addAttr -ci true -sn "i3D_dynamicFriction" -ln "i3D_dynamicFriction" -nn "i3D_dynamicFriction"
		-at "float";
	addAttr -ci true -sn "i3D_linearDamping" -ln "i3D_linearDamping" -nn "i3D_linearDamping"
		-at "float";
	addAttr -ci true -sn "i3D_angularDamping" -ln "i3D_angularDamping" -nn "i3D_angularDamping"
		-at "float";
	addAttr -ci true -sn "i3D_density" -ln "i3D_density" -nn "i3D_density" -at "float";
	addAttr -ci true -sn "i3D_ccd" -ln "i3D_ccd" -nn "i3D_ccd" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_trigger" -ln "i3D_trigger" -nn "i3D_trigger" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_splitType" -ln "i3D_splitType" -nn "i3D_splitType" -at "long";
	addAttr -ci true -sn "i3D_splitMinU" -ln "i3D_splitMinU" -nn "i3D_splitMinU" -at "float";
	addAttr -ci true -sn "i3D_splitMinV" -ln "i3D_splitMinV" -nn "i3D_splitMinV" -at "float";
	addAttr -ci true -sn "i3D_splitMaxU" -ln "i3D_splitMaxU" -nn "i3D_splitMaxU" -at "float";
	addAttr -ci true -sn "i3D_splitMaxV" -ln "i3D_splitMaxV" -nn "i3D_splitMaxV" -at "float";
	addAttr -ci true -sn "i3D_splitUvWorldScale" -ln "i3D_splitUvWorldScale" -nn "i3D_splitUvWorldScale"
		-at "float";
	addAttr -ci true -sn "i3D_joint" -ln "i3D_joint" -nn "i3D_joint" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_projection" -ln "i3D_projection" -nn "i3D_projection"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_projDistance" -ln "i3D_projDistance" -nn "i3D_projDistance"
		-at "float";
	addAttr -ci true -sn "i3D_projAngle" -ln "i3D_projAngle" -nn "i3D_projAngle" -at "float";
	addAttr -ci true -sn "i3D_xAxisDrive" -ln "i3D_xAxisDrive" -nn "i3D_xAxisDrive"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_yAxisDrive" -ln "i3D_yAxisDrive" -nn "i3D_yAxisDrive"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_zAxisDrive" -ln "i3D_zAxisDrive" -nn "i3D_zAxisDrive"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_drivePos" -ln "i3D_drivePos" -nn "i3D_drivePos" -min 0
		-max 1 -at "bool";
	addAttr -ci true -sn "i3D_driveForceLimit" -ln "i3D_driveForceLimit" -nn "i3D_driveForceLimit"
		-at "float";
	addAttr -ci true -sn "i3D_driveSpring" -ln "i3D_driveSpring" -nn "i3D_driveSpring"
		-at "float";
	addAttr -ci true -sn "i3D_driveDamping" -ln "i3D_driveDamping" -nn "i3D_driveDamping"
		-at "float";
	addAttr -ci true -sn "i3D_breakableJoint" -ln "i3D_breakableJoint" -nn "i3D_breakableJoint"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_jointBreakForce" -ln "i3D_jointBreakForce" -nn "i3D_jointBreakForce"
		-at "float";
	addAttr -ci true -sn "i3D_jointBreakTorque" -ln "i3D_jointBreakTorque" -nn "i3D_jointBreakTorque"
		-at "float";
	addAttr -ci true -sn "i3D_oc" -ln "i3D_oc" -nn "i3D_oc" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_nonRenderable" -ln "i3D_nonRenderable" -nn "i3D_nonRenderable"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_clipDistance" -ln "i3D_clipDistance" -nn "i3D_clipDistance"
		-at "float";
	addAttr -ci true -sn "i3D_objectMask" -ln "i3D_objectMask" -nn "i3D_objectMask"
		-at "long";
	addAttr -ci true -sn "i3D_navMeshMask" -ln "i3D_navMeshMask" -nn "i3D_navMeshMask"
		-at "long";
	addAttr -ci true -sn "i3D_decalLayer" -ln "i3D_decalLayer" -nn "i3D_decalLayer"
		-at "long";
	addAttr -ci true -sn "i3D_mergeGroup" -ln "i3D_mergeGroup" -nn "i3D_mergeGroup"
		-at "long";
	addAttr -ci true -sn "i3D_mergeGroupRoot" -ln "i3D_mergeGroupRoot" -nn "i3D_mergeGroupRoot"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_boundingVolume" -ln "i3D_boundingVolume" -nn "i3D_boundingVolume"
		-dt "string";
	addAttr -ci true -sn "i3D_cpuMesh" -ln "i3D_cpuMesh" -nn "i3D_cpuMesh" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_mergeChildren" -ln "i3D_mergeChildren" -nn "i3D_mergeChildren"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeChildrenFreezeTrans" -ln "i3D_mergeChildrenFreezeTrans"
		-nn "i3D_mergeChildrenFreezeTrans" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeChildrenFreezeRot" -ln "i3D_mergeChildrenFreezeRot"
		-nn "i3D_mergeChildrenFreezeRot" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeChildrenFreezeScale" -ln "i3D_mergeChildrenFreezeScale"
		-nn "i3D_mergeChildrenFreezeScale" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lod" -ln "i3D_lod" -nn "i3D_lod" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lod1" -ln "i3D_lod1" -nn "i3D_lod1" -at "float";
	addAttr -ci true -sn "i3D_lod2" -ln "i3D_lod2" -nn "i3D_lod2" -at "float";
	addAttr -ci true -sn "i3D_lod3" -ln "i3D_lod3" -nn "i3D_lod3" -at "float";
	addAttr -ci true -sn "i3D_scaled" -ln "i3D_scaled" -nn "i3D_scaled" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataFilePath" -ln "i3D_objectDataFilePath" -nn "i3D_objectDataFilePath"
		-dt "string";
	addAttr -ci true -sn "i3D_objectDataExportPosition" -ln "i3D_objectDataExportPosition"
		-nn "i3D_objectDataExportPosition" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataExportOrientation" -ln "i3D_objectDataExportOrientation"
		-nn "i3D_objectDataExportOrientation" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataExportScale" -ln "i3D_objectDataExportScale"
		-nn "i3D_objectDataExportScale" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataHideFirstAndLastObject" -ln "i3D_objectDataHideFirstAndLastObject"
		-nn "i3D_objectDataHideFirstAndLastObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataHierarchicalSetup" -ln "i3D_objectDataHierarchicalSetup"
		-nn "i3D_objectDataHierarchicalSetup" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_minuteOfDayStart" -ln "i3D_minuteOfDayStart" -nn "i3D_minuteOfDayStart"
		-at "long";
	addAttr -ci true -sn "i3D_minuteOfDayEnd" -ln "i3D_minuteOfDayEnd" -nn "i3D_minuteOfDayEnd"
		-at "long";
	addAttr -ci true -sn "i3D_dayOfYearStart" -ln "i3D_dayOfYearStart" -nn "i3D_dayOfYearStart"
		-at "long";
	addAttr -ci true -sn "i3D_dayOfYearEnd" -ln "i3D_dayOfYearEnd" -nn "i3D_dayOfYearEnd"
		-at "long";
	addAttr -ci true -sn "i3D_weatherRequiredMask" -ln "i3D_weatherRequiredMask" -nn "i3D_weatherRequiredMask"
		-dt "string";
	addAttr -ci true -sn "i3D_weatherPreventMask" -ln "i3D_weatherPreventMask" -nn "i3D_weatherPreventMask"
		-dt "string";
	addAttr -ci true -sn "i3D_viewerSpacialityRequiredMask" -ln "i3D_viewerSpacialityRequiredMask"
		-nn "i3D_viewerSpacialityRequiredMask" -dt "string";
	addAttr -ci true -sn "i3D_viewerSpacialityPreventMask" -ln "i3D_viewerSpacialityPreventMask"
		-nn "i3D_viewerSpacialityPreventMask" -dt "string";
	addAttr -ci true -sn "i3D_renderInvisible" -ln "i3D_renderInvisible" -nn "i3D_renderInvisible"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_visibleShaderParameter" -ln "i3D_visibleShaderParameter"
		-nn "i3D_visibleShaderParameter" -at "float";
	addAttr -ci true -sn "i3D_forceVisibilityCondition" -ln "i3D_forceVisibilityCondition"
		-nn "i3D_forceVisibilityCondition" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.8939936098462151e-09 1.4469968001584728e-09 -1.928 ;
	setAttr ".i3D_lightMask" -type "string" "FFFF";
	setAttr ".i3D_xmlIdentifier" -type "string" "hose_main_component2";
	setAttr ".i3D_dynamic" yes;
	setAttr ".i3D_compound" yes;
	setAttr ".i3D_collision" yes;
	setAttr ".i3D_collisionMask" -type "string" "2109442";
	setAttr ".i3D_solverIterationCount" 4;
	setAttr ".i3D_staticFriction" 0.5;
	setAttr ".i3D_dynamicFriction" 0.5;
	setAttr ".i3D_angularDamping" 0.0099999997764825821;
	setAttr ".i3D_density" 1;
	setAttr ".i3D_splitMaxU" 1;
	setAttr ".i3D_splitMaxV" 1;
	setAttr ".i3D_splitUvWorldScale" 1;
	setAttr ".i3D_projDistance" 0.0099999997764825821;
	setAttr ".i3D_projAngle" 0.0099999997764825821;
	setAttr ".i3D_driveForceLimit" 100000;
	setAttr ".i3D_driveSpring" 1;
	setAttr ".i3D_driveDamping" 0.0099999997764825821;
	setAttr ".i3D_nonRenderable" yes;
	setAttr ".i3D_clipDistance" 300;
	setAttr ".i3D_objectMask" 255;
	setAttr ".i3D_navMeshMask" 255;
	setAttr ".i3D_boundingVolume" -type "string" "";
	setAttr ".i3D_cpuMesh" yes;
	setAttr ".i3D_objectDataFilePath" -type "string" "";
	setAttr ".i3D_objectDataExportPosition" yes;
	setAttr ".i3D_objectDataExportOrientation" yes;
	setAttr ".i3D_weatherRequiredMask" -type "string" "0";
	setAttr ".i3D_weatherPreventMask" -type "string" "0";
	setAttr ".i3D_viewerSpacialityRequiredMask" -type "string" "0";
	setAttr ".i3D_viewerSpacialityPreventMask" -type "string" "0";
	setAttr ".i3D_visibleShaderParameter" 1;
createNode mesh -n "hose_main_componentShape2" -p "hose_main_component2";
	rename -uid "14A4F76A-458A-2F06-EC0E-969EF5BBF072";
	setAttr -k off ".v";
	setAttr ".tmp" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5000000074505806 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 36 ".uvst[0].uvsp[0:35]" -type "float2" 0.61048543 0.04576458
		 0.5 1.4901161e-08 0.38951457 0.04576458 0.34375 0.15625 0.38951457 0.26673543 0.5
		 0.3125 0.61048543 0.26673543 0.65625 0.15625 0.375 0.3125 0.40625 0.3125 0.4375 0.3125
		 0.46875 0.3125 0.5 0.3125 0.53125 0.3125 0.5625 0.3125 0.59375 0.3125 0.625 0.3125
		 0.375 0.68843985 0.40625 0.68843985 0.4375 0.68843985 0.46875 0.68843985 0.5 0.68843985
		 0.53125 0.68843985 0.5625 0.68843985 0.59375 0.68843985 0.625 0.68843985 0.61048543
		 0.73326457 0.5 0.6875 0.38951457 0.73326457 0.34375 0.84375 0.38951457 0.95423543
		 0.5 1 0.61048543 0.95423543 0.65625 0.84375 0.5 0.15000001 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".op" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 18 ".pt[0:17]" -type "float3"  0.11686925 -1.0326952 -0.58417398
		-2.8939935e-09 -1.0462381 -0.61903989 -0.11686926 -1.0326952 -0.58417398 -0.16527808
		-0.99999994 -0.49999994 -0.11686926 -0.96730465 -0.41582596 -2.8939935e-09 -0.95376182
		-0.38096005 0.11686926 -0.96730465 -0.41582596 0.16527809 -0.99999994 -0.49999994
		0.11686925 -0.032695323 0.4158259 -2.8939935e-09 -0.046238154 0.38096005 -0.11686926
		-0.032695323 0.4158259 -0.16527808 -2.9802322e-08 0.49999994 -0.11686926 0.032695264
		0.58417398 -2.8939935e-09 0.046238095 0.61903983 0.11686926 0.032695264 0.58417398
		0.16527809 -2.9802322e-08 0.49999994 -2.8939935e-09 -0.99999994 -0.49999994 -2.8939935e-09
		-2.9802322e-08 0.49999994;
	setAttr -s 18 ".vt[0:17]"  -0.084173962 0.99999994 0.084173962 0 0.99999994 0.11903995
		 0.084173962 0.99999994 0.084173962 0.11903995 0.99999994 4.1714861e-17 0.084173962 0.99999994 -0.084173962
		 0 0.99999994 -0.11903996 -0.08417397 0.99999994 -0.08417397 -0.11903997 0.99999994 4.1714861e-17
		 -0.084173962 1.4901161e-08 0.084173962 0 1.4901161e-08 0.11903995 0.084173962 1.4901161e-08 0.084173962
		 0.11903995 1.4901161e-08 2.6432183e-17 0.084173962 1.4901161e-08 -0.084173962 0 1.4901161e-08 -0.11903996
		 -0.08417397 1.4901161e-08 -0.08417397 -0.11903997 1.4901161e-08 2.6432183e-17 0 0.99999994 4.1714861e-17
		 0 1.4901161e-08 2.6432183e-17;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 0 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 8 0 0 8 0 1 9 0 2 10 0
		 3 11 0 4 12 0 5 13 0 6 14 0 7 15 0 16 0 1 16 1 1 16 2 1 16 3 1 16 4 1 16 5 1 16 6 1
		 16 7 1 8 17 1 9 17 1 10 17 1 11 17 1 12 17 1 13 17 1 14 17 1 15 17 1;
	setAttr -s 24 -ch 80 ".fc[0:23]" -type "polyFaces"
		f 4 16 8 -18 -1
		mu 0 4 8 17 18 9
		f 4 17 9 -19 -2
		mu 0 4 9 18 19 10
		f 4 18 10 -20 -3
		mu 0 4 10 19 20 11
		f 4 19 11 -21 -4
		mu 0 4 11 20 21 12
		f 4 20 12 -22 -5
		mu 0 4 12 21 22 13
		f 4 21 13 -23 -6
		mu 0 4 13 22 23 14
		f 4 22 14 -24 -7
		mu 0 4 14 23 24 15
		f 4 23 15 -17 -8
		mu 0 4 15 24 25 16
		f 3 -26 24 0
		mu 0 3 1 34 0
		f 3 -27 25 1
		mu 0 3 2 34 1
		f 3 -28 26 2
		mu 0 3 3 34 2
		f 3 -29 27 3
		mu 0 3 4 34 3
		f 3 -30 28 4
		mu 0 3 5 34 4
		f 3 -31 29 5
		mu 0 3 6 34 5
		f 3 -32 30 6
		mu 0 3 7 34 6
		f 3 -25 31 7
		mu 0 3 0 34 7
		f 3 32 -34 -9
		mu 0 3 32 35 31
		f 3 33 -35 -10
		mu 0 3 31 35 30
		f 3 34 -36 -11
		mu 0 3 30 35 29
		f 3 35 -37 -12
		mu 0 3 29 35 28
		f 3 36 -38 -13
		mu 0 3 28 35 27
		f 3 37 -39 -14
		mu 0 3 27 35 26
		f 3 38 -40 -15
		mu 0 3 26 35 33
		f 3 39 -33 -16
		mu 0 3 33 35 32;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "componentJoint2" -p "hose_main_component2";
	rename -uid "9C69B088-4302-F959-3D28-B5B87270EF78";
	addAttr -ci true -sn "i3D_xmlIdentifier" -ln "i3D_xmlIdentifier" -dt "string";
	setAttr ".t" -type "double3" 0 0 -1.548 ;
	setAttr ".i3D_xmlIdentifier" -type "string" "componentJoint2";
createNode transform -n "hose_main_component3";
	rename -uid "1EF29723-42E1-F557-3384-35965ECB1EB5";
	addAttr -ci true -sn "i3D_lightMask" -ln "i3D_lightMask" -dt "string";
	addAttr -ci true -sn "i3D_xmlIdentifier" -ln "i3D_xmlIdentifier" -dt "string";
	addAttr -ci true -sn "i3D_static" -ln "i3D_static" -nn "i3D_static" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_dynamic" -ln "i3D_dynamic" -nn "i3D_dynamic" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_kinematic" -ln "i3D_kinematic" -nn "i3D_kinematic" -min
		0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_compound" -ln "i3D_compound" -nn "i3D_compound" -min 0
		-max 1 -at "bool";
	addAttr -ci true -sn "i3D_compoundChild" -ln "i3D_compoundChild" -nn "i3D_compoundChild"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_collision" -ln "i3D_collision" -nn "i3D_collision" -min
		0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_collisionMask" -ln "i3D_collisionMask" -nn "i3D_collisionMask"
		-dt "string";
	addAttr -ci true -sn "i3D_solverIterationCount" -ln "i3D_solverIterationCount" -nn "i3D_solverIterationCount"
		-at "long";
	addAttr -ci true -sn "i3D_restitution" -ln "i3D_restitution" -nn "i3D_restitution"
		-at "float";
	addAttr -ci true -sn "i3D_staticFriction" -ln "i3D_staticFriction" -nn "i3D_staticFriction"
		-at "float";
	addAttr -ci true -sn "i3D_dynamicFriction" -ln "i3D_dynamicFriction" -nn "i3D_dynamicFriction"
		-at "float";
	addAttr -ci true -sn "i3D_linearDamping" -ln "i3D_linearDamping" -nn "i3D_linearDamping"
		-at "float";
	addAttr -ci true -sn "i3D_angularDamping" -ln "i3D_angularDamping" -nn "i3D_angularDamping"
		-at "float";
	addAttr -ci true -sn "i3D_density" -ln "i3D_density" -nn "i3D_density" -at "float";
	addAttr -ci true -sn "i3D_ccd" -ln "i3D_ccd" -nn "i3D_ccd" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_trigger" -ln "i3D_trigger" -nn "i3D_trigger" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_splitType" -ln "i3D_splitType" -nn "i3D_splitType" -at "long";
	addAttr -ci true -sn "i3D_splitMinU" -ln "i3D_splitMinU" -nn "i3D_splitMinU" -at "float";
	addAttr -ci true -sn "i3D_splitMinV" -ln "i3D_splitMinV" -nn "i3D_splitMinV" -at "float";
	addAttr -ci true -sn "i3D_splitMaxU" -ln "i3D_splitMaxU" -nn "i3D_splitMaxU" -at "float";
	addAttr -ci true -sn "i3D_splitMaxV" -ln "i3D_splitMaxV" -nn "i3D_splitMaxV" -at "float";
	addAttr -ci true -sn "i3D_splitUvWorldScale" -ln "i3D_splitUvWorldScale" -nn "i3D_splitUvWorldScale"
		-at "float";
	addAttr -ci true -sn "i3D_joint" -ln "i3D_joint" -nn "i3D_joint" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_projection" -ln "i3D_projection" -nn "i3D_projection"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_projDistance" -ln "i3D_projDistance" -nn "i3D_projDistance"
		-at "float";
	addAttr -ci true -sn "i3D_projAngle" -ln "i3D_projAngle" -nn "i3D_projAngle" -at "float";
	addAttr -ci true -sn "i3D_xAxisDrive" -ln "i3D_xAxisDrive" -nn "i3D_xAxisDrive"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_yAxisDrive" -ln "i3D_yAxisDrive" -nn "i3D_yAxisDrive"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_zAxisDrive" -ln "i3D_zAxisDrive" -nn "i3D_zAxisDrive"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_drivePos" -ln "i3D_drivePos" -nn "i3D_drivePos" -min 0
		-max 1 -at "bool";
	addAttr -ci true -sn "i3D_driveForceLimit" -ln "i3D_driveForceLimit" -nn "i3D_driveForceLimit"
		-at "float";
	addAttr -ci true -sn "i3D_driveSpring" -ln "i3D_driveSpring" -nn "i3D_driveSpring"
		-at "float";
	addAttr -ci true -sn "i3D_driveDamping" -ln "i3D_driveDamping" -nn "i3D_driveDamping"
		-at "float";
	addAttr -ci true -sn "i3D_breakableJoint" -ln "i3D_breakableJoint" -nn "i3D_breakableJoint"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_jointBreakForce" -ln "i3D_jointBreakForce" -nn "i3D_jointBreakForce"
		-at "float";
	addAttr -ci true -sn "i3D_jointBreakTorque" -ln "i3D_jointBreakTorque" -nn "i3D_jointBreakTorque"
		-at "float";
	addAttr -ci true -sn "i3D_oc" -ln "i3D_oc" -nn "i3D_oc" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_nonRenderable" -ln "i3D_nonRenderable" -nn "i3D_nonRenderable"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_clipDistance" -ln "i3D_clipDistance" -nn "i3D_clipDistance"
		-at "float";
	addAttr -ci true -sn "i3D_objectMask" -ln "i3D_objectMask" -nn "i3D_objectMask"
		-at "long";
	addAttr -ci true -sn "i3D_navMeshMask" -ln "i3D_navMeshMask" -nn "i3D_navMeshMask"
		-at "long";
	addAttr -ci true -sn "i3D_decalLayer" -ln "i3D_decalLayer" -nn "i3D_decalLayer"
		-at "long";
	addAttr -ci true -sn "i3D_mergeGroup" -ln "i3D_mergeGroup" -nn "i3D_mergeGroup"
		-at "long";
	addAttr -ci true -sn "i3D_mergeGroupRoot" -ln "i3D_mergeGroupRoot" -nn "i3D_mergeGroupRoot"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_boundingVolume" -ln "i3D_boundingVolume" -nn "i3D_boundingVolume"
		-dt "string";
	addAttr -ci true -sn "i3D_cpuMesh" -ln "i3D_cpuMesh" -nn "i3D_cpuMesh" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_mergeChildren" -ln "i3D_mergeChildren" -nn "i3D_mergeChildren"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeChildrenFreezeTrans" -ln "i3D_mergeChildrenFreezeTrans"
		-nn "i3D_mergeChildrenFreezeTrans" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeChildrenFreezeRot" -ln "i3D_mergeChildrenFreezeRot"
		-nn "i3D_mergeChildrenFreezeRot" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeChildrenFreezeScale" -ln "i3D_mergeChildrenFreezeScale"
		-nn "i3D_mergeChildrenFreezeScale" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lod" -ln "i3D_lod" -nn "i3D_lod" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lod1" -ln "i3D_lod1" -nn "i3D_lod1" -at "float";
	addAttr -ci true -sn "i3D_lod2" -ln "i3D_lod2" -nn "i3D_lod2" -at "float";
	addAttr -ci true -sn "i3D_lod3" -ln "i3D_lod3" -nn "i3D_lod3" -at "float";
	addAttr -ci true -sn "i3D_scaled" -ln "i3D_scaled" -nn "i3D_scaled" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataFilePath" -ln "i3D_objectDataFilePath" -nn "i3D_objectDataFilePath"
		-dt "string";
	addAttr -ci true -sn "i3D_objectDataExportPosition" -ln "i3D_objectDataExportPosition"
		-nn "i3D_objectDataExportPosition" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataExportOrientation" -ln "i3D_objectDataExportOrientation"
		-nn "i3D_objectDataExportOrientation" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataExportScale" -ln "i3D_objectDataExportScale"
		-nn "i3D_objectDataExportScale" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataHideFirstAndLastObject" -ln "i3D_objectDataHideFirstAndLastObject"
		-nn "i3D_objectDataHideFirstAndLastObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataHierarchicalSetup" -ln "i3D_objectDataHierarchicalSetup"
		-nn "i3D_objectDataHierarchicalSetup" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_minuteOfDayStart" -ln "i3D_minuteOfDayStart" -nn "i3D_minuteOfDayStart"
		-at "long";
	addAttr -ci true -sn "i3D_minuteOfDayEnd" -ln "i3D_minuteOfDayEnd" -nn "i3D_minuteOfDayEnd"
		-at "long";
	addAttr -ci true -sn "i3D_dayOfYearStart" -ln "i3D_dayOfYearStart" -nn "i3D_dayOfYearStart"
		-at "long";
	addAttr -ci true -sn "i3D_dayOfYearEnd" -ln "i3D_dayOfYearEnd" -nn "i3D_dayOfYearEnd"
		-at "long";
	addAttr -ci true -sn "i3D_weatherRequiredMask" -ln "i3D_weatherRequiredMask" -nn "i3D_weatherRequiredMask"
		-dt "string";
	addAttr -ci true -sn "i3D_weatherPreventMask" -ln "i3D_weatherPreventMask" -nn "i3D_weatherPreventMask"
		-dt "string";
	addAttr -ci true -sn "i3D_viewerSpacialityRequiredMask" -ln "i3D_viewerSpacialityRequiredMask"
		-nn "i3D_viewerSpacialityRequiredMask" -dt "string";
	addAttr -ci true -sn "i3D_viewerSpacialityPreventMask" -ln "i3D_viewerSpacialityPreventMask"
		-nn "i3D_viewerSpacialityPreventMask" -dt "string";
	addAttr -ci true -sn "i3D_renderInvisible" -ln "i3D_renderInvisible" -nn "i3D_renderInvisible"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_visibleShaderParameter" -ln "i3D_visibleShaderParameter"
		-nn "i3D_visibleShaderParameter" -at "float";
	addAttr -ci true -sn "i3D_forceVisibilityCondition" -ln "i3D_forceVisibilityCondition"
		-nn "i3D_forceVisibilityCondition" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.8939937994215396e-09 1.4469968001584732e-09 -3.556 ;
	setAttr ".i3D_lightMask" -type "string" "FFFF";
	setAttr ".i3D_xmlIdentifier" -type "string" "hose_main_component3";
	setAttr ".i3D_dynamic" yes;
	setAttr ".i3D_compound" yes;
	setAttr ".i3D_collision" yes;
	setAttr ".i3D_collisionMask" -type "string" "2109442";
	setAttr ".i3D_solverIterationCount" 4;
	setAttr ".i3D_staticFriction" 0.5;
	setAttr ".i3D_dynamicFriction" 0.5;
	setAttr ".i3D_angularDamping" 0.0099999997764825821;
	setAttr ".i3D_density" 1;
	setAttr ".i3D_splitMaxU" 1;
	setAttr ".i3D_splitMaxV" 1;
	setAttr ".i3D_splitUvWorldScale" 1;
	setAttr ".i3D_projDistance" 0.0099999997764825821;
	setAttr ".i3D_projAngle" 0.0099999997764825821;
	setAttr ".i3D_driveForceLimit" 100000;
	setAttr ".i3D_driveSpring" 1;
	setAttr ".i3D_driveDamping" 0.0099999997764825821;
	setAttr ".i3D_nonRenderable" yes;
	setAttr ".i3D_clipDistance" 300;
	setAttr ".i3D_objectMask" 255;
	setAttr ".i3D_navMeshMask" 255;
	setAttr ".i3D_boundingVolume" -type "string" "";
	setAttr ".i3D_cpuMesh" yes;
	setAttr ".i3D_objectDataFilePath" -type "string" "";
	setAttr ".i3D_objectDataExportPosition" yes;
	setAttr ".i3D_objectDataExportOrientation" yes;
	setAttr ".i3D_weatherRequiredMask" -type "string" "0";
	setAttr ".i3D_weatherPreventMask" -type "string" "0";
	setAttr ".i3D_viewerSpacialityRequiredMask" -type "string" "0";
	setAttr ".i3D_viewerSpacialityPreventMask" -type "string" "0";
	setAttr ".i3D_visibleShaderParameter" 1;
createNode mesh -n "hose_main_componentShape3" -p "hose_main_component3";
	rename -uid "2A7F6927-4118-E598-31D1-0DB10D33BACA";
	setAttr -k off ".v";
	setAttr ".tmp" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5000000074505806 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 36 ".uvst[0].uvsp[0:35]" -type "float2" 0.61048543 0.04576458
		 0.5 1.4901161e-08 0.38951457 0.04576458 0.34375 0.15625 0.38951457 0.26673543 0.5
		 0.3125 0.61048543 0.26673543 0.65625 0.15625 0.375 0.3125 0.40625 0.3125 0.4375 0.3125
		 0.46875 0.3125 0.5 0.3125 0.53125 0.3125 0.5625 0.3125 0.59375 0.3125 0.625 0.3125
		 0.375 0.68843985 0.40625 0.68843985 0.4375 0.68843985 0.46875 0.68843985 0.5 0.68843985
		 0.53125 0.68843985 0.5625 0.68843985 0.59375 0.68843985 0.625 0.68843985 0.61048543
		 0.73326457 0.5 0.6875 0.38951457 0.73326457 0.34375 0.84375 0.38951457 0.95423543
		 0.5 1 0.61048543 0.95423543 0.65625 0.84375 0.5 0.15000001 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".op" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 18 ".pt[0:17]" -type "float3"  0.11686925 -1.0326952 -0.58417398
		-2.8939935e-09 -1.0462381 -0.61903989 -0.11686926 -1.0326952 -0.58417398 -0.16527808
		-0.99999994 -0.49999994 -0.11686926 -0.96730465 -0.41582596 -2.8939935e-09 -0.95376182
		-0.38096005 0.11686926 -0.96730465 -0.41582596 0.16527809 -0.99999994 -0.49999994
		0.11686925 -0.032695323 0.4158259 -2.8939935e-09 -0.046238154 0.38096005 -0.11686926
		-0.032695323 0.4158259 -0.16527808 -2.9802322e-08 0.49999994 -0.11686926 0.032695264
		0.58417398 -2.8939935e-09 0.046238095 0.61903983 0.11686926 0.032695264 0.58417398
		0.16527809 -2.9802322e-08 0.49999994 -2.8939935e-09 -0.99999994 -0.49999994 -2.8939935e-09
		-2.9802322e-08 0.49999994;
	setAttr -s 18 ".vt[0:17]"  -0.084173962 0.99999994 0.084173962 0 0.99999994 0.11903995
		 0.084173962 0.99999994 0.084173962 0.11903995 0.99999994 4.1714861e-17 0.084173962 0.99999994 -0.084173962
		 0 0.99999994 -0.11903996 -0.08417397 0.99999994 -0.08417397 -0.11903997 0.99999994 4.1714861e-17
		 -0.084173962 1.4901161e-08 0.084173962 0 1.4901161e-08 0.11903995 0.084173962 1.4901161e-08 0.084173962
		 0.11903995 1.4901161e-08 2.6432183e-17 0.084173962 1.4901161e-08 -0.084173962 0 1.4901161e-08 -0.11903996
		 -0.08417397 1.4901161e-08 -0.08417397 -0.11903997 1.4901161e-08 2.6432183e-17 0 0.99999994 4.1714861e-17
		 0 1.4901161e-08 2.6432183e-17;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 0 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 8 0 0 8 0 1 9 0 2 10 0
		 3 11 0 4 12 0 5 13 0 6 14 0 7 15 0 16 0 1 16 1 1 16 2 1 16 3 1 16 4 1 16 5 1 16 6 1
		 16 7 1 8 17 1 9 17 1 10 17 1 11 17 1 12 17 1 13 17 1 14 17 1 15 17 1;
	setAttr -s 24 -ch 80 ".fc[0:23]" -type "polyFaces"
		f 4 16 8 -18 -1
		mu 0 4 8 17 18 9
		f 4 17 9 -19 -2
		mu 0 4 9 18 19 10
		f 4 18 10 -20 -3
		mu 0 4 10 19 20 11
		f 4 19 11 -21 -4
		mu 0 4 11 20 21 12
		f 4 20 12 -22 -5
		mu 0 4 12 21 22 13
		f 4 21 13 -23 -6
		mu 0 4 13 22 23 14
		f 4 22 14 -24 -7
		mu 0 4 14 23 24 15
		f 4 23 15 -17 -8
		mu 0 4 15 24 25 16
		f 3 -26 24 0
		mu 0 3 1 34 0
		f 3 -27 25 1
		mu 0 3 2 34 1
		f 3 -28 26 2
		mu 0 3 3 34 2
		f 3 -29 27 3
		mu 0 3 4 34 3
		f 3 -30 28 4
		mu 0 3 5 34 4
		f 3 -31 29 5
		mu 0 3 6 34 5
		f 3 -32 30 6
		mu 0 3 7 34 6
		f 3 -25 31 7
		mu 0 3 0 34 7
		f 3 32 -34 -9
		mu 0 3 32 35 31
		f 3 33 -35 -10
		mu 0 3 31 35 30
		f 3 34 -36 -11
		mu 0 3 30 35 29
		f 3 35 -37 -12
		mu 0 3 29 35 28
		f 3 36 -38 -13
		mu 0 3 28 35 27
		f 3 37 -39 -14
		mu 0 3 27 35 26
		f 3 38 -40 -15
		mu 0 3 26 35 33
		f 3 39 -33 -16
		mu 0 3 33 35 32;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "componentJoint3" -p "hose_main_component3";
	rename -uid "7DF10FCF-4936-8410-F59D-FEB2CCFED2A8";
	addAttr -ci true -sn "i3D_xmlIdentifier" -ln "i3D_xmlIdentifier" -dt "string";
	setAttr ".t" -type "double3" -1.8957532445874702e-16 -4.1359030627651384e-25 -1.8483227767944337 ;
	setAttr ".i3D_xmlIdentifier" -type "string" "componentJoint3";
createNode transform -n "hose_main_component4";
	rename -uid "834254E5-414C-B10D-BB33-ED90B05B9D78";
	addAttr -ci true -sn "i3D_lightMask" -ln "i3D_lightMask" -dt "string";
	addAttr -ci true -sn "i3D_xmlIdentifier" -ln "i3D_xmlIdentifier" -dt "string";
	addAttr -ci true -sn "i3D_static" -ln "i3D_static" -nn "i3D_static" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_dynamic" -ln "i3D_dynamic" -nn "i3D_dynamic" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_kinematic" -ln "i3D_kinematic" -nn "i3D_kinematic" -min
		0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_compound" -ln "i3D_compound" -nn "i3D_compound" -min 0
		-max 1 -at "bool";
	addAttr -ci true -sn "i3D_compoundChild" -ln "i3D_compoundChild" -nn "i3D_compoundChild"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_collision" -ln "i3D_collision" -nn "i3D_collision" -min
		0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_collisionMask" -ln "i3D_collisionMask" -nn "i3D_collisionMask"
		-dt "string";
	addAttr -ci true -sn "i3D_solverIterationCount" -ln "i3D_solverIterationCount" -nn "i3D_solverIterationCount"
		-at "long";
	addAttr -ci true -sn "i3D_restitution" -ln "i3D_restitution" -nn "i3D_restitution"
		-at "float";
	addAttr -ci true -sn "i3D_staticFriction" -ln "i3D_staticFriction" -nn "i3D_staticFriction"
		-at "float";
	addAttr -ci true -sn "i3D_dynamicFriction" -ln "i3D_dynamicFriction" -nn "i3D_dynamicFriction"
		-at "float";
	addAttr -ci true -sn "i3D_linearDamping" -ln "i3D_linearDamping" -nn "i3D_linearDamping"
		-at "float";
	addAttr -ci true -sn "i3D_angularDamping" -ln "i3D_angularDamping" -nn "i3D_angularDamping"
		-at "float";
	addAttr -ci true -sn "i3D_density" -ln "i3D_density" -nn "i3D_density" -at "float";
	addAttr -ci true -sn "i3D_ccd" -ln "i3D_ccd" -nn "i3D_ccd" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_trigger" -ln "i3D_trigger" -nn "i3D_trigger" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_splitType" -ln "i3D_splitType" -nn "i3D_splitType" -at "long";
	addAttr -ci true -sn "i3D_splitMinU" -ln "i3D_splitMinU" -nn "i3D_splitMinU" -at "float";
	addAttr -ci true -sn "i3D_splitMinV" -ln "i3D_splitMinV" -nn "i3D_splitMinV" -at "float";
	addAttr -ci true -sn "i3D_splitMaxU" -ln "i3D_splitMaxU" -nn "i3D_splitMaxU" -at "float";
	addAttr -ci true -sn "i3D_splitMaxV" -ln "i3D_splitMaxV" -nn "i3D_splitMaxV" -at "float";
	addAttr -ci true -sn "i3D_splitUvWorldScale" -ln "i3D_splitUvWorldScale" -nn "i3D_splitUvWorldScale"
		-at "float";
	addAttr -ci true -sn "i3D_joint" -ln "i3D_joint" -nn "i3D_joint" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_projection" -ln "i3D_projection" -nn "i3D_projection"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_projDistance" -ln "i3D_projDistance" -nn "i3D_projDistance"
		-at "float";
	addAttr -ci true -sn "i3D_projAngle" -ln "i3D_projAngle" -nn "i3D_projAngle" -at "float";
	addAttr -ci true -sn "i3D_xAxisDrive" -ln "i3D_xAxisDrive" -nn "i3D_xAxisDrive"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_yAxisDrive" -ln "i3D_yAxisDrive" -nn "i3D_yAxisDrive"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_zAxisDrive" -ln "i3D_zAxisDrive" -nn "i3D_zAxisDrive"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_drivePos" -ln "i3D_drivePos" -nn "i3D_drivePos" -min 0
		-max 1 -at "bool";
	addAttr -ci true -sn "i3D_driveForceLimit" -ln "i3D_driveForceLimit" -nn "i3D_driveForceLimit"
		-at "float";
	addAttr -ci true -sn "i3D_driveSpring" -ln "i3D_driveSpring" -nn "i3D_driveSpring"
		-at "float";
	addAttr -ci true -sn "i3D_driveDamping" -ln "i3D_driveDamping" -nn "i3D_driveDamping"
		-at "float";
	addAttr -ci true -sn "i3D_breakableJoint" -ln "i3D_breakableJoint" -nn "i3D_breakableJoint"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_jointBreakForce" -ln "i3D_jointBreakForce" -nn "i3D_jointBreakForce"
		-at "float";
	addAttr -ci true -sn "i3D_jointBreakTorque" -ln "i3D_jointBreakTorque" -nn "i3D_jointBreakTorque"
		-at "float";
	addAttr -ci true -sn "i3D_oc" -ln "i3D_oc" -nn "i3D_oc" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_nonRenderable" -ln "i3D_nonRenderable" -nn "i3D_nonRenderable"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_clipDistance" -ln "i3D_clipDistance" -nn "i3D_clipDistance"
		-at "float";
	addAttr -ci true -sn "i3D_objectMask" -ln "i3D_objectMask" -nn "i3D_objectMask"
		-at "long";
	addAttr -ci true -sn "i3D_navMeshMask" -ln "i3D_navMeshMask" -nn "i3D_navMeshMask"
		-at "long";
	addAttr -ci true -sn "i3D_decalLayer" -ln "i3D_decalLayer" -nn "i3D_decalLayer"
		-at "long";
	addAttr -ci true -sn "i3D_mergeGroup" -ln "i3D_mergeGroup" -nn "i3D_mergeGroup"
		-at "long";
	addAttr -ci true -sn "i3D_mergeGroupRoot" -ln "i3D_mergeGroupRoot" -nn "i3D_mergeGroupRoot"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_boundingVolume" -ln "i3D_boundingVolume" -nn "i3D_boundingVolume"
		-dt "string";
	addAttr -ci true -sn "i3D_cpuMesh" -ln "i3D_cpuMesh" -nn "i3D_cpuMesh" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_mergeChildren" -ln "i3D_mergeChildren" -nn "i3D_mergeChildren"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeChildrenFreezeTrans" -ln "i3D_mergeChildrenFreezeTrans"
		-nn "i3D_mergeChildrenFreezeTrans" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeChildrenFreezeRot" -ln "i3D_mergeChildrenFreezeRot"
		-nn "i3D_mergeChildrenFreezeRot" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeChildrenFreezeScale" -ln "i3D_mergeChildrenFreezeScale"
		-nn "i3D_mergeChildrenFreezeScale" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lod" -ln "i3D_lod" -nn "i3D_lod" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lod1" -ln "i3D_lod1" -nn "i3D_lod1" -at "float";
	addAttr -ci true -sn "i3D_lod2" -ln "i3D_lod2" -nn "i3D_lod2" -at "float";
	addAttr -ci true -sn "i3D_lod3" -ln "i3D_lod3" -nn "i3D_lod3" -at "float";
	addAttr -ci true -sn "i3D_scaled" -ln "i3D_scaled" -nn "i3D_scaled" -min 0 -max
		1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataFilePath" -ln "i3D_objectDataFilePath" -nn "i3D_objectDataFilePath"
		-dt "string";
	addAttr -ci true -sn "i3D_objectDataExportPosition" -ln "i3D_objectDataExportPosition"
		-nn "i3D_objectDataExportPosition" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataExportOrientation" -ln "i3D_objectDataExportOrientation"
		-nn "i3D_objectDataExportOrientation" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataExportScale" -ln "i3D_objectDataExportScale"
		-nn "i3D_objectDataExportScale" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataHideFirstAndLastObject" -ln "i3D_objectDataHideFirstAndLastObject"
		-nn "i3D_objectDataHideFirstAndLastObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_objectDataHierarchicalSetup" -ln "i3D_objectDataHierarchicalSetup"
		-nn "i3D_objectDataHierarchicalSetup" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_minuteOfDayStart" -ln "i3D_minuteOfDayStart" -nn "i3D_minuteOfDayStart"
		-at "long";
	addAttr -ci true -sn "i3D_minuteOfDayEnd" -ln "i3D_minuteOfDayEnd" -nn "i3D_minuteOfDayEnd"
		-at "long";
	addAttr -ci true -sn "i3D_dayOfYearStart" -ln "i3D_dayOfYearStart" -nn "i3D_dayOfYearStart"
		-at "long";
	addAttr -ci true -sn "i3D_dayOfYearEnd" -ln "i3D_dayOfYearEnd" -nn "i3D_dayOfYearEnd"
		-at "long";
	addAttr -ci true -sn "i3D_weatherRequiredMask" -ln "i3D_weatherRequiredMask" -nn "i3D_weatherRequiredMask"
		-dt "string";
	addAttr -ci true -sn "i3D_weatherPreventMask" -ln "i3D_weatherPreventMask" -nn "i3D_weatherPreventMask"
		-dt "string";
	addAttr -ci true -sn "i3D_viewerSpacialityRequiredMask" -ln "i3D_viewerSpacialityRequiredMask"
		-nn "i3D_viewerSpacialityRequiredMask" -dt "string";
	addAttr -ci true -sn "i3D_viewerSpacialityPreventMask" -ln "i3D_viewerSpacialityPreventMask"
		-nn "i3D_viewerSpacialityPreventMask" -dt "string";
	addAttr -ci true -sn "i3D_renderInvisible" -ln "i3D_renderInvisible" -nn "i3D_renderInvisible"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_visibleShaderParameter" -ln "i3D_visibleShaderParameter"
		-nn "i3D_visibleShaderParameter" -at "float";
	addAttr -ci true -sn "i3D_forceVisibilityCondition" -ln "i3D_forceVisibilityCondition"
		-nn "i3D_forceVisibilityCondition" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 6.4224431022968619e-16 0 -5.4841950275205029 ;
	setAttr ".i3D_lightMask" -type "string" "FFFF";
	setAttr ".i3D_xmlIdentifier" -type "string" "hose_main_component4";
	setAttr ".i3D_dynamic" yes;
	setAttr ".i3D_compound" yes;
	setAttr ".i3D_collision" yes;
	setAttr ".i3D_collisionMask" -type "string" "2109442";
	setAttr ".i3D_solverIterationCount" 4;
	setAttr ".i3D_staticFriction" 0.5;
	setAttr ".i3D_dynamicFriction" 0.5;
	setAttr ".i3D_angularDamping" 0.0099999997764825821;
	setAttr ".i3D_density" 1;
	setAttr ".i3D_splitMaxU" 1;
	setAttr ".i3D_splitMaxV" 1;
	setAttr ".i3D_splitUvWorldScale" 1;
	setAttr ".i3D_projDistance" 0.0099999997764825821;
	setAttr ".i3D_projAngle" 0.0099999997764825821;
	setAttr ".i3D_driveForceLimit" 100000;
	setAttr ".i3D_driveSpring" 1;
	setAttr ".i3D_driveDamping" 0.0099999997764825821;
	setAttr ".i3D_nonRenderable" yes;
	setAttr ".i3D_clipDistance" 300;
	setAttr ".i3D_objectMask" 255;
	setAttr ".i3D_navMeshMask" 255;
	setAttr ".i3D_boundingVolume" -type "string" "";
	setAttr ".i3D_cpuMesh" yes;
	setAttr ".i3D_objectDataFilePath" -type "string" "";
	setAttr ".i3D_objectDataExportPosition" yes;
	setAttr ".i3D_objectDataExportOrientation" yes;
	setAttr ".i3D_weatherRequiredMask" -type "string" "0";
	setAttr ".i3D_weatherPreventMask" -type "string" "0";
	setAttr ".i3D_viewerSpacialityRequiredMask" -type "string" "0";
	setAttr ".i3D_viewerSpacialityPreventMask" -type "string" "0";
	setAttr ".i3D_visibleShaderParameter" 1;
createNode mesh -n "hose_main_componentShape4" -p "hose_main_component4";
	rename -uid "960F0249-40D1-788F-268C-E0A001E388F8";
	setAttr -k off ".v";
	setAttr ".tmp" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5000000074505806 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 36 ".uvst[0].uvsp[0:35]" -type "float2" 0.61048543 0.04576458
		 0.5 1.4901161e-08 0.38951457 0.04576458 0.34375 0.15625 0.38951457 0.26673543 0.5
		 0.3125 0.61048543 0.26673543 0.65625 0.15625 0.375 0.3125 0.40625 0.3125 0.4375 0.3125
		 0.46875 0.3125 0.5 0.3125 0.53125 0.3125 0.5625 0.3125 0.59375 0.3125 0.625 0.3125
		 0.375 0.68843985 0.40625 0.68843985 0.4375 0.68843985 0.46875 0.68843985 0.5 0.68843985
		 0.53125 0.68843985 0.5625 0.68843985 0.59375 0.68843985 0.625 0.68843985 0.61048543
		 0.73326457 0.5 0.6875 0.38951457 0.73326457 0.34375 0.84375 0.38951457 0.95423543
		 0.5 1 0.61048543 0.95423543 0.65625 0.84375 0.5 0.15000001 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".op" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 18 ".pt[0:17]" -type "float3"  0.051478669 -1.0326952 0.91582584
		-2.4492937e-16 -1.0462381 0.88095999 -0.051478669 -1.0326952 0.91582584 -0.072801828
		-0.99999994 0.99999988 -0.051478669 -0.96730465 1.0841739 -2.4492932e-16 -0.95376182
		1.1190398 0.051478676 -0.96730465 1.0841739 0.072801843 -0.99999994 0.99999988 0.051478669
		-0.032695305 -0.084173948 -3.649732e-24 -0.046238136 -0.11903994 -0.051478669 -0.032695305
		-0.084173948 -0.072801828 -1.4901161e-08 1.4901161e-08 -0.051478669 0.032695275 0.084173977
		-3.649732e-24 0.046238106 0.11903998 0.051478676 0.032695279 0.084173985 0.072801843
		-1.4901161e-08 1.4901161e-08 -2.4492932e-16 -0.99999994 0.99999988 -3.649732e-24
		-1.4901161e-08 1.4901161e-08;
	setAttr -s 18 ".vt[0:17]"  -0.084173962 0.99999994 0.084173962 0 0.99999994 0.11903995
		 0.084173962 0.99999994 0.084173962 0.11903995 0.99999994 4.1714861e-17 0.084173962 0.99999994 -0.084173962
		 0 0.99999994 -0.11903996 -0.08417397 0.99999994 -0.08417397 -0.11903997 0.99999994 4.1714861e-17
		 -0.084173962 1.4901161e-08 0.084173962 0 1.4901161e-08 0.11903995 0.084173962 1.4901161e-08 0.084173962
		 0.11903995 1.4901161e-08 2.6432183e-17 0.084173962 1.4901161e-08 -0.084173962 0 1.4901161e-08 -0.11903996
		 -0.08417397 1.4901161e-08 -0.08417397 -0.11903997 1.4901161e-08 2.6432183e-17 0 0.99999994 4.1714861e-17
		 0 1.4901161e-08 2.6432183e-17;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 0 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 8 0 0 8 0 1 9 0 2 10 0
		 3 11 0 4 12 0 5 13 0 6 14 0 7 15 0 16 0 1 16 1 1 16 2 1 16 3 1 16 4 1 16 5 1 16 6 1
		 16 7 1 8 17 1 9 17 1 10 17 1 11 17 1 12 17 1 13 17 1 14 17 1 15 17 1;
	setAttr -s 24 -ch 80 ".fc[0:23]" -type "polyFaces"
		f 4 16 8 -18 -1
		mu 0 4 8 17 18 9
		f 4 17 9 -19 -2
		mu 0 4 9 18 19 10
		f 4 18 10 -20 -3
		mu 0 4 10 19 20 11
		f 4 19 11 -21 -4
		mu 0 4 11 20 21 12
		f 4 20 12 -22 -5
		mu 0 4 12 21 22 13
		f 4 21 13 -23 -6
		mu 0 4 13 22 23 14
		f 4 22 14 -24 -7
		mu 0 4 14 23 24 15
		f 4 23 15 -17 -8
		mu 0 4 15 24 25 16
		f 3 -26 24 0
		mu 0 3 1 34 0
		f 3 -27 25 1
		mu 0 3 2 34 1
		f 3 -28 26 2
		mu 0 3 3 34 2
		f 3 -29 27 3
		mu 0 3 4 34 3
		f 3 -30 28 4
		mu 0 3 5 34 4
		f 3 -31 29 5
		mu 0 3 6 34 5
		f 3 -32 30 6
		mu 0 3 7 34 6
		f 3 -25 31 7
		mu 0 3 0 34 7
		f 3 32 -34 -9
		mu 0 3 32 35 31
		f 3 33 -35 -10
		mu 0 3 31 35 30
		f 3 34 -36 -11
		mu 0 3 30 35 29
		f 3 35 -37 -12
		mu 0 3 29 35 28
		f 3 36 -38 -13
		mu 0 3 28 35 27
		f 3 37 -39 -14
		mu 0 3 27 35 26
		f 3 38 -40 -15
		mu 0 3 26 35 33
		f 3 39 -33 -16
		mu 0 3 33 35 32;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "grabNode2" -p "hose_main_component4";
	rename -uid "6D5D5C15-4629-14E7-E12A-EA94037D5473";
	addAttr -ci true -sn "i3D_xmlIdentifier" -ln "i3D_xmlIdentifier" -dt "string";
	setAttr ".t" -type "double3" -6.422443102296857e-16 1.4791141972893975e-30 0 ;
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".i3D_xmlIdentifier" -type "string" "grabNode2";
createNode transform -n "targetNode" -p "hose_main_component4";
	rename -uid "117BBDD4-4433-286A-1FD8-22832E30E284";
	addAttr -ci true -sn "i3D_xmlIdentifier" -ln "i3D_xmlIdentifier" -dt "string";
	setAttr ".t" -type "double3" 0 1.4791141972893975e-30 0.242 ;
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".i3D_xmlIdentifier" -type "string" "targetNode";
createNode transform -n "fertilizer_coupling_camplock_2" -p "hose_main_component4";
	rename -uid "F631527E-42AB-B4B2-A28D-BC9BFB33BB4B";
	addAttr -ci true -sn "i3D_xmlIdentifier" -ln "i3D_xmlIdentifier" -dt "string";
	addAttr -ci true -sn "i3D_objectMask" -ln "i3D_objectMask" -at "long";
	addAttr -ci true -sn "i3D_dynamic" -ln "i3D_dynamic" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_joint" -ln "i3D_joint" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_dynamicFriction" -ln "i3D_dynamicFriction" -at "float";
	addAttr -ci true -sn "i3D_ccd" -ln "i3D_ccd" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_density" -ln "i3D_density" -at "float";
	addAttr -ci true -sn "i3D_splitType" -ln "i3D_splitType" -at "long";
	addAttr -ci true -sn "i3D_splitMinU" -ln "i3D_splitMinU" -at "float";
	addAttr -ci true -sn "i3D_splitMinV" -ln "i3D_splitMinV" -at "float";
	addAttr -ci true -sn "i3D_driveForceLimit" -ln "i3D_driveForceLimit" -at "float";
	addAttr -ci true -sn "i3D_angularDamping" -ln "i3D_angularDamping" -at "float";
	addAttr -ci true -sn "i3D_splitUvWorldScale" -ln "i3D_splitUvWorldScale" -at "float";
	addAttr -ci true -sn "i3D_projection" -ln "i3D_projection" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_driveSpring" -ln "i3D_driveSpring" -at "float";
	addAttr -ci true -sn "i3D_breakableJoint" -ln "i3D_breakableJoint" -min 0 -max 1
		-at "bool";
	addAttr -ci true -sn "i3D_projDistance" -ln "i3D_projDistance" -at "float";
	addAttr -ci true -sn "i3D_driveDamping" -ln "i3D_driveDamping" -at "float";
	addAttr -ci true -sn "i3D_xAxisDrive" -ln "i3D_xAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_compound" -ln "i3D_compound" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_clipDistance" -ln "i3D_clipDistance" -at "float";
	addAttr -ci true -sn "i3D_collision" -ln "i3D_collision" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_scaled" -ln "i3D_scaled" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_projAngle" -ln "i3D_projAngle" -at "float";
	addAttr -ci true -sn "i3D_mergeGroupRoot" -ln "i3D_mergeGroupRoot" -min 0 -max 1
		-at "bool";
	addAttr -ci true -sn "i3D_jointBreakTorque" -ln "i3D_jointBreakTorque" -at "float";
	addAttr -ci true -sn "i3D_restitution" -ln "i3D_restitution" -at "float";
	addAttr -ci true -sn "i3D_yAxisDrive" -ln "i3D_yAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeGroup" -ln "i3D_mergeGroup" -at "long";
	addAttr -ci true -sn "i3D_jointBreakForce" -ln "i3D_jointBreakForce" -at "float";
	addAttr -ci true -sn "i3D_lod1" -ln "i3D_lod1" -at "float";
	addAttr -ci true -sn "i3D_lod2" -ln "i3D_lod2" -at "float";
	addAttr -ci true -sn "i3D_oc" -ln "i3D_oc" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_kinematic" -ln "i3D_kinematic" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_trigger" -ln "i3D_trigger" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_static" -ln "i3D_static" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lightMask" -ln "i3D_lightMask" -dt "string";
	addAttr -ci true -sn "i3D_linearDamping" -ln "i3D_linearDamping" -at "float";
	addAttr -ci true -sn "i3D_lod3" -ln "i3D_lod3" -at "float";
	addAttr -ci true -sn "i3D_drivePos" -ln "i3D_drivePos" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lod" -ln "i3D_lod" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_solverIterationCount" -ln "i3D_solverIterationCount" -at "long";
	addAttr -ci true -sn "i3D_nonRenderable" -ln "i3D_nonRenderable" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_boundingVolume" -ln "i3D_boundingVolume" -dt "string";
	addAttr -ci true -sn "i3D_collisionMask" -ln "i3D_collisionMask" -at "long";
	addAttr -ci true -sn "i3D_zAxisDrive" -ln "i3D_zAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_cpuMesh" -ln "i3D_cpuMesh" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_staticFriction" -ln "i3D_staticFriction" -at "float";
	addAttr -ci true -sn "i3D_decalLayer" -ln "i3D_decalLayer" -at "long";
	addAttr -ci true -sn "i3D_splitMaxV" -ln "i3D_splitMaxV" -at "float";
	addAttr -ci true -sn "i3D_splitMaxU" -ln "i3D_splitMaxU" -at "float";
	addAttr -ci true -sn "i3D_compoundChild" -ln "i3D_compoundChild" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0 1.862645149230957e-07 0 ;
	setAttr ".i3D_xmlIdentifier" -type "string" "fertilizer_coupling_camplock_2";
	setAttr ".i3D_objectMask" 255;
	setAttr ".i3D_dynamicFriction" 0.5;
	setAttr ".i3D_density" 1;
	setAttr ".i3D_driveForceLimit" 100000;
	setAttr ".i3D_angularDamping" 0.0099999997764825821;
	setAttr ".i3D_splitUvWorldScale" 1;
	setAttr ".i3D_driveSpring" 1;
	setAttr ".i3D_projDistance" 0.0099999997764825821;
	setAttr ".i3D_driveDamping" 0.0099999997764825821;
	setAttr ".i3D_clipDistance" 300;
	setAttr ".i3D_projAngle" 0.0099999997764825821;
	setAttr ".i3D_lightMask" -type "string" "FFFF";
	setAttr ".i3D_solverIterationCount" 4;
	setAttr ".i3D_boundingVolume" -type "string" "";
	setAttr ".i3D_collisionMask" 255;
	setAttr ".i3D_staticFriction" 0.5;
	setAttr ".i3D_splitMaxV" 1;
	setAttr ".i3D_splitMaxU" 1;
createNode mesh -n "fertilizer_coupling_camplock_2Shape" -p "fertilizer_coupling_camplock_2";
	rename -uid "3B7DA5FC-4F8C-531B-3971-6899EBBE78EB";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:846]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 4.2335832118988037 0.52103452384471893 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 1748 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.31109667 1.35898459 0.36198902
		 1.35919261 0.36198902 1.36679375 0.31109667 1.3665688 0.41285133 1.35770774 0.41283607
		 1.37219214 0.46371555 1.35891581 0.46370697 1.36652613 0.0057501793 1.35898459 0.056621552
		 1.35898459 0.056621552 1.3665688 0.0057501793 1.3665688 0.10751677 1.35898459 0.10751677
		 1.3665688 0.15840912 1.35898471 0.15840912 1.36656892 0.20930243 1.35898459 0.20930243
		 1.3665688 0.26019764 1.35898471 0.26019716 1.3665688 0.051986694 1.3806957 0.074059486
		 1.3806957 0.074059486 1.38594723 0.051986694 1.38594723 0.026889801 1.3806957 0.026889801
		 1.38594723 0.0057525635 1.3806957 0.0057525635 1.38594711 0.17979956 1.38069582 0.19554043
		 1.3806957 0.19554043 1.38594711 0.17979956 1.38594711 0.15772581 1.3806957 0.15772581
		 1.38594711 0.13262939 1.3806957 0.13262939 1.38594711 0.11606598 1.3806957 0.11606598
		 1.38594711 0.093959808 1.3806957 0.093959808 1.38594711 0.23000383 1.38144851 0.25830889
		 1.38144851 0.25830889 1.38777685 0.23000383 1.38777697 0.28575563 1.38144851 0.28575563
		 1.38777697 0.31038094 1.38144851 0.31038094 1.38777685 0.42430687 1.38789725 0.40622568
		 1.38789725 0.40622568 1.38197839 0.42430687 1.38197839 0.38385868 1.38789725 0.38385868
		 1.38197839 0.3635788 1.38789725 0.36357927 1.38197851 0.34230709 1.38789725 0.34230709
		 1.38197839 0.32103491 1.38789725 0.32103491 1.38197851 0.20556116 1.38144851 0.20556116
		 1.38777685 0.36058807 1.35043895 0.30995226 1.35089386 0.30995226 1.34205699 0.36058807
		 1.34157372 0.25930309 1.35089386 0.25930309 1.34205687 0.20866299 1.35089374 0.20866299
		 1.34205663 0.15802574 1.35089362 0.15802622 1.34205663 0.10738802 1.35089409 0.10738802
		 1.34205663 0.056750774 1.35089409 0.056750774 1.34205687 0.0061135292 1.35089386
		 0.0061135292 1.34205687 0.46176577 1.3507061 0.41118002 1.35220766 0.41113567 1.33533764
		 0.46174383 1.34182656 0.46370077 1.37343836 0.46172619 1.33378398 0.056621552 1.3734802
		 0.0057501793 1.37348032 0.0061135292 1.33403516 0.056750774 1.33403528 0.10751677
		 1.37348008 0.10738802 1.33403516 0.15840912 1.37348032 0.15802622 1.33403528 0.20930243
		 1.3734802 0.20866299 1.33403516 0.26019764 1.3734802 0.52010059 1.084127307 0.52010107
		 1.064020872 0.5316925 1.064019322 0.53169203 1.084125638 0.25930309 1.33403528 4.93759108
		 0.044519186 4.9565134 0.044519007 4.9565134 0.057499349 4.93759108 0.05749929 4.99435806
		 0.044518948 4.99435806 0.05749917 4.63619471 0.044519067 4.65511656 0.044519067 4.65511703
		 0.05749929 4.63619471 0.05749917 4.68789101 0.044519126 4.68789101 0.05749929 4.72573519
		 0.044519126 4.72573519 0.057499409 4.75850964 0.044519097 4.75850964 0.05749929 4.77743149
		 0.044519007 4.77743149 0.05749929 4.81527615 0.044519007 4.81527615 0.05749929 4.83419847
		 0.044519067 4.83419847 0.05749929 4.86697292 0.044519067 4.86697292 0.05749929 4.9048171
		 0.044519126 4.9048171 0.057499468 4.78310823 0.019157559 4.8134737 0.019157678 4.8134737
		 0.031981021 4.78310823 0.031980902 4.84383965 0.01915738 4.84383965 0.031980902 4.87420511
		 0.019157439 4.87420511 0.031980902 4.90457058 0.01915738 4.90457058 0.031980783 4.93493652
		 0.01915738 4.93493652 0.031980842 4.96532106 0.019157261 4.96532106 0.031980962 4.99642754
		 0.019157439 4.99642801 0.031980932 4.63047886 0.019157495 4.66157389 0.01915741 4.66157389
		 0.031980898 4.63047886 0.031980839 4.69198179 0.019157469 4.69198179 0.031981017
		 4.72237635 0.01915741 4.72237635 0.031980783 4.75274277 0.019157439 4.75274277 0.031981021
		 4.28374243 0.17031772 4.30679131 0.17031749 4.30679131 0.1815014 4.28374243 0.18150102
		 4.26034403 0.17031774 4.26034403 0.1815014 4.23729229 0.17031749 4.23729229 0.1815014
		 4.21429205 0.17031772 4.21429205 0.18150134 4.19109631 0.17031772 4.19109631 0.18150158
		 4.16925955 0.17031774 4.16925955 0.18150102 4.14565611 0.17031749 4.14565611 0.18150142
		 4.12272406 0.17031749 4.12272406 0.18150108 4.099633217 0.17031749 4.099633217 0.18150108
		 4.076016426 0.17031766 4.076016426 0.18150102 4.055327415 0.17031772 4.055327415
		 0.18150102 4.03172493 0.17031755 4.03172493 0.18150146 4.0086131096 0.17031749 4.0086131096
		 0.18150131 4.44652367 0.17031772 4.4693408 0.17031771 4.4693408 0.18150133 4.44652367
		 0.1815014 4.42311621 0.17031772 4.42311621 0.18150102 4.4000392 0.17031749 4.40003872
		 0.18150158 4.37664032 0.17031749 4.37664032 0.18150158 4.3533535 0.17031749 4.3533535
		 0.18150096 4.33038235 0.17031772 4.33038235 0.1815014 4.14565563 0.18800442 4.14565611
		 0.18364555 4.16925955 0.18364555 4.16925955 0.18800461 4.19109631 0.18364556 4.19109631
		 0.18800379 4.21429205 0.18364586 4.21429205 0.18800376 4.23729229 0.18364556 4.23729229
		 0.18800379 4.26034403 0.18364556 4.26034403 0.18800379 4.28374243 0.18364556 4.28374243
		 0.18800442 4.30679131 0.18364586 4.30679131 0.18800403 4.33038235 0.18364556 4.33038235
		 0.18800403 4.3533535 0.1836455 4.3533535 0.18800455 4.37664032 0.18364556 4.37664032
		 0.18800403 4.40003872 0.18364556 4.40003872 0.18800403 4.42311621 0.18364556 4.42311621
		 0.1880046 4.44652319 0.18364556 4.44652319 0.18800403 4.4693408 0.18364552 4.46934128
		 0.18800458 4.0086131096 0.1880044 4.0086131096 0.18364559 4.03172493 0.18364598 4.03172493
		 0.18800448 4.055327892 0.18364586 4.055327415 0.18800403 4.076016426 0.18364562 4.076016426
		 0.18800442 4.099633217 0.18364556 4.099633217 0.18800442 4.12272406 0.18364556 4.12272406
		 0.18800443 4.16925955 0.12524644 4.14565611 0.12524645 4.14565611 0.12037669 4.16925955
		 0.12037669 4.19109631 0.12524657 4.19109631 0.12037669 4.21429205 0.12524663 4.21429205
		 0.12037669 4.23729229 0.12524663 4.23729229 0.12037669 4.26034403 0.12524663 4.26034403
		 0.12037669 4.28374243 0.12524645 4.28374243 0.12037669;
	setAttr ".uvst[0].uvsp[250:499]" 4.30679131 0.12524645 4.30679131 0.12037669
		 4.33038235 0.12524663 4.33038235 0.12037669 4.3533535 0.12524663 4.3533535 0.12037669
		 4.37664032 0.12524663 4.3766408 0.12037669 4.40003872 0.12524663 4.4000392 0.12037669
		 4.42311621 0.12524661 4.42311621 0.12037668 4.44652367 0.12524661 4.44652367 0.12037668
		 4.46934128 0.12524661 4.4693408 0.12037668 4.03172493 0.12524669 4.0086131096 0.12524645
		 4.0086131096 0.12037651 4.03172493 0.12037669 4.055327892 0.12524663 4.055327892
		 0.12037669 4.076016426 0.12524645 4.076016426 0.12037651 4.099633217 0.12524663 4.099633217
		 0.12037669 4.12272406 0.12524663 4.12272406 0.12037669 4.16829824 0.11262442 4.14549494
		 0.11262442 4.14549494 0.10138328 4.16829824 0.10138328 4.19115925 0.11262444 4.19115925
		 0.10138324 4.21407557 0.11262444 4.21407557 0.10138324 4.23704338 0.11262444 4.23704338
		 0.10138312 4.26006031 0.11262447 4.26006031 0.10138345 4.28312302 0.11262447 4.28312302
		 0.10138321 4.30622864 0.11262447 4.30622864 0.10138333 4.32937431 0.11262453 4.32937431
		 0.10138321 4.35255814 0.11262447 4.35255814 0.10138321 4.37577772 0.1126247 4.37577772
		 0.10138315 4.39903641 0.11262441 4.39903641 0.10138315 4.42236757 0.11262459 4.42236757
		 0.10138351 4.44598532 0.11262459 4.44598532 0.10138321 4.46875668 0.11262459 4.46875668
		 0.10138321 4.032382011 0.11262448 4.0091977119 0.11262448 4.0091977119 0.10138328
		 4.032382011 0.10138346 4.054894447 0.11262448 4.054894447 0.10138349 4.077450752
		 0.11262448 4.077450752 0.10138349 4.10006952 0.11262448 4.10007 0.10138316 4.12275124
		 0.11262448 4.12275124 0.10138328 4.15996027 0.018596604 4.14371014 0.01859659 4.14371014
		 0.0069898963 4.15996027 0.0069899708 4.18276215 0.018596724 4.18276215 0.0069901496
		 4.20778847 0.018596515 4.20778847 0.0069899112 4.23360157 0.018596336 4.23360157
		 0.0069899112 4.25872231 0.018596396 4.25872231 0.0069902092 4.28170824 0.018596604
		 4.28170824 0.0069899708 4.30496264 0.018596515 4.30496264 0.0069899112 4.32237053
		 0.018596305 4.32237053 0.0069899112 4.34636164 0.018596603 4.34636164 0.0069902083
		 4.37192917 0.018596604 4.37192869 0.0069903573 4.39760733 0.018596336 4.39760733
		 0.0069899699 4.42192459 0.018596364 4.42192507 0.0069901794 4.44353962 0.018596336
		 4.44353962 0.0069899708 4.4693532 0.018596366 4.4693532 0.0069899708 4.029942036
		 0.018596351 4.0086011887 0.018596351 4.0086011887 0.0069899857 4.029942036 0.0069899857
		 4.054123878 0.01859656 4.054123878 0.0069899857 4.079761505 0.01859656 4.079761505
		 0.0069901645 4.10538149 0.018596768 4.10538149 0.0069899261 4.12951279 0.018596768
		 4.12951279 0.0069899559 4.57439804 0.3710044 4.58310986 0.37777835 4.55737162 0.40189409
		 4.56402016 0.36725464 4.55299044 0.36689553 4.54238939 0.36996236 4.53325558 0.37615496
		 4.52648163 0.38486701 4.52273178 0.39524558 4.5223732 0.40627456 4.52544022 0.41687551
		 4.53163242 0.42600998 4.54034376 0.4327834 4.5507226 0.43653333 4.56175232 0.43689266
		 4.57235289 0.43382591 4.58148718 0.42763358 4.58826065 0.4189215 4.5920105 0.40854198
		 4.59237003 0.39751309 4.58930349 0.3869133 4.19737959 0.1325493 4.2156682 0.1325493
		 4.2156682 0.16489702 4.19737959 0.16489676 4.23729992 0.13254881 4.23729992 0.16489699
		 4.2589798 0.1325493 4.2589798 0.16489723 4.27621508 0.1325493 4.27621508 0.16489702
		 4.3139534 0.13229507 4.33175278 0.13229507 4.33175325 0.16478701 4.31395388 0.16478726
		 4.35335732 0.13229528 4.35335684 0.16478676 4.37525797 0.13229528 4.37525797 0.16478726
		 4.39325047 0.13229507 4.39325047 0.16478676 4.42976332 0.13091011 4.44650078 0.13091011
		 4.44650126 0.163744 4.42976332 0.16374427 4.46757269 0.13091011 4.46757269 0.16374423
		 4.0091018677 0.13033837 4.030248642 0.13033837 4.030248642 0.16406626 4.0091018677
		 0.16406648 4.047683716 0.13033864 4.047683716 0.1640662 4.083203793 0.13146155 4.10106754
		 0.13146135 4.10106754 0.16466866 4.083203793 0.16466866 4.12271881 0.13146135 4.12271881
		 0.16466869 4.14422083 0.13146135 4.14422083 0.16466866 4.16198969 0.13146135 4.16199017
		 0.16466868 4.16982841 0.093484953 4.14677429 0.093484953 4.14677429 0.025919512 4.16982841
		 0.025919512 4.12372446 0.093484953 4.12372446 0.025919512 4.10067558 0.093484953
		 4.10067511 0.025919512 4.077617645 0.093484953 4.077617645 0.025919572 4.054577351
		 0.093485013 4.054577351 0.025919512 4.031518459 0.093484953 4.031518459 0.025919512
		 4.0084686279 0.093484953 4.0084686279 0.025919572 4.46948576 0.093484953 4.44644547
		 0.093484953 4.44644547 0.025919482 4.46948576 0.025919482 4.42339134 0.093484953
		 4.42339134 0.025919452 4.40033674 0.093484953 4.40033674 0.025919512 4.37728739 0.093484953
		 4.37728739 0.025919512 4.35423803 0.093484953 4.35423803 0.025919482 4.33118391 0.093484953
		 4.33118391 0.025919512 4.30813932 0.093484953 4.30813932 0.025919512 4.2850852 0.093484953
		 4.2850852 0.025919512 4.26203537 0.093484953 4.26203537 0.025919512 4.23898125 0.093484953
		 4.23898125 0.025919512 4.21592712 0.093484953 4.21592712 0.025919512 4.19288254 0.093484953
		 4.19288254 0.025919512 4.1938529 0.12778893 4.2156682 0.12778899 4.2156682 0.16777536
		 4.1938529 0.16777536 4.23729992 0.12778899 4.23729992 0.16777515 4.2589798 0.12778899
		 4.2589798 0.16777538 4.28098583 0.12778881 4.28098536 0.16777536 4.30956602 0.12784888
		 4.33175278 0.12784904 4.33175278 0.1677153 4.30956602 0.16771509 4.35335732 0.12784904
		 4.35335684 0.16771509 4.37525797 0.12784904 4.37525797 0.16771509 4.397264 0.12784904
		 4.39726448 0.16771509 4.4248848 0.12767862 4.44650126 0.12767862 4.44650126 0.16788572
		 4.4248848 0.16788572 4.46757269 0.12767862 4.46757221 0.16788571 4.0091018677 0.12716234
		 4.030248642 0.12716256 4.030248642 0.16840167 4.0091023445 0.16840161 4.051845074
		 0.1271625 4.051845074 0.16840184 4.078922749 0.12748978;
	setAttr ".uvst[0].uvsp[500:749]" 4.10106754 0.12748994 4.10106754 0.16807419
		 4.078922749 0.16807434 4.12271881 0.12748994 4.12271881 0.16807419 4.14422083 0.12748978
		 4.14422083 0.16807419 4.16635275 0.12748976 4.16635275 0.16807441 4.82972097 0.081645012
		 4.81002998 0.081645012 4.81002998 0.068137467 4.82972097 0.068137527 4.77064753 0.081645131
		 4.770648 0.068137527 4.75095701 0.081644893 4.75095701 0.068137527 4.71685171 0.08164525
		 4.71685171 0.068137646 4.67746973 0.08164525 4.67746973 0.068137646 4.64336443 0.081645012
		 4.64336443 0.068137407 4.62367344 0.081645012 4.62367344 0.068137407 4.99638605 0.081645012
		 4.95700407 0.081645042 4.95700455 0.068137497 4.99638653 0.068137407 4.93731356 0.081645019
		 4.93731356 0.068137474 4.90320778 0.081645012 4.90320778 0.068137407 4.86382627 0.081645012
		 4.86382627 0.068137467 4.85927105 0.092633888 4.88676405 0.092633888 4.88676453 0.10608447
		 4.85927105 0.1060845 4.83148336 0.092633888 4.83148336 0.10608448 4.80390453 0.092633873
		 4.80390406 0.10608448 4.77611971 0.092633888 4.77612019 0.10608432 4.74865294 0.092633799
		 4.74865294 0.10608437 4.72118187 0.092633888 4.72118139 0.10608434 4.6913662 0.092633866
		 4.6913662 0.10608442 4.66030025 0.092633873 4.66030025 0.10608442 4.96875286 0.092633888
		 4.99711609 0.092633858 4.99711609 0.10608444 4.96875286 0.10608444 4.94160032 0.092633858
		 4.9416008 0.10608447 4.91424847 0.092633888 4.91424847 0.10608447 4.77898312 0.116799
		 4.80652618 0.11679894 4.80652618 0.13152057 4.77898312 0.13152057 4.83401346 0.11679891
		 4.83401346 0.13152066 4.86140871 0.11679885 4.86140871 0.13152063 4.88865948 0.11679894
		 4.88865948 0.13152066 4.9156909 0.11679894 4.91569042 0.13152066 4.94239521 0.11679903
		 4.94239521 0.13152063 4.96859694 0.11679894 4.96859694 0.13152067 4.99471283 0.11679894
		 4.99471283 0.13152069 4.66630793 0.11679882 4.69586611 0.11679888 4.69586611 0.13152057
		 4.66630793 0.13152075 4.72379494 0.11679882 4.72379494 0.13152066 4.75140762 0.11679894
		 4.75140762 0.13152072 1.29370594 -0.80349451 1.32248783 -0.80349433 1.32248783 -0.75153649
		 1.29370594 -0.75153649 1.26492453 -0.80349433 1.26492405 -0.75153667 1.23614264 -0.80349433
		 1.23614264 -0.75153643 1.20736074 -0.80349433 1.20736074 -0.75153649 1.17857885 -0.80349433
		 1.17857885 -0.75153649 1.14979744 -0.80349433 1.14979744 -0.75153649 1.12101555 -0.80349433
		 1.12101555 -0.75153649 1.092233658 -0.80349433 1.092233658 -0.75153649 1.063452244
		 -0.80349433 1.063452244 -0.75153649 1.034670353 -0.80349433 1.034670353 -0.75153649
		 1.0058884621 -0.80349433 1.0058884621 -0.75153649 1.43761492 -0.80349445 1.46639681
		 -0.80349445 1.46639681 -0.75153661 1.43761492 -0.75153661 1.40883303 -0.80349445
		 1.40883303 -0.75153661 1.38005161 -0.80349439 1.38005114 -0.75153649 1.35126972 -0.80349433
		 1.35126972 -0.75153643 1.77559662 -0.85865653 1.79656315 -0.85865647 1.79656315 -0.84232116
		 1.77559662 -0.84232116 1.81623554 -0.85865647 1.81623554 -0.84232116 1.83411741 -0.85865647
		 1.83411741 -0.84232116 1.85175896 -0.85865647 1.85175896 -0.84232116 1.87016106 -0.85865647
		 1.87016106 -0.84232116 1.8902421 -0.85865653 1.8902421 -0.84232116 1.90812397 -0.85865653
		 1.90812397 -0.84232116 1.92576551 -0.85865653 1.92576504 -0.84232116 1.94305849 -0.85865647
		 1.94305849 -0.84232116 1.96094942 -0.85865653 1.96094942 -0.84232116 1.97883129 -0.85865653
		 1.97883129 -0.84232116 1.99328136 -0.85865653 1.99328136 -0.84232116 1.69763899 -0.85865653
		 1.71698332 -0.85865647 1.71698332 -0.84232116 1.69763899 -0.84232116 1.74007368 -0.85865653
		 1.74007368 -0.84232116 1.75795555 -0.85865647 1.75795555 -0.8423211 4.15014887 0.31743717
		 4.17881346 0.31743723 4.17881346 0.32456756 4.15014887 0.32456756 4.20747805 0.31743723
		 4.20747805 0.32456756 4.23614264 0.31743723 4.23614216 0.32456747 4.26480722 0.31743723
		 4.26480722 0.32456768 4.29347181 0.31743717 4.29347181 0.32456741 4.3221364 0.31743717
		 4.3221364 0.32456756 4.35080099 0.31743723 4.35080099 0.32456747 4.37946558 0.31743723
		 4.37946558 0.32456756 4.40813017 0.31743723 4.40813017 0.32456756 4.43679476 0.31743723
		 4.43679476 0.32456756 4.46545935 0.31743723 4.46545935 0.32456756 4.0068259239 0.31743723
		 4.035490513 0.31743717 4.035490513 0.32456756 4.0068259239 0.32456756 4.064155102
		 0.31743723 4.064155102 0.32456756 4.092819691 0.31743723 4.092819691 0.32456756 4.12148428
		 0.31743723 4.12148428 0.32456756 1.29374361 -0.74276531 1.32246733 -0.74276525 1.32246733
		 -0.72958046 1.29374361 -0.72958034 1.26501942 -0.74276519 1.26501942 -0.7295804 1.23629332
		 -0.74276519 1.23629332 -0.72958034 1.20756483 -0.74276507 1.20756483 -0.72958028
		 1.17883158 -0.74276507 1.17883158 -0.72958028 1.15009022 -0.74276507 1.15009022 -0.72958022
		 1.12133646 -0.74276507 1.12133646 -0.72958022 1.09256506 -0.74276519 1.09256506 -0.72958028
		 1.063749313 -0.74276519 1.063749313 -0.7295804 1.034706593 -0.74276531 1.034706593
		 -0.72958028 1.0060319901 -0.74276531 1.0060319901 -0.72958028 1.43722105 -0.74276501
		 1.46625328 -0.74276519 1.46625328 -0.72958034 1.43722105 -0.72958034 1.40859509 -0.74276519
		 1.40859509 -0.72958034 1.37990189 -0.74276519 1.37990236 -0.72958034 1.35118818 -0.74276525
		 1.35118818 -0.72958034 4.29362392 0.28270543 4.32236481 0.28270543 4.32236481 0.31109732
		 4.29362392 0.31109726 4.26488352 0.28270543 4.26488352 0.31109732 4.23614264 0.28270543
		 4.23614264 0.31109726 4.20740223 0.28270543 4.20740223 0.31109726 4.17866135 0.28270549
		 4.17866135 0.31109732 4.14992046 0.28270549 4.14992046 0.31109732 4.12118006 0.28270549
		 4.12118006 0.31109732 4.092439175 0.28270549 4.092439175 0.31109732 4.063698769 0.28270549
		 4.063698769 0.31109732 4.034957886 0.28270543 4.034957886 0.31109726 4.0062170029
		 0.28270543 4.0062174797 0.31109726 4.43732738 0.28270543 4.46606827 0.28270543 4.46606827
		 0.31109732;
	setAttr ".uvst[0].uvsp[750:999]" 4.43732738 0.31109732 4.40858698 0.28270549
		 4.40858698 0.31109732 4.3798461 0.28270543 4.3798461 0.31109732 4.35110521 0.28270543
		 4.35110569 0.3110972 4.26376867 0.46544862 4.29121017 0.46544862 4.29121017 0.46957034
		 4.26376867 0.46957028 4.23623419 0.4695704 4.23623419 0.46544877 4.40229511 0.46957004
		 4.37496185 0.46957004 4.37496185 0.46491313 4.40229511 0.46491301 4.34780073 0.46957028
		 4.34780073 0.46491301 4.32429361 0.46491301 4.32429361 0.46957004 4.26165628 0.48774046
		 4.28972912 0.48774046 4.28972912 0.5543285 4.26165628 0.5543285 4.23358345 0.48774046
		 4.23358345 0.55432862 4.20551062 0.4877404 4.20551062 0.55432868 4.40202093 0.48774043
		 4.43009377 0.48774043 4.43009377 0.55432862 4.40202093 0.55432862 4.3739481 0.48774043
		 4.3739481 0.55432862 4.34587526 0.48774043 4.34587526 0.55432862 4.31780243 0.48774037
		 4.31780243 0.55432868 4.3187685 0.40216991 4.31505871 0.41177279 4.29044008 0.41233057
		 4.29033709 0.40328306 4.32436562 0.41174993 4.31882191 0.41173205 4.37495136 0.457414
		 4.34621906 0.45751587 4.34617758 0.41204545 4.3746891 0.41186628 4.40368557 0.45726517
		 4.40320063 0.41166416 4.43045664 0.40138316 4.42562771 0.41103703 4.40308619 0.40264967
		 4.55719995 0.092389189 4.55702114 0.12994002 4.5543828 0.12997983 4.55371714 0.092440814
		 4.2619338 0.4125343 4.23342752 0.41271645 4.23343801 0.40369219 4.26188183 0.40331149
		 4.29121017 0.48005617 4.26376867 0.48005611 4.23623419 0.48005617 4.20792246 0.48005617
		 4.20792246 0.4695704 4.21332169 0.46957034 4.42544222 0.46957034 4.42999554 0.46957034
		 4.42999554 0.48005617 4.40229511 0.48005617 4.37496185 0.48005617 4.34780073 0.48005626
		 4.31904984 0.48005626 4.31904984 0.46957004 4.3149457 0.46957004 4.3149457 0.46544862
		 4.42544222 0.46491301 4.51648045 0.22789478 4.51638985 0.23178664 4.4746027 0.23079413
		 4.47467136 0.22789481 4.34617901 0.40299496 4.37463617 0.4026418 4.4735384 0.26878932
		 4.47352648 0.26606536 4.51638937 0.2658641 4.51640797 0.26949179 4.51627159 0.27307838
		 4.47343779 0.27147377 4.29091978 0.457946 4.26218987 0.45808411 4.23345804 0.45817679
		 4.21336412 0.41236392 4.207551 0.41233653 4.20749331 0.40274182 4.31505871 0.45761281
		 4.32436562 0.45750985 4.42562771 0.45692444 4.21336412 0.45815694 4.21332169 0.46544877
		 4.50158453 0.11658478 4.49580288 0.11658479 4.49575138 0.10845352 4.50158453 0.10731402
		 4.54122591 0.12917233 4.54122591 0.091818795 4.54782009 0.091725774 4.54459906 0.12909965
		 4.51617241 0.2442468 4.47460938 0.24424678 4.47476768 0.24032989 4.51641607 0.23733962
		 4.48906708 0.097970814 4.48300457 0.097970814 4.48300314 0.088736922 4.48900366 0.090080857
		 4.52122164 0.11545755 4.51529408 0.11545755 4.5154767 0.10631538 4.52158642 0.10538142
		 4.47366142 0.251771 4.51635504 0.251771 4.51637697 0.259581 4.4736867 0.25509515
		 4.51624012 0.28548482 4.47362328 0.28548479 4.47376442 0.28157592 4.5164566 0.27829295
		 4.52697515 0.11545756 4.52752209 0.10676663 4.43051243 0.41098005 4.15208149 0.46440455
		 4.15208149 0.46957037 4.12488651 0.46957043 4.12488651 0.46440455 4.17930603 0.46440455
		 4.17930603 0.46957034 4.0090446472 0.46957031 4.0090446472 0.46318442 4.041367531
		 0.46318451 4.041367531 0.46957037 4.068627834 0.46318445 4.068627834 0.46957037 4.092741489
		 0.46318451 4.092741489 0.46957037 4.096412659 0.40346327 4.12089682 0.40424195 4.12089729
		 0.41329339 4.10143328 0.41303846 4.096483707 0.41302404 4.092691422 0.41306844 4.036815166
		 0.45938256 4.036673546 0.41378453 4.065156937 0.41365346 4.065587997 0.45913497 4.0079483986
		 0.45962277 4.0082616806 0.41389361 4.45870399 0.40256891 4.4586277 0.41134033 4.43503761
		 0.41100866 4.5606823 0.092474073 4.55965853 0.13000487 4.149405 0.41317469 4.1493516
		 0.40395206 4.17779827 0.40401214 4.17791176 0.4130339 4.15208149 0.48005626 4.12488651
		 0.48005626 4.17930603 0.48005617 4.20245695 0.46957034 4.43509769 0.46957034 4.45812225
		 0.46957034 4.45812225 0.48005617 4.0090446472 0.48005617 4.041367531 0.48005626 4.068627834
		 0.48005626 4.096509933 0.46957031 4.096509933 0.4800562 4.10149622 0.46957031 4.10149622
		 0.46440452 4.45812225 0.46365091 4.43509769 0.46365106 4.4746027 0.22499529 4.51638985
		 0.22400275 4.036622047 0.40454969 4.065053463 0.40460387 4.0082130432 0.40465757
		 4.474998 0.18433915 4.51845455 0.18433899 4.5183754 0.18801519 4.4749403 0.18709956
		 4.47494125 0.18161711 4.51837587 0.18070182 4.14966679 0.45872557 4.1209383 0.45891684
		 4.17839718 0.45849007 4.20238018 0.41239187 4.10143328 0.45887968 4.092691422 0.45882216
		 4.45914078 0.45678458 4.43503761 0.4567768 4.20238018 0.45817551 4.20245695 0.46440452
		 4.50741911 0.10845385 4.50736713 0.11658474 4.57348013 0.12984169 4.57016373 0.12978084
		 4.56682777 0.092416793 4.57348013 0.092491448 4.5161047 0.21031387 4.51616335 0.21779099
		 4.47461128 0.21366787 4.47456312 0.21031387 4.47694206 0.097970814 4.47700357 0.090082355
		 4.50310946 0.098470196 4.50272846 0.087964639 4.50909805 0.088938698 4.50928974 0.098470196
		 4.4752326 0.20176774 4.47524023 0.19849673 4.51839828 0.19377775 4.51840591 0.20176774
		 4.51848745 0.16695827 4.51860237 0.17457195 4.47536898 0.17060477 4.47528839 0.16695827
		 4.49711084 0.098470196 4.49653959 0.08940915 4.26161671 0.57437164 4.26161671 0.56761473
		 4.28937531 0.56761473 4.28937531 0.57437164 4.23389006 0.57437152 4.23389006 0.56761473
		 4.40157175 0.56761473 4.40157127 0.57422483 4.37384129 0.57422483 4.37384129 0.56761473
		 4.34606695 0.57422483 4.34606695 0.56761473 4.3211832 0.57422483 4.3211832 0.56761473
		 4.47791052 0.7380476 4.51370382 0.75544167 4.47397852 0.75306916 4.47609472 0.76845205
		 4.48393631 0.78185439;
	setAttr ".uvst[0].uvsp[1000:1249]" 4.54347181 0.72902918 4.53109789 0.71964812
		 4.51607656 0.71571648 4.50069332 0.71783227 4.48729134 0.72567397 4.31852674 0.63019705
		 4.29015589 0.62958819 4.2902236 0.62156695 4.31597662 0.62199003 4.31853151 0.62202376
		 4.3211236 0.62199175 4.37529898 0.58191246 4.3752408 0.62166756 4.34677744 0.62163395
		 4.34675217 0.58190948 4.40387297 0.58199441 4.40369129 0.62168896 4.43195009 0.63041776
		 4.40359879 0.62969422 4.42904139 0.62217546 4.51391506 0.39896399 4.51385832 0.40368527
		 4.46869278 0.40263861 4.4687376 0.39896396 4.26177692 0.6215452 4.26176834 0.62961078
		 4.2333827 0.62951994 4.23331738 0.62150997 4.26161671 0.56394517 4.28937531 0.56394517
		 4.23389006 0.56394529 4.20935774 0.56761456 4.20579052 0.56761473 4.20579052 0.56394541
		 4.42596579 0.56761479 4.40157175 0.56394541 4.42910862 0.56394529 4.42910862 0.56761467
		 4.37384081 0.56394541 4.34606743 0.56394529 4.31769896 0.56761473 4.31769896 0.56394541
		 4.31421137 0.56761473 4.31421089 0.5743714 4.42596626 0.57422483 4.51360893 0.35285711
		 4.47411728 0.35285714 4.47406864 0.34968466 4.51354647 0.34871405 4.37524319 0.62973821
		 4.34683275 0.62965316 4.47336292 0.30911899 4.51474619 0.30911979 4.51469088 0.31306496
		 4.47332144 0.31216365 4.47332239 0.30611688 4.51469135 0.30521584 4.26182032 0.58178884
		 4.29038286 0.58185953 4.23327303 0.58179456 4.20801687 0.62192196 4.2051158 0.63015288
		 4.20512438 0.62196398 4.3160553 0.5820024 4.32103014 0.58201474 4.42912388 0.58215171
		 4.20790482 0.58191895 4.20935774 0.57437134 4.48382044 0.13116696 4.48383284 0.12276638
		 4.48946381 0.12387532 4.48940134 0.13227579 4.4682827 0.41884458 4.46843624 0.41347221
		 4.51354408 0.4118416 4.51332998 0.42012188 4.51363039 0.33438358 4.51371288 0.34168035
		 4.47399664 0.33938122 4.47393465 0.33493209 4.49653292 0.13276312 4.49659061 0.12482467
		 4.50215483 0.12357765 4.50215483 0.13151544 4.52078724 0.13124299 4.52091217 0.12260202
		 4.52647924 0.12376006 4.52618742 0.13239831 4.47371626 0.32491553 4.47375154 0.3202897
		 4.51501656 0.31763807 4.51497555 0.3252221 4.51475191 0.29262939 4.51477432 0.30025581
		 4.47328186 0.29748783 4.47325802 0.29283595 4.51543427 0.13222727 4.5153923 0.12358348
		 4.4319458 0.62222344 4.14990187 0.57498312 4.12210512 0.57498318 4.12210512 0.56761479
		 4.14990187 0.56761473 4.17763901 0.56761473 4.17763901 0.57498312 4.0088481903 0.56761473
		 4.036957264 0.56761473 4.036957264 0.57505327 4.0088486671 0.57505339 4.064723969
		 0.56761479 4.064723969 0.57505339 4.089415073 0.57505339 4.089415073 0.56761473 4.52671432
		 0.79305077 4.51133156 0.79516697 4.49630976 0.79123521 4.5513134 0.74243128 4.5534296
		 0.75781405 4.5494976 0.77283573 4.54011631 0.7852093 4.14936447 0.48774043 4.14936447
		 0.55432862 4.12129164 0.5543285 4.12129164 0.48774037 4.17743778 0.4877404 4.17743731
		 0.55432856 4.4581666 0.48774046 4.4581666 0.55432862 4.037073135 0.48774037 4.037073135
		 0.5543285 4.0089998245 0.5543285 4.0089998245 0.48774043 4.065145969 0.48774043 4.065145969
		 0.55432862 4.093218803 0.48774037 4.093218803 0.5543285 4.091704845 0.62994498 4.094272137
		 0.62174284 4.12002659 0.62137747 4.12007618 0.62939882 4.089125633 0.62173396 4.09171772
		 0.62177187 4.035086632 0.58151859 4.063605309 0.58159339 4.063468456 0.62131923 4.034983635
		 0.62129229 4.0066037178 0.58147228 4.006483078 0.62125313 4.43484592 0.62217456 4.46022987
		 0.62169868 4.46041536 0.62963325 4.46869278 0.39528906 4.51385832 0.39424253 4.14847326
		 0.62141889 4.17693281 0.6214478 4.17684984 0.62945777 4.14846373 0.62948459 4.12210464
		 0.56394529 4.14990139 0.56394529 4.17763901 0.56394529 4.20215988 0.56761473 4.43363237
		 0.56761467 4.45831823 0.56394517 4.45831823 0.56761473 4.0088481903 0.56394541 4.036957264
		 0.56394517 4.064723969 0.56394535 4.093278408 0.56394547 4.093278408 0.56761467 4.097378254
		 0.56761479 4.097378254 0.57498318 4.45831823 0.57431799 4.43363237 0.57431793 4.51354694
		 0.35700011 4.47406864 0.35602894 4.063396454 0.62933797 4.034971714 0.62936199 4.0064630508
		 0.62932378 4.47302771 0.44813073 4.47300911 0.44516706 4.51327848 0.44459319 4.51330376
		 0.44843361 4.51322174 0.45223236 4.47296572 0.45105237 4.11995554 0.58166993 4.14851856
		 0.58166271 4.17706585 0.58173233 4.20223188 0.62191576 4.094283104 0.58175522 4.089321136
		 0.58175874 4.4347024 0.58218849 4.45989037 0.58210641 4.20243359 0.58191329 4.20215988
		 0.57498324 4.47823572 0.13225853 4.47819901 0.12385838 4.46865702 0.38193297 4.51369762
		 0.38044545 4.51395082 0.3887248 4.46883583 0.38730475 4.51335812 0.37184727 4.47399473
		 0.37143481 4.47404146 0.3670224 4.51341581 0.36461189 4.50777721 0.1327631 4.50771904
		 0.12482465 4.48325491 0.11550301 4.47742128 0.11672699 4.47714186 0.10740009 4.4831562
		 0.10617325 4.47295237 0.43125057 4.5132494 0.43101758 4.51327705 0.43842432 4.47297955
		 0.43576798 4.51333523 0.46580595 4.47284031 0.46543542 4.47288275 0.46089542 4.51338816
		 0.45836243 4.48902893 0.11658798 4.4891119 0.10725661 4.86642027 0.18082932 4.84919834
		 0.18082932 4.84919834 0.16647838 4.86642027 0.16647838 4.95553923 0.18082929 4.9373188
		 0.18082929 4.9373188 0.16647851 4.95553923 0.16647851 4.92009687 0.18082926 4.92009687
		 0.16647851 4.88407278 0.18082923 4.88407278 0.16647847 4.90283108 0.18082927 4.90283108
		 0.1664785 4.97331047 0.18082929 4.97331047 0.16647851 4.83193207 0.18082924 4.83193207
		 0.16647846 4.81588936 0.18082924 4.80003452 0.18082926 4.80003452 0.16647846 4.81588936
		 0.16647846 4.73162413 0.18082924 4.71715784 0.18082924 4.71715784 0.16647846 4.73162413
		 0.16647846 4.74618006 0.18082927 4.74618006 0.16647846 4.7828126 0.18082927 4.7828126
		 0.16647846;
	setAttr ".uvst[0].uvsp[1250:1499]" 4.7655468 0.18082932 4.7655468 0.16647846
		 4.99057627 0.18082929 4.99057627 0.16647851 4.86696291 0.89526165 4.86696291 0.91031581
		 4.86140299 0.91031587 4.86140299 0.89526153 4.81218338 0.8953948 4.8121829 0.91036892
		 4.79381514 0.91036892 4.79381514 0.8953948 4.76541948 0.89539486 4.76541948 0.91036916
		 4.76300621 0.91036928 4.76300621 0.89539486 4.97224665 0.89564431 4.97224665 0.91071951
		 4.94697237 0.91071951 4.94697237 0.89564431 4.90506458 0.99164921 4.90505314 0.96258974
		 4.95192146 0.96257418 4.95193195 0.99163353 4.80125713 0.94862628 4.80126762 0.91956711
		 4.8481369 0.91958272 4.84812498 0.94864213 4.81622887 0.89539468 4.81622839 0.91036892
		 4.88981056 0.99165809 4.88980293 0.97162789 4.93670845 0.91071945 4.93670845 0.89564401
		 4.86338615 0.92862093 4.863379 0.94865113 4.83862543 0.89539468 4.83862543 0.91036892
		 4.88432169 0.91071945 4.88432169 0.89564401 4.96600676 0.92865545 4.96600246 0.94868577
		 4.84853697 0.89526153 4.84853697 0.91031581 4.84562445 0.91031581 4.84562397 0.89526153
		 4.87905121 0.91071945 4.87905169 0.89564401 4.87266445 0.89526165 4.87266445 0.91031599
		 4.87234354 0.91031599 4.87234306 0.89526165 4.78111458 0.99483061 4.77566433 0.99221164
		 4.77566195 0.97166628 4.78718233 0.9716621 4.7871871 0.99169284 4.87076139 0.89526165
		 4.87076139 0.91031599 4.85121584 0.89526153 4.85511684 0.89526153 4.85511637 0.91031581
		 4.85121584 0.91031581 4.84982872 0.89526153 4.84982824 0.91031581 4.9830308 0.9517169
		 4.97752523 0.94920498 4.97752762 0.92865908 4.98104668 0.92866039 4.98624802 0.93031758
		 4.98853207 0.93447763 4.98931551 0.94057482 4.9877367 0.94746673 4.76465702 0.97748446
		 4.76694155 0.97332436 4.77214193 0.97166711 4.77015877 0.99472398 4.76545238 0.99047399
		 4.76387358 0.9835819 4.9775176 0.95313317 4.97207499 0.95182341 4.77567196 0.99613994
		 4.99015903 0.89564401 4.99015903 0.91071963 4.77151012 0.91036874 4.7715106 0.89539486
		 4.76852083 0.89539468 4.76852083 0.91036892 4.76262665 0.91955388 4.76720047 0.92981482
		 4.76387215 0.92703015 4.76262569 0.92287338 4.98598862 0.97282207 4.99056244 0.96256077
		 4.99056339 0.96588057 4.98931742 0.97003686 4.86696291 0.89526165 4.86140299 0.89526153
		 4.86140299 0.91031587 4.86696291 0.91031581 4.81218338 0.8953948 4.79381514 0.8953948
		 4.79381514 0.91036892 4.8121829 0.91036892 4.76541948 0.89539486 4.76300621 0.89539486
		 4.76300621 0.91036928 4.76541948 0.91036916 4.97224665 0.89564431 4.94697237 0.89564431
		 4.94697237 0.91071951 4.97224665 0.91071951 4.90506458 0.99164921 4.95193195 0.99163353
		 4.95192146 0.96257418 4.90505314 0.96258974 4.80125713 0.94862628 4.84812498 0.94864213
		 4.8481369 0.91958272 4.80126762 0.91956711 4.81622887 0.89539468 4.81622839 0.91036892
		 4.88981056 0.99165809 4.88980293 0.97162789 4.93670845 0.89564401 4.93670845 0.91071945
		 4.863379 0.94865113 4.86338615 0.92862093 4.83862543 0.89539468 4.83862543 0.91036892
		 4.88432169 0.89564401 4.88432169 0.91071945 4.96600246 0.94868577 4.96600676 0.92865545
		 4.84853697 0.89526153 4.84562397 0.89526153 4.84562445 0.91031581 4.84853697 0.91031581
		 4.87905169 0.89564401 4.87905121 0.91071945 4.87266445 0.89526165 4.87234306 0.89526165
		 4.87234354 0.91031599 4.87266445 0.91031599 4.78111458 0.99483061 4.7871871 0.99169284
		 4.78718233 0.9716621 4.77566195 0.97166628 4.77566433 0.99221164 4.87076139 0.91031599
		 4.87076139 0.89526165 4.85121584 0.89526153 4.85121584 0.91031581 4.85511637 0.91031581
		 4.85511684 0.89526153 4.84982824 0.91031581 4.84982872 0.89526153 4.9830308 0.9517169
		 4.9877367 0.94746673 4.98931551 0.94057482 4.98853207 0.93447763 4.98624802 0.93031758
		 4.98104668 0.92866039 4.97752762 0.92865908 4.97752523 0.94920498 4.76465702 0.97748446
		 4.76387358 0.9835819 4.76545238 0.99047399 4.77015877 0.99472398 4.77214193 0.97166711
		 4.76694155 0.97332436 4.9775176 0.95313317 4.97207499 0.95182341 4.77567196 0.99613994
		 4.99015903 0.89564401 4.99015903 0.91071963 4.7715106 0.89539486 4.77151012 0.91036874
		 4.76852083 0.91036892 4.76852083 0.89539468 4.76262665 0.91955388 4.76262569 0.92287338
		 4.76387215 0.92703015 4.76720047 0.92981482 4.98598862 0.97282207 4.98931742 0.97003686
		 4.99056339 0.96588057 4.99056244 0.96256077 4.58888578 0.0028053857 4.58038855 0.0027944446
		 4.58012676 0.08632952 4.58865261 0.079623535 4.59457493 0.079646349 4.60366201 0.086328849
		 4.60319948 0.0027950816 4.59420681 0.0028291941 4.54082775 0.0027849674 4.54082823
		 0.036279917 4.55097961 0.036279887 4.55097961 0.0027849749 4.62554741 0.054356098
		 4.6277647 0.048328876 4.62549496 0.042317837 4.54082823 0.086338997 4.55097961 0.086338967
		 4.55097914 0.047237728 4.54082823 0.047237754 4.54082823 0.041758537 4.55097914 0.041758534
		 4.55807877 0.042352796 4.55582237 0.048367858 4.55805254 0.054389477 4.4962244 0.07818675
		 4.50235844 0.078184485 4.50373125 0.0020514131 4.49621725 0.0020541851 4.48190689
		 0.0077437013 4.48190689 0.016074538 4.49155188 0.016074479 4.49155188 0.0077436566
		 4.48190689 0.044959545 4.48190689 0.077837944 4.49155235 0.077837944 4.49155188 0.044959545
		 4.49155188 0.0023624897 4.48190689 0.0023624897 4.48190689 0.026771784 4.49155188
		 0.026771784 4.48190689 0.036321878 4.49155188 0.036321878 4.52797937 0.039442062
		 4.53110933 0.027787566 4.52574301 0.015574813 4.51446915 0.0057281852 3.14279222
		 2.65184355 3.16563511 2.65184331 3.16563511 2.66580772 3.14279222 2.66580796 3.18843174
		 2.65184355 3.18843174 2.66580772 3.21123695 2.65184355 3.21123695 2.66580772 3.23398733
		 2.65184355 3.23398685 2.66580772 3.25670815 2.65184379 3.25670815 2.66580796 3.27942324
		 2.65184379 3.27942324 2.66580772 3.30213881 2.65184379 3.30213881 2.66580796;
	setAttr ".uvst[0].uvsp[1500:1747]" 3.32485342 2.65184379 3.32485342 2.66580796
		 3.34756756 2.65184331 3.34756756 2.66580796 3.37028408 2.65184331 3.37028408 2.66580796
		 3.39303589 2.65184331 3.39303589 2.66580796 3.41607571 2.65184331 3.41607571 2.66580796
		 3.43961143 2.65184331 3.43961143 2.66580796 3.46389771 2.65184331 3.46389771 2.66580796
		 3.0040884018 2.65184379 3.028375626 2.65184379 3.028375626 2.66580772 3.0040884018
		 2.66580772 3.051929951 2.65184379 3.051929951 2.66580772 3.07514286 2.65184331 3.07514286
		 2.66580772 3.098121643 2.65184355 3.098121643 2.66580772 3.12070751 2.65184355 3.12070751
		 2.66580772 3.16601801 2.64533567 3.14347887 2.64533567 3.14347887 2.63953853 3.16601801
		 2.63953853 3.18952703 2.64533567 3.18952703 2.63953853 3.2120657 2.64533567 3.2120657
		 2.63953853 3.23477173 2.64533567 3.23477173 2.63953853 3.25745964 2.64533567 3.25745964
		 2.63953853 3.28014612 2.64533567 3.28014612 2.63953853 3.3028326 2.64533567 3.3028326
		 2.63953853 3.32551861 2.64533567 3.32551861 2.63953853 3.34820652 2.64533567 3.34820652
		 2.63953853 3.37089252 2.64533567 3.37089252 2.63953853 3.39357853 2.64533567 3.39357853
		 2.63953853 3.41620731 2.64533567 3.41620731 2.63953853 3.43993664 2.64533567 3.43993664
		 2.63953853 3.46458626 2.64533567 3.46458626 2.63953853 3.029747486 2.64533567 3.0047893524
		 2.64564562 3.0047893524 2.63922882 3.029747486 2.63953853 3.053365707 2.64533567
		 3.053365707 2.63953853 3.076060295 2.64533567 3.076060295 2.63953853 3.099107265
		 2.64533567 3.099107265 2.63953853 3.12186193 2.64533567 3.12186193 2.63953853 3.14337301
		 2.67203212 3.16573238 2.67203188 3.16573238 2.67806864 3.14337301 2.67806864 3.18745899
		 2.67203212 3.18745899 2.6780684 3.21020699 2.67203259 3.21020699 2.6780684 3.23320198
		 2.67203259 3.23320198 2.67806888 3.25594044 2.67203259 3.25594044 2.67806888 3.27857971
		 2.67203259 3.27857971 2.67806888 3.30122614 2.67203259 3.30122614 2.67806888 3.32387352
		 2.67203259 3.32387352 2.67806888 3.34651852 2.67203355 3.34651852 2.67806983 3.36916733
		 2.67203355 3.36916733 2.67806983 3.39181328 2.67203355 3.39181328 2.67806983 3.41437912
		 2.67203355 3.41437912 2.67806983 3.43788338 2.67203355 3.43788338 2.67806983 3.46265697
		 2.6718061 3.46265697 2.67829728 3.0040636063 2.67203259 3.028565884 2.67203259 3.028565884
		 2.67806888 3.0040636063 2.67806888 3.05216217 2.67203164 3.05216217 2.67806792 3.074756622
		 2.67203307 3.074756622 2.6780684 3.0974226 2.67203259 3.0974226 2.6780684 3.11993599
		 2.67203212 3.11993599 2.6780684 4.58888578 0.0028053857 4.58038855 0.0027944446 4.58012676
		 0.08632952 4.58865261 0.079623535 4.59457493 0.079646349 4.60366201 0.086328849 4.60319948
		 0.0027950816 4.59420681 0.0028291941 4.54082775 0.0027849674 4.54082823 0.036279917
		 4.55097961 0.036279887 4.55097961 0.0027849749 4.62554741 0.054356098 4.6277647 0.048328876
		 4.62549496 0.042317837 4.54082823 0.086338997 4.55097961 0.086338967 4.55097914 0.047237728
		 4.54082823 0.047237754 4.54082823 0.041758537 4.55097914 0.041758534 4.55807877 0.042352796
		 4.55582237 0.048367858 4.55805254 0.054389477 4.4962244 0.07818675 4.50235844 0.078184485
		 4.50373125 0.0020514131 4.49621725 0.0020541851 4.48190689 0.0077437013 4.48190689
		 0.016074538 4.49155188 0.016074479 4.49155188 0.0077436566 4.48190689 0.044959545
		 4.48190689 0.077837944 4.49155235 0.077837944 4.49155188 0.044959545 4.49155188 0.0023624897
		 4.48190689 0.0023624897 4.48190689 0.026771784 4.49155188 0.026771784 4.48190689
		 0.036321878 4.49155188 0.036321878 4.52797937 0.039442062 4.53110933 0.027787566
		 4.52574301 0.015574813 4.51446915 0.0057281852 4.58888578 0.0028053857 4.58865261
		 0.079623535 4.58012676 0.08632952 4.58038855 0.0027944446 4.59457493 0.079646349
		 4.59420681 0.0028291941 4.60319948 0.0027950816 4.60366201 0.086328849 4.54082775
		 0.0027849674 4.55097961 0.0027849749 4.55097961 0.036279887 4.54082823 0.036279917
		 4.62549496 0.042317837 4.6277647 0.048328876 4.62554741 0.054356098 4.54082823 0.086338997
		 4.54082823 0.047237754 4.55097914 0.047237728 4.55097961 0.086338967 4.55097914 0.041758534
		 4.54082823 0.041758537 4.55805254 0.054389477 4.55582237 0.048367858 4.55807877 0.042352796
		 4.4962244 0.07818675 4.49621725 0.0020541851 4.50373125 0.0020514131 4.50235844 0.078184485
		 4.48190689 0.0077437013 4.49155188 0.0077436566 4.49155188 0.016074479 4.48190689
		 0.016074538 4.48190689 0.044959545 4.49155188 0.044959545 4.49155235 0.077837944
		 4.48190689 0.077837944 4.49155188 0.0023624897 4.48190689 0.0023624897 4.49155188
		 0.026771784 4.48190689 0.026771784 4.49155188 0.036321878 4.48190689 0.036321878
		 4.52797937 0.039442062 4.51446915 0.0057281852 4.52574301 0.015574813 4.53110933
		 0.027787566 4.58888578 0.0028053857 4.58865261 0.079623535 4.58012676 0.08632952
		 4.58038855 0.0027944446 4.59457493 0.079646349 4.59420681 0.0028291941 4.60319948
		 0.0027950816 4.60366201 0.086328849 4.54082775 0.0027849674 4.55097961 0.0027849749
		 4.55097961 0.036279887 4.54082823 0.036279917 4.62549496 0.042317837 4.6277647 0.048328876
		 4.62554741 0.054356098 4.54082823 0.086338997 4.54082823 0.047237754 4.55097914 0.047237728
		 4.55097961 0.086338967 4.55097914 0.041758534 4.54082823 0.041758537 4.55805254 0.054389477
		 4.55582237 0.048367858 4.55807877 0.042352796 4.4962244 0.07818675 4.49621725 0.0020541851
		 4.50373125 0.0020514131 4.50235844 0.078184485 4.48190689 0.0077437013 4.49155188
		 0.0077436566 4.49155188 0.016074479 4.48190689 0.016074538 4.48190689 0.044959545
		 4.49155188 0.044959545 4.49155235 0.077837944 4.48190689 0.077837944 4.49155188 0.0023624897
		 4.48190689 0.0023624897 4.49155188 0.026771784 4.48190689 0.026771784 4.49155188
		 0.036321878 4.48190689 0.036321878 4.52797937 0.039442062 4.51446915 0.0057281852
		 4.52574301 0.015574813 4.53110933 0.027787566;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 980 ".pt";
	setAttr ".pt[0:165]" -type "float3"  0.11746001 -1.8626451e-07 0.22437406
		0.11953557 -1.8626451e-07 0.20931172 0.12141383 -1.8626451e-07 0.19568181 0.12237728
		-1.8626451e-07 0.18868947 0.12205791 -1.8626451e-07 0.19100595 0.12057769 -1.8626451e-07
		0.20174812 0.11850226 -1.8626451e-07 0.21681142 0.11662388 -1.8626451e-07 0.23044132
		0.11566043 -1.8626451e-07 0.23743366 0.11597979 -1.8626451e-07 0.23511624 0.11973441
		-1.8626451e-07 0.22468783 0.12180984 -1.8626451e-07 0.20962548 0.12576771 -1.8626451e-07
		0.19628167 0.12465167 -1.8626451e-07 0.18900323 0.12433231 -1.8626451e-07 0.1913197
		0.12285209 -1.8626451e-07 0.20206188 0.12077665 -1.8626451e-07 0.21712518 0.11889827
		-1.8626451e-07 0.23075508 0.11793482 -1.8626451e-07 0.23774742 0.11825418 -1.8626451e-07
		0.23543 0.11768758 -1.8626451e-07 0.22272228 0.11946011 -1.8626451e-07 0.20986009
		0.12106407 -1.8626451e-07 0.19821954 0.12188673 -1.8626451e-07 0.19224858 0.1216141
		-1.8626451e-07 0.19422841 0.12035012 -1.8626451e-07 0.2033999 0.11857772 -1.8626451e-07
		0.21626306 0.11697376 -1.8626451e-07 0.22790264 0.11615098 -1.8626451e-07 0.23387361
		0.11642361 -1.8626451e-07 0.23189472 0.11996198 -1.8626451e-07 0.2230351 0.1217345
		-1.8626451e-07 0.21017288 0.12540627 -1.8626451e-07 0.19885468 0.12416112 -1.8626451e-07
		0.19256234 0.12388849 -1.8626451e-07 0.19454217 0.12262452 -1.8626451e-07 0.20371367
		0.12085199 -1.8626451e-07 0.21657586 0.11924815 -1.8626451e-07 0.22821546 0.11842537
		-1.8626451e-07 0.23418736 0.118698 -1.8626451e-07 0.23220849 0.12673116 -1.8626451e-07
		0.18928933 0.12624061 -1.8626451e-07 0.19284844 0.12639737 -1.8626451e-07 0.19164014
		0.12596798 -1.8626451e-07 0.19482827 0.12493157 -1.8626451e-07 0.20234801 0.124704
		-1.8626451e-07 0.2040007 0.12285614 -1.8626451e-07 0.21741128 0.1229316 -1.8626451e-07
		0.21686292 0.12097776 -1.8626451e-07 0.23104118 0.12132764 -1.8626451e-07 0.2285025
		0.12001431 -1.8626451e-07 0.23803352 0.12050486 -1.8626451e-07 0.23447347 0.12033367
		-1.8626451e-07 0.2357161 0.12077749 -1.8626451e-07 0.23249458 0.079655245 -1.8626451e-07
		0.11746144 0.029155847 -1.8626451e-07 0.11746144 -0.029155845 -1.8626451e-07 0.11746144
		-0.079655245 -1.8626451e-07 0.11746144 -0.1088111 -1.8626451e-07 0.11746144 -0.1088111
		-1.8626451e-07 0.11746144 -0.079655245 -1.8626451e-07 0.11746144 -0.029155847 -1.8626451e-07
		0.11746144 0.029155845 -1.8626451e-07 0.11746144 0.079655245 -1.8626451e-07 0.11746144
		0.1088111 -1.8626451e-07 0.11746144 0.1088111 -1.8626451e-07 0.11746144 0.079655245
		-1.8626451e-07 0.1374619 0.029155847 -1.8626451e-07 0.1374619 -0.029155845 -1.8626451e-07
		0.1374619 -0.079655245 -1.8626451e-07 0.1374619 -0.1088111 -1.8626451e-07 0.1374619
		-0.1088111 -1.8626451e-07 0.1374619 -0.079655245 -1.8626451e-07 0.1374619 -0.029155847
		-1.8626451e-07 0.1374619 0.029155845 -1.8626451e-07 0.1374619 0.079655245 -1.8626451e-07
		0.1374619 0.1088111 -1.8626451e-07 0.1374619 0.1088111 -1.8626451e-07 0.1374619 0.064117029
		-1.8626451e-07 0.1374619 0.023468465 -1.8626451e-07 0.1374619 -0.023468463 -1.8626451e-07
		0.1374619 -0.064117029 -1.8626451e-07 0.1374619 -0.087585501 -1.8626451e-07 0.1374619
		-0.087585501 -1.8626451e-07 0.1374619 -0.064117029 -1.8626451e-07 0.1374619 -0.023468465
		-1.8626451e-07 0.1374619 0.023468463 -1.8626451e-07 0.1374619 0.064117029 -1.8626451e-07
		0.1374619 0.087585501 -1.8626451e-07 0.1374619 0.087585501 -1.8626451e-07 0.1374619
		0.10886204 -1.8626451e-07 0.011611223 0.092603564 -1.8626451e-07 0.011611223 0.067280412
		-1.8626451e-07 0.011611223 0.035371423 -1.8626451e-07 0.011611223 4.9074442e-16 -1.8626451e-07
		0.011611223 -0.035371423 -1.8626451e-07 0.011611223 -0.067280412 -1.8626451e-07 0.011611223
		-0.092603564 -1.8626451e-07 0.011611223 -0.10886204 -1.8626451e-07 0.011611223 -0.11446428
		-1.8626451e-07 0.011611223 -0.10886204 -1.8626451e-07 0.011611223 -0.092603564 -1.8626451e-07
		0.011611223 -0.067280412 -1.8626451e-07 0.011611223 -0.035371423 -1.8626451e-07 0.011611223
		-3.4113008e-09 -1.8626451e-07 0.011611223 0.035371363 -1.8626451e-07 0.011611223
		0.067280412 -1.8626451e-07 0.011611223 0.092603445 -1.8626451e-07 0.011611223 0.10886192
		-1.8626451e-07 0.011611223 0.11446428 -1.8626451e-07 0.011611223 -0.092603564 -1.8626451e-07
		0.10102773 -0.067280412 -1.8626451e-07 0.10102773 -0.035371423 -1.8626451e-07 0.10102773
		4.8526925e-16 -1.8626451e-07 0.10102773 0.035371423 -1.8626451e-07 0.10102773 0.067280412
		-1.8626451e-07 0.10102773 0.092603564 -1.8626451e-07 0.10102773 0.10886204 -1.8626451e-07
		0.10102773 0.11446428 -1.8626451e-07 0.10102773 0.10886192 -1.8626451e-07 0.10102773
		0.092603445 -1.8626451e-07 0.10102773 0.067280412 -1.8626451e-07 0.10102773 0.035371423
		-1.8626451e-07 0.10102773 -3.4113012e-09 -1.8626451e-07 0.10102773 -0.035371423 -1.8626451e-07
		0.10102773 -0.067280412 -1.8626451e-07 0.10102773 -0.092603564 -1.8626451e-07 0.10102773
		-0.10886204 -1.8626451e-07 0.10102773 -0.11446428 -1.8626451e-07 0.10102773 -0.10886204
		-1.8626451e-07 0.10102773 0.1013521 -1.8626451e-07 0.12856984 0.10737622 -1.8626451e-07
		0.12702584 0.10886204 -1.8626451e-07 0.12330174 0.086215138 -1.8626451e-07 0.12856984
		0.091339707 -1.8626451e-07 0.12702584 0.092603564 -1.8626451e-07 0.12330174 0.062638998
		-1.8626451e-07 0.12856984 0.066362143 -1.8626451e-07 0.12702584 0.067280412 -1.8626451e-07
		0.12330174 0.032931268 -1.8626451e-07 0.12856984 0.034888625 -1.8626451e-07 0.12702584
		0.035371423 -1.8626451e-07 0.12330174 -1.3097178e-08 -1.8626451e-07 0.12856984 1.6051344e-10
		-1.8626451e-07 0.12702584 4.8390537e-16 -1.8626451e-07 0.12330174 -0.032931268 -1.8626451e-07
		0.12856984 -0.034888625 -1.8626451e-07 0.12702584 -0.035371423 -1.8626451e-07 0.12330174
		-0.062638998 -1.8626451e-07 0.12856984 -0.066362143 -1.8626451e-07 0.12702584 -0.067280412
		-1.8626451e-07 0.12330174 -0.086215138 -1.8626451e-07 0.12856984 -0.091339588 -1.8626451e-07
		0.12702584 -0.092603564 -1.8626451e-07 0.12330174 -0.1013521 -1.8626451e-07 0.12856984
		-0.10737622 -1.8626451e-07 0.12702584 -0.10886204 -1.8626451e-07 0.12330174 -0.10656786
		-1.8626451e-07 0.12856984 -0.11290193 -1.8626451e-07 0.12702584 -0.11446428 -1.8626451e-07
		0.12330174 -0.1013521 -1.8626451e-07 0.12856984 -0.10737622 -1.8626451e-07 0.12702584
		-0.10886204 -1.8626451e-07 0.12330174 -0.086215138 -1.8626451e-07 0.12856984 -0.091339588
		-1.8626451e-07 0.1270268 -0.092603564 -1.8626451e-07 0.12330174;
	setAttr ".pt[166:331]" -0.062638998 -1.8626451e-07 0.12856984 -0.066362143
		-1.8626451e-07 0.12702584 -0.067280412 -1.8626451e-07 0.12330174 -0.032931268 -1.8626451e-07
		0.12856984 -0.034888625 -1.8626451e-07 0.1270268 -0.035371423 -1.8626451e-07 0.12330174
		-1.7655253e-08 -1.8626451e-07 0.12856984 -3.5866667e-09 -1.8626451e-07 0.12702584
		-3.4113012e-09 -1.8626451e-07 0.12330174 0.032931268 -1.8626451e-07 0.12856984 0.034888625
		-1.8626451e-07 0.12702584 0.035371423 -1.8626451e-07 0.12330174 0.062638998 -1.8626451e-07
		0.12856984 0.066362143 -1.8626451e-07 0.1270268 0.067280412 -1.8626451e-07 0.12330174
		0.086215138 -1.8626451e-07 0.12856984 0.091339588 -1.8626451e-07 0.12702584 0.092603445
		-1.8626451e-07 0.12330174 0.10135198 -1.8626451e-07 0.12856984 0.1073761 -1.8626451e-07
		0.12702584 0.10886192 -1.8626451e-07 0.12330174 0.10656774 -1.8626451e-07 0.12856984
		0.11290193 -1.8626451e-07 0.12702584 0.11446428 -1.8626451e-07 0.12330174 0.10886204
		-1.8626451e-07 0.0016739368 0.092603564 -1.8626451e-07 0.0016739368 0.067280412 -1.8626451e-07
		0.0016739368 0.035371423 -1.8626451e-07 0.0016739368 4.9135291e-16 -1.8626451e-07
		0.0016739368 -0.035371423 -1.8626451e-07 0.0016739368 -0.067280412 -1.8626451e-07
		0.0016739368 -0.092603564 -1.8626451e-07 0.0016739368 -0.10886204 -1.8626451e-07
		0.0016739368 -0.11446428 -1.8626451e-07 0.0016739368 -0.10886204 -1.8626451e-07 0.0016739368
		-0.092603564 -1.8626451e-07 0.0016739368 -0.067280412 -1.8626451e-07 0.0016739368
		-0.035371423 -1.8626451e-07 0.0016739368 -3.4113008e-09 -1.8626451e-07 0.0016739368
		0.035371363 -1.8626451e-07 0.0016739368 0.067280412 -1.8626451e-07 0.0016739368 0.092603445
		-1.8626451e-07 0.0016739368 0.10886192 -1.8626451e-07 0.0016739368 0.11446428 -1.8626451e-07
		0.0016739368 0.093344808 -1.8626451e-07 0.0016739368 0.079403877 -1.8626451e-07 0.0016739368
		0.057690263 -1.8626451e-07 0.0016739368 0.030329555 -1.8626451e-07 0.0016739368 2.3321192e-09
		-1.8626451e-07 0.0016739368 -0.030329555 -1.8626451e-07 0.0016739368 -0.057690263
		-1.8626451e-07 0.0016739368 -0.079403877 -1.8626451e-07 0.0016739368 -0.093344808
		-1.8626451e-07 0.0016739368 -0.098148465 -1.8626451e-07 0.0016739368 -0.093344808
		-1.8626451e-07 0.0016739368 -0.079403758 -1.8626451e-07 0.0016739368 -0.057690263
		-1.8626451e-07 0.0016739368 -0.030329555 -1.8626451e-07 0.0016739368 -1.0015697e-08
		-1.8626451e-07 0.0016739368 0.030329525 -1.8626451e-07 0.0016739368 0.057690203 -1.8626451e-07
		0.0016739368 0.079403758 -1.8626451e-07 0.0016739368 0.093344688 -1.8626451e-07 0.0016739368
		0.098148465 -1.8626451e-07 0.0016739368 0.093338847 -1.8626451e-07 0.12175775 0.079402804
		-1.8626451e-07 0.12175775 0.05769074 -1.8626451e-07 0.12175775 0.030329555 -1.8626451e-07
		0.12175775 2.3321187e-09 -1.8626451e-07 0.12175775 -0.030329555 -1.8626451e-07 0.12175775
		-0.057690263 -1.8626451e-07 0.12175775 -0.0794034 -1.8626451e-07 0.12175775 -0.093340874
		-1.8626451e-07 0.12175775 -0.098141789 -1.8626451e-07 0.12175775 -0.093341708 -1.8626451e-07
		0.12175775 -0.0794034 -1.8626451e-07 0.12175775 -0.057690144 -1.8626451e-07 0.12175775
		-0.030329943 -1.8626451e-07 0.12175775 -5.4697978e-08 -1.8626451e-07 0.12175775 0.030329674
		-1.8626451e-07 0.12175775 0.057689011 -1.8626451e-07 0.12175775 0.079403877 -1.8626451e-07
		0.12175775 0.093347907 -1.8626451e-07 0.12175775 0.098145843 -1.8626451e-07 0.12175775
		0.083989739 -1.8626451e-07 0.13278222 0.071449757 -1.8626451e-07 0.13278222 0.051912963
		-1.8626451e-07 0.13278222 0.027292192 -1.8626451e-07 0.13278222 -8.0108293e-08 -1.8626451e-07
		0.13278222 -0.027292222 -1.8626451e-07 0.13278222 -0.051912725 -1.8626451e-07 0.13278222
		-0.071450949 -1.8626451e-07 0.13278222 -0.083991885 -1.8626451e-07 0.13278222 -0.088311911
		-1.8626451e-07 0.13278222 -0.083992839 -1.8626451e-07 0.13278222 -0.071450949 -1.8626451e-07
		0.13278222 -0.051912427 -1.8626451e-07 0.13278222 -0.027292728 -1.8626451e-07 0.13278222
		-3.223804e-07 -1.8626451e-07 0.13278222 0.027291894 -1.8626451e-07 0.13278222 0.051911175
		-1.8626451e-07 0.13278222 0.07145226 -1.8626451e-07 0.13278222 0.083999991 -1.8626451e-07
		0.13278222 0.088316083 -1.8626451e-07 0.13278222 4.7756021e-07 -1.8626451e-07 0.45702577
		0.060277045 -1.8626451e-07 0.018801928 0.033737361 -1.8626451e-07 0.018800974 0.033737361
		-1.8626451e-07 0.093837976 0.060277045 -1.8626451e-07 0.093837976 -2.3283017e-10
		-1.8626451e-07 0.018800974 4.857095e-16 -1.8626451e-07 0.093837976 -0.033737421 -1.8626451e-07
		0.018801928 -0.033737421 -1.8626451e-07 0.093837976 -0.060277045 -1.8626451e-07 0.018801928
		-0.060277045 -1.8626451e-07 0.093837976 -0.091155767 -1.8626451e-07 0.018801928 -0.10383308
		-1.8626451e-07 0.018801928 -0.10383308 -1.8626451e-07 0.09383893 -0.091155767 -1.8626451e-07
		0.09383893 -0.10917652 -1.8626451e-07 0.018801928 -0.10917652 -1.8626451e-07 0.093839407
		-0.10383308 -1.8626451e-07 0.018800974 -0.10383308 -1.8626451e-07 0.093837976 -0.091155767
		-1.8626451e-07 0.018800974 -0.091155767 -1.8626451e-07 0.093837976 -0.060276985 -1.8626451e-07
		0.018800974 -0.033737361 -1.8626451e-07 0.018800974 -0.033737361 -1.8626451e-07 0.093837976
		-0.060276985 -1.8626451e-07 0.093837976 -3.9581201e-09 -1.8626451e-07 0.018802404
		-4.8894426e-09 -1.8626451e-07 0.093837976 0.033737361 -1.8626451e-07 0.018800974
		0.033737421 -1.8626451e-07 0.093837976 0.060276985 -1.8626451e-07 0.018800974 0.060276985
		-1.8626451e-07 0.093837976 0.091155767 -1.8626451e-07 0.018801928 0.10383296 -1.8626451e-07
		0.018802404 0.10383296 -1.8626451e-07 0.093837976 0.091155767 -1.8626451e-07 0.09383893
		0.10917652 -1.8626451e-07 0.018801928 0.10917652 -1.8626451e-07 0.093837976 0.10383308
		-1.8626451e-07 0.018800974 0.10383308 -1.8626451e-07 0.093837976 0.091155767 -1.8626451e-07
		0.018800974 0.091155887 -1.8626451e-07 0.093837976 0.079655245 -1.8626451e-07 0.1437161
		0.029155847 -1.8626451e-07 0.1437161 -0.029155845 -1.8626451e-07 0.1437161 -0.079655245
		-1.8626451e-07 0.1437161 -0.1088111 -1.8626451e-07 0.1437161 -0.1088111 -1.8626451e-07
		0.1437161 -0.079655245 -1.8626451e-07 0.1437161 -0.029155847 -1.8626451e-07 0.1437161
		0.029155845 -1.8626451e-07 0.1437161 0.079655245 -1.8626451e-07 0.1437161 0.1088111
		-1.8626451e-07 0.1437161 0.1088111 -1.8626451e-07 0.1437161 0.079655245 -1.8626451e-07
		0.16371655 0.029155847 -1.8626451e-07 0.16371655 -0.029155845 -1.8626451e-07 0.16371655
		-0.079655245 -1.8626451e-07 0.16371655 -0.1088111 -1.8626451e-07 0.16371655 -0.1088111
		-1.8626451e-07 0.16371655 -0.079655245 -1.8626451e-07 0.16371655 -0.029155847 -1.8626451e-07
		0.16371655 0.029155845 -1.8626451e-07 0.16371655;
	setAttr ".pt[332:497]" 0.079655245 -1.8626451e-07 0.16371655 0.1088111 -1.8626451e-07
		0.16371655 0.1088111 -1.8626451e-07 0.16371655 0.0634951 -1.8626451e-07 0.1437161
		0.023240823 -1.8626451e-07 0.1437161 -0.023240821 -1.8626451e-07 0.1437161 -0.0634951
		-1.8626451e-07 0.1437161 -0.086735927 -1.8626451e-07 0.1437161 -0.086735927 -1.8626451e-07
		0.1437161 -0.063495092 -1.8626451e-07 0.1437161 -0.023240823 -1.8626451e-07 0.1437161
		0.023240821 -1.8626451e-07 0.1437161 0.0634951 -1.8626451e-07 0.1437161 0.086735927
		-1.8626451e-07 0.1437161 0.086735927 -1.8626451e-07 0.1437161 0.060738593 -1.8626451e-07
		0.16371655 0.022231871 -1.8626451e-07 0.16371655 -0.022231869 -1.8626451e-07 0.16371655
		-0.060738597 -1.8626451e-07 0.16371655 -0.08297047 -1.8626451e-07 0.16371655 -0.08297047
		-1.8626451e-07 0.16371655 -0.06073859 -1.8626451e-07 0.16371655 -0.022231871 -1.8626451e-07
		0.16371655 0.022231869 -1.8626451e-07 0.16371655 0.060738597 -1.8626451e-07 0.16371655
		0.08297047 -1.8626451e-07 0.16371655 0.08297047 -1.8626451e-07 0.16371655 0.10306761
		-1.8626451e-07 0.17152619 0.078884535 -1.8626451e-07 0.17152619 0.042692035 -1.8626451e-07
		0.17152619 5.6520481e-08 -1.8626451e-07 0.17152619 -0.042691935 -1.8626451e-07 0.17152619
		-0.078884475 -1.8626451e-07 0.17152619 -0.10306758 -1.8626451e-07 0.17152619 -0.11155954
		-1.8626451e-07 0.17152619 -0.10306761 -1.8626451e-07 0.17152619 -0.07888452 -1.8626451e-07
		0.17152619 -0.042692009 -1.8626451e-07 0.17152619 -1.6623668e-08 -1.8626451e-07 0.17152619
		0.04269198 -1.8626451e-07 0.17152619 0.078884497 -1.8626451e-07 0.17152619 0.10306759
		-1.8626451e-07 0.17152619 0.11155954 -1.8626451e-07 0.17152619 0.10306761 -1.8626451e-07
		0.25010514 0.078884535 -1.8626451e-07 0.25010514 0.042692035 -1.8626451e-07 0.25010514
		5.6520481e-08 -1.8626451e-07 0.25010514 -0.042691931 -1.8626451e-07 0.25010514 -0.078884475
		-1.8626451e-07 0.25010514 -0.10306758 -1.8626451e-07 0.25010514 -0.11155954 -1.8626451e-07
		0.25010514 -0.1030676 -1.8626451e-07 0.25010514 -0.07888452 -1.8626451e-07 0.25010514
		-0.042692009 -1.8626451e-07 0.25010514 -1.6623666e-08 -1.8626451e-07 0.25010514 0.04269198
		-1.8626451e-07 0.25010514 0.078884497 -1.8626451e-07 0.25010514 0.10306759 -1.8626451e-07
		0.25010514 0.11155954 -1.8626451e-07 0.25010514 0.071178429 -1.8626451e-07 0.25010514
		0.054477617 -1.8626451e-07 0.25010514 0.029483095 -1.8626451e-07 0.25010514 3.9033015e-08
		-1.8626451e-07 0.25010514 -0.029483022 -1.8626451e-07 0.25010514 -0.05447758 -1.8626451e-07
		0.25010514 -0.071178406 -1.8626451e-07 0.25010514 -0.077042952 -1.8626451e-07 0.25010514
		-0.071178429 -1.8626451e-07 0.25010514 -0.054477606 -1.8626451e-07 0.25010514 -0.029483074
		-1.8626451e-07 0.25010514 -1.1480295e-08 -1.8626451e-07 0.25010514 0.029483054 -1.8626451e-07
		0.25010514 0.054477587 -1.8626451e-07 0.25010514 0.071178421 -1.8626451e-07 0.25010514
		0.077042952 -1.8626451e-07 0.25010514 0.071178429 -1.8626451e-07 0.2575829 0.054477617
		-1.8626451e-07 0.2575829 0.029483095 -1.8626451e-07 0.2575829 3.9033015e-08 -1.8626451e-07
		0.2575829 -0.029483022 -1.8626451e-07 0.2575829 -0.05447758 -1.8626451e-07 0.2575829
		-0.071178406 -1.8626451e-07 0.2575829 -0.077042952 -1.8626451e-07 0.2575829 -0.071178429
		-1.8626451e-07 0.2575829 -0.054477606 -1.8626451e-07 0.2575829 -0.029483074 -1.8626451e-07
		0.2575829 -1.1480295e-08 -1.8626451e-07 0.2575829 0.029483054 -1.8626451e-07 0.2575829
		0.054477587 -1.8626451e-07 0.2575829 0.071178421 -1.8626451e-07 0.2575829 0.077042952
		-1.8626451e-07 0.2575829 0.085883111 -1.8626451e-07 0.17152619 0.065732084 -1.8626451e-07
		0.17152619 0.035573978 -1.8626451e-07 0.17152619 4.7096798e-08 -1.8626451e-07 0.17152619
		-0.035573892 -1.8626451e-07 0.17152619 -0.06573204 -1.8626451e-07 0.17152619 -0.085883081
		-1.8626451e-07 0.17152619 -0.092959173 -1.8626451e-07 0.17152619 -0.085883111 -1.8626451e-07
		0.17152619 -0.065732069 -1.8626451e-07 0.17152619 -0.035573956 -1.8626451e-07 0.17152619
		-1.3851998e-08 -1.8626451e-07 0.17152619 0.03557393 -1.8626451e-07 0.17152619 0.065732054
		-1.8626451e-07 0.17152619 0.085883096 -1.8626451e-07 0.17152619 0.092959173 -1.8626451e-07
		0.17152619 0.085883111 -1.8626451e-07 0.1356957 0.065732084 -1.8626451e-07 0.1356957
		0.035573978 -1.8626451e-07 0.1356957 4.7096798e-08 -1.8626451e-07 0.1356957 -0.035573892
		-1.8626451e-07 0.1356957 -0.06573204 -1.8626451e-07 0.1356957 -0.085883081 -1.8626451e-07
		0.1356957 -0.092959173 -1.8626451e-07 0.1356957 -0.085883111 -1.8626451e-07 0.1356957
		-0.065732069 -1.8626451e-07 0.1356957 -0.035573956 -1.8626451e-07 0.1356957 -1.3851998e-08
		-1.8626451e-07 0.1356957 0.03557393 -1.8626451e-07 0.1356957 0.065732054 -1.8626451e-07
		0.1356957 0.085883096 -1.8626451e-07 0.1356957 0.092959173 -1.8626451e-07 0.1356957
		-0.077254012 -1.8626451e-07 0.2575829 -0.059127681 -1.8626451e-07 0.2575829 -0.031999692
		-1.8626451e-07 0.2575829 4.7568301e-16 -1.8626451e-07 0.2575829 4.7568301e-16 -1.8626451e-07
		0.2575829 -0.03199964 -1.8626451e-07 0.2575829 -0.05912764 -1.8626451e-07 0.2575829
		-0.07725399 -1.8626451e-07 0.2575829 -0.083619103 -1.8626451e-07 0.2575829 -0.10290432
		-1.8626451e-07 0.32073426 -0.078759588 -1.8626451e-07 0.32073426 -0.042624414 -1.8626451e-07
		0.32073426 4.7181609e-16 -1.8626451e-07 0.32073426 4.7181609e-16 -1.8626451e-07 0.32073426
		-0.042624347 -1.8626451e-07 0.32073426 -0.078759544 -1.8626451e-07 0.32073426 -0.1029043
		-1.8626451e-07 0.32073426 -0.11138282 -1.8626451e-07 0.32073426 -0.079189584 -1.8626451e-07
		0.32073426 -0.079189584 -1.8626451e-07 0.32073426 -0.06060908 -1.8626451e-07 0.32073426
		-0.032801386 -1.8626451e-07 0.32073426 -0.032801442 -1.8626451e-07 0.32073426 -0.060609113
		-1.8626451e-07 0.32073426 -0.087266818 -1.8626451e-07 0.32073426 -0.066791147 -1.8626451e-07
		0.32073426 -0.03614714 -1.8626451e-07 0.32073426 4.7181609e-16 -1.8626451e-07 0.32073426
		4.7181609e-16 -1.8626451e-07 0.32073426 -0.036147077 -1.8626451e-07 0.32073426 -0.066791117
		-1.8626451e-07 0.32073426 -0.087266788 -1.8626451e-07 0.32073426 -0.094456904 -1.8626451e-07
		0.32073426 -0.093594491 -1.8626451e-07 0.32073426 -0.08507362 -1.8626451e-07 0.32073426
		-0.093585156 -1.8626451e-07 0.32073426 -0.085064277 -1.8626451e-07 0.32073426 -0.0048049032
		-1.8626451e-07 0.32073426 -0.0036896733 -1.8626451e-07 0.32073426 4.7503085e-16 -1.8626451e-07
		0.26823354 4.750309e-16 -1.8626451e-07 0.26823258 -0.0036113122 -1.8626451e-07 0.26823354
		-0.07719215 -1.8626451e-07 0.26823258;
	setAttr ".pt[498:663]" -0.059080314 -1.8626451e-07 0.26823258 -0.031974025
		-1.8626451e-07 0.26823258 -0.082898021 -1.8626451e-07 0.26823258 -0.083533652 -1.8626451e-07
		0.26823258 -0.082907125 -1.8626451e-07 0.26823258 -0.077170923 -1.8626451e-07 0.26823258
		-0.059064083 -1.8626451e-07 0.26823258 -0.031965274 -1.8626451e-07 0.26823258 -0.0036059935
		-1.8626451e-07 0.26823258 -0.0036897296 -1.8626451e-07 0.32073426 -0.0048049651 -1.8626451e-07
		0.32073426 4.7502958e-16 -1.8626451e-07 0.26825547 -0.0036380552 -1.8626451e-07 0.26825547
		4.7502963e-16 -1.8626451e-07 0.26825356 -0.0035739329 -1.8626451e-07 0.26825452 -0.087997437
		-1.8626451e-07 0.26824975 -0.088633053 -1.8626451e-07 0.26824975 -0.088006534 -1.8626451e-07
		0.26824975 0.077254012 -1.8626451e-07 0.2575829 0.059127681 -1.8626451e-07 0.2575829
		0.031999692 -1.8626451e-07 0.2575829 0.03199964 -1.8626451e-07 0.2575829 0.05912764
		-1.8626451e-07 0.2575829 0.07725399 -1.8626451e-07 0.2575829 0.083619103 -1.8626451e-07
		0.2575829 0.10290432 -1.8626451e-07 0.32073426 0.078759588 -1.8626451e-07 0.32073426
		0.042624414 -1.8626451e-07 0.32073426 0.042624347 -1.8626451e-07 0.32073426 0.078759544
		-1.8626451e-07 0.32073426 0.1029043 -1.8626451e-07 0.32073426 0.11138282 -1.8626451e-07
		0.32073426 0.079189584 -1.8626451e-07 0.32073426 0.079189584 -1.8626451e-07 0.32073426
		0.06060908 -1.8626451e-07 0.32073426 0.032801386 -1.8626451e-07 0.32073426 0.032801442
		-1.8626451e-07 0.32073426 0.060609113 -1.8626451e-07 0.32073426 0.087266818 -1.8626451e-07
		0.32073426 0.066791147 -1.8626451e-07 0.32073426 0.03614714 -1.8626451e-07 0.32073426
		0.036147077 -1.8626451e-07 0.32073426 0.066791117 -1.8626451e-07 0.32073426 0.087266788
		-1.8626451e-07 0.32073426 0.094456904 -1.8626451e-07 0.32073426 0.093594491 -1.8626451e-07
		0.32073426 0.08507362 -1.8626451e-07 0.32073426 0.093585156 -1.8626451e-07 0.32073426
		0.085064277 -1.8626451e-07 0.32073426 0.0048049032 -1.8626451e-07 0.32073426 0.0036896733
		-1.8626451e-07 0.32073426 0.0036113122 -1.8626451e-07 0.26823354 0.07719215 -1.8626451e-07
		0.26823258 0.059080314 -1.8626451e-07 0.26823258 0.031974025 -1.8626451e-07 0.26823258
		0.082898021 -1.8626451e-07 0.26823258 0.083533652 -1.8626451e-07 0.26823258 0.082907125
		-1.8626451e-07 0.26823258 0.077170923 -1.8626451e-07 0.26823258 0.059064083 -1.8626451e-07
		0.26823258 0.031965274 -1.8626451e-07 0.26823258 0.0036059935 -1.8626451e-07 0.26823258
		0.0036897296 -1.8626451e-07 0.32073426 0.0048049651 -1.8626451e-07 0.32073426 0.0036380552
		-1.8626451e-07 0.26825547 0.0035739329 -1.8626451e-07 0.26825452 0.087997437 -1.8626451e-07
		0.26824975 0.088633053 -1.8626451e-07 0.26824975 0.088006534 -1.8626451e-07 0.26824975
		-0.089150727 -1.8626451e-07 0.48697019 -0.068233036 -1.8626451e-07 0.48697019 -0.03692748
		-1.8626451e-07 0.48697019 4.6163709e-16 -1.8626451e-07 0.48697019 4.6163709e-16 -1.8626451e-07
		0.48697019 -0.036927421 -1.8626451e-07 0.48697019 -0.068232991 -1.8626451e-07 0.48697019
		-0.089150704 -1.8626451e-07 0.48697019 -0.096496016 -1.8626451e-07 0.48697019 4.6163709e-16
		-1.8626451e-07 0.48697019 -0.10290432 -1.8626451e-07 0.42381883 -0.078759588 -1.8626451e-07
		0.42381883 -0.042624414 -1.8626451e-07 0.42381883 4.65504e-16 -1.8626451e-07 0.42381883
		4.65504e-16 -1.8626451e-07 0.42381883 -0.042624347 -1.8626451e-07 0.42381883 -0.078759544
		-1.8626451e-07 0.42381883 -0.1029043 -1.8626451e-07 0.42381883 -0.11138282 -1.8626451e-07
		0.42381883 -0.088924617 -1.8626451e-07 0.42381883 -0.088924617 -1.8626451e-07 0.42381883
		-0.068059951 -1.8626451e-07 0.42381883 -0.036833767 -1.8626451e-07 0.42381883 -0.03683383
		-1.8626451e-07 0.42381883 -0.068059988 -1.8626451e-07 0.42381883 -0.097994804 -1.8626451e-07
		0.42381883 -0.075002 -1.8626451e-07 0.42381883 -0.040590826 -1.8626451e-07 0.42381883
		4.65504e-16 -1.8626451e-07 0.42381883 4.65504e-16 -1.8626451e-07 0.42381883 -0.040590756
		-1.8626451e-07 0.42381883 -0.075001962 -1.8626451e-07 0.42381883 -0.097994782 -1.8626451e-07
		0.42381883 -0.1060688 -1.8626451e-07 0.42381883 -0.10510037 -1.8626451e-07 0.42381883
		-0.095531993 -1.8626451e-07 0.42381883 -0.10508988 -1.8626451e-07 0.42381883 -0.095521502
		-1.8626451e-07 0.42381883 -0.0053955857 -1.8626451e-07 0.42381883 -0.0041432567 -1.8626451e-07
		0.42381883 4.6228925e-16 -1.8626451e-07 0.47631955 4.622892e-16 -1.8626451e-07 0.47632051
		-0.0041674357 -1.8626451e-07 0.47631955 -0.089079343 -1.8626451e-07 0.47632051 -0.068178378
		-1.8626451e-07 0.47632051 -0.03689786 -1.8626451e-07 0.47632051 -0.09566389 -1.8626451e-07
		0.47632051 -0.0963974 -1.8626451e-07 0.47632051 -0.095674396 -1.8626451e-07 0.47632051
		-0.089054845 -1.8626451e-07 0.47632051 -0.068159647 -1.8626451e-07 0.47632051 -0.036887761
		-1.8626451e-07 0.47632051 -0.0041612978 -1.8626451e-07 0.47632051 -0.00414332 -1.8626451e-07
		0.42381883 -0.0053956551 -1.8626451e-07 0.42381883 4.6229057e-16 -1.8626451e-07 0.47629762
		-0.0041982969 -1.8626451e-07 0.47629762 4.6229047e-16 -1.8626451e-07 0.47629952 -0.0041243001
		-1.8626451e-07 0.47629857 -0.10154858 -1.8626451e-07 0.47630334 -0.10228208 -1.8626451e-07
		0.47630334 -0.10155909 -1.8626451e-07 0.47630334 0.089150727 -1.8626451e-07 0.48697019
		0.068233036 -1.8626451e-07 0.48697019 0.03692748 -1.8626451e-07 0.48697019 0.036927421
		-1.8626451e-07 0.48697019 0.068232991 -1.8626451e-07 0.48697019 0.089150704 -1.8626451e-07
		0.48697019 0.096496016 -1.8626451e-07 0.48697019 0.10290432 -1.8626451e-07 0.42381883
		0.078759588 -1.8626451e-07 0.42381883 0.042624414 -1.8626451e-07 0.42381883 0.042624347
		-1.8626451e-07 0.42381883 0.078759544 -1.8626451e-07 0.42381883 0.1029043 -1.8626451e-07
		0.42381883 0.11138282 -1.8626451e-07 0.42381883 0.088924617 -1.8626451e-07 0.42381883
		0.088924617 -1.8626451e-07 0.42381883 0.068059951 -1.8626451e-07 0.42381883 0.036833767
		-1.8626451e-07 0.42381883 0.03683383 -1.8626451e-07 0.42381883 0.068059988 -1.8626451e-07
		0.42381883 0.097994804 -1.8626451e-07 0.42381883 0.075002 -1.8626451e-07 0.42381883
		0.040590826 -1.8626451e-07 0.42381883 0.040590756 -1.8626451e-07 0.42381883 0.075001962
		-1.8626451e-07 0.42381883 0.097994782 -1.8626451e-07 0.42381883 0.1060688 -1.8626451e-07
		0.42381883 0.10510037 -1.8626451e-07 0.42381883 0.095531993 -1.8626451e-07 0.42381883
		0.10508988 -1.8626451e-07 0.42381883 0.095521502 -1.8626451e-07 0.42381883 0.0053955857
		-1.8626451e-07 0.42381883 0.0041432567 -1.8626451e-07 0.42381883 0.0041674357 -1.8626451e-07
		0.47631955 0.089079343 -1.8626451e-07 0.47632051;
	setAttr ".pt[664:829]" 0.068178378 -1.8626451e-07 0.47632051 0.03689786 -1.8626451e-07
		0.47632051 0.09566389 -1.8626451e-07 0.47632051 0.0963974 -1.8626451e-07 0.47632051
		0.095674396 -1.8626451e-07 0.47632051 0.089054845 -1.8626451e-07 0.47632051 0.068159647
		-1.8626451e-07 0.47632051 0.036887761 -1.8626451e-07 0.47632051 0.0041612978 -1.8626451e-07
		0.47632051 0.00414332 -1.8626451e-07 0.42381883 0.0053956551 -1.8626451e-07 0.42381883
		0.0041982969 -1.8626451e-07 0.47629762 0.0041243001 -1.8626451e-07 0.47629857 0.10154858
		-1.8626451e-07 0.47630334 0.10228208 -1.8626451e-07 0.47630334 0.10155909 -1.8626451e-07
		0.47630334 -0.042621434 -1.8626451e-07 0.2575829 -0.023066577 -1.8626451e-07 0.2575829
		-0.023066536 -1.8626451e-07 0.2575829 -0.042621408 -1.8626451e-07 0.2575829 -0.055687569
		-1.8626451e-07 0.2575829 -0.055687577 -1.8626451e-07 0.2575829 -0.060275771 -1.8626451e-07
		0.2575829 4.7568301e-16 -1.8626451e-07 0.2575829 4.7568301e-16 -1.8626451e-07 0.2575829
		0.042621434 -1.8626451e-07 0.2575829 0.023066577 -1.8626451e-07 0.2575829 0.023066536
		-1.8626451e-07 0.2575829 0.042621408 -1.8626451e-07 0.2575829 0.055687569 -1.8626451e-07
		0.2575829 0.055687577 -1.8626451e-07 0.2575829 0.060275771 -1.8626451e-07 0.2575829
		-0.11020368 -1.8626451e-07 0.021129847 -0.11020356 -1.8626451e-07 0.021129847 -0.13357782
		-1.8626451e-07 0.089899778 -0.13357782 -1.8626451e-07 0.089899778 -0.1102035 -1.8626451e-07
		0.089899778 -0.11020362 -1.8626451e-07 0.089899778 -0.13357782 -1.8626451e-07 0.10189843
		-0.13357794 -1.8626451e-07 0.10189843 -0.11746609 -1.8626451e-07 0.10189843 -0.11746609
		-1.8626451e-07 0.10189843 -0.11746609 -1.8626451e-07 0.18444419 -0.11746609 -1.8626451e-07
		0.18444419 -0.11746609 -1.8626451e-07 0.1937139 -0.11746609 -1.8626451e-07 0.1937139
		-0.11746609 -1.8626451e-07 0.19654441 -0.11879766 -1.8626451e-07 0.20072341 -0.12214339
		-1.8626451e-07 0.20256066 -0.11746609 -1.8626451e-07 0.19654441 -0.12214339 -1.8626451e-07
		0.20256066 -0.11879766 -1.8626451e-07 0.20072341 -0.13601148 -1.8626451e-07 0.19814944
		-0.12704742 -1.8626451e-07 0.20319343 -0.13259161 -1.8626451e-07 0.20192742 -0.13601148
		-1.8626451e-07 0.19814944 -0.13259161 -1.8626451e-07 0.20192742 -0.12704742 -1.8626451e-07
		0.20319343 -0.13399231 -1.8626451e-07 0.1937139 -0.13715208 -1.8626451e-07 0.19370675
		-0.13610017 -1.8626451e-07 0.18932605 -0.13399231 -1.8626451e-07 0.1937139 -0.13610017
		-1.8626451e-07 0.18932605 -0.13715208 -1.8626451e-07 0.19370675 -0.13357782 -1.8626451e-07
		0.18444419 -0.13357794 -1.8626451e-07 0.18444419 -0.11020362 -1.8626451e-07 0.052200556
		-0.1102035 -1.8626451e-07 0.052200556 -0.13357782 -1.8626451e-07 0.052200556 -0.13357782
		-1.8626451e-07 0.052200556 -0.11845595 -1.8626451e-07 0.024809599 -0.11621672 -1.8626451e-07
		0.022132158 -0.11287373 -1.8626451e-07 0.021129847 -0.11845607 -1.8626451e-07 0.024809599
		-0.11287385 -1.8626451e-07 0.021129847 -0.11621672 -1.8626451e-07 0.022132158 0.11020368
		-1.8626451e-07 0.021129847 0.11020356 -1.8626451e-07 0.021129847 0.13357782 -1.8626451e-07
		0.089899778 0.13357782 -1.8626451e-07 0.089899778 0.1102035 -1.8626451e-07 0.089899778
		0.11020362 -1.8626451e-07 0.089899778 0.13357782 -1.8626451e-07 0.10189843 0.13357794
		-1.8626451e-07 0.10189843 0.11746609 -1.8626451e-07 0.10189843 0.11746609 -1.8626451e-07
		0.10189843 0.11746609 -1.8626451e-07 0.18444419 0.11746609 -1.8626451e-07 0.18444419
		0.11746609 -1.8626451e-07 0.1937139 0.11746609 -1.8626451e-07 0.1937139 0.11746609
		-1.8626451e-07 0.19654441 0.11879766 -1.8626451e-07 0.20072341 0.12214339 -1.8626451e-07
		0.20256066 0.11746609 -1.8626451e-07 0.19654441 0.12214339 -1.8626451e-07 0.20256066
		0.11879766 -1.8626451e-07 0.20072341 0.13601148 -1.8626451e-07 0.19814944 0.12704742
		-1.8626451e-07 0.20319343 0.13259161 -1.8626451e-07 0.20192742 0.13601148 -1.8626451e-07
		0.19814944 0.13259161 -1.8626451e-07 0.20192742 0.12704742 -1.8626451e-07 0.20319343
		0.13399231 -1.8626451e-07 0.1937139 0.13715208 -1.8626451e-07 0.19370675 0.13610017
		-1.8626451e-07 0.18932605 0.13399231 -1.8626451e-07 0.1937139 0.13610017 -1.8626451e-07
		0.18932605 0.13715208 -1.8626451e-07 0.19370675 0.13357782 -1.8626451e-07 0.18444419
		0.13357794 -1.8626451e-07 0.18444419 0.11020362 -1.8626451e-07 0.052200556 0.1102035
		-1.8626451e-07 0.052200556 0.13357782 -1.8626451e-07 0.052200556 0.13357782 -1.8626451e-07
		0.052200556 0.11845595 -1.8626451e-07 0.024809599 0.11621672 -1.8626451e-07 0.022132158
		0.11287373 -1.8626451e-07 0.021129847 0.11845607 -1.8626451e-07 0.024809599 0.11287385
		-1.8626451e-07 0.021129847 0.11621672 -1.8626451e-07 0.022132158 0.10221242 -1.8626451e-07
		0.10105824 0.10409905 -1.8626451e-07 0.10105824 0.11184163 -1.8626451e-07 0.10105824
		0.10984869 -1.8626451e-07 0.10105824 0.11199661 -1.8626451e-07 0.011608362 0.10994567
		-1.8626451e-07 0.011608362 0.10229327 -1.8626451e-07 0.018800974 0.1041799 -1.8626451e-07
		0.018800974 0.1355615 -1.8626451e-07 0.045755625 0.13555428 -1.8626451e-07 0.058646441
		0.13796006 -1.8626451e-07 0.052200556 0.13547952 -1.8626451e-07 0.045757532 0.13788086
		-1.8626451e-07 0.052200556 0.13547783 -1.8626451e-07 0.058646441 0.10059907 -1.8626451e-07
		0.10105824 0.10979865 -1.8626451e-07 0.10105824 0.10648568 -1.8626451e-07 0.10105824
		0.10783015 -1.8626451e-07 0.027993441 0.10783014 -1.8626451e-07 0.027993441 0.10061917
		-1.8626451e-07 0.027993441 0.10061917 -1.8626451e-07 0.027993441 0.13223834 -1.8626451e-07
		0.063934565 0.13487041 -1.8626451e-07 0.052712679 0.12946536 -1.8626451e-07 0.041130304
		0.11861968 -1.8626451e-07 0.031794786 0.13108811 -1.8626451e-07 0.063885927 0.11813404
		-1.8626451e-07 0.03152585 0.12895024 -1.8626451e-07 0.040979624 0.13409609 -1.8626451e-07
		0.052702188 0.084345549 -1.8626451e-07 0.4957211 0.071748614 -1.8626451e-07 0.4957211
		0.052128401 -1.8626451e-07 0.4957211 0.027405515 -1.8626451e-07 0.4957211 4.6110123e-16
		-1.8626451e-07 0.4957211 -0.027405515 -1.8626451e-07 0.4957211 -0.052128382 -1.8626451e-07
		0.4957211 -0.071748555 -1.8626451e-07 0.4957211 -0.084345482 -1.8626451e-07 0.4957211
		-0.088686086 -1.8626451e-07 0.4957211 -0.084345482 -1.8626451e-07 0.4957211 -0.071748547
		-1.8626451e-07 0.4957211 -0.052128375 -1.8626451e-07 0.4957211 -0.027405512 -1.8626451e-07
		0.4957211 -2.6430509e-09 -1.8626451e-07 0.4957211 0.0274055 -1.8626451e-07 0.4957211
		0.05212836 -1.8626451e-07 0.4957211;
	setAttr ".pt[830:979]" 0.07174854 -1.8626451e-07 0.4957211 0.084345475 -1.8626451e-07
		0.4957211 0.088686079 -1.8626451e-07 0.4957211 0.084345549 -1.8626451e-07 0.51263118
		0.071748614 -1.8626451e-07 0.51263118 0.052128401 -1.8626451e-07 0.51263118 0.027405515
		-1.8626451e-07 0.51263118 4.6006579e-16 -1.8626451e-07 0.51263118 -0.027405515 -1.8626451e-07
		0.51263118 -0.052128382 -1.8626451e-07 0.51263118 -0.071748555 -1.8626451e-07 0.51263118
		-0.084345482 -1.8626451e-07 0.51263118 -0.088686086 -1.8626451e-07 0.51263118 -0.084345482
		-1.8626451e-07 0.51263118 -0.071748547 -1.8626451e-07 0.51263118 -0.052128375 -1.8626451e-07
		0.51263118 -0.027405512 -1.8626451e-07 0.51263118 -2.6430509e-09 -1.8626451e-07 0.51263118
		0.0274055 -1.8626451e-07 0.51263118 0.05212836 -1.8626451e-07 0.51263118 0.07174854
		-1.8626451e-07 0.51263118 0.084345475 -1.8626451e-07 0.51263118 0.088686079 -1.8626451e-07
		0.51263118 0.07997746 -1.8626451e-07 0.4957211 0.068032891 -1.8626451e-07 0.4957211
		0.049428791 -1.8626451e-07 0.4957211 0.02598625 -1.8626451e-07 0.4957211 4.6110123e-16
		-1.8626451e-07 0.4957211 -0.025986249 -1.8626451e-07 0.4957211 -0.049428772 -1.8626451e-07
		0.4957211 -0.068032861 -1.8626451e-07 0.4957211 -0.079977438 -1.8626451e-07 0.4957211
		-0.084093243 -1.8626451e-07 0.4957211 -0.079977438 -1.8626451e-07 0.4957211 -0.068032853
		-1.8626451e-07 0.4957211 -0.049428765 -1.8626451e-07 0.4957211 -0.025986241 -1.8626451e-07
		0.4957211 -2.7648634e-09 -1.8626451e-07 0.4957211 0.02598623 -1.8626451e-07 0.4957211
		0.049428754 -1.8626451e-07 0.4957211 0.068032846 -1.8626451e-07 0.4957211 0.079977408
		-1.8626451e-07 0.4957211 0.084093221 -1.8626451e-07 0.4957211 0.07997746 -1.8626451e-07
		0.51263118 0.068032891 -1.8626451e-07 0.51263118 0.049428791 -1.8626451e-07 0.51263118
		0.02598625 -1.8626451e-07 0.51263118 4.6006579e-16 -1.8626451e-07 0.51263118 -0.025986249
		-1.8626451e-07 0.51263118 -0.049428772 -1.8626451e-07 0.51263118 -0.068032861 -1.8626451e-07
		0.51263118 -0.079977438 -1.8626451e-07 0.51263118 -0.084093243 -1.8626451e-07 0.51263118
		-0.079977438 -1.8626451e-07 0.51263118 -0.068032853 -1.8626451e-07 0.51263118 -0.049428765
		-1.8626451e-07 0.51263118 -0.025986241 -1.8626451e-07 0.51263118 -2.7648634e-09 -1.8626451e-07
		0.51263118 0.02598623 -1.8626451e-07 0.51263118 0.049428754 -1.8626451e-07 0.51263118
		0.068032846 -1.8626451e-07 0.51263118 0.079977408 -1.8626451e-07 0.51263118 0.084093221
		-1.8626451e-07 0.51263118 -0.10221242 -1.8626451e-07 0.10105824 -0.10409905 -1.8626451e-07
		0.10105824 -0.11184163 -1.8626451e-07 0.10105824 -0.10984869 -1.8626451e-07 0.10105824
		-0.11199661 -1.8626451e-07 0.011608362 -0.10994567 -1.8626451e-07 0.011608362 -0.10229327
		-1.8626451e-07 0.018800974 -0.1041799 -1.8626451e-07 0.018800974 -0.1355615 -1.8626451e-07
		0.045755625 -0.13555428 -1.8626451e-07 0.058646441 -0.13796006 -1.8626451e-07 0.052200556
		-0.13547952 -1.8626451e-07 0.045757532 -0.13788086 -1.8626451e-07 0.052200556 -0.13547783
		-1.8626451e-07 0.058646441 -0.10059907 -1.8626451e-07 0.10105824 -0.10979865 -1.8626451e-07
		0.10105824 -0.10648568 -1.8626451e-07 0.10105824 -0.10783015 -1.8626451e-07 0.027993441
		-0.10783014 -1.8626451e-07 0.027993441 -0.10061917 -1.8626451e-07 0.027993441 -0.10061917
		-1.8626451e-07 0.027993441 -0.13223834 -1.8626451e-07 0.063934565 -0.13487041 -1.8626451e-07
		0.052712679 -0.12946536 -1.8626451e-07 0.041130304 -0.11861968 -1.8626451e-07 0.031794786
		-0.13108811 -1.8626451e-07 0.063885927 -0.11813404 -1.8626451e-07 0.03152585 -0.12895024
		-1.8626451e-07 0.040979624 -0.13409609 -1.8626451e-07 0.052702188 -0.10221242 -1.8626451e-07
		0.10105824 -0.10409905 -1.8626451e-07 0.10105824 -0.11184163 -1.8626451e-07 0.10105824
		-0.10984869 -1.8626451e-07 0.10105824 -0.11199661 -1.8626451e-07 0.011608362 -0.10994567
		-1.8626451e-07 0.011608362 -0.10229327 -1.8626451e-07 0.018800974 -0.1041799 -1.8626451e-07
		0.018800974 -0.1355615 -1.8626451e-07 0.045755625 -0.13555428 -1.8626451e-07 0.058646441
		-0.13796006 -1.8626451e-07 0.052200556 -0.13547952 -1.8626451e-07 0.045757532 -0.13788086
		-1.8626451e-07 0.052200556 -0.13547783 -1.8626451e-07 0.058646441 -0.10059907 -1.8626451e-07
		0.10105824 -0.10979865 -1.8626451e-07 0.10105824 -0.10648568 -1.8626451e-07 0.10105824
		-0.10783015 -1.8626451e-07 0.027993441 -0.10783014 -1.8626451e-07 0.027993441 -0.10061917
		-1.8626451e-07 0.027993441 -0.10061917 -1.8626451e-07 0.027993441 -0.13223834 -1.8626451e-07
		0.063934565 -0.13487041 -1.8626451e-07 0.052712679 -0.12946536 -1.8626451e-07 0.041130304
		-0.11861968 -1.8626451e-07 0.031794786 -0.13108811 -1.8626451e-07 0.063885927 -0.11813404
		-1.8626451e-07 0.03152585 -0.12895024 -1.8626451e-07 0.040979624 -0.13409609 -1.8626451e-07
		0.052702188 0.10221242 -1.8626451e-07 0.10105824 0.10409905 -1.8626451e-07 0.10105824
		0.11184163 -1.8626451e-07 0.10105824 0.10984869 -1.8626451e-07 0.10105824 0.11199661
		-1.8626451e-07 0.011608362 0.10994567 -1.8626451e-07 0.011608362 0.10229327 -1.8626451e-07
		0.018800974 0.1041799 -1.8626451e-07 0.018800974 0.1355615 -1.8626451e-07 0.045755625
		0.13555428 -1.8626451e-07 0.058646441 0.13796006 -1.8626451e-07 0.052200556 0.13547952
		-1.8626451e-07 0.045757532 0.13788086 -1.8626451e-07 0.052200556 0.13547783 -1.8626451e-07
		0.058646441 0.10059907 -1.8626451e-07 0.10105824 0.10979865 -1.8626451e-07 0.10105824
		0.10648568 -1.8626451e-07 0.10105824 0.10783015 -1.8626451e-07 0.027993441 0.10783014
		-1.8626451e-07 0.027993441 0.10061917 -1.8626451e-07 0.027993441 0.10061917 -1.8626451e-07
		0.027993441 0.13223834 -1.8626451e-07 0.063934565 0.13487041 -1.8626451e-07 0.052712679
		0.12946536 -1.8626451e-07 0.041130304 0.11861968 -1.8626451e-07 0.031794786 0.13108811
		-1.8626451e-07 0.063885927 0.11813404 -1.8626451e-07 0.03152585 0.12895024 -1.8626451e-07
		0.040979624 0.13409609 -1.8626451e-07 0.052702188;
	setAttr -s 980 ".vt";
	setAttr ".vt[0:165]"  -0.058730006 -0.01107874 -0.113024 -0.059767783 -0.012319013 -0.10549283
		 -0.060706913 -0.0088538378 -0.098677874 -0.061188638 -0.0020068842 -0.095181704 -0.061028957 0.0056070033 -0.096339941
		 -0.060288846 0.011079046 -0.10171103 -0.05925113 0.012319341 -0.10924268 -0.058311939 0.0088541452 -0.11605763
		 -0.057830215 0.0020071913 -0.1195538 -0.057989895 -0.0056066774 -0.11839509 -0.059867203 -0.01107874 -0.11318088
		 -0.06090492 -0.012319013 -0.10564971 -0.062883854 -0.0088538378 -0.098977804 -0.062325835 -0.0020068842 -0.095338583
		 -0.062166154 0.0056070033 -0.09649682 -0.061426044 0.011079046 -0.10186791 -0.060388327 0.012319341 -0.10939956
		 -0.059449136 0.0088541452 -0.11621451 -0.058967412 0.0020071913 -0.11971068 -0.059127092 -0.0056066774 -0.11855197
		 -0.058843791 -0.0094607407 -0.11219811 -0.059730053 -0.010519559 -0.10576701 -0.060532033 -0.0075605055 -0.099946737
		 -0.060943365 -0.0017137523 -0.09696126 -0.060807049 0.004787934 -0.097951174 -0.060175061 0.0094610471 -0.10253692
		 -0.059288859 0.010519867 -0.1089685 -0.058486879 0.007560832 -0.11478829 -0.058075488 0.0017140979 -0.11777377
		 -0.058211803 -0.0047876267 -0.11678433 -0.059980989 -0.0094607407 -0.11235452 -0.06086725 -0.010519559 -0.10592341
		 -0.062703133 -0.007554214 -0.10026431 -0.062080562 -0.0017137523 -0.097118139 -0.061944246 0.004787934 -0.098108053
		 -0.061312258 0.0094610471 -0.1026938 -0.060425997 0.010519867 -0.1091249 -0.059624076 0.007560832 -0.1149447
		 -0.059212685 0.0017140979 -0.11793065 -0.059349 -0.0047876267 -0.11694121 -0.063365579 -0.0020068842 -0.095481634
		 -0.063120306 -0.0017137523 -0.09726119 -0.063198686 0.0056120679 -0.096657038 -0.06298399 0.004787934 -0.098251104
		 -0.062465787 0.011079046 -0.10201097 -0.062352002 0.0094610471 -0.10283732 -0.06142807 0.012319341 -0.10954261
		 -0.0614658 0.010519867 -0.10926843 -0.06048888 0.0088541452 -0.11635756 -0.060663819 0.007560832 -0.11508822
		 -0.060007155 0.0020071913 -0.11985373 -0.060252428 0.0017140979 -0.1180737 -0.060166836 -0.0056066774 -0.11869502
		 -0.060388744 -0.0047876267 -0.11708426 -0.039827622 0.039827652 -0.05956769 -0.014577923 0.054405756 -0.05956769
		 0.014577922 0.054405756 -0.05956769 0.039827622 0.039827652 -0.05956769 0.054405548 0.014578092 -0.05956769
		 0.054405548 -0.014577785 -0.05956769 0.039827622 -0.039827503 -0.05956769 0.014577923 -0.05440544 -0.05956769
		 -0.014577922 -0.05440544 -0.05956769 -0.039827622 -0.039827503 -0.05956769 -0.054405548 -0.014577787 -0.05956769
		 -0.054405548 0.01457809 -0.05956769 -0.039827622 0.039827652 -0.069567919 -0.014577923 0.054405756 -0.069567919
		 0.014577922 0.054405756 -0.069567919 0.039827622 0.039827652 -0.069567919 0.054405548 0.014578092 -0.069567919
		 0.054405548 -0.014577785 -0.069567919 0.039827622 -0.039827503 -0.069567919 0.014577923 -0.05440544 -0.069567919
		 -0.014577922 -0.05440544 -0.069567919 -0.039827622 -0.039827503 -0.069567919 -0.054405548 -0.014577787 -0.069567919
		 -0.054405548 0.01457809 -0.069567919 -0.032058515 0.032058682 -0.069567919 -0.011734232 0.043792825 -0.069567919
		 0.011734231 0.043792825 -0.069567919 0.032058515 0.032058682 -0.069567919 0.043792751 0.01173444 -0.069567919
		 0.043792751 -0.01173413 -0.069567919 0.032058515 -0.032058381 -0.069567919 0.011734232 -0.043792672 -0.069567919
		 -0.011734231 -0.043792672 -0.069567919 -0.032058515 -0.032058381 -0.069567919 -0.043792751 -0.011734133 -0.069567919
		 -0.043792751 0.011734437 -0.069567919 -0.054431021 0.017685808 -0.00664258 -0.046301782 0.033640258 -0.00664258
		 -0.033640206 0.046301872 -0.00664258 -0.017685711 0.054431114 -0.00664258 -1.6874012e-16 0.057232421 -0.00664258
		 0.017685711 0.054431096 -0.00664258 0.033640206 0.046301834 -0.00664258 0.046301782 0.033640217 -0.00664258
		 0.054431021 0.017685784 -0.00664258 0.057232141 0 -0.00664258 0.054431021 -0.017685479 -0.00664258
		 0.046301782 -0.03364021 -0.00664258 0.033640206 -0.046301655 -0.00664258 0.017685711 -0.054430887 -0.00664258
		 1.7056504e-09 -0.057232048 -0.00664258 -0.017685682 -0.054430846 -0.00664258 -0.033640206 -0.046301626 -0.00664258
		 -0.046301723 -0.033640191 -0.00664258 -0.054430962 -0.01768546 -0.00664258 -0.057232141 8.9913357e-09 -0.00664258
		 0.046301782 0.033640217 -0.051350832 0.033640206 0.046301853 -0.051350832 0.017685711 0.054431133 -0.051350832
		 -1.6326495e-16 0.057232399 -0.051350832 -0.017685711 0.054431133 -0.051350832 -0.033640206 0.046301853 -0.051350832
		 -0.046301782 0.033640217 -0.051350832 -0.054431021 0.017685808 -0.051350832 -0.057232141 0 -0.051350832
		 -0.054430962 -0.017685503 -0.051350832 -0.046301723 -0.033640221 -0.051350832 -0.033640206 -0.046301547 -0.051350832
		 -0.017685711 -0.05443082 -0.051350832 1.7056506e-09 -0.057231933 -0.051350832 0.017685711 -0.05443082 -0.051350832
		 0.033640206 -0.0463017 -0.051350832 0.046301782 -0.033640221 -0.051350832 0.054431021 -0.017685503 -0.051350832
		 0.057232141 0 -0.051350832 0.054431021 0.017685808 -0.051350832 -0.050676048 0.01646571 -0.065121889
		 -0.053688109 0.017444581 -0.06434989 -0.054431021 0.017685808 -0.062487841 -0.043107569 0.031319562 -0.065121889
		 -0.045669854 0.033181243 -0.06434989 -0.046301782 0.033640217 -0.062487841 -0.031319499 0.043107748 -0.065121889
		 -0.033181071 0.045669936 -0.06434989 -0.033640206 0.046301853 -0.062487841 -0.016465634 0.050676156 -0.065121889
		 -0.017444313 0.053688116 -0.06434989 -0.017685711 0.054431133 -0.062487841 6.5485892e-09 0.053284079 -0.065121889
		 -8.0256635e-11 0.056451175 -0.06434989 -1.6190107e-16 0.057232399 -0.062487841 0.016465634 0.050676156 -0.065121889
		 0.017444313 0.053688116 -0.06434989 0.017685711 0.054431133 -0.062487841 0.031319499 0.043107595 -0.065121889
		 0.033181071 0.045669783 -0.06434989 0.033640206 0.046301853 -0.062487841 0.043107569 0.031319562 -0.065121889
		 0.045669794 0.033181243 -0.06434989 0.046301782 0.033640217 -0.062487841 0.050676048 0.01646571 -0.065121889
		 0.053688109 0.017444581 -0.06434989 0.054431021 0.017685808 -0.062487841 0.05328393 0 -0.065121889
		 0.056450963 0 -0.06434989 0.057232141 0 -0.062487841 0.050676048 -0.01646556 -0.065121889
		 0.053688109 -0.017444275 -0.06434989 0.054431021 -0.017685503 -0.062487841 0.043107569 -0.031319257 -0.065121889
		 0.045669794 -0.033180937 -0.064350367 0.046301782 -0.033640221 -0.062487841;
	setAttr ".vt[166:331]" 0.031319499 -0.043107443 -0.065121889 0.033181071 -0.04566963 -0.06434989
		 0.033640206 -0.0463017 -0.062487841 0.016465634 -0.050675854 -0.065121889 0.017444313 -0.053687956 -0.064350367
		 0.017685711 -0.05443082 -0.062487841 8.8276266e-09 -0.053283766 -0.065121889 1.7933334e-09 -0.056450862 -0.06434989
		 1.7056506e-09 -0.057231933 -0.062487841 -0.016465634 -0.050675854 -0.065121889 -0.017444313 -0.053687956 -0.06434989
		 -0.017685711 -0.05443082 -0.062487841 -0.031319499 -0.043107443 -0.065121889 -0.033181071 -0.04566963 -0.064350367
		 -0.033640206 -0.046301547 -0.062487841 -0.043107569 -0.031319257 -0.065121889 -0.045669794 -0.033180937 -0.06434989
		 -0.046301723 -0.033640221 -0.062487841 -0.050675988 -0.01646556 -0.065121889 -0.053688049 -0.017444275 -0.06434989
		 -0.054430962 -0.017685503 -0.062487841 -0.05328387 0 -0.065121889 -0.056450963 0 -0.06434989
		 -0.057232141 0 -0.062487841 -0.054431021 0.017685808 -0.0016739368 -0.046301782 0.033640258 -0.0016739368
		 -0.033640206 0.046301872 -0.0016739368 -0.017685711 0.054431114 -0.0016739368 -1.6934861e-16 0.057232421 -0.0016739368
		 0.017685711 0.054431096 -0.0016739368 0.033640206 0.046301834 -0.0016739368 0.046301782 0.033640217 -0.0016739368
		 0.054431021 0.01768579 -0.0016739368 0.057232141 0 -0.0016739368 0.054431021 -0.017685473 -0.0016739368
		 0.046301782 -0.03364021 -0.0016739368 0.033640206 -0.046301663 -0.0016739368 0.017685711 -0.054430887 -0.0016739368
		 1.7056504e-09 -0.057232048 -0.0016739368 -0.017685682 -0.054430846 -0.0016739368
		 -0.033640206 -0.046301626 -0.0016739368 -0.046301723 -0.033640198 -0.0016739368 -0.054430962 -0.017685466 -0.0016739368
		 -0.057232141 9.5907495e-09 -0.0016739368 -0.046672404 0.015164916 -0.0016739368 -0.039701939 0.028845185 -0.0016739368
		 -0.028845131 0.039701995 -0.0016739368 -0.015164778 0.04667259 -0.0016739368 -1.1660596e-09 0.049074501 -0.0016739368
		 0.015164778 0.04667259 -0.0016739368 0.028845131 0.039701976 -0.0016739368 0.039701939 0.028845148 -0.0016739368
		 0.046672404 0.01516486 -0.0016739368 0.049074233 0 -0.0016739368 0.046672404 -0.015164564 -0.0016739368
		 0.039701879 -0.028845131 -0.0016739368 0.028845131 -0.039701786 -0.0016739368 0.015164778 -0.046672247 -0.0016739368
		 5.0078484e-09 -0.049074158 -0.0016739368 -0.015164763 -0.04667218 -0.0016739368 -0.028845102 -0.039701737 -0.0016739368
		 -0.039701879 -0.028845111 -0.0016739368 -0.046672344 -0.015164535 -0.0016739368 -0.049074233 2.8772263e-08 -0.0016739368
		 -0.046669424 0.015164284 -0.061715841 -0.039701402 0.028845148 -0.061715841 -0.02884537 0.039702341 -0.061715841
		 -0.015164778 0.04667259 -0.061715841 -1.1660594e-09 0.049074575 -0.061715841 0.015164778 0.04667259 -0.061715841
		 0.028845131 0.039702035 -0.061715841 0.0397017 0.028845148 -0.061715841 0.046670437 0.01516459 -0.061715841
		 0.049070895 1.5345205e-07 -0.061715841 0.046670854 -0.015164286 -0.061715841 0.0397017 -0.028844843 -0.061715841
		 0.028845072 -0.039701883 -0.061715841 0.015164971 -0.046672598 -0.061715841 2.7348989e-08 -0.049073964 -0.061715841
		 -0.015164837 -0.046672288 -0.061715841 -0.028844506 -0.039701268 -0.061715841 -0.039701939 -0.028844535 -0.061715841
		 -0.046673954 -0.015165207 -0.061715841 -0.049072921 -3.069041e-07 -0.061715841 -0.04199487 0.013645723 -0.067228079
		 -0.035724878 0.02595718 -0.067228079 -0.025956482 0.035726398 -0.067228079 -0.013646096 0.04199829 -0.067228079
		 4.0054147e-08 0.044159662 -0.067228079 0.013646111 0.04199829 -0.067228079 0.025956362 0.035725936 -0.067228079
		 0.035725474 0.025956873 -0.067228079 0.041995943 0.01364649 -0.067228079 0.044155955 0 -0.067228079
		 0.041996419 -0.013646338 -0.067228079 0.035725474 -0.025956262 -0.067228079 0.025956213 -0.03572594 -0.067228079
		 0.013646364 -0.041998599 -0.067228079 1.611902e-07 -0.044159204 -0.067228079 -0.013645947 -0.04199829 -0.067228079
		 -0.025955588 -0.035725173 -0.067228079 -0.03572613 -0.02595534 -0.067228079 -0.041999996 -0.013646645 -0.067228079
		 -0.044158041 -1.5345205e-06 -0.067228079 -2.387801e-07 0 -0.22934985 -0.030138522 0.045578152 -0.010237932
		 -0.016868681 0.051916666 -0.010237455 -0.016868681 0.051916666 -0.047755957 -0.030138522 0.045578174 -0.047755957
		 1.1641516e-10 0.054588314 -0.010237455 -1.637052e-16 0.054588344 -0.047755957 0.016868711 0.051916659 -0.010237932
		 0.016868711 0.051916666 -0.047755957 0.030138522 0.045578048 -0.010237932 0.030138522 0.045578018 -0.047755957
		 0.045577884 0.030138638 -0.010237932 0.05191654 0.016868973 -0.010237932 0.05191654 0.016868982 -0.047756433
		 0.045577884 0.030138595 -0.047756433 0.054588258 0 -0.010237932 0.054588258 0 -0.047756672
		 0.05191654 -0.01686864 -0.010237455 0.05191654 -0.016868677 -0.047755957 0.045577884 -0.03013831 -0.010237455
		 0.045577884 -0.03013829 -0.047755957 0.030138493 -0.045577735 -0.010237455 0.016868681 -0.051916432 -0.010237455
		 0.016868681 -0.051916353 -0.047755957 0.030138493 -0.045577712 -0.047755957 1.9790602e-09 -0.054588087 -0.010238171
		 2.4447215e-09 -0.054588106 -0.047755957 -0.016868681 -0.051916409 -0.010237455 -0.016868711 -0.051916353 -0.047755957
		 -0.030138493 -0.045577697 -0.010237455 -0.030138493 -0.045577712 -0.047755957 -0.045577884 -0.03013829 -0.010237932
		 -0.05191648 -0.016868621 -0.010238171 -0.05191648 -0.016868677 -0.047755957 -0.045577884 -0.03013829 -0.047756433
		 -0.054588258 1.9181499e-08 -0.010237932 -0.054588258 0 -0.047755957 -0.05191654 0.016868982 -0.010237455
		 -0.05191654 0.016868982 -0.047755957 -0.045577884 0.030138677 -0.010237455 -0.045577943 0.030138595 -0.047755957
		 -0.039827622 0.039827652 -0.072695017 -0.014577923 0.054405756 -0.072695017 0.014577922 0.054405756 -0.072695017
		 0.039827622 0.039827652 -0.072695017 0.054405548 0.014578092 -0.072695017 0.054405548 -0.014577785 -0.072695017
		 0.039827622 -0.039827503 -0.072695017 0.014577923 -0.05440544 -0.072695017 -0.014577922 -0.05440544 -0.072695017
		 -0.039827622 -0.039827503 -0.072695017 -0.054405548 -0.014577787 -0.072695017 -0.054405548 0.01457809 -0.072695017
		 -0.039827622 0.039827652 -0.082695246 -0.014577923 0.054405756 -0.082695246 0.014577922 0.054405756 -0.082695246
		 0.039827622 0.039827652 -0.082695246 0.054405548 0.014578092 -0.082695246 0.054405548 -0.014577785 -0.082695246
		 0.039827622 -0.039827503 -0.082695246 0.014577923 -0.05440544 -0.082695246 -0.014577922 -0.05440544 -0.082695246;
	setAttr ".vt[332:497]" -0.039827622 -0.039827503 -0.082695246 -0.054405548 -0.014577787 -0.082695246
		 -0.054405548 0.01457809 -0.082695246 -0.03174755 0.031747609 -0.072695017 -0.011620412 0.043367952 -0.072695017
		 0.011620411 0.043367952 -0.072695017 0.03174755 0.031747609 -0.072695017 0.043367963 0.011620641 -0.072695017
		 0.043367963 -0.011620332 -0.072695017 0.031747546 -0.031747311 -0.072695017 0.011620412 -0.043367803 -0.072695017
		 -0.011620411 -0.043367803 -0.072695017 -0.03174755 -0.031747304 -0.072695017 -0.043367963 -0.011620333 -0.072695017
		 -0.043367963 0.011620639 -0.072695017 -0.030369297 0.03036942 -0.082695246 -0.011115936 0.041485261 -0.082695246
		 0.011115935 0.041485261 -0.082695246 0.030369299 0.03036942 -0.082695246 0.041485235 0.011116136 -0.082695246
		 0.041485235 -0.011115827 -0.082695246 0.030369295 -0.030369125 -0.082695246 0.011115936 -0.041485108 -0.082695246
		 -0.011115935 -0.041485108 -0.082695246 -0.030369299 -0.030369116 -0.082695246 -0.041485235 -0.011115829 -0.082695246
		 -0.041485235 0.011116134 -0.082695246 -0.051533807 0.02134607 -0.086600065 -0.039442267 0.039442211 -0.086600065
		 -0.021346018 0.051533997 -0.086600065 -2.826024e-08 0.055780016 -0.086600065 0.021345967 0.051534072 -0.086600065
		 0.039442237 0.039442308 -0.086600065 0.051533788 0.02134621 -0.086600065 0.05577977 4.7624042e-08 -0.086600065
		 0.051533803 -0.021345809 -0.086600065 0.03944226 -0.0394421 -0.086600065 0.021346005 -0.051533729 -0.086600065
		 8.3118339e-09 -0.055779699 -0.086600065 -0.02134599 -0.051533606 -0.086600065 -0.039442249 -0.039442115 -0.086600065
		 -0.051533796 -0.021345867 -0.086600065 -0.05577977 -3.7330778e-09 -0.086600065 -0.051533803 0.02134607 -0.12588954
		 -0.039442267 0.039442211 -0.12588954 -0.021346018 0.051533997 -0.12588954 -2.826024e-08 0.055780016 -0.12588954
		 0.021345966 0.051534064 -0.12588954 0.039442237 0.039442308 -0.12588954 0.051533788 0.021346204 -0.12588954
		 0.05577977 4.7624042e-08 -0.12588954 0.0515338 -0.021345809 -0.12588954 0.03944226 -0.0394421 -0.12588954
		 0.021346005 -0.051533721 -0.12588954 8.311833e-09 -0.055779699 -0.12588954 -0.02134599 -0.051533595 -0.12588954
		 -0.039442249 -0.039442107 -0.12588954 -0.051533796 -0.021345861 -0.12588954 -0.05577977 -3.7330778e-09 -0.12588954
		 -0.035589214 0.014741751 -0.12588954 -0.027238809 0.027238807 -0.12588954 -0.014741547 0.03558946 -0.12588954
		 -1.9516508e-08 0.038521543 -0.12588954 0.014741511 0.035589203 -0.12588954 0.02723879 0.027238868 -0.12588954
		 0.035589203 0.014741538 -0.12588954 0.038521476 3.2889119e-08 -0.12588954 0.035589214 -0.014741478 -0.12588954
		 0.027238803 -0.027238525 -0.12588954 0.014741537 -0.035589024 -0.12588954 5.7401475e-09 -0.038521394 -0.12588954
		 -0.014741527 -0.035589051 -0.12588954 -0.027238794 -0.027238525 -0.12588954 -0.035589211 -0.014741511 -0.12588954
		 -0.038521476 -2.5780622e-09 -0.12588954 -0.035589214 0.014741751 -0.12962842 -0.027238809 0.027238807 -0.12962842
		 -0.014741547 0.03558946 -0.12962842 -1.9516508e-08 0.038521543 -0.12962842 0.014741511 0.035589203 -0.12962842
		 0.02723879 0.027238868 -0.12962842 0.035589203 0.014741538 -0.12962842 0.038521476 3.2889119e-08 -0.12962842
		 0.035589214 -0.014741478 -0.12962842 0.027238803 -0.027238525 -0.12962842 0.014741537 -0.035589024 -0.12962842
		 5.7401475e-09 -0.038521394 -0.12962842 -0.014741527 -0.035589051 -0.12962842 -0.027238794 -0.027238525 -0.12962842
		 -0.035589211 -0.014741511 -0.12962842 -0.038521476 -2.5780622e-09 -0.12962842 -0.042941555 0.01778714 -0.086600065
		 -0.032866042 0.032866083 -0.086600065 -0.017786989 0.0429416 -0.086600065 -2.3548399e-08 0.046479713 -0.086600065
		 0.017786946 0.042941675 -0.086600065 0.03286602 0.032866158 -0.086600065 0.04294154 0.017787259 -0.086600065
		 0.046479587 3.9683655e-08 -0.086600065 0.042941555 -0.017786872 -0.086600065 0.032866035 -0.032865804 -0.086600065
		 0.017786978 -0.04294135 -0.086600065 6.9259989e-09 -0.046479408 -0.086600065 -0.017786965 -0.042941369 -0.086600065
		 -0.032866027 -0.032865822 -0.086600065 -0.042941548 -0.01778692 -0.086600065 -0.046479587 -3.1106708e-09 -0.086600065
		 -0.042941555 0.01778714 -0.068684816 -0.032866042 0.032866083 -0.068684816 -0.017786989 0.0429416 -0.068684816
		 -2.3548399e-08 0.046479713 -0.068684816 0.017786946 0.042941675 -0.068684816 0.03286602 0.032866158 -0.068684816
		 0.04294154 0.017787259 -0.068684816 0.046479587 3.9683655e-08 -0.068684816 0.042941555 -0.017786872 -0.068684816
		 0.032866035 -0.032865804 -0.068684816 0.017786978 -0.04294135 -0.068684816 6.9259989e-09 -0.046479408 -0.068684816
		 -0.017786965 -0.042941369 -0.068684816 -0.032866027 -0.032865822 -0.068684816 -0.042941548 -0.01778692 -0.068684816
		 -0.046479587 -3.1106708e-09 -0.068684816 0.038627006 0.01600218 -0.12962842 0.02956384 0.029566152 -0.12962842
		 0.015999846 0.038629472 -0.12962842 -1.5367871e-16 0.041812163 -0.12962842 -1.5367871e-16 -0.041807041 -0.12962842
		 0.01599982 -0.038624533 -0.12962842 0.02956382 -0.029561233 -0.12962842 0.038626995 -0.015997281 -0.12962842
		 0.041809551 2.3292114e-06 -0.12962842 0.05145216 0.021312421 -0.1612041 0.039379794 0.039379872 -0.1612041
		 0.021312207 0.051452428 -0.1612041 -1.4981179e-16 0.05569154 -0.1612041 -1.4981179e-16 -0.055691246 -0.1612041
		 0.021312173 -0.051451977 -0.1612041 0.039379772 -0.039379641 -0.1612041 0.051452149 -0.021312203 -0.1612041
		 0.05569141 9.2967412e-11 -0.1612041 0.039594792 0.0164009 -0.1612041 0.039594792 -0.016400669 -0.1612041
		 0.03030454 -0.030304305 -0.1612041 0.016400693 -0.039594688 -0.1612041 0.016400721 0.039594963 -0.1612041
		 0.030304557 0.030304559 -0.1612041 0.043633409 0.018073792 -0.1612041 0.033395573 0.03339579 -0.1612041
		 0.01807357 0.043633599 -0.1612041 -1.4981179e-16 0.047228523 -0.1612041 -1.4981179e-16 -0.047228388 -0.1612041
		 0.018073538 -0.043633312 -0.1612041 0.033395559 -0.033395551 -0.1612041 0.043633394 -0.018073549 -0.1612041
		 0.047228452 -1.144187e-09 -0.1612041 0.046797246 0.0021678321 -0.1612041 0.04253681 0.0016103064 -0.1612041
		 0.046792578 -0.0021912328 -0.1612041 0.042532139 -0.0016333984 -0.1612041 0.0024024516 -0.046707906 -0.1612041
		 0.0018448366 -0.042447407 -0.1612041 -1.5302655e-16 0.041793603 -0.13495374 -1.530266e-16 -0.041783247 -0.13495326
		 0.0018056561 -0.041382596 -0.13495374 0.038596075 -0.015984565 -0.13495326;
	setAttr ".vt[498:663]" 0.029540157 -0.02953776 -0.13495326 0.015987013 -0.038593583 -0.13495326
		 0.04144901 -0.0015954268 -0.13495326 0.041766826 2.3292077e-06 -0.13495326 0.041453563 0.0015773962 -0.13495326
		 0.038585462 0.015985195 -0.13495326 0.029532041 0.029534617 -0.13495326 0.015982637 0.038587894 -0.13495326
		 0.0018029967 0.041438516 -0.13495326 0.0018448648 0.042502984 -0.1612041 0.0024024826 0.046763189 -0.1612041
		 -1.5302522e-16 0.044506654 -0.1349647 0.0018190276 0.044151317 -0.1349647 -1.5302533e-16 -0.044332825 -0.13496375
		 0.0017869665 -0.043932326 -0.13496423 0.043998718 -0.0016446833 -0.13496184 0.044316527 2.3270161e-06 -0.13496184
		 0.044003267 0.0016266481 -0.13496184 -0.038627006 0.01600218 -0.12962842 -0.02956384 0.029566152 -0.12962842
		 -0.015999846 0.038629472 -0.12962842 -0.01599982 -0.038624533 -0.12962842 -0.02956382 -0.029561233 -0.12962842
		 -0.038626995 -0.015997281 -0.12962842 -0.041809551 2.3292114e-06 -0.12962842 -0.05145216 0.021312421 -0.1612041
		 -0.039379794 0.039379872 -0.1612041 -0.021312207 0.051452428 -0.1612041 -0.021312173 -0.051451977 -0.1612041
		 -0.039379772 -0.039379641 -0.1612041 -0.051452149 -0.021312203 -0.1612041 -0.05569141 9.2967412e-11 -0.1612041
		 -0.039594792 0.0164009 -0.1612041 -0.039594792 -0.016400669 -0.1612041 -0.03030454 -0.030304305 -0.1612041
		 -0.016400693 -0.039594688 -0.1612041 -0.016400721 0.039594963 -0.1612041 -0.030304557 0.030304559 -0.1612041
		 -0.043633409 0.018073792 -0.1612041 -0.033395573 0.03339579 -0.1612041 -0.01807357 0.043633599 -0.1612041
		 -0.018073538 -0.043633312 -0.1612041 -0.033395559 -0.033395551 -0.1612041 -0.043633394 -0.018073549 -0.1612041
		 -0.047228452 -1.144187e-09 -0.1612041 -0.046797246 0.0021678321 -0.1612041 -0.04253681 0.0016103064 -0.1612041
		 -0.046792578 -0.0021912328 -0.1612041 -0.042532139 -0.0016333984 -0.1612041 -0.0024024516 -0.046707906 -0.1612041
		 -0.0018448366 -0.042447407 -0.1612041 -0.0018056561 -0.041382596 -0.13495374 -0.038596075 -0.015984565 -0.13495326
		 -0.029540157 -0.02953776 -0.13495326 -0.015987013 -0.038593583 -0.13495326 -0.04144901 -0.0015954268 -0.13495326
		 -0.041766826 2.3292077e-06 -0.13495326 -0.041453563 0.0015773962 -0.13495326 -0.038585462 0.015985195 -0.13495326
		 -0.029532041 0.029534617 -0.13495326 -0.015982637 0.038587894 -0.13495326 -0.0018029967 0.041438516 -0.13495326
		 -0.0018448648 0.042502984 -0.1612041 -0.0024024826 0.046763189 -0.1612041 -0.0018190276 0.044151317 -0.1349647
		 -0.0017869665 -0.043932326 -0.13496423 -0.043998718 -0.0016446833 -0.13496184 -0.044316527 2.3270161e-06 -0.13496184
		 -0.044003267 0.0016266481 -0.13496184 0.044575363 0.018463854 -0.24432206 0.034116518 0.034116618 -0.24432206
		 0.01846374 0.044575382 -0.24432206 -1.3963279e-16 0.048248276 -0.24432206 -1.3963279e-16 -0.048247818 -0.24432206
		 0.01846371 -0.044575259 -0.24432206 0.034116495 -0.034116372 -0.24432206 0.044575352 -0.018463625 -0.24432206
		 0.048248008 -4.6368598e-10 -0.24432206 -1.3963279e-16 -4.6972559e-10 -0.24432206
		 0.05145216 0.021312421 -0.21274638 0.039379794 0.039379872 -0.21274638 0.021312207 0.051452428 -0.21274638
		 -1.434997e-16 0.05569154 -0.21274638 -1.434997e-16 -0.055691246 -0.21274638 0.021312173 -0.051451977 -0.21274638
		 0.039379772 -0.039379641 -0.21274638 0.051452149 -0.021312203 -0.21274638 0.05569141 9.2967412e-11 -0.21274638
		 0.044462308 0.01841696 -0.21274638 0.044462308 -0.018416731 -0.21274638 0.034029976 -0.034029882 -0.21274638
		 0.018416883 -0.044462234 -0.21274638 0.018416915 0.044462353 -0.21274638 0.034029994 0.034030128 -0.21274638
		 0.048997402 0.020295504 -0.21274638 0.037501 0.037501179 -0.21274638 0.020295413 0.048997499 -0.21274638
		 -1.434997e-16 0.053034481 -0.21274638 -1.434997e-16 -0.053034183 -0.21274638 0.020295378 -0.048997208 -0.21274638
		 0.037500981 -0.037500795 -0.21274638 0.048997391 -0.020295272 -0.21274638 0.053034399 -1.0581402e-10 -0.21274638
		 0.052550185 0.0024343752 -0.21274638 0.047765996 0.0018080923 -0.21274638 0.05254494 -0.002460612 -0.21274638
		 0.047760751 -0.0018343267 -0.21274638 0.0026977928 -0.0524498 -0.21274638 0.0020716283 -0.047665566 -0.21274638
		 -1.4028495e-16 0.048227012 -0.23899674 -1.402849e-16 -0.048220217 -0.23899722 0.0020837178 -0.047758028 -0.23899674
		 0.044539671 -0.018448904 -0.23899722 0.034089189 -0.034089036 -0.23899722 0.01844893 -0.044539571 -0.23899722
		 0.047831945 -0.0018435866 -0.23899722 0.0481987 -4.6746607e-10 -0.23899722 0.047837198 0.001817657 -0.23899722
		 0.044527423 0.018444039 -0.23899722 0.034079824 0.03407985 -0.23899722 0.018443881 0.044527467 -0.23899722
		 0.0020806489 0.047817018 -0.23899722 0.00207166 0.047727853 -0.21274638 0.0026978275 0.052512109 -0.21274638
		 -1.4028627e-16 0.051357709 -0.23898578 0.0020991485 0.05094767 -0.23898578 -1.4028617e-16 -0.051162694 -0.23898673
		 0.00206215 -0.050700355 -0.23898625 0.050774291 -0.0019007702 -0.23898864 0.051141042 -2.9971119e-09 -0.23898864
		 0.050779544 0.0018745287 -0.23898864 -0.044575363 0.018463854 -0.24432206 -0.034116518 0.034116618 -0.24432206
		 -0.01846374 0.044575382 -0.24432206 -0.01846371 -0.044575259 -0.24432206 -0.034116495 -0.034116372 -0.24432206
		 -0.044575352 -0.018463625 -0.24432206 -0.048248008 -4.6368598e-10 -0.24432206 -0.05145216 0.021312421 -0.21274638
		 -0.039379794 0.039379872 -0.21274638 -0.021312207 0.051452428 -0.21274638 -0.021312173 -0.051451977 -0.21274638
		 -0.039379772 -0.039379641 -0.21274638 -0.051452149 -0.021312203 -0.21274638 -0.05569141 9.2967412e-11 -0.21274638
		 -0.044462308 0.01841696 -0.21274638 -0.044462308 -0.018416731 -0.21274638 -0.034029976 -0.034029882 -0.21274638
		 -0.018416883 -0.044462234 -0.21274638 -0.018416915 0.044462353 -0.21274638 -0.034029994 0.034030128 -0.21274638
		 -0.048997402 0.020295504 -0.21274638 -0.037501 0.037501179 -0.21274638 -0.020295413 0.048997499 -0.21274638
		 -0.020295378 -0.048997208 -0.21274638 -0.037500981 -0.037500795 -0.21274638 -0.048997391 -0.020295272 -0.21274638
		 -0.053034399 -1.0581402e-10 -0.21274638 -0.052550185 0.0024343752 -0.21274638 -0.047765996 0.0018080923 -0.21274638
		 -0.05254494 -0.002460612 -0.21274638 -0.047760751 -0.0018343267 -0.21274638 -0.0026977928 -0.0524498 -0.21274638
		 -0.0020716283 -0.047665566 -0.21274638 -0.0020837178 -0.047758028 -0.23899674 -0.044539671 -0.018448904 -0.23899722;
	setAttr ".vt[664:829]" -0.034089189 -0.034089036 -0.23899722 -0.01844893 -0.044539571 -0.23899722
		 -0.047831945 -0.0018435866 -0.23899722 -0.0481987 -4.6746607e-10 -0.23899722 -0.047837198 0.001817657 -0.23899722
		 -0.044527423 0.018444039 -0.23899722 -0.034079824 0.03407985 -0.23899722 -0.018443881 0.044527467 -0.23899722
		 -0.0020806489 0.047817018 -0.23899722 -0.00207166 0.047727853 -0.21274638 -0.0026978275 0.052512109 -0.21274638
		 -0.0020991485 0.05094767 -0.23898578 -0.00206215 -0.050700355 -0.23898625 -0.050774291 -0.0019007702 -0.23898864
		 -0.051141042 -2.9971119e-09 -0.23898864 -0.050779544 0.0018745287 -0.23898864 0.021310717 0.021313155 -0.12962842
		 0.011533288 0.027846357 -0.12962842 0.011533268 -0.027841419 -0.12962842 0.021310704 -0.021308223 -0.12962842
		 0.027843785 -0.01153085 -0.12962842 0.027843788 0.011535775 -0.12962842 0.030137885 2.3295859e-06 -0.12962842
		 -1.5367871e-16 -0.030135317 -0.12962842 -1.5367871e-16 0.030140283 -0.12962842 -0.021310717 0.021313155 -0.12962842
		 -0.011533288 0.027846357 -0.12962842 -0.011533268 -0.027841419 -0.12962842 -0.021310704 -0.021308223 -0.12962842
		 -0.027843785 -0.01153085 -0.12962842 -0.027843788 0.011535775 -0.12962842 -0.030137885 2.3295859e-06 -0.12962842
		 0.055101842 -0.0066100233 -0.011401892 0.055101782 0.0066104075 -0.011401892 0.066788912 -0.0070000221 -0.045786858
		 0.066788912 0.0070000221 -0.045786858 0.055101752 0.0070000221 -0.045786858 0.055101812 -0.0069999453 -0.045786858
		 0.066788912 -0.0057216128 -0.051786184 0.066788971 0.0057219202 -0.051786184 0.058733046 0.0057219584 -0.051786184
		 0.058733046 -0.005721651 -0.051786184 0.058733046 0.0057219584 -0.093059063 0.058733046 -0.005721651 -0.093059063
		 0.058733046 0.0057219584 -0.09769392 0.058733046 -0.005721651 -0.09769392 0.058733046 -0.005721651 -0.099109173
		 0.05939883 -0.0057216706 -0.10119867 0.061071694 -0.0057216706 -0.1021173 0.058733046 0.0057219584 -0.099109173
		 0.061071694 0.0057219779 -0.1021173 0.05939883 0.0057219779 -0.10119867 0.068005741 -0.0057216128 -0.09991169
		 0.06352371 -0.0057216897 -0.10243368 0.066295803 -0.0057216128 -0.10180068 0.068005741 0.0057219202 -0.09991169
		 0.066295803 0.0057219202 -0.10180068 0.06352371 0.0057219965 -0.10243368 0.066996157 -0.0057216128 -0.09769392
		 0.068576038 -0.0057216128 -0.097690344 0.068050086 -0.0057216128 -0.095499992 0.066996157 0.0057219202 -0.09769392
		 0.068050086 0.0057219202 -0.095499992 0.068576038 0.0057219202 -0.097690344 0.066788912 -0.0057216128 -0.093059063
		 0.066788971 0.0057219202 -0.093059063 0.055101812 -0.0069999453 -0.026937246 0.055101752 0.0070000221 -0.026937246
		 0.066788912 0.0070000221 -0.026937246 0.066788912 -0.0070000221 -0.026937246 0.059227973 -0.0066561359 -0.013241768
		 0.05810836 -0.0066227601 -0.011903048 0.056436867 -0.0066100233 -0.011401892 0.059228033 0.0066564432 -0.013241768
		 0.056436926 0.0066103307 -0.011401892 0.05810836 0.0066230674 -0.011903048 -0.055101842 -0.0066100233 -0.011401892
		 -0.055101782 0.0066104075 -0.011401892 -0.066788912 -0.0070000221 -0.045786858 -0.066788912 0.0070000221 -0.045786858
		 -0.055101752 0.0070000221 -0.045786858 -0.055101812 -0.0069999453 -0.045786858 -0.066788912 -0.0057216128 -0.051786184
		 -0.066788971 0.0057219202 -0.051786184 -0.058733046 0.0057219584 -0.051786184 -0.058733046 -0.005721651 -0.051786184
		 -0.058733046 0.0057219584 -0.093059063 -0.058733046 -0.005721651 -0.093059063 -0.058733046 0.0057219584 -0.09769392
		 -0.058733046 -0.005721651 -0.09769392 -0.058733046 -0.005721651 -0.099109173 -0.05939883 -0.0057216706 -0.10119867
		 -0.061071694 -0.0057216706 -0.1021173 -0.058733046 0.0057219584 -0.099109173 -0.061071694 0.0057219779 -0.1021173
		 -0.05939883 0.0057219779 -0.10119867 -0.068005741 -0.0057216128 -0.09991169 -0.06352371 -0.0057216897 -0.10243368
		 -0.066295803 -0.0057216128 -0.10180068 -0.068005741 0.0057219202 -0.09991169 -0.066295803 0.0057219202 -0.10180068
		 -0.06352371 0.0057219965 -0.10243368 -0.066996157 -0.0057216128 -0.09769392 -0.068576038 -0.0057216128 -0.097690344
		 -0.068050086 -0.0057216128 -0.095499992 -0.066996157 0.0057219202 -0.09769392 -0.068050086 0.0057219202 -0.095499992
		 -0.068576038 0.0057219202 -0.097690344 -0.066788912 -0.0057216128 -0.093059063 -0.066788971 0.0057219202 -0.093059063
		 -0.055101812 -0.0069999453 -0.026937246 -0.055101752 0.0070000221 -0.026937246 -0.066788912 0.0070000221 -0.026937246
		 -0.066788912 -0.0070000221 -0.026937246 -0.059227973 -0.0066561359 -0.013241768 -0.05810836 -0.0066227601 -0.011903048
		 -0.056436867 -0.0066100233 -0.011401892 -0.059228033 0.0066564432 -0.013241768 -0.056436926 0.0066103307 -0.011401892
		 -0.05810836 0.0066230674 -0.011903048 -0.051106211 0.0070851017 -0.051366091 -0.052049525 0.013406117 -0.051366091
		 -0.055920813 0.0071093282 -0.051366091 -0.054924343 0.013417357 -0.051366091 -0.055998303 0.0071036215 -0.0066411495
		 -0.054972835 0.013416321 -0.0066411495 -0.051146634 0.0070850924 -0.010237455 -0.052089948 0.013406117 -0.010237455
		 -0.067780748 0.0070916908 -0.023714781 -0.067777142 0.0070922375 -0.030160189 -0.068980031 0.0071099899 -0.026937246
		 -0.067739762 0.013402021 -0.023715734 -0.068940431 0.013420349 -0.026937246 -0.067738913 0.013402331 -0.030160189
		 -0.050299536 0.019739408 -0.051366091 -0.054899327 0.013311715 -0.051366091 -0.05324284 0.019750323 -0.051366091
		 -0.053915076 0.013305998 -0.014833689 -0.053915072 0.019749297 -0.014833689 -0.050309584 0.013287479 -0.014833689
		 -0.050309587 0.019739414 -0.014833689 -0.066119172 0.013312099 -0.032804251 -0.067435205 0.013311542 -0.027193308
		 -0.064732678 0.0133102 -0.021402121 -0.05930984 0.01330806 -0.016734362 -0.065544054 0.019752163 -0.032779932
		 -0.059067018 0.019750284 -0.016599894 -0.064475119 0.01975178 -0.02132678 -0.067048043 0.019752242 -0.027188063
		 -0.042172775 0.013702986 -0.24869752 -0.035874307 0.026064247 -0.24869752 -0.0260642 0.03587446 -0.24869752
		 -0.013702758 0.042172823 -0.24869752 -1.3909693e-16 0.044343188 -0.24869752 0.013702758 0.042172823 -0.24869752
		 0.026064191 0.035874411 -0.24869752 0.035874277 0.026064217 -0.24869752 0.042172741 0.013702975 -0.24869752
		 0.044343043 0 -0.24869752 0.042172741 -0.013702669 -0.24869752 0.035874274 -0.026063908 -0.24869752
		 0.026064187 -0.035874087 -0.24869752 0.013702756 -0.042172633 -0.24869752 1.3215254e-09 -0.044342846 -0.24869752
		 -0.01370275 -0.042172633 -0.24869752 -0.02606418 -0.035874076 -0.24869752;
	setAttr ".vt[830:979]" -0.03587427 -0.026063899 -0.24869752 -0.042172737 -0.013702657 -0.24869752
		 -0.044343039 0 -0.24869752 -0.042172775 0.013702986 -0.25715256 -0.035874307 0.026064247 -0.25715256
		 -0.0260642 0.03587446 -0.25715256 -0.013702758 0.042172823 -0.25715256 -1.3806149e-16 0.044343188 -0.25715256
		 0.013702758 0.042172823 -0.25715256 0.026064191 0.035874411 -0.25715256 0.035874277 0.026064217 -0.25715256
		 0.042172741 0.013702975 -0.25715256 0.044343043 0 -0.25715256 0.042172741 -0.013702669 -0.25715256
		 0.035874274 -0.026063908 -0.25715256 0.026064187 -0.035874087 -0.25715256 0.013702756 -0.042172633 -0.25715256
		 1.3215254e-09 -0.044342846 -0.25715256 -0.01370275 -0.042172633 -0.25715256 -0.02606418 -0.035874076 -0.25715256
		 -0.03587427 -0.026063899 -0.25715256 -0.042172737 -0.013702657 -0.25715256 -0.044343039 0 -0.25715256
		 -0.03998873 0.012993172 -0.24869752 -0.034016445 0.024714487 -0.24869752 -0.024714395 0.03401652 -0.24869752
		 -0.012993125 0.03998889 -0.24869752 -1.3909693e-16 0.042046685 -0.24869752 0.012993124 0.03998889 -0.24869752
		 0.024714386 0.03401649 -0.24869752 0.03401643 0.024714462 -0.24869752 0.039988719 0.012993149 -0.24869752
		 0.042046621 0 -0.24869752 0.039988719 -0.012992843 -0.24869752 0.034016427 -0.02471415 -0.24869752
		 0.024714382 -0.03401617 -0.24869752 0.012993121 -0.03998857 -0.24869752 1.3824317e-09 -0.042046487 -0.24869752
		 -0.012993115 -0.03998857 -0.24869752 -0.024714377 -0.034016158 -0.24869752 -0.034016423 -0.024714138 -0.24869752
		 -0.039988704 -0.012992838 -0.24869752 -0.04204661 5.8068963e-09 -0.24869752 -0.03998873 0.012993172 -0.25715256
		 -0.034016445 0.024714487 -0.25715256 -0.024714395 0.03401652 -0.25715256 -0.012993125 0.03998889 -0.25715256
		 -1.3806149e-16 0.042046685 -0.25715256 0.012993124 0.03998889 -0.25715256 0.024714386 0.03401649 -0.25715256
		 0.03401643 0.024714462 -0.25715256 0.039988719 0.012993149 -0.25715256 0.042046621 0 -0.25715256
		 0.039988719 -0.012992843 -0.25715256 0.034016427 -0.02471415 -0.25715256 0.024714382 -0.03401617 -0.25715256
		 0.012993121 -0.03998857 -0.25715256 1.3824317e-09 -0.042046487 -0.25715256 -0.012993115 -0.03998857 -0.25715256
		 -0.024714377 -0.034016158 -0.25715256 -0.034016423 -0.024714138 -0.25715256 -0.039988704 -0.012992838 -0.25715256
		 -0.04204661 5.8068963e-09 -0.25715256 0.051106211 -0.0070847948 -0.051366091 0.052049525 -0.013406118 -0.051366091
		 0.055920813 -0.0071090208 -0.051366091 0.054924343 -0.013417052 -0.051366091 0.055998303 -0.0071033142 -0.0066411495
		 0.054972835 -0.013416016 -0.0066411495 0.051146634 -0.007084785 -0.010237455 0.052089948 -0.013406118 -0.010237455
		 0.067780748 -0.0070913834 -0.023714781 0.067777142 -0.0070919301 -0.030160189 0.068980031 -0.0071096825 -0.026937246
		 0.067739762 -0.013402023 -0.023715734 0.068940431 -0.013420044 -0.026937246 0.067738913 -0.013402026 -0.030160189
		 0.050299536 -0.019739103 -0.051366091 0.054899327 -0.01331141 -0.051366091 0.05324284 -0.019750018 -0.051366091
		 0.053915076 -0.013305694 -0.014833689 0.053915072 -0.019748993 -0.014833689 0.050309584 -0.013287175 -0.014833689
		 0.050309587 -0.019739108 -0.014833689 0.066119172 -0.013311793 -0.032804251 0.067435205 -0.013311237 -0.027193308
		 0.064732678 -0.013309894 -0.021402121 0.05930984 -0.013307756 -0.016734362 0.065544054 -0.01975186 -0.032779932
		 0.059067018 -0.019750286 -0.016599894 0.064475119 -0.019751476 -0.02132678 0.067048043 -0.019752244 -0.027188063
		 0.051106211 0.0070851017 -0.051366091 0.052049525 0.013406117 -0.051366091 0.055920813 0.0071093282 -0.051366091
		 0.054924343 0.013417357 -0.051366091 0.055998303 0.0071036215 -0.0066411495 0.054972835 0.013416321 -0.0066411495
		 0.051146634 0.0070850924 -0.010237455 0.052089948 0.013406117 -0.010237455 0.067780748 0.0070916908 -0.023714781
		 0.067777142 0.0070922375 -0.030160189 0.068980031 0.0071099899 -0.026937246 0.067739762 0.013402021 -0.023715734
		 0.068940431 0.013420349 -0.026937246 0.067738913 0.013402331 -0.030160189 0.050299536 0.019739408 -0.051366091
		 0.054899327 0.013311715 -0.051366091 0.05324284 0.019750323 -0.051366091 0.053915076 0.013305998 -0.014833689
		 0.053915072 0.019749297 -0.014833689 0.050309584 0.013287479 -0.014833689 0.050309587 0.019739414 -0.014833689
		 0.066119172 0.013312099 -0.032804251 0.067435205 0.013311542 -0.027193308 0.064732678 0.0133102 -0.021402121
		 0.05930984 0.01330806 -0.016734362 0.065544054 0.019752163 -0.032779932 0.059067018 0.019750284 -0.016599894
		 0.064475119 0.01975178 -0.02132678 0.067048043 0.019752242 -0.027188063 -0.051106211 -0.0070847911 -0.051366091
		 -0.052049525 -0.013406114 -0.051366091 -0.055920813 -0.0071090232 -0.051366091 -0.054924343 -0.013417052 -0.051366091
		 -0.055998303 -0.0071033118 -0.0066411495 -0.054972835 -0.013416016 -0.0066411495
		 -0.051146634 -0.0070847897 -0.010237455 -0.052089948 -0.013406114 -0.010237455 -0.067780748 -0.0070913872 -0.023714781
		 -0.067777142 -0.0070919278 -0.030160189 -0.068980031 -0.0071096825 -0.026937246 -0.067739762 -0.013402021 -0.023715734
		 -0.068940431 -0.013420047 -0.026937246 -0.067738913 -0.013402028 -0.030160189 -0.050299536 -0.019739103 -0.051366091
		 -0.054899327 -0.01331141 -0.051366091 -0.05324284 -0.019750018 -0.051366091 -0.053915076 -0.013305694 -0.014833689
		 -0.053915072 -0.019748993 -0.014833689 -0.050309584 -0.013287175 -0.014833689 -0.050309587 -0.019739108 -0.014833689
		 -0.066119172 -0.013311793 -0.032804251 -0.067435205 -0.01331124 -0.027193308 -0.064732678 -0.0133099 -0.021402121
		 -0.05930984 -0.013307756 -0.016734362 -0.065544054 -0.019751865 -0.032779932 -0.059067018 -0.019750286 -0.016599894
		 -0.064475119 -0.019751476 -0.02132678 -0.067048043 -0.019752244 -0.027188063;
	setAttr -s 1813 ".ed";
	setAttr ".ed[0:165]"  0 1 0 1 2 0 2 3 0 4 5 0 5 6 0 6 7 0 7 8 0 8 9 0 9 0 0
		 10 11 0 11 12 0 12 13 1 14 15 1 15 16 1 16 17 1 17 18 1 18 19 1 19 10 0 0 10 1 1 11 1
		 2 12 1 3 13 0 4 14 0 5 15 1 6 16 1 7 17 1 8 18 1 9 19 1 0 20 1 1 21 1 20 21 0 2 22 1
		 21 22 0 3 23 0 22 23 0 4 24 0 5 25 1 24 25 0 6 26 1 25 26 0 7 27 1 26 27 0 8 28 1
		 27 28 0 9 29 1 28 29 0 29 20 0 10 30 1 11 31 1 30 31 0 12 32 1 31 32 0 32 33 1 34 35 1
		 35 36 1 36 37 1 37 38 1 19 39 0 38 39 1 39 30 0 21 31 1 20 30 1 29 39 1 28 38 1 27 37 1
		 26 36 1 25 35 1 24 34 0 23 33 0 22 32 1 13 40 0 12 40 0 33 41 0 40 41 0 32 41 0 14 42 0
		 34 43 0 42 43 0 15 44 1 42 44 0 35 45 1 44 45 1 43 45 0 16 46 1 44 46 0 36 47 1 46 47 1
		 45 47 0 17 48 1 46 48 0 37 49 1 48 49 1 47 49 0 18 50 1 48 50 0 38 51 1 50 51 1 49 51 0
		 19 52 0 50 52 0 39 53 0 52 53 0 51 53 0 54 55 0 55 56 0 56 57 0 57 58 0 58 59 0 59 60 0
		 60 61 0 61 62 0 62 63 0 63 64 0 64 65 0 65 54 0 66 67 0 67 68 0 68 69 0 69 70 0 70 71 0
		 71 72 0 72 73 0 73 74 0 74 75 0 75 76 0 76 77 0 77 66 0 54 66 0 55 67 0 56 68 0 57 69 0
		 58 70 0 59 71 0 60 72 0 61 73 0 62 74 0 63 75 0 64 76 0 65 77 0 66 78 1 67 79 1 78 79 0
		 68 80 1 79 80 0 69 81 1 80 81 0 70 82 1 81 82 0 71 83 1 82 83 0 72 84 1 83 84 0 73 85 1
		 84 85 0 74 86 1 85 86 0 75 87 1 86 87 0 76 88 1 87 88 0 77 89 1 88 89 0 89 78 0 90 91 0
		 91 92 0 92 93 0;
	setAttr ".ed[166:331]" 93 94 0 94 95 0 95 96 0 96 97 0 97 98 0 98 99 0 99 100 0
		 100 101 0 101 102 0 102 103 0 103 104 0 104 105 0 105 106 0 106 107 0 107 108 0 108 109 0
		 109 90 0 110 111 0 111 112 0 112 113 0 113 114 0 114 115 0 115 116 0 116 117 0 117 118 0
		 118 119 0 119 120 0 120 121 0 121 122 0 122 123 0 123 124 0 124 125 0 125 126 0 126 127 0
		 127 128 0 128 129 0 129 110 0 134 133 1 133 130 0 132 135 1 135 134 1 132 131 1 189 132 1
		 131 130 1 130 187 0 137 136 1 136 133 0 135 138 1 138 137 1 140 139 1 139 136 0 138 141 1
		 141 140 1 143 142 1 142 139 0 141 144 1 144 143 1 146 145 1 145 142 0 144 147 1 147 146 1
		 149 148 1 148 145 0 147 150 1 150 149 1 152 151 1 151 148 0 150 153 1 153 152 1 155 154 1
		 154 151 0 153 156 1 156 155 1 158 157 1 157 154 0 156 159 1 159 158 1 161 160 1 160 157 0
		 159 162 1 162 161 1 164 163 1 163 160 0 162 165 1 165 164 1 167 166 1 166 163 0 165 168 1
		 168 167 1 170 169 1 169 166 0 168 171 1 171 170 1 173 172 1 172 169 0 171 174 1 174 173 1
		 176 175 1 175 172 0 174 177 1 177 176 1 179 178 1 178 175 0 177 180 1 180 179 1 182 181 1
		 181 178 0 180 183 1 183 182 1 185 184 1 184 181 0 183 186 1 186 185 1 188 187 1 187 184 0
		 186 189 1 189 188 1 110 153 1 150 111 1 147 112 1 144 113 1 141 114 1 138 115 1 135 116 1
		 132 117 1 189 118 1 186 119 1 183 120 1 180 121 1 177 122 1 174 123 1 171 124 1 168 125 1
		 165 126 1 162 127 1 159 128 1 156 129 1 131 134 1 134 137 1 137 140 1 140 143 1 143 146 1
		 146 149 1 149 152 1 152 155 1 155 158 1 158 161 1 161 164 1 164 167 1 167 170 1 170 173 1
		 173 176 1 176 179 1 179 182 1 182 185 1 185 188 1 131 188 1 90 190 1 91 191 1 190 191 0
		 92 192 1 191 192 0 93 193 1 192 193 0 94 194 1 193 194 0;
	setAttr ".ed[332:497]" 95 195 1 194 195 0 96 196 1 195 196 0 97 197 1 196 197 0
		 98 198 1 197 198 0 99 199 1 198 199 0 100 200 1 199 200 0 101 201 1 200 201 0 102 202 1
		 201 202 0 103 203 1 202 203 0 104 204 1 203 204 0 105 205 1 204 205 0 106 206 1 205 206 0
		 107 207 1 206 207 0 108 208 1 207 208 0 109 209 1 208 209 0 209 190 0 190 210 1 191 211 1
		 210 211 0 192 212 1 211 212 0 193 213 1 212 213 0 194 214 1 213 214 0 195 215 1 214 215 0
		 196 216 1 215 216 0 197 217 1 216 217 0 198 218 1 217 218 0 199 219 1 218 219 0 200 220 1
		 219 220 0 201 221 1 220 221 0 202 222 1 221 222 0 203 223 1 222 223 0 204 224 1 223 224 0
		 205 225 1 224 225 0 206 226 1 225 226 0 207 227 1 226 227 0 208 228 1 227 228 0 209 229 1
		 228 229 0 229 210 0 230 231 0 231 232 0 232 233 0 233 234 0 234 235 0 235 236 0 236 237 0
		 237 238 0 238 239 0 239 240 0 240 241 0 241 242 0 242 243 0 243 244 0 244 245 0 245 246 0
		 246 247 0 247 248 0 248 249 0 249 230 0 230 250 1 231 251 1 250 251 1 232 252 1 251 252 1
		 233 253 1 252 253 1 234 254 1 253 254 1 235 255 1 254 255 1 236 256 1 255 256 1 237 257 1
		 256 257 1 238 258 1 257 258 1 239 259 1 258 259 1 240 260 1 259 260 1 241 261 1 260 261 1
		 242 262 1 261 262 1 243 263 1 262 263 1 244 264 1 263 264 1 245 265 1 264 265 1 246 266 1
		 265 266 1 247 267 1 266 267 1 248 268 1 267 268 1 249 269 1 268 269 1 269 250 1 250 270 1
		 251 270 1 252 270 1 253 270 1 254 270 1 255 270 1 256 270 1 257 270 1 258 270 1 259 270 1
		 260 270 1 261 270 1 262 270 1 263 270 1 264 270 1 265 270 1 266 270 1 267 270 1 268 270 1
		 269 270 1 91 116 0 92 115 0 96 111 0 97 110 0 101 126 0 102 125 0 106 121 0 107 120 0
		 211 231 1 210 230 1 229 249 1 228 248 1 227 247 1 226 246 1 225 245 1;
	setAttr ".ed[498:663]" 224 244 1 223 243 1 222 242 1 221 241 1 220 240 1 219 239 1
		 218 238 1 217 237 1 216 236 1 215 235 1 214 234 1 213 233 1 212 232 1 92 271 0 93 272 1
		 271 272 0 114 273 1 272 273 1 115 274 0 273 274 0 271 274 0 94 275 1 272 275 0 113 276 1
		 275 276 1 276 273 0 95 277 1 275 277 0 112 278 1 277 278 1 278 276 0 96 279 0 277 279 0
		 111 280 0 279 280 0 280 278 0 97 281 0 98 282 1 281 282 0 129 283 1 282 283 1 110 284 0
		 283 284 0 281 284 0 99 285 1 282 285 0 128 286 1 285 286 1 286 283 0 100 287 1 285 287 0
		 127 288 1 287 288 1 288 286 0 101 289 0 287 289 0 126 290 0 289 290 0 290 288 0 102 291 0
		 103 292 1 291 292 0 124 293 1 292 293 1 125 294 0 293 294 0 291 294 0 104 295 1 292 295 0
		 123 296 1 295 296 1 296 293 0 105 297 1 295 297 0 122 298 1 297 298 1 298 296 0 106 299 0
		 297 299 0 121 300 0 299 300 0 300 298 0 107 301 0 108 302 1 301 302 0 119 303 1 302 303 1
		 120 304 0 303 304 0 301 304 0 109 305 1 302 305 0 118 306 1 305 306 1 306 303 0 90 307 1
		 305 307 0 117 308 1 307 308 1 308 306 0 91 309 0 307 309 0 116 310 0 309 310 0 310 308 0
		 311 312 0 312 313 0 313 314 0 314 315 0 315 316 0 316 317 0 317 318 0 318 319 0 319 320 0
		 320 321 0 321 322 0 322 311 0 323 324 0 324 325 0 325 326 0 326 327 0 327 328 0 328 329 0
		 329 330 0 330 331 0 331 332 0 332 333 0 333 334 0 334 323 0 311 323 0 312 324 0 313 325 0
		 314 326 0 315 327 0 316 328 0 317 329 0 318 330 0 319 331 0 320 332 0 321 333 0 322 334 0
		 311 335 1 312 336 1 335 336 0 313 337 1 336 337 0 314 338 1 337 338 0 315 339 1 338 339 0
		 316 340 1 339 340 0 317 341 1 340 341 0 318 342 1 341 342 0 319 343 1 342 343 0 320 344 1
		 343 344 0 321 345 1 344 345 0 322 346 1 345 346 0 346 335 0 323 347 1;
	setAttr ".ed[664:829]" 324 348 1 347 348 0 325 349 1 348 349 0 326 350 1 349 350 0
		 327 351 1 350 351 0 328 352 1 351 352 0 329 353 1 352 353 0 330 354 1 353 354 0 331 355 1
		 354 355 0 332 356 1 355 356 0 333 357 1 356 357 0 334 358 1 357 358 0 358 347 0 359 375 1
		 360 376 1 361 377 1 362 378 1 363 379 1 364 380 1 365 381 1 366 382 1 367 383 1 368 384 1
		 369 385 1 370 386 1 371 387 1 372 388 1 373 389 1 374 390 1 375 376 0 376 377 0 377 378 0
		 378 379 0 379 380 0 380 381 0 381 382 0 382 383 0 383 384 0 384 385 0 385 386 0 386 387 0
		 387 388 0 388 389 0 389 390 0 390 375 0 361 362 0 360 361 0 359 360 0 362 363 0 363 364 0
		 364 365 0 365 366 0 366 367 0 367 368 0 368 369 0 369 370 0 370 371 0 371 372 0 372 373 0
		 373 374 0 374 359 0 375 391 0 376 392 0 391 392 0 377 393 0 392 393 0 378 394 0 393 394 0
		 379 395 0 394 395 0 380 396 0 395 396 0 381 397 0 396 397 0 382 398 0 397 398 0 383 399 0
		 398 399 0 384 400 0 399 400 0 385 401 0 400 401 0 386 402 0 401 402 0 387 403 0 402 403 0
		 388 404 0 403 404 0 389 405 0 404 405 0 390 406 0 405 406 0 406 391 0 391 407 1 392 408 1
		 407 408 0 393 409 1 408 409 0 394 410 1 409 410 0 395 411 1 410 411 0 396 412 1 411 412 0
		 397 413 1 412 413 0 398 414 1 413 414 0 399 415 1 414 415 0 400 416 1 415 416 0 401 417 1
		 416 417 0 402 418 1 417 418 0 403 419 1 418 419 0 404 420 1 419 420 0 405 421 1 420 421 0
		 406 422 1 421 422 0 422 407 0 359 423 0 360 424 0 423 424 0 361 425 0 424 425 0 362 426 0
		 425 426 0 363 427 0 426 427 0 364 428 0 427 428 0 365 429 0 428 429 0 366 430 0 429 430 0
		 367 431 0 430 431 0 368 432 0 431 432 0 369 433 0 432 433 0 370 434 0 433 434 0 371 435 0
		 434 435 0 372 436 0 435 436 0 373 437 0 436 437 0 374 438 0 437 438 0;
	setAttr ".ed[830:995]" 438 423 0 423 439 1 424 440 1 439 440 0 425 441 1 440 441 0
		 426 442 1 441 442 0 427 443 1 442 443 0 428 444 1 443 444 0 429 445 1 444 445 0 430 446 1
		 445 446 0 431 447 1 446 447 0 432 448 1 447 448 0 433 449 1 448 449 0 434 450 1 449 450 0
		 435 451 1 450 451 0 436 452 1 451 452 0 437 453 1 452 453 0 438 454 1 453 454 0 454 439 0
		 456 457 0 460 461 0 461 462 0 464 479 0 465 480 0 466 481 0 467 482 0 468 483 0 469 484 0
		 470 485 0 471 486 0 472 487 0 465 466 0 469 470 0 470 471 0 464 465 0 455 456 0 473 503 1
		 474 497 1 475 498 1 476 499 1 477 505 1 478 504 1 474 475 0 475 476 0 477 478 0 478 473 0
		 479 473 0 480 478 0 481 477 0 484 476 0 485 475 0 486 474 0 479 480 0 480 481 0 483 492 0
		 484 485 0 485 486 0 487 488 0 473 489 0 472 464 0 488 479 0 488 489 0 463 455 0 489 502 0
		 490 487 0 490 491 0 491 500 0 471 472 0 486 490 0 491 474 0 462 463 0 476 493 0 468 469 0
		 492 484 0 492 493 0 459 460 0 493 496 0 494 458 1 495 459 1 495 496 0 497 462 1 498 461 1
		 499 460 1 497 498 0 498 499 0 501 463 1 500 501 0 501 502 0 503 455 1 504 456 1 505 457 1
		 503 504 0 504 505 0 502 503 0 497 500 0 496 499 0 494 506 0 481 508 0 457 458 0 506 505 0
		 507 477 0 506 507 0 508 482 0 507 508 0 466 467 0 494 509 0 482 509 1 506 510 0 509 510 0
		 510 508 0 495 511 0 483 511 1 496 512 0 492 512 0 511 512 0 500 513 0 501 514 0 513 514 0
		 490 513 0 487 514 1 502 515 0 488 515 0 514 515 0 463 502 1 463 500 1 459 496 1 458 506 1
		 517 518 0 519 520 0 520 521 0 523 536 0 524 537 0 525 538 0 526 539 0 527 540 0 528 541 0
		 529 542 0 524 525 0 526 527 0 527 528 0 523 524 0 516 517 0 530 556 1 531 550 1 532 551 1
		 533 552 1 534 558 1 535 557 1 531 532 0 532 533 0 534 535 0 535 530 0;
	setAttr ".ed[996:1161]" 536 530 0 537 535 0 538 534 0 539 533 0 540 532 0 541 531 0
		 536 537 0 537 538 0 483 547 0 539 540 0 540 541 0 542 543 0 530 544 0 529 523 0 543 536 0
		 543 544 0 522 516 0 544 555 0 545 542 0 545 546 0 546 553 0 528 529 0 541 545 0 546 531 0
		 521 522 0 533 548 0 468 526 0 547 539 0 547 548 0 459 519 0 548 549 0 495 549 0 550 521 1
		 551 520 1 552 519 1 550 551 0 551 552 0 554 522 1 553 554 0 554 555 0 556 516 1 557 517 1
		 558 518 1 556 557 0 557 558 0 555 556 0 550 553 0 549 552 0 494 559 0 538 561 0 518 458 0
		 559 558 0 560 534 0 559 560 0 561 482 0 560 561 0 525 467 0 559 562 0 509 562 0 562 561 0
		 549 563 0 547 563 0 511 563 0 553 564 0 554 565 0 564 565 0 545 564 0 542 565 1 555 566 0
		 543 566 0 565 566 0 522 555 1 522 553 1 459 549 1 458 559 1 568 569 0 572 573 0 573 574 0
		 464 577 1 465 578 1 466 579 1 467 580 1 468 581 1 469 582 1 470 583 1 471 584 1 472 585 1
		 567 576 0 568 576 0 569 576 0 570 576 0 571 576 0 572 576 0 573 576 0 574 576 0 575 576 0
		 577 592 0 578 593 0 579 594 0 580 595 0 581 596 0 582 597 0 583 598 0 584 599 0 585 600 0
		 578 579 0 582 583 0 583 584 0 577 578 0 567 568 0 586 616 1 587 610 1 588 611 1 589 612 1
		 590 618 1 591 617 1 587 588 0 588 589 0 590 591 0 591 586 0 592 586 0 593 591 0 594 590 0
		 597 589 0 598 588 0 599 587 0 592 593 0 593 594 0 596 605 0 597 598 0 598 599 0 600 601 0
		 586 602 0 585 577 0 601 592 0 601 602 0 575 567 0 602 615 0 603 600 0 603 604 0 604 613 0
		 584 585 0 599 603 0 604 587 0 574 575 0 589 606 0 581 582 0 605 597 0 605 606 0 571 572 0
		 606 609 0 607 570 1 608 571 1 608 609 0 610 574 1 611 573 1 612 572 1 610 611 0 611 612 0
		 614 575 1 613 614 0 614 615 0 616 567 1 617 568 1 618 569 1 616 617 0;
	setAttr ".ed[1162:1327]" 617 618 0 615 616 0 610 613 0 609 612 0 607 619 0 594 621 0
		 569 570 0 619 618 0 620 590 0 619 620 0 621 595 0 620 621 0 579 580 0 607 622 0 595 622 1
		 619 623 0 622 623 0 623 621 0 608 624 0 596 624 1 609 625 0 605 625 0 624 625 0 613 626 0
		 614 627 0 626 627 0 603 626 0 600 627 1 615 628 0 601 628 0 627 628 0 575 615 1 575 613 1
		 571 609 1 570 619 1 630 631 0 632 633 0 633 634 0 523 636 1 524 637 1 525 638 1 526 639 1
		 527 640 1 528 641 1 529 642 1 629 576 0 630 576 0 631 576 0 632 576 0 633 576 0 634 576 0
		 635 576 0 636 649 0 637 650 0 638 651 0 639 652 0 640 653 0 641 654 0 642 655 0 637 638 0
		 639 640 0 640 641 0 636 637 0 629 630 0 643 669 1 644 663 1 645 664 1 646 665 1 647 671 1
		 648 670 1 644 645 0 645 646 0 647 648 0 648 643 0 649 643 0 650 648 0 651 647 0 652 646 0
		 653 645 0 654 644 0 649 650 0 650 651 0 596 660 0 652 653 0 653 654 0 655 656 0 643 657 0
		 642 636 0 656 649 0 656 657 0 635 629 0 657 668 0 658 655 0 658 659 0 659 666 0 641 642 0
		 654 658 0 659 644 0 634 635 0 646 661 0 581 639 0 660 652 0 660 661 0 571 632 0 661 662 0
		 608 662 0 663 634 1 664 633 1 665 632 1 663 664 0 664 665 0 667 635 1 666 667 0 667 668 0
		 669 629 1 670 630 1 671 631 1 669 670 0 670 671 0 668 669 0 663 666 0 662 665 0 607 672 0
		 651 674 0 631 570 0 672 671 0 673 647 0 672 673 0 674 595 0 673 674 0 638 580 0 672 675 0
		 622 675 0 675 674 0 662 676 0 660 676 0 624 676 0 666 677 0 667 678 0 677 678 0 658 677 0
		 655 678 1 668 679 0 656 679 0 678 679 0 635 668 1 635 666 1 571 662 1 570 672 1 456 680 0
		 457 681 0 680 681 0 460 682 0 461 683 0 682 683 0 462 684 0 683 684 0 455 685 0 685 680 0
		 463 686 0 686 685 0 684 686 0 459 687 0 687 682 0 458 688 0 681 688 0;
	setAttr ".ed[1328:1493]" 517 689 0 518 690 0 689 690 0 519 691 0 520 692 0 691 692 0
		 521 693 0 692 693 0 516 694 0 694 689 0 522 695 0 695 694 0 693 695 0 687 691 0 690 688 0
		 696 697 0 696 730 0 697 731 0 698 733 0 699 732 0 700 704 0 701 705 0 698 699 1 699 700 0
		 700 701 1 701 698 0 702 698 0 703 699 0 704 706 0 705 707 0 702 703 1 703 704 0 704 705 1
		 705 702 0 706 708 0 707 709 0 706 707 1 707 728 1 708 713 0 709 710 0 708 709 1 709 722 1
		 712 717 0 714 721 0 724 728 0 722 724 1 722 716 1 725 708 1 726 729 0 725 726 1 725 719 1
		 712 714 1 713 710 1 716 719 1 721 717 1 724 726 1 712 711 0 711 715 1 715 714 0 711 710 0
		 713 715 0 716 718 0 718 720 1 720 719 0 718 717 0 721 720 0 724 723 0 723 727 1 727 726 0
		 723 716 0 719 727 0 723 722 1 727 725 1 728 702 0 729 706 1 729 703 0 729 728 0 730 701 0
		 731 700 0 732 737 0 733 734 0 730 731 1 731 732 1 732 733 0 733 730 1 736 696 0 738 697 0
		 736 738 1 737 734 1 736 735 0 735 739 1 739 738 0 735 734 0 737 739 0 740 741 0 740 774 0
		 741 775 0 742 777 0 743 776 0 744 748 0 745 749 0 742 743 1 743 744 0 744 745 1 745 742 0
		 746 742 0 747 743 0 748 750 0 749 751 0 746 747 1 747 748 0 748 749 1 749 746 0 750 752 0
		 751 753 0 750 751 1 751 772 1 752 757 0 753 754 0 752 753 1 753 766 1 756 761 0 758 765 0
		 768 772 0 766 768 1 766 760 1 769 752 1 770 773 0 769 770 1 769 763 1 756 758 1 757 754 1
		 760 763 1 765 761 1 768 770 1 756 755 0 755 759 1 759 758 0 755 754 0 757 759 0 760 762 0
		 762 764 1 764 763 0 762 761 0 765 764 0 768 767 0 767 771 1 771 770 0 767 760 0 763 771 0
		 767 766 1 771 769 1 772 746 0 773 750 1 773 747 0 773 772 0 774 745 0 775 744 0 776 781 0
		 777 778 0 774 775 1 775 776 1 776 777 0 777 774 1 780 740 0 782 741 0;
	setAttr ".ed[1494:1659]" 780 782 1 781 778 1 780 779 0 779 783 1 783 782 0 779 778 0
		 781 783 0 786 787 0 788 789 0 784 786 0 785 787 0 786 788 1 787 789 1 788 790 0 789 791 0
		 790 784 0 791 785 0 786 793 0 787 797 0 789 795 0 788 792 0 792 795 1 797 793 1 792 794 0
		 794 796 1 796 795 0 794 793 0 797 796 0 799 800 0 801 802 1 798 800 0 800 802 1 801 803 0
		 802 804 0 804 798 0 799 805 0 801 808 0 800 809 0 803 804 0 810 802 0 808 810 1 809 805 1
		 808 807 0 807 811 1 811 810 0 807 806 0 806 812 1 812 811 0 806 805 0 809 812 0 813 814 0
		 814 815 0 815 816 0 816 817 0 817 818 0 818 819 0 819 820 0 820 821 0 821 822 0 822 823 0
		 823 824 0 824 825 0 825 826 0 826 827 0 827 828 0 828 829 0 829 830 0 830 831 0 831 832 0
		 832 813 0 833 834 0 834 835 0 835 836 0 836 837 0 837 838 0 838 839 0 839 840 0 840 841 0
		 841 842 0 842 843 0 843 844 0 844 845 0 845 846 0 846 847 0 847 848 0 848 849 0 849 850 0
		 850 851 0 851 852 0 852 833 0 813 833 1 814 834 1 815 835 1 816 836 1 817 837 1 818 838 1
		 819 839 1 820 840 1 821 841 1 822 842 1 823 843 1 824 844 1 825 845 1 826 846 1 827 847 1
		 828 848 1 829 849 1 830 850 1 831 851 1 832 852 1 813 853 1 814 854 1 853 854 0 815 855 1
		 854 855 0 816 856 1 855 856 0 817 857 1 856 857 0 818 858 1 857 858 0 819 859 1 858 859 0
		 820 860 1 859 860 0 821 861 1 860 861 0 822 862 1 861 862 0 823 863 1 862 863 0 824 864 1
		 863 864 0 825 865 1 864 865 0 826 866 1 865 866 0 827 867 1 866 867 0 828 868 1 867 868 0
		 829 869 1 868 869 0 830 870 1 869 870 0 831 871 1 870 871 0 832 872 1 871 872 0 872 853 0
		 833 873 1 834 874 1 873 874 0 835 875 1 874 875 0 836 876 1 875 876 0 837 877 1 876 877 0
		 838 878 1 877 878 0 839 879 1 878 879 0 840 880 1 879 880 0 841 881 1;
	setAttr ".ed[1660:1812]" 880 881 0 842 882 1 881 882 0 843 883 1 882 883 0 844 884 1
		 883 884 0 845 885 1 884 885 0 846 886 1 885 886 0 847 887 1 886 887 0 848 888 1 887 888 0
		 849 889 1 888 889 0 850 890 1 889 890 0 851 891 1 890 891 0 852 892 1 891 892 0 892 873 0
		 895 896 0 897 898 0 893 895 0 894 896 0 895 897 1 896 898 1 897 899 0 898 900 0 899 893 0
		 900 894 0 895 902 0 896 906 0 898 904 0 897 901 0 901 904 1 906 902 1 901 903 0 903 905 1
		 905 904 0 903 902 0 906 905 0 908 909 0 910 911 1 907 909 0 909 911 1 910 912 0 911 913 0
		 913 907 0 908 914 0 910 917 0 909 918 0 912 913 0 919 911 0 917 919 1 918 914 1 917 916 0
		 916 920 1 920 919 0 916 915 0 915 921 1 921 920 0 915 914 0 918 921 0 924 925 0 926 927 0
		 922 924 0 923 925 0 924 926 1 925 927 1 926 928 0 927 929 0 928 922 0 929 923 0 924 931 0
		 925 935 0 927 933 0 926 930 0 930 933 1 935 931 1 930 932 0 932 934 1 934 933 0 932 931 0
		 935 934 0 937 938 0 939 940 1 936 938 0 938 940 1 939 941 0 940 942 0 942 936 0 937 943 0
		 939 946 0 938 947 0 941 942 0 948 940 0 946 948 1 947 943 1 946 945 0 945 949 1 949 948 0
		 945 944 0 944 950 1 950 949 0 944 943 0 947 950 0 953 954 0 955 956 0 951 953 0 952 954 0
		 953 955 1 954 956 1 955 957 0 956 958 0 957 951 0 958 952 0 953 960 0 954 964 0 956 962 0
		 955 959 0 959 962 1 964 960 1 959 961 0 961 963 1 963 962 0 961 960 0 964 963 0 966 967 0
		 968 969 1 965 967 0 967 969 1 968 970 0 969 971 0 971 965 0 966 972 0 968 975 0 967 976 0
		 970 971 0 977 969 0 975 977 1 976 972 1 975 974 0 974 978 1 978 977 0 974 973 0 973 979 1
		 979 978 0 973 972 0 976 979 0;
	setAttr -s 847 -ch 3386 ".fc";
	setAttr ".fc[0:499]" -type "polyFaces"
		f 4 0 19 -10 -19
		mu 0 4 0 1 2 3
		f 4 1 20 -11 -20
		mu 0 4 1 4 5 2
		f 4 2 21 -12 -21
		mu 0 4 4 6 7 5
		f 4 3 23 -13 -23
		mu 0 4 8 9 10 11
		f 4 4 24 -14 -24
		mu 0 4 9 12 13 10
		f 4 5 25 -15 -25
		mu 0 4 12 14 15 13
		f 4 6 26 -16 -26
		mu 0 4 14 16 17 15
		f 4 7 27 -17 -27
		mu 0 4 16 18 19 17
		f 4 8 18 -18 -28
		mu 0 4 18 0 3 19
		f 4 -1 28 30 -30
		mu 0 4 20 21 22 23
		f 4 -2 29 32 -32
		mu 0 4 24 20 23 25
		f 4 -3 31 34 -34
		mu 0 4 26 24 25 27
		f 4 -4 35 37 -37
		mu 0 4 28 29 30 31
		f 4 -5 36 39 -39
		mu 0 4 32 28 31 33
		f 4 -6 38 41 -41
		mu 0 4 34 32 33 35
		f 4 -7 40 43 -43
		mu 0 4 36 34 35 37
		f 4 -8 42 45 -45
		mu 0 4 38 36 37 39
		f 4 -9 44 46 -29
		mu 0 4 21 38 39 22
		f 4 9 48 -50 -48
		mu 0 4 40 41 42 43
		f 4 10 50 -52 -49
		mu 0 4 41 44 45 42
		f 4 71 73 -75 -51
		mu 0 4 44 46 47 45
		f 4 79 81 -83 -78
		mu 0 4 48 49 50 51
		f 4 84 86 -88 -82
		mu 0 4 49 52 53 50
		f 4 89 91 -93 -87
		mu 0 4 52 54 55 53
		f 4 94 96 -98 -92
		mu 0 4 54 56 57 55
		f 4 99 101 -103 -97
		mu 0 4 56 58 59 57
		f 4 17 47 -60 -58
		mu 0 4 60 40 43 61
		f 4 -31 61 49 -61
		mu 0 4 62 63 64 65
		f 4 -47 62 59 -62
		mu 0 4 63 66 67 64
		f 4 -46 63 58 -63
		mu 0 4 66 68 69 67
		f 4 -44 64 56 -64
		mu 0 4 68 70 71 69
		f 4 -42 65 55 -65
		mu 0 4 70 72 73 71
		f 4 -40 66 54 -66
		mu 0 4 72 74 75 73
		f 4 -38 67 53 -67
		mu 0 4 74 76 77 75
		f 4 -35 69 52 -69
		mu 0 4 78 79 80 81
		f 4 -33 60 51 -70
		mu 0 4 79 62 65 80
		f 3 11 70 -72
		mu 0 3 5 7 82
		f 3 -53 74 -73
		mu 0 3 81 80 83
		f 4 12 78 -80 -76
		mu 0 4 11 10 84 85
		f 4 -54 76 82 -81
		mu 0 4 75 77 86 87
		f 4 13 83 -85 -79
		mu 0 4 10 13 88 84
		f 4 -55 80 87 -86
		mu 0 4 73 75 87 89
		f 4 14 88 -90 -84
		mu 0 4 13 15 90 88
		f 4 -56 85 92 -91
		mu 0 4 71 73 89 91
		f 4 15 93 -95 -89
		mu 0 4 15 17 92 90
		f 4 -57 90 97 -96
		mu 0 4 69 71 91 93
		f 4 16 98 -100 -94
		mu 0 4 17 19 94 92
		f 4 57 100 -102 -99
		mu 0 4 95 96 97 98
		f 4 -59 95 102 -101
		mu 0 4 67 69 93 99
		f 4 103 128 -116 -128
		mu 0 4 100 101 102 103
		f 4 104 129 -117 -129
		mu 0 4 101 104 105 102
		f 4 105 130 -118 -130
		mu 0 4 106 107 108 109
		f 4 106 131 -119 -131
		mu 0 4 107 110 111 108
		f 4 107 132 -120 -132
		mu 0 4 110 112 113 111
		f 4 108 133 -121 -133
		mu 0 4 112 114 115 113
		f 4 109 134 -122 -134
		mu 0 4 114 116 117 115
		f 4 110 135 -123 -135
		mu 0 4 116 118 119 117
		f 4 111 136 -124 -136
		mu 0 4 118 120 121 119
		f 4 112 137 -125 -137
		mu 0 4 120 122 123 121
		f 4 113 138 -126 -138
		mu 0 4 122 124 125 123
		f 4 114 127 -127 -139
		mu 0 4 124 100 103 125
		f 4 115 140 -142 -140
		mu 0 4 126 127 128 129
		f 4 116 142 -144 -141
		mu 0 4 127 130 131 128
		f 4 117 144 -146 -143
		mu 0 4 130 132 133 131
		f 4 118 146 -148 -145
		mu 0 4 132 134 135 133
		f 4 119 148 -150 -147
		mu 0 4 134 136 137 135
		f 4 120 150 -152 -149
		mu 0 4 136 138 139 137
		f 4 121 152 -154 -151
		mu 0 4 138 140 141 139
		f 4 122 154 -156 -153
		mu 0 4 142 143 144 145
		f 4 123 156 -158 -155
		mu 0 4 143 146 147 144
		f 4 124 158 -160 -157
		mu 0 4 146 148 149 147
		f 4 125 160 -162 -159
		mu 0 4 148 150 151 149
		f 4 126 139 -163 -161
		mu 0 4 150 126 129 151
		f 4 -184 283 -234 284
		mu 0 4 152 153 154 155
		f 4 -185 -285 -230 285
		mu 0 4 156 152 155 157
		f 4 -186 -286 -226 286
		mu 0 4 158 156 157 159
		f 4 -187 -287 -222 287
		mu 0 4 160 158 159 161
		f 4 -188 -288 -218 288
		mu 0 4 162 160 161 163
		f 4 -189 -289 -214 289
		mu 0 4 164 162 163 165
		f 4 -190 -290 -206 290
		mu 0 4 166 164 165 167
		f 4 -191 -291 -209 291
		mu 0 4 168 166 167 169
		f 4 -192 -292 -282 292
		mu 0 4 170 168 169 171
		f 4 -193 -293 -278 293
		mu 0 4 172 170 171 173
		f 4 -194 -294 -274 294
		mu 0 4 174 172 173 175
		f 4 -195 -295 -270 295
		mu 0 4 176 174 175 177
		f 4 -196 -296 -266 296
		mu 0 4 178 176 177 179
		f 4 -197 -297 -262 297
		mu 0 4 180 181 182 183
		f 4 -198 -298 -258 298
		mu 0 4 184 180 183 185
		f 4 -199 -299 -254 299
		mu 0 4 186 184 185 187
		f 4 -200 -300 -250 300
		mu 0 4 188 186 187 189
		f 4 -201 -301 -246 301
		mu 0 4 190 188 189 191
		f 4 -202 -302 -242 302
		mu 0 4 192 190 191 193
		f 4 -203 -303 -238 -284
		mu 0 4 153 192 193 154
		f 4 -210 303 203 204
		mu 0 4 194 195 196 197
		f 4 -208 205 206 -304
		mu 0 4 195 167 165 196
		f 4 -204 304 211 212
		mu 0 4 197 196 198 199
		f 4 -207 213 214 -305
		mu 0 4 196 165 163 198
		f 4 -212 305 215 216
		mu 0 4 199 198 200 201
		f 4 -215 217 218 -306
		mu 0 4 198 163 161 200
		f 4 -216 306 219 220
		mu 0 4 201 200 202 203
		f 4 -219 221 222 -307
		mu 0 4 200 161 159 202
		f 4 -220 307 223 224
		mu 0 4 203 202 204 205
		f 4 -223 225 226 -308
		mu 0 4 202 159 157 204
		f 4 -224 308 227 228
		mu 0 4 205 204 206 207
		f 4 -227 229 230 -309
		mu 0 4 204 157 155 206
		f 4 -228 309 231 232
		mu 0 4 207 206 208 209
		f 4 -231 233 234 -310
		mu 0 4 206 155 154 208
		f 4 -232 310 235 236
		mu 0 4 209 208 210 211
		f 4 -235 237 238 -311
		mu 0 4 208 154 193 210
		f 4 -236 311 239 240
		mu 0 4 211 210 212 213
		f 4 -239 241 242 -312
		mu 0 4 210 193 191 212
		f 4 -240 312 243 244
		mu 0 4 213 212 214 215
		f 4 -243 245 246 -313
		mu 0 4 212 191 189 214
		f 4 -244 313 247 248
		mu 0 4 215 214 216 217
		f 4 -247 249 250 -314
		mu 0 4 214 189 187 216
		f 4 -248 314 251 252
		mu 0 4 217 216 218 219
		f 4 -251 253 254 -315
		mu 0 4 216 187 185 218
		f 4 -252 315 255 256
		mu 0 4 219 218 220 221
		f 4 -255 257 258 -316
		mu 0 4 218 185 183 220
		f 4 -256 316 259 260
		mu 0 4 221 220 222 223
		f 4 -259 261 262 -317
		mu 0 4 220 183 182 222
		f 4 -260 317 263 264
		mu 0 4 224 225 226 227
		f 4 -263 265 266 -318
		mu 0 4 225 179 177 226
		f 4 -264 318 267 268
		mu 0 4 227 226 228 229
		f 4 -267 269 270 -319
		mu 0 4 226 177 175 228
		f 4 -268 319 271 272
		mu 0 4 229 228 230 231
		f 4 -271 273 274 -320
		mu 0 4 228 175 173 230
		f 4 -272 320 275 276
		mu 0 4 231 230 232 233
		f 4 -275 277 278 -321
		mu 0 4 230 173 171 232
		f 4 -276 321 279 280
		mu 0 4 233 232 234 235
		f 4 -279 281 282 -322
		mu 0 4 232 171 169 234
		f 4 207 322 -283 208
		mu 0 4 167 195 234 169
		f 4 209 210 -280 -323
		mu 0 4 195 194 235 234
		f 4 -164 323 325 -325
		mu 0 4 236 237 238 239
		f 4 -165 324 327 -327
		mu 0 4 240 236 239 241
		f 4 -166 326 329 -329
		mu 0 4 242 240 241 243
		f 4 -167 328 331 -331
		mu 0 4 244 242 243 245
		f 4 -168 330 333 -333
		mu 0 4 246 244 245 247
		f 4 -169 332 335 -335
		mu 0 4 248 246 247 249
		f 4 -170 334 337 -337
		mu 0 4 250 248 249 251
		f 4 -171 336 339 -339
		mu 0 4 252 250 251 253
		f 4 -172 338 341 -341
		mu 0 4 254 252 253 255
		f 4 -173 340 343 -343
		mu 0 4 256 254 255 257
		f 4 -174 342 345 -345
		mu 0 4 258 256 257 259
		f 4 -175 344 347 -347
		mu 0 4 260 258 259 261
		f 4 -176 346 349 -349
		mu 0 4 262 260 261 263
		f 4 -177 348 351 -351
		mu 0 4 264 262 263 265
		f 4 -178 350 353 -353
		mu 0 4 266 267 268 269
		f 4 -179 352 355 -355
		mu 0 4 270 266 269 271
		f 4 -180 354 357 -357
		mu 0 4 272 270 271 273
		f 4 -181 356 359 -359
		mu 0 4 274 272 273 275
		f 4 -182 358 361 -361
		mu 0 4 276 274 275 277
		f 4 -183 360 362 -324
		mu 0 4 237 276 277 238
		f 4 -326 363 365 -365
		mu 0 4 278 279 280 281
		f 4 -328 364 367 -367
		mu 0 4 282 278 281 283
		f 4 -330 366 369 -369
		mu 0 4 284 282 283 285
		f 4 -332 368 371 -371
		mu 0 4 286 284 285 287
		f 4 -334 370 373 -373
		mu 0 4 288 286 287 289
		f 4 -336 372 375 -375
		mu 0 4 290 288 289 291
		f 4 -338 374 377 -377
		mu 0 4 292 290 291 293
		f 4 -340 376 379 -379
		mu 0 4 294 292 293 295
		f 4 -342 378 381 -381
		mu 0 4 296 294 295 297
		f 4 -344 380 383 -383
		mu 0 4 298 296 297 299
		f 4 -346 382 385 -385
		mu 0 4 300 298 299 301
		f 4 -348 384 387 -387
		mu 0 4 302 300 301 303
		f 4 -350 386 389 -389
		mu 0 4 304 302 303 305
		f 4 -352 388 391 -391
		mu 0 4 306 304 305 307
		f 4 -354 390 393 -393
		mu 0 4 308 309 310 311
		f 4 -356 392 395 -395
		mu 0 4 312 308 311 313
		f 4 -358 394 397 -397
		mu 0 4 314 312 313 315
		f 4 -360 396 399 -399
		mu 0 4 316 314 315 317
		f 4 -362 398 401 -401
		mu 0 4 318 316 317 319
		f 4 -363 400 402 -364
		mu 0 4 279 318 319 280
		f 4 -404 423 425 -425
		mu 0 4 320 321 322 323
		f 4 -405 424 427 -427
		mu 0 4 324 320 323 325
		f 4 -406 426 429 -429
		mu 0 4 326 324 325 327
		f 4 -407 428 431 -431
		mu 0 4 328 326 327 329
		f 4 -408 430 433 -433
		mu 0 4 330 328 329 331
		f 4 -409 432 435 -435
		mu 0 4 332 330 331 333
		f 4 -410 434 437 -437
		mu 0 4 334 332 333 335
		f 4 -411 436 439 -439
		mu 0 4 336 334 335 337
		f 4 -412 438 441 -441
		mu 0 4 338 336 337 339
		f 4 -413 440 443 -443
		mu 0 4 340 338 339 341
		f 4 -414 442 445 -445
		mu 0 4 342 340 341 343
		f 4 -415 444 447 -447
		mu 0 4 344 342 343 345
		f 4 -416 446 449 -449
		mu 0 4 346 344 345 347
		f 4 -417 448 451 -451
		mu 0 4 348 346 347 349
		f 4 -418 450 453 -453
		mu 0 4 350 351 352 353
		f 4 -419 452 455 -455
		mu 0 4 354 350 353 355
		f 4 -420 454 457 -457
		mu 0 4 356 354 355 357
		f 4 -421 456 459 -459
		mu 0 4 358 356 357 359
		f 4 -422 458 461 -461
		mu 0 4 360 358 359 361
		f 4 -423 460 462 -424
		mu 0 4 321 360 361 322
		f 3 -426 463 -465
		mu 0 3 362 363 364
		f 3 -428 464 -466
		mu 0 3 365 362 364
		f 3 -430 465 -467
		mu 0 3 366 365 364
		f 3 -432 466 -468
		mu 0 3 367 366 364
		f 3 -434 467 -469
		mu 0 3 368 367 364
		f 3 -436 468 -470
		mu 0 3 369 368 364
		f 3 -438 469 -471
		mu 0 3 370 369 364
		f 3 -440 470 -472
		mu 0 3 371 370 364
		f 3 -442 471 -473
		mu 0 3 372 371 364
		f 3 -444 472 -474
		mu 0 3 373 372 364
		f 3 -446 473 -475
		mu 0 3 374 373 364
		f 3 -448 474 -476
		mu 0 3 375 374 364
		f 3 -450 475 -477
		mu 0 3 376 375 364
		f 3 -452 476 -478
		mu 0 3 377 376 364
		f 3 -454 477 -479
		mu 0 3 378 377 364
		f 3 -456 478 -480
		mu 0 3 379 378 364
		f 3 -458 479 -481
		mu 0 3 380 379 364
		f 3 -460 480 -482
		mu 0 3 381 380 364
		f 3 -462 481 -483
		mu 0 3 382 381 364
		f 3 -463 482 -464
		mu 0 3 363 382 364
		f 4 164 484 188 -484
		mu 0 4 236 240 162 164
		f 4 513 515 517 -519
		mu 0 4 383 384 385 386
		f 4 520 522 523 -516
		mu 0 4 384 387 388 385
		f 4 525 527 528 -523
		mu 0 4 387 389 390 388
		f 4 530 532 533 -528
		mu 0 4 389 391 392 390
		f 4 169 486 183 -486
		mu 0 4 248 250 153 152
		f 4 536 538 540 -542
		mu 0 4 393 394 395 396
		f 4 543 545 546 -539
		mu 0 4 394 397 398 395
		f 4 548 550 551 -546
		mu 0 4 397 399 400 398
		f 4 553 555 556 -551
		mu 0 4 399 401 402 400
		f 4 174 488 198 -488
		mu 0 4 258 260 184 186
		f 4 559 561 563 -565
		mu 0 4 403 404 405 406
		f 4 566 568 569 -562
		mu 0 4 404 407 408 405
		f 4 571 573 574 -569
		mu 0 4 409 410 411 412
		f 4 576 578 579 -574
		mu 0 4 410 413 414 411
		f 4 179 490 193 -490
		mu 0 4 270 272 172 174
		f 4 582 584 586 -588
		mu 0 4 415 416 417 418
		f 4 589 591 592 -585
		mu 0 4 416 419 420 417
		f 4 594 596 597 -592
		mu 0 4 419 421 422 420
		f 4 599 601 602 -597
		mu 0 4 421 423 424 422
		f 4 -366 492 403 -492
		mu 0 4 425 426 427 428
		f 4 -403 493 422 -493
		mu 0 4 426 429 430 427
		f 4 -402 494 421 -494
		mu 0 4 429 431 432 430
		f 4 -400 495 420 -495
		mu 0 4 431 433 434 432
		f 4 -398 496 419 -496
		mu 0 4 433 435 436 434
		f 4 -396 497 418 -497
		mu 0 4 435 437 438 436
		f 4 -394 498 417 -498
		mu 0 4 437 439 440 438
		f 4 -392 499 416 -499
		mu 0 4 441 442 443 444
		f 4 -390 500 415 -500
		mu 0 4 442 445 446 443
		f 4 -388 501 414 -501
		mu 0 4 445 447 448 446
		f 4 -386 502 413 -502
		mu 0 4 447 449 450 448
		f 4 -384 503 412 -503
		mu 0 4 449 451 452 450
		f 4 -382 504 411 -504
		mu 0 4 451 453 454 452
		f 4 -380 505 410 -505
		mu 0 4 453 455 456 454
		f 4 -378 506 409 -506
		mu 0 4 455 457 458 456
		f 4 -376 507 408 -507
		mu 0 4 457 459 460 458
		f 4 -374 508 407 -508
		mu 0 4 459 461 462 460
		f 4 -372 509 406 -509
		mu 0 4 461 463 464 462
		f 4 -370 510 405 -510
		mu 0 4 463 465 466 464
		f 4 -368 491 404 -511
		mu 0 4 465 425 428 466
		f 4 165 512 -514 -512
		mu 0 4 467 468 384 383
		f 4 187 516 -518 -515
		mu 0 4 469 470 386 385
		f 4 -485 511 518 -517
		mu 0 4 470 467 383 386
		f 4 166 519 -521 -513
		mu 0 4 468 471 387 384
		f 4 186 514 -524 -522
		mu 0 4 472 469 385 388
		f 4 167 524 -526 -520
		mu 0 4 471 473 389 387
		f 4 185 521 -529 -527
		mu 0 4 474 472 388 390
		f 4 168 529 -531 -525
		mu 0 4 473 475 391 389
		f 4 485 531 -533 -530
		mu 0 4 475 476 392 391
		f 4 184 526 -534 -532
		mu 0 4 476 474 390 392
		f 4 170 535 -537 -535
		mu 0 4 477 478 394 393
		f 4 202 539 -541 -538
		mu 0 4 479 480 396 395
		f 4 -487 534 541 -540
		mu 0 4 480 477 393 396
		f 4 171 542 -544 -536
		mu 0 4 478 481 397 394
		f 4 201 537 -547 -545
		mu 0 4 482 479 395 398
		f 4 172 547 -549 -543
		mu 0 4 481 483 399 397
		f 4 200 544 -552 -550
		mu 0 4 484 482 398 400
		f 4 173 552 -554 -548
		mu 0 4 483 485 401 399
		f 4 487 554 -556 -553
		mu 0 4 485 486 402 401
		f 4 199 549 -557 -555
		mu 0 4 486 484 400 402
		f 4 175 558 -560 -558
		mu 0 4 487 488 404 403
		f 4 197 562 -564 -561
		mu 0 4 489 490 406 405
		f 4 -489 557 564 -563
		mu 0 4 490 487 403 406
		f 4 176 565 -567 -559
		mu 0 4 488 491 407 404
		f 4 196 560 -570 -568
		mu 0 4 492 489 405 408
		f 4 177 570 -572 -566
		mu 0 4 493 494 410 409
		f 4 195 567 -575 -573
		mu 0 4 495 496 412 411
		f 4 178 575 -577 -571
		mu 0 4 494 497 413 410
		f 4 489 577 -579 -576
		mu 0 4 497 498 414 413
		f 4 194 572 -580 -578
		mu 0 4 498 495 411 414
		f 4 180 581 -583 -581
		mu 0 4 499 500 416 415
		f 4 192 585 -587 -584
		mu 0 4 501 502 418 417
		f 4 -491 580 587 -586
		mu 0 4 502 499 415 418
		f 4 181 588 -590 -582
		mu 0 4 500 503 419 416
		f 4 191 583 -593 -591
		mu 0 4 504 501 417 420
		f 4 182 593 -595 -589
		mu 0 4 503 505 421 419
		f 4 190 590 -598 -596
		mu 0 4 506 504 420 422
		f 4 163 598 -600 -594
		mu 0 4 505 507 423 421
		f 4 483 600 -602 -599
		mu 0 4 507 508 424 423
		f 4 189 595 -603 -601
		mu 0 4 508 506 422 424
		f 4 603 628 -616 -628
		mu 0 4 509 510 511 512
		f 4 604 629 -617 -629
		mu 0 4 510 513 514 511
		f 4 605 630 -618 -630
		mu 0 4 513 515 516 514
		f 4 606 631 -619 -631
		mu 0 4 515 517 518 516
		f 4 607 632 -620 -632
		mu 0 4 517 519 520 518
		f 4 608 633 -621 -633
		mu 0 4 519 521 522 520
		f 4 609 634 -622 -634
		mu 0 4 521 523 524 522
		f 4 610 635 -623 -635
		mu 0 4 525 526 527 528
		f 4 611 636 -624 -636
		mu 0 4 526 529 530 527
		f 4 612 637 -625 -637
		mu 0 4 529 531 532 530
		f 4 613 638 -626 -638
		mu 0 4 531 533 534 532
		f 4 614 627 -627 -639
		mu 0 4 533 509 512 534
		f 4 -604 639 641 -641
		mu 0 4 535 536 537 538
		f 4 -605 640 643 -643
		mu 0 4 539 535 538 540
		f 4 -606 642 645 -645
		mu 0 4 541 539 540 542
		f 4 -607 644 647 -647
		mu 0 4 543 541 542 544
		f 4 -608 646 649 -649
		mu 0 4 545 543 544 546
		f 4 -609 648 651 -651
		mu 0 4 547 545 546 548
		f 4 -610 650 653 -653
		mu 0 4 549 547 548 550
		f 4 -611 652 655 -655
		mu 0 4 551 549 550 552
		f 4 -612 654 657 -657
		mu 0 4 553 554 555 556
		f 4 -613 656 659 -659
		mu 0 4 557 553 556 558
		f 4 -614 658 661 -661
		mu 0 4 559 557 558 560
		f 4 -615 660 662 -640
		mu 0 4 536 559 560 537
		f 4 615 664 -666 -664
		mu 0 4 561 562 563 564
		f 4 616 666 -668 -665
		mu 0 4 562 565 566 563
		f 4 617 668 -670 -667
		mu 0 4 565 567 568 566
		f 4 618 670 -672 -669
		mu 0 4 567 569 570 568
		f 4 619 672 -674 -671
		mu 0 4 569 571 572 570
		f 4 620 674 -676 -673
		mu 0 4 571 573 574 572
		f 4 621 676 -678 -675
		mu 0 4 573 575 576 574
		f 4 622 678 -680 -677
		mu 0 4 575 577 578 576
		f 4 623 680 -682 -679
		mu 0 4 579 580 581 582
		f 4 624 682 -684 -681
		mu 0 4 580 583 584 581
		f 4 625 684 -686 -683
		mu 0 4 583 585 586 584
		f 4 626 663 -687 -685
		mu 0 4 585 561 564 586
		f 4 -704 -688 721 688
		mu 0 4 587 588 589 590
		f 4 -705 -689 720 689
		mu 0 4 591 587 590 592
		f 4 -706 -690 719 690
		mu 0 4 593 591 592 594
		f 4 -707 -691 722 691
		mu 0 4 595 593 594 596
		f 4 -708 -692 723 692
		mu 0 4 597 595 596 598
		f 4 -709 -693 724 693
		mu 0 4 599 597 598 600
		f 4 -710 -694 725 694
		mu 0 4 601 599 600 602
		f 4 -711 -695 726 695
		mu 0 4 603 601 602 604
		f 4 -712 -696 727 696
		mu 0 4 605 603 604 606
		f 4 -713 -697 728 697
		mu 0 4 607 605 606 608
		f 4 -714 -698 729 698
		mu 0 4 609 607 608 610
		f 4 -715 -699 730 699
		mu 0 4 611 612 613 614
		f 4 -716 -700 731 700
		mu 0 4 615 611 614 616
		f 4 -717 -701 732 701
		mu 0 4 617 615 616 618
		f 4 -718 -702 733 702
		mu 0 4 619 617 618 620
		f 4 -719 -703 734 687
		mu 0 4 588 619 620 589
		f 4 703 736 -738 -736
		mu 0 4 621 622 623 624
		f 4 704 738 -740 -737
		mu 0 4 622 625 626 623
		f 4 705 740 -742 -739
		mu 0 4 625 627 628 626
		f 4 706 742 -744 -741
		mu 0 4 627 629 630 628
		f 4 707 744 -746 -743
		mu 0 4 629 631 632 630
		f 4 708 746 -748 -745
		mu 0 4 631 633 634 632
		f 4 709 748 -750 -747
		mu 0 4 633 635 636 634
		f 4 710 750 -752 -749
		mu 0 4 635 637 638 636
		f 4 711 752 -754 -751
		mu 0 4 637 639 640 638
		f 4 712 754 -756 -753
		mu 0 4 639 641 642 640
		f 4 713 756 -758 -755
		mu 0 4 641 643 644 642
		f 4 714 758 -760 -757
		mu 0 4 643 645 646 644
		f 4 715 760 -762 -759
		mu 0 4 647 648 649 650
		f 4 716 762 -764 -761
		mu 0 4 648 651 652 649
		f 4 717 764 -766 -763
		mu 0 4 651 653 654 652
		f 4 718 735 -767 -765
		mu 0 4 653 621 624 654
		f 4 737 768 -770 -768
		mu 0 4 655 656 657 658
		f 4 739 770 -772 -769
		mu 0 4 656 659 660 657
		f 4 741 772 -774 -771
		mu 0 4 659 661 662 660
		f 4 743 774 -776 -773
		mu 0 4 661 663 664 662
		f 4 745 776 -778 -775
		mu 0 4 663 665 666 664
		f 4 747 778 -780 -777
		mu 0 4 665 667 668 666
		f 4 749 780 -782 -779
		mu 0 4 667 669 670 668
		f 4 751 782 -784 -781
		mu 0 4 669 671 672 670
		f 4 753 784 -786 -783
		mu 0 4 671 673 674 672
		f 4 755 786 -788 -785
		mu 0 4 673 675 676 674
		f 4 757 788 -790 -787
		mu 0 4 675 677 678 676
		f 4 759 790 -792 -789
		mu 0 4 679 680 681 682
		f 4 761 792 -794 -791
		mu 0 4 680 683 684 681
		f 4 763 794 -796 -793
		mu 0 4 683 685 686 684
		f 4 765 796 -798 -795
		mu 0 4 685 687 688 686
		f 4 766 767 -799 -797
		mu 0 4 687 655 658 688
		f 4 -722 799 801 -801
		mu 0 4 689 690 691 692
		f 4 -721 800 803 -803
		mu 0 4 693 689 692 694
		f 4 -720 802 805 -805
		mu 0 4 695 693 694 696
		f 4 -723 804 807 -807
		mu 0 4 697 695 696 698
		f 4 -724 806 809 -809
		mu 0 4 699 697 698 700
		f 4 -725 808 811 -811
		mu 0 4 701 699 700 702
		f 4 -726 810 813 -813
		mu 0 4 703 701 702 704
		f 4 -727 812 815 -815
		mu 0 4 705 703 704 706
		f 4 -728 814 817 -817
		mu 0 4 707 705 706 708
		f 4 -729 816 819 -819
		mu 0 4 709 707 708 710
		f 4 -730 818 821 -821
		mu 0 4 711 709 710 712
		f 4 -731 820 823 -823
		mu 0 4 713 714 715 716
		f 4 -732 822 825 -825
		mu 0 4 717 713 716 718
		f 4 -733 824 827 -827
		mu 0 4 719 717 718 720
		f 4 -734 826 829 -829
		mu 0 4 721 719 720 722
		f 4 -735 828 830 -800
		mu 0 4 690 721 722 691
		f 4 -802 831 833 -833
		mu 0 4 723 724 725 726
		f 4 -804 832 835 -835
		mu 0 4 727 723 726 728
		f 4 -806 834 837 -837
		mu 0 4 729 727 728 730
		f 4 -808 836 839 -839
		mu 0 4 731 729 730 732
		f 4 -810 838 841 -841
		mu 0 4 733 731 732 734
		f 4 -812 840 843 -843
		mu 0 4 735 733 734 736
		f 4 -814 842 845 -845
		mu 0 4 737 735 736 738
		f 4 -816 844 847 -847
		mu 0 4 739 737 738 740
		f 4 -818 846 849 -849
		mu 0 4 741 739 740 742
		f 4 -820 848 851 -851
		mu 0 4 743 741 742 744
		f 4 -822 850 853 -853
		mu 0 4 745 743 744 746
		f 4 -824 852 855 -855
		mu 0 4 747 748 749 750
		f 4 -826 854 857 -857
		mu 0 4 751 747 750 752
		f 4 -828 856 859 -859
		mu 0 4 753 751 752 754
		f 4 -830 858 861 -861
		mu 0 4 755 753 754 756
		f 4 -831 860 862 -832
		mu 0 4 724 755 756 725
		f 4 889 -891 896 891
		mu 0 4 757 758 759 760
		f 4 897 892 888 -892
		mu 0 4 760 761 762 757
		f 4 899 894 887 -894
		mu 0 4 763 764 765 766
		f 4 900 895 886 -895
		mu 0 4 764 767 768 765
		f 4 913 -896 912 909
		mu 0 4 769 768 767 770
		f 4 -879 1074 1104 -1076
		mu 0 4 771 772 773 774
		f 4 -876 1075 1101 -1077
		mu 0 4 775 771 774 776
		f 4 -949 1076 1174 -1078
		mu 0 4 777 775 776 778
		f 4 -917 1078 1142 -1080
		mu 0 4 779 780 781 782
		f 4 -877 1079 1102 -1081
		mu 0 4 783 779 782 784
		f 4 -878 1080 1103 -1082
		mu 0 4 785 783 784 786
		f 4 -912 1081 1137 -1083
		mu 0 4 787 785 786 788
		f 4 -904 1082 1129 -1075
		mu 0 4 772 787 788 773
		f 4 967 937 932 -907
		mu 0 4 789 790 791 792
		f 3 968 930 929
		mu 0 3 789 793 794
		f 4 -887 881 927 -883
		mu 0 4 795 796 797 798
		f 4 -888 882 928 -884
		mu 0 4 799 795 798 800
		f 4 969 939 926 -920
		mu 0 4 801 802 800 803
		f 4 950 952 953 946
		mu 0 4 804 805 806 807
		f 4 936 934 -864 -934
		mu 0 4 808 809 810 811
		f 4 -933 935 933 -880
		mu 0 4 792 791 808 811
		f 4 -897 -867 878 867
		mu 0 4 760 759 812 813
		f 4 875 868 -898 -868
		mu 0 4 813 814 761 760
		f 5 948 869 -947 -942 -869
		mu 0 5 814 815 816 817 761
		f 5 -899 -871 916 871 -918
		mu 0 5 818 819 820 821 763
		f 4 876 872 -900 -872
		mu 0 4 821 822 764 763
		f 4 877 873 -901 -873
		mu 0 4 822 823 767 764
		f 5 -913 -874 911 874 -909
		mu 0 5 770 767 823 824 825
		f 5 -902 -875 903 866 -905
		mu 0 5 826 825 824 812 759
		f 4 902 -906 904 890
		mu 0 4 758 827 826 759
		f 4 915 -919 917 893
		mu 0 4 766 828 818 763
		f 4 898 957 -959 -956
		mu 0 4 829 830 831 832
		f 4 -928 924 -866 -926
		mu 0 4 798 797 833 834
		f 4 -929 925 -865 -927
		mu 0 4 800 798 834 803
		f 4 -962 -963 908 963
		mu 0 4 835 836 837 838
		f 4 901 965 -967 -964
		mu 0 4 838 839 840 835
		f 4 -936 -881 -890 885
		mu 0 4 808 791 841 842
		f 4 -889 884 -937 -886
		mu 0 4 842 843 809 808
		f 3 -941 921 970
		mu 0 3 844 845 846
		f 4 -938 -908 -903 880
		mu 0 4 791 790 847 841
		f 4 -939 -882 -914 910
		mu 0 4 793 797 796 848
		f 4 -940 -921 -916 883
		mu 0 4 800 802 849 799
		f 4 -945 -946 943 -885
		mu 0 4 843 850 844 809
		f 4 941 -948 944 -893
		mu 0 4 761 817 851 762
		f 4 940 951 -953 -950
		mu 0 4 852 853 854 855
		f 4 945 947 -954 -952
		mu 0 4 856 857 858 859
		f 4 920 956 -958 918
		mu 0 4 860 861 862 863
		f 4 -924 954 958 -957
		mu 0 4 864 865 866 867
		f 4 -931 959 961 -961
		mu 0 4 868 869 870 871
		f 4 -911 -910 962 -960
		mu 0 4 872 873 874 875
		f 4 907 964 -966 905
		mu 0 4 876 877 878 879
		f 4 -932 960 966 -965
		mu 0 4 880 868 871 881
		f 3 -930 931 -968
		mu 0 3 789 794 790
		f 4 -915 -925 938 -969
		mu 0 4 789 833 797 793
		f 3 -923 923 -970
		mu 0 3 801 882 802
		f 4 -971 -943 -935 -944
		mu 0 4 844 846 810 809
		f 4 -998 -1003 996 -996
		mu 0 4 883 884 885 886
		f 4 997 -995 -999 -1004
		mu 0 4 884 883 887 888
		f 4 999 -994 -1001 -1006
		mu 0 4 889 890 891 892
		f 4 1000 -993 -1002 -1007
		mu 0 4 892 891 893 894
		f 4 -1016 -1019 1001 -1020
		mu 0 4 895 896 894 893
		f 4 1012 -1037 -1042 -1068
		mu 0 4 897 898 899 900
		f 3 -1034 -1035 -1069
		mu 0 3 897 901 902
		f 4 988 -1032 -988 992
		mu 0 4 903 904 905 906
		f 4 989 -1033 -989 993
		mu 0 4 907 908 904 903
		f 4 1025 -1031 -1044 -1070
		mu 0 4 801 909 910 911
		f 4 -1051 -1056 -1055 -951
		mu 0 4 804 912 913 805
		f 4 1037 971 -1039 -1041
		mu 0 4 914 915 916 917
		f 4 985 -1038 -1040 1036
		mu 0 4 898 915 914 899
		f 4 -976 -985 974 1002
		mu 0 4 884 918 919 885
		f 4 975 1003 -977 -982
		mu 0 4 918 884 888 920
		f 5 976 1045 1050 -870 -1053
		mu 0 5 920 888 921 816 815
		f 5 1023 -978 -1023 870 1004
		mu 0 5 922 923 924 820 819
		f 4 977 1005 -979 -983
		mu 0 4 925 889 892 926
		f 4 978 1006 -980 -984
		mu 0 4 926 892 894 927
		f 5 1014 -981 -1018 979 1018
		mu 0 5 896 928 929 927 894
		f 5 1010 -975 -1010 980 1007
		mu 0 5 930 885 919 929 928
		f 4 -997 -1011 1011 -1009
		mu 0 4 886 885 930 931
		f 4 -1000 -1024 1024 -1022
		mu 0 4 932 923 922 933
		f 4 955 1058 -1058 -1005
		mu 0 4 829 832 934 935
		f 4 1029 973 -1029 1031
		mu 0 4 904 936 937 905
		f 4 1030 972 -1030 1032
		mu 0 4 908 938 936 904
		f 4 -1064 -1015 1062 1061
		mu 0 4 939 940 941 942
		f 4 1063 1066 -1066 -1008
		mu 0 4 940 939 943 944
		f 4 -992 995 986 1039
		mu 0 4 914 945 946 899
		f 4 991 1040 -991 994
		mu 0 4 945 914 917 947
		f 3 -1071 -922 1044
		mu 0 3 948 846 845
		f 4 -987 1008 1013 1041
		mu 0 4 899 946 949 900
		f 4 -1017 1019 987 1042
		mu 0 4 902 950 906 905
		f 4 -990 1021 1026 1043
		mu 0 4 910 951 952 911
		f 4 990 -1048 1049 1048
		mu 0 4 947 917 948 953;
	setAttr ".fc[500:846]"
		f 4 998 -1049 1051 -1046
		mu 0 4 888 887 954 921
		f 4 949 1054 -1054 -1045
		mu 0 4 852 855 955 956
		f 4 1053 1055 -1052 -1050
		mu 0 4 957 958 959 960
		f 4 -1025 1057 -1057 -1027
		mu 0 4 961 962 963 964
		f 4 1056 -1059 -955 1027
		mu 0 4 965 966 866 865
		f 4 1060 -1062 -1060 1034
		mu 0 4 967 968 969 970
		f 4 1059 -1063 1015 1016
		mu 0 4 971 972 973 974
		f 4 -1012 1065 -1065 -1014
		mu 0 4 975 976 977 978
		f 4 1064 -1067 -1061 1035
		mu 0 4 979 980 968 967
		f 3 1067 -1036 1033
		mu 0 3 897 900 901
		f 4 1068 -1043 1028 1020
		mu 0 4 897 902 905 937
		f 3 1069 -1028 922
		mu 0 3 801 911 882
		f 4 1047 1038 1046 1070
		mu 0 4 948 917 916 846
		f 4 -1118 -1123 1116 -1116
		mu 0 4 981 982 983 984
		f 4 1117 -1115 -1119 -1124
		mu 0 4 982 981 985 986
		f 4 1119 -1114 -1121 -1126
		mu 0 4 987 988 989 990
		f 4 1120 -1113 -1122 -1127
		mu 0 4 990 989 991 992
		f 4 -1136 -1139 1121 -1140
		mu 0 4 993 994 992 991
		f 3 1083 -1085 -1106
		mu 0 3 995 996 997
		f 3 1084 -1086 -1072
		mu 0 3 997 996 998
		f 3 1085 -1087 -1169
		mu 0 3 998 996 999
		f 3 1087 -1089 -1146
		mu 0 3 1000 996 1001
		f 3 1088 -1090 -1073
		mu 0 3 1001 996 1002
		f 3 1089 -1091 -1074
		mu 0 3 1002 996 1003
		f 3 1090 -1092 -1141
		mu 0 3 1003 996 1004
		f 3 1091 -1084 -1133
		mu 0 3 1004 996 995
		f 4 1132 -1159 -1164 -1194
		mu 0 4 1005 1006 1007 1008
		f 3 -1156 -1157 -1195
		mu 0 3 1005 1009 1010
		f 4 1108 -1154 -1108 1112
		mu 0 4 1011 1012 1013 1014
		f 4 1109 -1155 -1109 1113
		mu 0 4 1015 1016 1012 1011
		f 4 1145 -1153 -1166 -1196
		mu 0 4 1017 1018 1016 1019
		f 4 -1173 -1180 -1179 -1177
		mu 0 4 1020 1021 1022 1023
		f 4 1159 1071 -1161 -1163
		mu 0 4 1024 1025 1026 1027
		f 4 1105 -1160 -1162 1158
		mu 0 4 1006 1025 1024 1007
		f 4 -1094 -1105 1092 1122
		mu 0 4 982 1028 1029 983
		f 4 1093 1123 -1095 -1102
		mu 0 4 1028 982 986 1030
		f 5 1094 1167 1172 -1096 -1175
		mu 0 5 1030 986 1031 1032 1033
		f 5 1143 -1098 -1143 1096 1124
		mu 0 5 1034 987 1035 1036 1037
		f 4 1097 1125 -1099 -1103
		mu 0 4 1035 987 990 1038
		f 4 1098 1126 -1100 -1104
		mu 0 4 1038 990 992 1039
		f 5 1134 -1101 -1138 1099 1138
		mu 0 5 994 1040 1041 1039 992
		f 5 1130 -1093 -1130 1100 1127
		mu 0 5 1042 983 1029 1041 1040
		f 4 -1117 -1131 1131 -1129
		mu 0 4 984 983 1042 1043
		f 4 -1120 -1144 1144 -1142
		mu 0 4 988 987 1034 1044
		f 4 1181 1184 -1184 -1125
		mu 0 4 1045 1046 1047 1048
		f 4 1151 1073 -1151 1153
		mu 0 4 1012 1049 1050 1013
		f 4 1152 1072 -1152 1154
		mu 0 4 1016 1018 1049 1012
		f 4 -1190 -1135 1188 1187
		mu 0 4 1051 1052 1053 1054
		f 4 1189 1192 -1192 -1128
		mu 0 4 1052 1051 1055 1056
		f 4 -1112 1115 1106 1161
		mu 0 4 1024 1057 1058 1007
		f 4 1111 1162 -1111 1114
		mu 0 4 1057 1024 1027 1059
		f 3 -1197 -1148 1166
		mu 0 3 1060 1061 1062
		f 4 -1107 1128 1133 1163
		mu 0 4 1007 1058 1063 1008
		f 4 -1137 1139 1107 1164
		mu 0 4 1010 1064 1014 1013
		f 4 -1110 1141 1146 1165
		mu 0 4 1016 1015 1065 1019
		f 4 1110 -1170 1171 1170
		mu 0 4 1059 1027 1060 1066
		f 4 1118 -1171 1173 -1168
		mu 0 4 986 985 1067 1031
		f 4 1175 1178 -1178 -1167
		mu 0 4 1068 1069 1070 1071
		f 4 1177 1179 -1174 -1172
		mu 0 4 1072 1073 1074 1075
		f 4 -1145 1183 -1183 -1147
		mu 0 4 1076 1077 1078 1079
		f 4 1182 -1185 -1181 1149
		mu 0 4 1080 1081 1082 1083
		f 4 1186 -1188 -1186 1156
		mu 0 4 1084 1085 1086 1087
		f 4 1185 -1189 1135 1136
		mu 0 4 1088 1089 1090 1091
		f 4 -1132 1191 -1191 -1134
		mu 0 4 1092 1093 1094 1095
		f 4 1190 -1193 -1187 1157
		mu 0 4 1096 1097 1085 1084
		f 3 1193 -1158 1155
		mu 0 3 1005 1008 1009
		f 4 1194 -1165 1150 1140
		mu 0 4 1005 1010 1013 1050
		f 3 1195 -1150 1148
		mu 0 3 1017 1019 1098
		f 4 1169 1160 1168 1196
		mu 0 4 1060 1027 1026 1061
		f 4 1235 -1237 1242 1237
		mu 0 4 1099 1100 1101 1102
		f 4 1243 1238 1234 -1238
		mu 0 4 1102 1103 1104 1099
		f 4 1245 1240 1233 -1240
		mu 0 4 1105 1106 1107 1108
		f 4 1246 1241 1232 -1241
		mu 0 4 1106 1109 1110 1107
		f 4 1259 -1242 1258 1255
		mu 0 4 1111 1110 1109 1112
		f 3 1225 1208 -1208
		mu 0 3 1113 1114 996
		f 3 1197 1209 -1209
		mu 0 3 1114 1115 996
		f 3 1286 1086 -1210
		mu 0 3 1115 999 996
		f 3 1265 1210 -1088
		mu 0 3 1000 1116 996
		f 3 1198 1211 -1211
		mu 0 3 1116 1117 996
		f 3 1199 1212 -1212
		mu 0 3 1117 1118 996
		f 3 1260 1213 -1213
		mu 0 3 1118 1119 996
		f 3 1252 1207 -1214
		mu 0 3 1119 1113 996
		f 4 1201 -1225 -1201 984
		mu 0 4 1120 1121 1122 1123
		f 4 1202 -1222 -1202 981
		mu 0 4 1124 1125 1121 1120
		f 4 1077 -1293 -1203 1052
		mu 0 4 777 778 1125 1124
		f 4 1203 -1263 -1079 1022
		mu 0 4 1126 1127 781 780
		f 4 1204 -1223 -1204 982
		mu 0 4 1128 1129 1130 1131
		f 4 1205 -1224 -1205 983
		mu 0 4 1132 1133 1129 1128
		f 4 1206 -1258 -1206 1017
		mu 0 4 1134 1135 1133 1132
		f 4 1200 -1250 -1207 1009
		mu 0 4 1123 1122 1135 1134
		f 4 1307 1281 1276 -1253
		mu 0 4 1136 1137 1138 1139
		f 3 1308 1274 1273
		mu 0 3 1136 1140 1141
		f 4 -1233 1227 1271 -1229
		mu 0 4 1142 1143 1144 1145
		f 4 -1234 1228 1272 -1230
		mu 0 4 1146 1142 1145 1147
		f 4 1309 1283 1270 -1266
		mu 0 4 1017 1148 1149 1150
		f 4 1176 1294 1295 1290
		mu 0 4 1020 1023 1151 1152
		f 4 1280 1278 -1198 -1278
		mu 0 4 1153 1154 1155 1156
		f 4 -1277 1279 1277 -1226
		mu 0 4 1139 1138 1153 1156
		f 4 -1243 -1215 1224 1215
		mu 0 4 1102 1101 1157 1158
		f 4 1221 1216 -1244 -1216
		mu 0 4 1158 1159 1103 1102
		f 5 1292 1095 -1291 -1286 -1217
		mu 0 5 1159 1033 1032 1160 1103
		f 5 -1245 -1097 1262 1217 -1264
		mu 0 5 1161 1037 1036 1162 1163
		f 4 1222 1218 -1246 -1218
		mu 0 4 1164 1165 1106 1105
		f 4 1223 1219 -1247 -1219
		mu 0 4 1165 1166 1109 1106
		f 5 -1259 -1220 1257 1220 -1255
		mu 0 5 1112 1109 1166 1167 1168
		f 5 -1248 -1221 1249 1214 -1251
		mu 0 5 1169 1168 1167 1157 1101
		f 4 1248 -1252 1250 1236
		mu 0 4 1100 1170 1169 1101
		f 4 1261 -1265 1263 1239
		mu 0 4 1171 1172 1161 1163
		f 4 1244 1297 -1299 -1182
		mu 0 4 1045 1173 1174 1046
		f 4 -1272 1268 -1200 -1270
		mu 0 4 1145 1144 1175 1176
		f 4 -1273 1269 -1199 -1271
		mu 0 4 1147 1145 1176 1177
		f 4 -1302 -1303 1254 1303
		mu 0 4 1178 1179 1180 1181
		f 4 1247 1305 -1307 -1304
		mu 0 4 1181 1182 1183 1178
		f 4 -1280 -1227 -1236 1231
		mu 0 4 1153 1138 1184 1185
		f 4 -1235 1230 -1281 -1232
		mu 0 4 1185 1186 1154 1153
		f 3 -1285 1147 1310
		mu 0 3 1187 1062 1061
		f 4 -1282 -1254 -1249 1226
		mu 0 4 1138 1137 1188 1184
		f 4 -1283 -1228 -1260 1256
		mu 0 4 1140 1144 1143 1189
		f 4 -1284 -1267 -1262 1229
		mu 0 4 1149 1148 1190 1191
		f 4 -1289 -1290 1287 -1231
		mu 0 4 1186 1192 1187 1154
		f 4 1285 -1292 1288 -1239
		mu 0 4 1103 1160 1193 1104
		f 4 1284 1293 -1295 -1176
		mu 0 4 1068 1194 1195 1069
		f 4 1289 1291 -1296 -1294
		mu 0 4 1196 1197 1198 1199
		f 4 1266 1296 -1298 1264
		mu 0 4 1200 1201 1202 1203
		f 4 -1268 1180 1298 -1297
		mu 0 4 1204 1083 1082 1205
		f 4 -1275 1299 1301 -1301
		mu 0 4 1206 1207 1208 1209
		f 4 -1257 -1256 1302 -1300
		mu 0 4 1210 1211 1212 1213
		f 4 1253 1304 -1306 1251
		mu 0 4 1214 1215 1216 1217
		f 4 -1276 1300 1306 -1305
		mu 0 4 1218 1206 1209 1219
		f 3 -1274 1275 -1308
		mu 0 3 1136 1141 1137
		f 4 -1261 -1269 1282 -1309
		mu 0 4 1136 1175 1144 1140
		f 3 -1149 1267 -1310
		mu 0 3 1017 1098 1148
		f 4 -1311 -1287 -1279 -1288
		mu 0 4 1187 1061 1155 1154
		f 4 863 1312 -1314 -1312
		mu 0 4 1220 1221 1222 1223
		f 4 864 1315 -1317 -1315
		mu 0 4 1224 1225 1226 1227
		f 4 865 1317 -1319 -1316
		mu 0 4 1225 1228 1229 1226
		f 4 879 1311 -1321 -1320
		mu 0 4 1230 1220 1223 1231
		f 4 906 1319 -1323 -1322
		mu 0 4 1232 1230 1231 1233
		f 4 914 1321 -1324 -1318
		mu 0 4 1228 1232 1233 1229
		f 4 919 1314 -1326 -1325
		mu 0 4 1234 1224 1227 1235
		f 4 942 1326 -1328 -1313
		mu 0 4 1221 1236 1237 1222
		f 4 -972 1328 1330 -1330
		mu 0 4 1238 1239 1240 1241
		f 4 -973 1331 1333 -1333
		mu 0 4 1242 1243 1244 1245
		f 4 -974 1332 1335 -1335
		mu 0 4 1246 1242 1245 1247
		f 4 -986 1336 1337 -1329
		mu 0 4 1239 1248 1249 1240
		f 4 -1013 1338 1339 -1337
		mu 0 4 1248 1250 1251 1249
		f 4 -1021 1334 1340 -1339
		mu 0 4 1250 1246 1247 1251
		f 4 -1026 1324 1341 -1332
		mu 0 4 1252 1234 1235 1253
		f 4 -1047 1329 1342 -1327
		mu 0 4 1236 1238 1241 1237
		f 4 1379 1371 1382 -1371
		mu 0 4 1254 1255 1256 1257
		f 4 1350 1347 1411 -1347
		mu 0 4 1258 1259 1260 1261
		f 4 1415 1414 -1344 -1414
		mu 0 4 1262 1263 1264 1265
		f 4 1409 1406 1352 -1406
		mu 0 4 1266 1267 1268 1269
		f 4 1351 -1407 1410 -1348
		mu 0 4 1270 1271 1272 1273
		f 4 1412 1405 1353 1346
		mu 0 4 1274 1275 1276 1277
		f 4 1358 1355 -1351 -1355
		mu 0 4 1278 1279 1259 1258
		f 4 1359 -1349 -1352 -1356
		mu 0 4 1280 1281 1271 1270
		f 4 -1353 1348 1360 -1350
		mu 0 4 1269 1268 1282 1283
		f 4 -1354 1349 1361 1354
		mu 0 4 1277 1276 1284 1285
		f 4 -1405 1403 -1359 -1402
		mu 0 4 1286 1287 1279 1278
		f 4 -1361 1356 1364 -1358
		mu 0 4 1283 1282 1288 1289
		f 4 -1362 1357 1365 1401
		mu 0 4 1285 1284 1290 1291
		f 4 1383 1376 1404 -1373
		mu 0 4 1292 1293 1294 1295
		f 4 -1365 1362 1368 -1364
		mu 0 4 1289 1288 1296 1297
		f 4 -1369 1366 1380 -1368
		mu 0 4 1298 1299 1300 1301
		f 5 -1378 1375 -1363 -1403 -1377
		mu 0 5 1302 1303 1304 1305 1306
		f 4 1384 1385 1386 -1380
		mu 0 4 1254 1307 1308 1255
		f 4 1387 -1381 1388 -1386
		mu 0 4 1307 1301 1300 1308
		f 4 1389 1390 1391 -1382
		mu 0 4 1309 1310 1311 1312
		f 4 1392 -1383 1393 -1391
		mu 0 4 1310 1257 1256 1311
		f 4 1394 1395 1396 -1384
		mu 0 4 1292 1313 1314 1293
		f 4 1397 1381 1398 -1396
		mu 0 4 1313 1309 1312 1314
		f 8 -1375 -1370 1367 -1388 -1385 1370 -1393 -1390
		mu 0 8 1315 1316 1317 1318 1319 1320 1321 1322
		f 8 -1387 -1389 -1367 -1376 1378 -1392 -1394 -1372
		mu 0 8 1323 1324 1325 1304 1303 1326 1327 1328
		f 3 1374 -1398 1399
		mu 0 3 1316 1315 1329
		f 3 -1400 -1395 -1374
		mu 0 3 1316 1329 1330
		f 3 1377 -1397 1400
		mu 0 3 1303 1302 1331
		f 3 -1401 -1399 -1379
		mu 0 3 1303 1331 1326
		f 5 -1366 1363 1369 1373 1372
		mu 0 5 1291 1290 1317 1316 1330
		f 4 1402 -1357 -1360 -1404
		mu 0 4 1306 1305 1281 1280
		f 4 1343 1345 -1410 -1345
		mu 0 4 1332 1333 1267 1266
		f 4 -1412 1407 1416 -1409
		mu 0 4 1261 1260 1334 1335
		f 4 1417 1418 1419 -1416
		mu 0 4 1262 1336 1337 1263
		f 4 1420 -1417 1421 -1419
		mu 0 4 1336 1335 1334 1337
		f 6 1344 -1413 1408 -1421 -1418 1413
		mu 0 6 1338 1275 1274 1339 1340 1341
		f 6 -1408 -1411 -1346 -1415 -1420 -1422
		mu 0 6 1342 1273 1272 1343 1344 1345
		f 4 1449 -1462 -1451 -1459
		mu 0 4 1346 1347 1348 1349
		f 4 1425 -1491 -1427 -1430
		mu 0 4 1350 1351 1352 1353
		f 4 1492 1422 -1494 -1495
		mu 0 4 1354 1355 1356 1357
		f 4 1484 -1432 -1486 -1489
		mu 0 4 1358 1359 1360 1361
		f 4 1426 -1490 1485 -1431
		mu 0 4 1362 1363 1364 1365
		f 4 -1426 -1433 -1485 -1492
		mu 0 4 1366 1367 1368 1369
		f 4 1433 1429 -1435 -1438
		mu 0 4 1370 1350 1353 1371
		f 4 1434 1430 1427 -1439
		mu 0 4 1372 1362 1365 1373
		f 4 1428 -1440 -1428 1431
		mu 0 4 1359 1374 1375 1360
		f 4 -1434 -1441 -1429 1432
		mu 0 4 1367 1376 1377 1368
		f 4 1480 1437 -1483 1483
		mu 0 4 1378 1370 1371 1379
		f 4 1436 -1444 -1436 1439
		mu 0 4 1374 1380 1381 1375
		f 4 -1481 -1445 -1437 1440
		mu 0 4 1376 1382 1383 1377
		f 4 1451 -1484 -1456 -1463
		mu 0 4 1384 1385 1386 1387
		f 4 1442 -1448 -1442 1443
		mu 0 4 1380 1388 1389 1381
		f 4 1446 -1460 -1446 1447
		mu 0 4 1390 1391 1392 1393
		f 5 1455 1481 1441 -1455 1456
		mu 0 5 1394 1395 1396 1397 1398
		f 4 1458 -1466 -1465 -1464
		mu 0 4 1346 1349 1399 1400
		f 4 1464 -1468 1459 -1467
		mu 0 4 1400 1399 1392 1391
		f 4 1460 -1471 -1470 -1469
		mu 0 4 1401 1402 1403 1404
		f 4 1469 -1473 1461 -1472
		mu 0 4 1404 1403 1348 1347
		f 4 1462 -1476 -1475 -1474
		mu 0 4 1384 1387 1405 1406
		f 4 1474 -1478 -1461 -1477
		mu 0 4 1406 1405 1402 1401
		f 8 1468 1471 -1450 1463 1466 -1447 1448 1453
		mu 0 8 1407 1408 1409 1410 1411 1412 1413 1414
		f 8 1450 1472 1470 -1458 1454 1445 1467 1465
		mu 0 8 1415 1416 1417 1418 1398 1397 1419 1420
		f 3 -1479 1476 -1454
		mu 0 3 1414 1421 1407
		f 3 1452 1473 1478
		mu 0 3 1414 1422 1421
		f 3 -1480 1475 -1457
		mu 0 3 1398 1423 1394
		f 3 1457 1477 1479
		mu 0 3 1398 1418 1423
		f 5 -1452 -1453 -1449 -1443 1444
		mu 0 5 1382 1422 1414 1413 1383
		f 4 1482 1438 1435 -1482
		mu 0 4 1395 1372 1373 1396
		f 4 1423 1488 -1425 -1423
		mu 0 4 1424 1358 1361 1425
		f 4 1487 -1496 -1487 1490
		mu 0 4 1351 1426 1427 1352
		f 4 1494 -1499 -1498 -1497
		mu 0 4 1354 1357 1428 1429
		f 4 1497 -1501 1495 -1500
		mu 0 4 1429 1428 1427 1426
		f 6 -1493 1496 1499 -1488 1491 -1424
		mu 0 6 1430 1431 1432 1433 1366 1369
		f 6 1500 1498 1493 1424 1489 1486
		mu 0 6 1434 1435 1436 1437 1364 1363
		f 4 1504 1506 1508 1510
		mu 0 4 1438 1439 1440 1441
		f 4 -1508 -1506 -1504 -1510
		mu 0 4 1442 1443 1444 1445
		f 4 1513 -1516 -1515 1502
		mu 0 4 1446 1447 1448 1449
		f 5 1514 1517 1520 -1512 1505
		mu 0 5 1443 1450 1451 1452 1444
		f 4 -1502 1511 -1517 -1513
		mu 0 4 1453 1454 1455 1456
		f 4 1515 -1520 -1519 -1518
		mu 0 4 1448 1447 1457 1458
		f 4 1518 -1522 1516 -1521
		mu 0 4 1458 1457 1456 1455
		f 5 -1507 1512 1521 1519 -1514
		mu 0 5 1440 1439 1459 1460 1461
		f 4 1524 1525 1527 1528
		mu 0 4 1462 1463 1464 1465
		f 4 -1534 -1535 -1531 1523
		mu 0 4 1466 1467 1468 1469
		f 4 -1532 -1523 1529 -1536
		mu 0 4 1470 1471 1472 1473
		f 4 1532 -1528 -1524 1526
		mu 0 4 1474 1475 1466 1469
		f 4 1534 -1539 -1538 -1537
		mu 0 4 1468 1467 1476 1477
		f 4 1537 -1542 -1541 -1540
		mu 0 4 1477 1476 1478 1479
		f 4 1540 -1544 1535 -1543
		mu 0 4 1479 1478 1470 1473
		f 6 1543 1541 1538 1533 -1526 1531
		mu 0 6 1480 1481 1482 1483 1464 1463
		f 4 1544 1585 -1565 -1585
		mu 0 4 1484 1485 1486 1487
		f 4 1545 1586 -1566 -1586
		mu 0 4 1485 1488 1489 1486
		f 4 1546 1587 -1567 -1587
		mu 0 4 1488 1490 1491 1489
		f 4 1547 1588 -1568 -1588
		mu 0 4 1490 1492 1493 1491
		f 4 1548 1589 -1569 -1589
		mu 0 4 1492 1494 1495 1493
		f 4 1549 1590 -1570 -1590
		mu 0 4 1494 1496 1497 1495
		f 4 1550 1591 -1571 -1591
		mu 0 4 1496 1498 1499 1497
		f 4 1551 1592 -1572 -1592
		mu 0 4 1498 1500 1501 1499
		f 4 1552 1593 -1573 -1593
		mu 0 4 1500 1502 1503 1501
		f 4 1553 1594 -1574 -1594
		mu 0 4 1502 1504 1505 1503
		f 4 1554 1595 -1575 -1595
		mu 0 4 1504 1506 1507 1505
		f 4 1555 1596 -1576 -1596
		mu 0 4 1506 1508 1509 1507
		f 4 1556 1597 -1577 -1597
		mu 0 4 1508 1510 1511 1509
		f 4 1557 1598 -1578 -1598
		mu 0 4 1510 1512 1513 1511
		f 4 1558 1599 -1579 -1599
		mu 0 4 1514 1515 1516 1517
		f 4 1559 1600 -1580 -1600
		mu 0 4 1515 1518 1519 1516
		f 4 1560 1601 -1581 -1601
		mu 0 4 1518 1520 1521 1519
		f 4 1561 1602 -1582 -1602
		mu 0 4 1520 1522 1523 1521
		f 4 1562 1603 -1583 -1603
		mu 0 4 1522 1524 1525 1523
		f 4 1563 1584 -1584 -1604
		mu 0 4 1524 1484 1487 1525
		f 4 -1545 1604 1606 -1606
		mu 0 4 1526 1527 1528 1529
		f 4 -1546 1605 1608 -1608
		mu 0 4 1530 1526 1529 1531
		f 4 -1547 1607 1610 -1610
		mu 0 4 1532 1530 1531 1533
		f 4 -1548 1609 1612 -1612
		mu 0 4 1534 1532 1533 1535
		f 4 -1549 1611 1614 -1614
		mu 0 4 1536 1534 1535 1537
		f 4 -1550 1613 1616 -1616
		mu 0 4 1538 1536 1537 1539
		f 4 -1551 1615 1618 -1618
		mu 0 4 1540 1538 1539 1541
		f 4 -1552 1617 1620 -1620
		mu 0 4 1542 1540 1541 1543
		f 4 -1553 1619 1622 -1622
		mu 0 4 1544 1542 1543 1545
		f 4 -1554 1621 1624 -1624
		mu 0 4 1546 1544 1545 1547
		f 4 -1555 1623 1626 -1626
		mu 0 4 1548 1546 1547 1549
		f 4 -1556 1625 1628 -1628
		mu 0 4 1550 1548 1549 1551
		f 4 -1557 1627 1630 -1630
		mu 0 4 1552 1550 1551 1553
		f 4 -1558 1629 1632 -1632
		mu 0 4 1554 1552 1553 1555
		f 4 -1559 1631 1634 -1634
		mu 0 4 1556 1557 1558 1559
		f 4 -1560 1633 1636 -1636
		mu 0 4 1560 1556 1559 1561
		f 4 -1561 1635 1638 -1638
		mu 0 4 1562 1560 1561 1563
		f 4 -1562 1637 1640 -1640
		mu 0 4 1564 1562 1563 1565
		f 4 -1563 1639 1642 -1642
		mu 0 4 1566 1564 1565 1567
		f 4 -1564 1641 1643 -1605
		mu 0 4 1527 1566 1567 1528
		f 4 1564 1645 -1647 -1645
		mu 0 4 1568 1569 1570 1571
		f 4 1565 1647 -1649 -1646
		mu 0 4 1569 1572 1573 1570
		f 4 1566 1649 -1651 -1648
		mu 0 4 1572 1574 1575 1573
		f 4 1567 1651 -1653 -1650
		mu 0 4 1574 1576 1577 1575
		f 4 1568 1653 -1655 -1652
		mu 0 4 1576 1578 1579 1577
		f 4 1569 1655 -1657 -1654
		mu 0 4 1578 1580 1581 1579
		f 4 1570 1657 -1659 -1656
		mu 0 4 1580 1582 1583 1581
		f 4 1571 1659 -1661 -1658
		mu 0 4 1582 1584 1585 1583
		f 4 1572 1661 -1663 -1660
		mu 0 4 1584 1586 1587 1585
		f 4 1573 1663 -1665 -1662
		mu 0 4 1586 1588 1589 1587
		f 4 1574 1665 -1667 -1664
		mu 0 4 1588 1590 1591 1589
		f 4 1575 1667 -1669 -1666
		mu 0 4 1590 1592 1593 1591
		f 4 1576 1669 -1671 -1668
		mu 0 4 1592 1594 1595 1593
		f 4 1577 1671 -1673 -1670
		mu 0 4 1594 1596 1597 1595
		f 4 1578 1673 -1675 -1672
		mu 0 4 1598 1599 1600 1601
		f 4 1579 1675 -1677 -1674
		mu 0 4 1599 1602 1603 1600
		f 4 1580 1677 -1679 -1676
		mu 0 4 1602 1604 1605 1603
		f 4 1581 1679 -1681 -1678
		mu 0 4 1604 1606 1607 1605
		f 4 1582 1681 -1683 -1680
		mu 0 4 1606 1608 1609 1607
		f 4 1583 1644 -1684 -1682
		mu 0 4 1608 1568 1571 1609
		f 4 1687 1689 1691 1693
		mu 0 4 1610 1611 1612 1613
		f 4 -1691 -1689 -1687 -1693
		mu 0 4 1614 1615 1616 1617
		f 4 1696 -1699 -1698 1685
		mu 0 4 1618 1619 1620 1621
		f 5 1697 1700 1703 -1695 1688
		mu 0 5 1615 1622 1623 1624 1616
		f 4 -1685 1694 -1700 -1696
		mu 0 4 1625 1626 1627 1628
		f 4 1698 -1703 -1702 -1701
		mu 0 4 1620 1619 1629 1630
		f 4 1701 -1705 1699 -1704
		mu 0 4 1630 1629 1628 1627
		f 5 -1690 1695 1704 1702 -1697
		mu 0 5 1612 1611 1631 1632 1633
		f 4 1707 1708 1710 1711
		mu 0 4 1634 1635 1636 1637
		f 4 -1717 -1718 -1714 1706
		mu 0 4 1638 1639 1640 1641
		f 4 -1715 -1706 1712 -1719
		mu 0 4 1642 1643 1644 1645
		f 4 1715 -1711 -1707 1709
		mu 0 4 1646 1647 1638 1641
		f 4 1717 -1722 -1721 -1720
		mu 0 4 1640 1639 1648 1649
		f 4 1720 -1725 -1724 -1723
		mu 0 4 1649 1648 1650 1651
		f 4 1723 -1727 1718 -1726
		mu 0 4 1651 1650 1642 1645
		f 6 1726 1724 1721 1716 -1709 1714
		mu 0 6 1652 1653 1654 1655 1636 1635
		f 4 -1737 -1735 -1733 -1731
		mu 0 4 1656 1657 1658 1659
		f 4 1735 1729 1731 1733
		mu 0 4 1660 1661 1662 1663
		f 4 -1729 1740 1741 -1740
		mu 0 4 1664 1665 1666 1667
		f 5 -1732 1737 -1747 -1744 -1741
		mu 0 5 1663 1662 1668 1669 1670
		f 4 1738 1742 -1738 1727
		mu 0 4 1671 1672 1673 1674
		f 4 1743 1744 1745 -1742
		mu 0 4 1666 1675 1676 1667
		f 4 1746 -1743 1747 -1745
		mu 0 4 1675 1673 1672 1676
		f 5 1739 -1746 -1748 -1739 1732
		mu 0 5 1658 1677 1678 1679 1659
		f 4 -1755 -1754 -1752 -1751
		mu 0 4 1680 1681 1682 1683
		f 4 -1750 1756 1760 1759
		mu 0 4 1684 1685 1686 1687
		f 4 1761 -1756 1748 1757
		mu 0 4 1688 1689 1690 1691
		f 4 -1753 1749 1753 -1759
		mu 0 4 1692 1685 1684 1693
		f 4 1762 1763 1764 -1761
		mu 0 4 1686 1694 1695 1687
		f 4 1765 1766 1767 -1764
		mu 0 4 1694 1696 1697 1695
		f 4 1768 -1762 1769 -1767
		mu 0 4 1696 1689 1688 1697
		f 6 -1758 1751 -1760 -1765 -1768 -1770
		mu 0 6 1698 1683 1682 1699 1700 1701
		f 4 -1780 -1778 -1776 -1774
		mu 0 4 1702 1703 1704 1705
		f 4 1778 1772 1774 1776
		mu 0 4 1706 1707 1708 1709
		f 4 -1772 1783 1784 -1783
		mu 0 4 1710 1711 1712 1713
		f 5 -1775 1780 -1790 -1787 -1784
		mu 0 5 1709 1708 1714 1715 1716
		f 4 1781 1785 -1781 1770
		mu 0 4 1717 1718 1719 1720
		f 4 1786 1787 1788 -1785
		mu 0 4 1712 1721 1722 1713
		f 4 1789 -1786 1790 -1788
		mu 0 4 1721 1719 1718 1722
		f 5 1782 -1789 -1791 -1782 1775
		mu 0 5 1704 1723 1724 1725 1705
		f 4 -1798 -1797 -1795 -1794
		mu 0 4 1726 1727 1728 1729
		f 4 -1793 1799 1803 1802
		mu 0 4 1730 1731 1732 1733
		f 4 1804 -1799 1791 1800
		mu 0 4 1734 1735 1736 1737
		f 4 -1796 1792 1796 -1802
		mu 0 4 1738 1731 1730 1739
		f 4 1805 1806 1807 -1804
		mu 0 4 1732 1740 1741 1733
		f 4 1808 1809 1810 -1807
		mu 0 4 1740 1742 1743 1741
		f 4 1811 -1805 1812 -1810
		mu 0 4 1742 1735 1734 1743
		f 6 -1801 1794 -1803 -1808 -1811 -1813
		mu 0 6 1744 1729 1728 1745 1746 1747;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "fertilizer_coupling_2" -p "hose_main_component4";
	rename -uid "A35657CE-48B3-ECFD-CE3B-AAB2FC7F8728";
	addAttr -ci true -sn "i3D_xmlIdentifier" -ln "i3D_xmlIdentifier" -dt "string";
	addAttr -ci true -sn "i3D_objectMask" -ln "i3D_objectMask" -at "long";
	addAttr -ci true -sn "i3D_dynamic" -ln "i3D_dynamic" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_joint" -ln "i3D_joint" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_dynamicFriction" -ln "i3D_dynamicFriction" -at "float";
	addAttr -ci true -sn "i3D_ccd" -ln "i3D_ccd" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_density" -ln "i3D_density" -at "float";
	addAttr -ci true -sn "i3D_splitType" -ln "i3D_splitType" -at "long";
	addAttr -ci true -sn "i3D_splitMinU" -ln "i3D_splitMinU" -at "float";
	addAttr -ci true -sn "i3D_splitMinV" -ln "i3D_splitMinV" -at "float";
	addAttr -ci true -sn "i3D_driveForceLimit" -ln "i3D_driveForceLimit" -at "float";
	addAttr -ci true -sn "i3D_angularDamping" -ln "i3D_angularDamping" -at "float";
	addAttr -ci true -sn "i3D_splitUvWorldScale" -ln "i3D_splitUvWorldScale" -at "float";
	addAttr -ci true -sn "i3D_projection" -ln "i3D_projection" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_driveSpring" -ln "i3D_driveSpring" -at "float";
	addAttr -ci true -sn "i3D_breakableJoint" -ln "i3D_breakableJoint" -min 0 -max 1
		-at "bool";
	addAttr -ci true -sn "i3D_projDistance" -ln "i3D_projDistance" -at "float";
	addAttr -ci true -sn "i3D_driveDamping" -ln "i3D_driveDamping" -at "float";
	addAttr -ci true -sn "i3D_xAxisDrive" -ln "i3D_xAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_compound" -ln "i3D_compound" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_clipDistance" -ln "i3D_clipDistance" -at "float";
	addAttr -ci true -sn "i3D_collision" -ln "i3D_collision" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_scaled" -ln "i3D_scaled" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_projAngle" -ln "i3D_projAngle" -at "float";
	addAttr -ci true -sn "i3D_mergeGroupRoot" -ln "i3D_mergeGroupRoot" -min 0 -max 1
		-at "bool";
	addAttr -ci true -sn "i3D_jointBreakTorque" -ln "i3D_jointBreakTorque" -at "float";
	addAttr -ci true -sn "i3D_restitution" -ln "i3D_restitution" -at "float";
	addAttr -ci true -sn "i3D_yAxisDrive" -ln "i3D_yAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_mergeGroup" -ln "i3D_mergeGroup" -at "long";
	addAttr -ci true -sn "i3D_jointBreakForce" -ln "i3D_jointBreakForce" -at "float";
	addAttr -ci true -sn "i3D_lod1" -ln "i3D_lod1" -at "float";
	addAttr -ci true -sn "i3D_lod2" -ln "i3D_lod2" -at "float";
	addAttr -ci true -sn "i3D_oc" -ln "i3D_oc" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_kinematic" -ln "i3D_kinematic" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_trigger" -ln "i3D_trigger" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_static" -ln "i3D_static" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lightMask" -ln "i3D_lightMask" -dt "string";
	addAttr -ci true -sn "i3D_linearDamping" -ln "i3D_linearDamping" -at "float";
	addAttr -ci true -sn "i3D_lod3" -ln "i3D_lod3" -at "float";
	addAttr -ci true -sn "i3D_drivePos" -ln "i3D_drivePos" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_lod" -ln "i3D_lod" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_solverIterationCount" -ln "i3D_solverIterationCount" -at "long";
	addAttr -ci true -sn "i3D_nonRenderable" -ln "i3D_nonRenderable" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_boundingVolume" -ln "i3D_boundingVolume" -dt "string";
	addAttr -ci true -sn "i3D_collisionMask" -ln "i3D_collisionMask" -at "long";
	addAttr -ci true -sn "i3D_zAxisDrive" -ln "i3D_zAxisDrive" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_cpuMesh" -ln "i3D_cpuMesh" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_staticFriction" -ln "i3D_staticFriction" -at "float";
	addAttr -ci true -sn "i3D_decalLayer" -ln "i3D_decalLayer" -at "long";
	addAttr -ci true -sn "i3D_splitMaxV" -ln "i3D_splitMaxV" -at "float";
	addAttr -ci true -sn "i3D_splitMaxU" -ln "i3D_splitMaxU" -at "float";
	addAttr -ci true -sn "i3D_compoundChild" -ln "i3D_compoundChild" -min 0 -max 1 -at "bool";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1.4714896678924561e-07 0 ;
	setAttr ".i3D_xmlIdentifier" -type "string" "fertilizer_coupling_2";
	setAttr ".i3D_objectMask" 255;
	setAttr ".i3D_dynamicFriction" 0.5;
	setAttr ".i3D_density" 1;
	setAttr ".i3D_driveForceLimit" 100000;
	setAttr ".i3D_angularDamping" 0.0099999997764825821;
	setAttr ".i3D_splitUvWorldScale" 1;
	setAttr ".i3D_driveSpring" 1;
	setAttr ".i3D_projDistance" 0.0099999997764825821;
	setAttr ".i3D_driveDamping" 0.0099999997764825821;
	setAttr ".i3D_clipDistance" 300;
	setAttr ".i3D_projAngle" 0.0099999997764825821;
	setAttr ".i3D_lightMask" -type "string" "FFFF";
	setAttr ".i3D_solverIterationCount" 4;
	setAttr ".i3D_boundingVolume" -type "string" "";
	setAttr ".i3D_collisionMask" 255;
	setAttr ".i3D_staticFriction" 0.5;
	setAttr ".i3D_splitMaxV" 1;
	setAttr ".i3D_splitMaxU" 1;
createNode mesh -n "fertilizer_coupling_2Shape" -p "fertilizer_coupling_2";
	rename -uid "4363D283-42A2-891A-4A01-5B936144EE2A";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:363]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 769 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 4.86492395 0.58965021 4.8892436
		 0.58937627 4.88928127 0.59549111 4.86492395 0.59553915 4.84146309 0.59545416 4.84161711
		 0.58944517 4.98785448 0.59553933 4.96266508 0.59553921 4.96266508 0.5897404 4.98785448
		 0.58974022 4.93800306 0.59553933 4.93800306 0.58974016 4.91607237 0.58944148 4.91660786
		 0.59531122 4.89239359 0.63271642 4.86842728 0.6327343 4.86840582 0.60431039 4.89237261
		 0.60429269 4.84446049 0.63275206 4.84443951 0.60432804 4.82049417 0.63276976 4.82047319
		 0.60434574 4.6287632 0.63291132 4.60479641 0.63292897 4.60477543 0.60450542 4.62874222
		 0.60448754 4.98825884 0.63264573 4.96429253 0.63266331 4.96427155 0.60423934 4.98823833
		 0.60422164 4.94032621 0.63268101 4.94030523 0.60425699 4.9163599 0.63269871 4.91633892
		 0.60427511 4.9112854 0.5561949 4.88927841 0.55635297 4.88920832 0.54957432 4.91368055
		 0.54924583 4.91367626 0.55494362 4.91605663 0.55620801 4.93800306 0.54993135 4.93800306
		 0.55663872 4.96266508 0.55663866 4.98785448 0.55663866 4.86492395 0.5566386 4.84082556
		 0.55663854 4.84082556 0.54993135 4.86492395 0.54993117 4.88929081 0.59871924 4.86492395
		 0.598719 4.8414402 0.59870219 4.81854248 0.59858054 4.81854248 0.59587127 4.82169294
		 0.59533119 4.62626648 0.59546506 4.6293726 0.59560192 4.629457 0.59867811 4.60517979
		 0.59871912 4.60517979 0.59553921 4.98785448 0.598719 4.96266508 0.59871936 4.93800306
		 0.59871918 4.91354179 0.59872633 4.91348219 0.59561241 4.9106884 0.59554297 4.91117811
		 0.58951014 4.60517979 0.58941138 4.62671471 0.58948791 4.96266508 0.54993129 4.98785448
		 0.54993129 4.68853188 0.23885113 4.68636513 0.2389062 4.6853776 0.20948148 4.68818426
		 0.20940906 4.69096184 0.20941532 4.69066763 0.23885512 4.60517979 0.55663872 4.62678051
		 0.55660558 4.82111931 0.58945864 4.82075739 0.55661368 4.68868303 0.24736089 4.68598223
		 0.24788982 4.68598223 0.24369174 4.68868351 0.24317408 4.67652798 0.23900241 4.67658854
		 0.20947075 4.68201637 0.2094931 4.67983866 0.23900861 4.700243 0.20933968 4.69976282
		 0.23877779 4.69646263 0.23872325 4.69483185 0.20926253 4.69120407 0.24787852 4.69138432
		 0.24368054 4.60421419 0.63970339 4.63063288 0.63970339 4.63063288 0.65404016 4.60421419
		 0.65404016 4.97459221 0.63970339 4.98882103 0.63970339 4.98882055 0.6540398 4.97459221
		 0.6540401 4.94822598 0.63970339 4.94916534 0.65362865 4.92585659 0.6396274 4.92590523
		 0.65315384 4.90296841 0.63970339 4.9026742 0.65352386 4.87663937 0.63970339 4.87663937
		 0.65404004 4.85348845 0.63970339 4.85348845 0.65404016 4.83829594 0.63970339 4.83829594
		 0.6540401 4.60335827 0.67351854 4.62818289 0.67351872 4.62818289 0.69092172 4.60335827
		 0.69092143 4.96947622 0.67343658 4.9890008 0.67343652 4.9890008 0.68712407 4.96947622
		 0.68712407 4.94995117 0.67343652 4.94995117 0.68712437 4.8789897 0.67354417 4.90122366
		 0.67354363 4.90122366 0.68913066 4.87899017 0.68913072 4.85675621 0.67354363 4.85675621
		 0.68913019 4.83452225 0.67354369 4.83452225 0.68913019 4.60364056 0.69908476 4.62934113
		 0.69908446 4.62934113 0.71662945 4.60364056 0.71662951 4.96898174 0.70035672 4.99038029
		 0.70035672 4.99038029 0.71565306 4.96898174 0.71565306 4.9475832 0.70035672 4.9475832
		 0.715653 4.61416864 0.1067057 4.61162329 0.12588659 4.60583973 0.1239703 4.60800743
		 0.10663643 4.61190891 0.087361008 4.60604572 0.089242488 4.87859297 0.69998157 4.90116978
		 0.69998163 4.90116978 0.71558619 4.87859297 0.71558607 4.85646629 0.69998175 4.85646629
		 0.71558607 4.83436728 0.69998175 4.83436728 0.71558607 4.60332489 0.72092962 4.62787342
		 0.72092968 4.62787342 0.73499161 4.60332489 0.73499072 4.96833038 0.72213167 4.99060059
		 0.72213155 4.99060059 0.73633873 4.96832943 0.73633796 4.94605923 0.72213149 4.9460597
		 0.7363379 4.87864256 0.72190106 4.90072012 0.72190094 4.90072012 0.73598409 4.87864256
		 0.73598421 4.85656452 0.72190088 4.85656452 0.73598421 4.83448696 0.72190082 4.83448696
		 0.73598421 4.60290289 0.75457454 4.62752962 0.75457454 4.62752962 0.77184534 4.60290289
		 0.77184522 4.96548223 0.75457454 4.99013186 0.75457454 4.99013186 0.77184564 4.96548223
		 0.77184516 4.94128323 0.75457448 4.94128323 0.77184522 4.91714859 0.75457454 4.91714859
		 0.77184522 4.89299393 0.7545746 4.89299393 0.77184522 4.86883593 0.75457454 4.86883593
		 0.77184522 4.84471226 0.75457448 4.84471226 0.77184516 4.8205719 0.75457454 4.8205719
		 0.77184534 4.60233688 0.79443473 4.62660933 0.79443461 4.62660933 0.8848632 4.60233688
		 0.8848632 4.96642542 0.79443467 4.99069786 0.79443467 4.99069786 0.88486314 4.96642542
		 0.88486314 4.9421525 0.79443467 4.9421525 0.88486326 4.91788006 0.79443461 4.91788006
		 0.8848632 4.89360762 0.79443461 4.89360762 0.8848632 4.86933517 0.79443461 4.86933517
		 0.8848632 4.84506226 0.79443461 4.84506226 0.8848632 4.82078981 0.79443461 4.82078981
		 0.88486326 4.47995806 0.53047413 4.48890066 0.51911873 4.51297283 0.54727501 4.47604132
		 0.54438704 4.47774792 0.55873984 4.48481655 0.57134694 4.49617195 0.58028954 4.51008415
		 0.58420593 4.5244379 0.5824998 4.53704453 0.57543117 4.60288334 0.74291277 4.62473297
		 0.74291283 4.62473297 0.74792504 4.60288334 0.7479251 4.62380266 0.78528047 4.60195923
		 0.78528011 4.60195923 0.77814925 4.62380266 0.77814925 4.96955872 0.74291307 4.99181318
		 0.74291241 4.99181318 0.74792558 4.96955872 0.74792504 4.99107552 0.78528047 4.96892405
		 0.78528047 4.96892405 0.77814949 4.99107552 0.77814949 4.9503417 0.74291283 4.9503417
		 0.74792504 4.94654226 0.78528035 4.94654226 0.77814949 4.92410564 0.74291277 4.92410564
		 0.74792498 4.92516661 0.78528035 4.92516661 0.77814943 4.90087414 0.74291283 4.90087461
		 0.7479251;
	setAttr ".uvst[0].uvsp[250:499]" 4.90041351 0.78528005 4.90041351 0.77814919
		 4.86749554 0.74291277 4.86749554 0.74792486 4.8779707 0.78528035 4.87797022 0.77814949
		 4.84649086 0.74291283 4.84649086 0.7479251 4.85585403 0.78528053 4.85585403 0.77814966
		 4.824121 0.74291277 4.824121 0.74792522 4.83453941 0.78528053 4.83453941 0.77814966
		 4.64348745 0.10690203 4.64486885 0.12393716 4.63862085 0.12451831 4.63698292 0.10677853
		 4.64545345 0.089890391 4.63921881 0.088964731 4.58476257 0.120958 4.58581686 0.10643461
		 4.59563637 0.10656658 4.59440804 0.12144485 4.58511066 0.092062742 4.5945816 0.09164241
		 4.62497902 0.1066238 4.62497902 0.1264222 4.62007713 0.1264222 4.62007713 0.1066238
		 4.62497902 0.086825639 4.62007713 0.086825639 4.94746685 0.66058654 4.9259243 0.65916151
		 4.90462494 0.66041535 4.6315012 0.10660258 4.63415718 0.0871723 4.63260365 0.12607542
		 4.48487329 0.93791485 4.49598885 0.94530219 4.4969511 0.95596051 4.48480511 0.9540934
		 4.506042 0.92215884 4.50594616 0.9453429 4.48493958 0.92207187 4.5188446 0.92213988
		 4.53984737 0.92218941 4.52873564 0.9452374 4.51878929 0.94521314 4.53981161 0.93795687
		 4.53977489 0.95405781 4.52925444 0.95584261 4.60395479 0.10659125 4.60133362 0.10659221
		 4.59989452 0.091100365 4.60228491 0.090451628 4.59871864 0.10658935 4.59747314 0.091449648
		 4.59732294 0.12166014 4.60212326 0.12275234 4.53487062 0.96536613 4.52846956 0.96713877
		 4.51875257 0.96396935 4.51876974 0.9558208 4.53976488 0.95903611 4.53839779 0.96300459
		 4.50589991 0.95599848 4.5058651 0.96418607 4.49608088 0.96730876 4.48966169 0.96548641
		 4.48613262 0.96309143 4.48478317 0.95909548 4.59973097 0.12205735 4.78019238 0.20917749
		 4.78065825 0.23887521 4.77824306 0.23894256 4.7770896 0.20926391 4.71918011 0.20923424
		 4.72229815 0.20928109 4.72156763 0.23898792 4.71918011 0.23895133 4.78053999 0.24579126
		 4.77818489 0.24625427 4.77816534 0.24271065 4.78054142 0.24224693 4.7663126 0.23842674
		 4.76676416 0.20880228 4.77220821 0.20889872 4.76984644 0.23847955 4.73097992 0.20899004
		 4.73094177 0.23861176 4.72762203 0.23860735 4.72553539 0.20899653 4.72223091 0.24609256
		 4.71987152 0.24556923 4.71987152 0.24223781 4.72220659 0.24276161 4.77272272 0.58957624
		 4.772892 0.59553933 4.74903345 0.59551263 4.7491312 0.58942628 4.79561901 0.58962703
		 4.79580402 0.59562701 4.65360308 0.59549165 4.65375519 0.58940148 4.67805195 0.58971238
		 4.67805195 0.59553921 4.70177126 0.58952463 4.70189095 0.59548938 4.72308064 0.58956754
		 4.72263336 0.59554005 4.74859524 0.63282275 4.74857426 0.60439909 4.77254057 0.6043812
		 4.77256155 0.63280499 4.79650688 0.60436362 4.79652786 0.63278735 4.65270853 0.6044699
		 4.65272951 0.63289368 4.67667484 0.60445201 4.67669582 0.63287592 4.70064116 0.60443437
		 4.70066261 0.63285816 4.72460747 0.60441661 4.72462845 0.63284051 4.67805195 0.5566386
		 4.70175648 0.55662727 4.65380239 0.55662274 4.78329659 0.20916648 4.78307438 0.23886693
		 4.77230358 0.55663162 4.77231932 0.54994416 4.79536867 0.54997611 4.7953558 0.55665749
		 4.749053 0.54992956 4.74907923 0.55663812 4.772892 0.59871924 4.74903059 0.59877741
		 4.79582691 0.59887546 4.81539154 0.59534615 4.6327877 0.59520817 4.65359974 0.59876084
		 4.67805195 0.59871912 4.70193291 0.5986743 4.72537041 0.59561086 4.7254343 0.59870553
		 4.72837543 0.59529805 4.72783375 0.58946347 4.63225269 0.58937871 4.71679354 0.23898792
		 4.71606255 0.20928109 4.67805195 0.54993129 4.70175695 0.54995561 4.65382004 0.54997182
		 4.74854565 0.23906103 4.74854517 0.20933923 4.75137949 0.20937911 4.75073195 0.23909083
		 4.74638939 0.23909035 4.74574184 0.20937863 4.7277112 0.55662131 4.72308016 0.55662274
		 4.63220024 0.55660498 4.81570387 0.55661303 4.81586409 0.58949673 4.78291702 0.24271232
		 4.78289509 0.24625595 4.79300022 0.23874301 4.78946733 0.23868495 4.78803587 0.2090444
		 4.79348087 0.20911914 4.70651722 0.20968223 4.71196079 0.20964569 4.71011066 0.23927218
		 4.70679092 0.23930287 4.71751261 0.24609254 4.7175374 0.24276161 4.74862623 0.24706134
		 4.74849701 0.24373159 4.75066376 0.24406299 4.75072908 0.24739513 4.75999308 0.23870239
		 4.75667048 0.23868904 4.75465822 0.20905909 4.76010513 0.20906863 4.73738909 0.20944461
		 4.74283504 0.20935729 4.7412467 0.23901287 4.73792553 0.23907378 4.74658585 0.24755034
		 4.74639177 0.24422345 4.72541237 0.55627918 4.72540855 0.54990733 4.65066242 0.63970345
		 4.65066242 0.65404016 4.67656612 0.63970333 4.67656612 0.6540401 4.70292664 0.63970339
		 4.7039299 0.65438324 4.72799206 0.63970333 4.73068857 0.65454304 4.7619586 0.63970339
		 4.75976038 0.65447456 4.78565979 0.63970333 4.78565979 0.65404016 4.81187677 0.63970339
		 4.8118763 0.65404016 4.65300655 0.67351884 4.65300703 0.69092131 4.67783117 0.67351896
		 4.67783117 0.69092137 4.70265532 0.67351884 4.70265532 0.69092131 4.7900548 0.67354363
		 4.7900548 0.68913019 4.76782131 0.68913019 4.76782131 0.67354363 4.81228828 0.67354363
		 4.81228828 0.68913019 4.65412045 0.69908488 4.65412045 0.71662962 4.67959309 0.69908452
		 4.67959309 0.71662968 4.70188141 0.6990847 4.70188141 0.71662951 4.63492966 0.22159684
		 4.64109135 0.2215845 4.64312315 0.23894137 4.63732529 0.24081248 4.63734055 0.20228577
		 4.64318895 0.20421296 4.79012775 0.69998151 4.79012775 0.71558607 4.76756001 0.71558607
		 4.76756001 0.69998133 4.81226444 0.69998151 4.81226444 0.71558607 4.65242195 0.72092962
		 4.65242195 0.73499155 4.67697096 0.72092968 4.67697096 0.73499155 4.70151949 0.72092968
		 4.70151949 0.73499149 4.79033136 0.72190088 4.79033136 0.73598427 4.76825333 0.73598421
		 4.76825333 0.72190094 4.81240892 0.72190082 4.81240892 0.73598421 4.65167713 0.75457454;
	setAttr ".uvst[0].uvsp[500:749]" 4.65167713 0.77184534 4.67579556 0.75457454
		 4.67579556 0.77184534 4.69993591 0.75457454 4.69993591 0.77184534 4.72404575 0.75457507
		 4.72404575 0.77184582 4.74819517 0.75457448 4.74819517 0.77184528 4.77231169 0.75457448
		 4.77231169 0.77184528 4.79643154 0.75457448 4.79643154 0.77184528 4.65088177 0.79443461
		 4.65088177 0.8848632 4.67515469 0.79443467 4.67515469 0.88486326 4.69942713 0.79443467
		 4.69942713 0.88486326 4.72369957 0.79443467 4.72369957 0.88486326 4.74797201 0.79443461
		 4.74797201 0.88486326 4.77224493 0.79443467 4.77224493 0.88486326 4.79651737 0.79443461
		 4.79651737 0.88486326 4.50150824 0.51205021 4.51586103 0.51034409 4.52977324 0.51426059
		 4.54112864 0.52320319 4.54819727 0.53581029 4.54990387 0.55016297 4.54598713 0.56407589
		 4.65531063 0.74291277 4.65531063 0.74792504 4.64624453 0.77814925 4.64624453 0.78528023
		 4.68452358 0.74291283 4.68452358 0.74792504 4.66804361 0.77814919 4.66804361 0.78528005
		 4.70773506 0.74291277 4.70773506 0.74792516 4.71428156 0.77814919 4.71428156 0.78528029
		 4.73356819 0.74291283 4.73356819 0.74792528 4.74246836 0.77814966 4.74246836 0.78528053
		 4.75509405 0.74291277 4.75509405 0.74792504 4.76921844 0.77814966 4.76921844 0.78528059
		 4.77778196 0.74291277 4.77778196 0.74792504 4.78999043 0.77814966 4.78999043 0.78528059
		 4.80100489 0.74291283 4.80100489 0.7479251 4.81217289 0.77814966 4.81217289 0.78528053
		 4.60492134 0.22208327 4.61142063 0.22179514 4.61023283 0.23957062 4.60397196 0.23914808
		 4.60252523 0.20512694 4.60873413 0.20404357 4.66422367 0.23609388 4.65457439 0.23650545
		 4.65346289 0.22161806 4.66328287 0.22156268 4.65463352 0.20670247 4.66410112 0.20719689
		 4.62339163 0.22154915 4.62829351 0.22154915 4.62829351 0.24134761 4.62339163 0.24134761
		 4.62339163 0.2017507 4.62829351 0.2017507 4.73102427 0.6609202 4.70639658 0.66167605
		 4.75727081 0.66211832 4.61689615 0.22148037 4.61374855 0.20212334 4.61628771 0.24097484
		 4.72763872 0.70815033 4.74437141 0.70816082 4.74624157 0.72073209 4.73522329 0.71968359
		 4.71123791 0.72996533 4.71125317 0.70813984 4.73521519 0.72998202 4.7108717 0.67773753
		 4.73484945 0.67766082 4.73488283 0.68799627 4.71093988 0.69956267 4.74590397 0.68852717
		 4.74405766 0.69946206 4.72732544 0.69951266 4.64514446 0.22157764 4.64694023 0.20545149
		 4.64932537 0.20611894 4.64776516 0.22159904 4.65174389 0.20648724 4.65038013 0.22161651
		 4.65165806 0.23669785 4.64684916 0.23775256 4.75580502 0.6943562 4.75335407 0.69802356
		 4.74923086 0.69944704 4.7458725 0.67763144 4.75434065 0.67760718 4.75764179 0.68770319
		 4.74954462 0.70816422 4.75367069 0.70957851 4.75613022 0.71324039 4.75798225 0.71988946
		 4.754704 0.72999239 4.74623585 0.72998726 4.64924717 0.23707616 4.54933119 0.50449538
		 4.53885889 0.49749792 4.56168461 0.47467184 4.59396553 0.47467172 4.59150839 0.48702556
		 4.58451033 0.49749798 4.56168461 0.5069527 4.57403755 0.5044955 4.59150839 0.46231794
		 4.53186131 0.48702532 4.52940369 0.47467196 4.53186083 0.46231872 4.57403755 0.44484812
		 4.58451033 0.45184547 4.56168413 0.44239104 4.53885841 0.45184606 4.54933119 0.44484842
		 4.60517979 0.54993129 4.62949657 0.549891 4.62949276 0.55617499 4.81822443 0.54987693
		 4.81823015 0.55621684 3.14279222 2.65184355 3.16563511 2.65184331 3.16563511 2.66580772
		 3.14279222 2.66580796 3.18843174 2.65184355 3.18843174 2.66580772 3.21123695 2.65184355
		 3.21123695 2.66580772 3.23398733 2.65184355 3.23398685 2.66580772 3.25670815 2.65184379
		 3.25670815 2.66580796 3.27942324 2.65184379 3.27942324 2.66580772 3.30213881 2.65184379
		 3.30213881 2.66580796 3.32485342 2.65184379 3.32485342 2.66580796 3.34756756 2.65184331
		 3.34756756 2.66580796 3.37028408 2.65184331 3.37028408 2.66580796 3.39303589 2.65184331
		 3.39303589 2.66580796 3.41607571 2.65184331 3.41607571 2.66580796 3.43961143 2.65184331
		 3.43961143 2.66580796 3.46389771 2.65184331 3.46389771 2.66580796 3.0040884018 2.65184379
		 3.028375626 2.65184379 3.028375626 2.66580772 3.0040884018 2.66580772 3.051929951
		 2.65184379 3.051929951 2.66580772 3.07514286 2.65184331 3.07514286 2.66580772 3.098121643
		 2.65184355 3.098121643 2.66580772 3.12070751 2.65184355 3.12070751 2.66580772 3.16601801
		 2.64533567 3.14347887 2.64533567 3.14347887 2.63953853 3.16601801 2.63953853 3.18952703
		 2.64533567 3.18952703 2.63953853 3.2120657 2.64533567 3.2120657 2.63953853 3.23477173
		 2.64533567 3.23477173 2.63953853 3.25745964 2.64533567 3.25745964 2.63953853 3.28014612
		 2.64533567 3.28014612 2.63953853 3.3028326 2.64533567 3.3028326 2.63953853 3.32551861
		 2.64533567 3.32551861 2.63953853 3.34820652 2.64533567 3.34820652 2.63953853 3.37089252
		 2.64533567 3.37089252 2.63953853 3.39357853 2.64533567 3.39357853 2.63953853 3.41620731
		 2.64533567 3.41620731 2.63953853 3.43993664 2.64533567 3.43993664 2.63953853 3.46458626
		 2.64533567 3.46458626 2.63953853 3.029747486 2.64533567 3.0047893524 2.64564562 3.0047893524
		 2.63922882 3.029747486 2.63953853 3.053365707 2.64533567 3.053365707 2.63953853 3.076060295
		 2.64533567 3.076060295 2.63953853 3.099107265 2.64533567 3.099107265 2.63953853 3.12186193
		 2.64533567 3.12186193 2.63953853 3.14337301 2.67203212 3.16573238 2.67203188 3.16573238
		 2.67806864 3.14337301 2.67806864 3.18745899 2.67203212 3.18745899 2.6780684 3.21020699
		 2.67203259 3.21020699 2.6780684 3.23320198 2.67203259 3.23320198 2.67806888 3.25594044
		 2.67203259 3.25594044 2.67806888 3.27857971 2.67203259 3.27857971 2.67806888 3.30122614
		 2.67203259 3.30122614 2.67806888 3.32387352 2.67203259 3.32387352 2.67806888 3.34651852
		 2.67203355 3.34651852 2.67806983 3.36916733 2.67203355 3.36916733 2.67806983 3.39181328
		 2.67203355;
	setAttr ".uvst[0].uvsp[750:768]" 3.39181328 2.67806983 3.41437912 2.67203355
		 3.41437912 2.67806983 3.43788338 2.67203355 3.43788338 2.67806983 3.46265697 2.6718061
		 3.46265697 2.67829728 3.0040636063 2.67203259 3.028565884 2.67203259 3.028565884
		 2.67806888 3.0040636063 2.67806888 3.05216217 2.67203164 3.05216217 2.67806792 3.074756622
		 2.67203307 3.074756622 2.6780684 3.0974226 2.67203259 3.0974226 2.6780684 3.11993599
		 2.67203212 3.11993599 2.6780684;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 388 ".pt";
	setAttr ".pt[0:165]" -type "float3"  -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228;
	setAttr ".pt[166:331]" -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228;
	setAttr ".pt[332:387]" -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16
		-1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07
		5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228 -1.5265567e-16 -1.4714897e-07 5.2443228
		-1.5265567e-16 -1.4714897e-07 5.2443228;
	setAttr -s 388 ".vt";
	setAttr ".vt[0:165]"  1.4551919e-09 0.048248276 -5.1896553 4.6599581e-16 -0.048247818 -5.1896553
		 4.6637862e-16 0.05569154 -5.21855164 4.6637862e-16 -0.055691246 -5.21855164 -1.746225e-10 0.053034481 -5.21855164
		 4.6637862e-16 -0.053034194 -5.21855164 -0.0026977928 -0.052449811 -5.21855164 -0.0020716283 -0.047665566 -5.21855164
		 4.6027728e-16 0.048227005 -5.19498062 4.6027712e-16 -0.048220225 -5.19497967 -0.0020806489 0.047817029 -5.19497967
		 -0.00207166 0.047727861 -5.21855164 0.044575363 0.018463854 -5.1896553 0.034116518 0.034116618 -5.1896553
		 0.01846374 0.044575382 -5.1896553 0.01846371 -0.044575259 -5.1896553 0.034116495 -0.034116372 -5.1896553
		 0.044575352 -0.018463625 -5.1896553 0.048248008 -4.6368598e-10 -5.1896553 0.05145216 0.021312421 -5.21855164
		 0.039379794 0.039379872 -5.21855164 0.021312207 0.051452428 -5.21855164 0.021312173 -0.051451977 -5.21855164
		 0.039379772 -0.039379641 -5.21855164 0.051452149 -0.021312203 -5.21855164 0.05569141 9.2967412e-11 -5.21855164
		 0.044462308 0.01841696 -5.21855164 0.044462308 -0.018416731 -5.21855164 0.034029976 -0.034029882 -5.21855164
		 0.018416883 -0.044462234 -5.21855164 0.018416915 0.044462353 -5.21855164 0.034029994 0.034030128 -5.21855164
		 0.048997402 0.020295504 -5.21855164 0.037501 0.037501179 -5.21855164 0.020295413 0.048997499 -5.21855164
		 0.020295378 -0.048997208 -5.21855164 0.037500981 -0.037500795 -5.21855164 0.048997391 -0.020295272 -5.21855164
		 0.053034399 -1.0581402e-10 -5.21855164 0.052550185 0.0024343752 -5.21855164 0.047765996 0.0018080923 -5.21855164
		 0.05254494 -0.002460612 -5.21855164 0.047760751 -0.0018343267 -5.21855164 0.0026977928 -0.052449811 -5.21855164
		 0.044539671 -0.018448904 -5.19497967 0.034089189 -0.034089036 -5.19497967 0.01844893 -0.044539571 -5.19497967
		 0.047831945 -0.0018435866 -5.19497967 0.0481987 -4.6746607e-10 -5.19497967 0.047837198 0.001817657 -5.19497967
		 0.044527423 0.018444039 -5.19497967 0.034079824 0.03407985 -5.19497967 0.018443881 0.044527467 -5.19497967
		 0.00207166 0.047727861 -5.21855164 0.0026978278 0.05251212 -5.21855164 0.050774291 -0.0019007702 -5.19498825
		 0.051141042 -2.9971119e-09 -5.19498825 0.050779544 0.0018745287 -5.19498825 4.7269081e-16 -0.055691246 -5.24432278
		 0.021312173 -0.051451977 -5.24432278 0.039379772 -0.039379641 -5.24432278 0.051452149 -0.021312203 -5.24432278
		 0.05569141 9.2967412e-11 -5.24432278 0.05145216 0.021312421 -5.24432278 0.039379794 0.039379872 -5.24432278
		 0.021312207 0.051452428 -5.24432278 4.7269081e-16 0.05569154 -5.24432278 4.7269081e-16 -0.044948053 -5.24432278
		 0.017200949 -0.041526675 -5.24432278 0.031783219 -0.031783 -5.24432278 0.041526772 -0.017200775 -5.24432278
		 0.044948261 2.697405e-09 -5.24432278 0.041526783 0.017200999 -5.24432278 0.031783238 0.031783238 -5.24432278
		 0.017200978 0.041526817 -5.24432278 4.7269081e-16 0.044948339 -5.24432278 4.696794e-16 -0.044948053 -5.23202801
		 0.017200949 -0.041526675 -5.23202801 0.031783219 -0.031783 -5.23202801 0.041526772 -0.017200775 -5.23202801
		 0.041526783 0.017200999 -5.23202801 0.031783238 0.031783238 -5.23202801 0.017200978 0.041526817 -5.23202801
		 4.696794e-16 0.044948339 -5.23202801 4.7118505e-16 -0.033756949 -5.23202801 0.012918313 -0.031187374 -5.23202801
		 0.023869939 -0.023869956 -5.23202801 0.031187572 -0.012918122 -5.23202801 0.031187579 0.012918357 -5.23202801
		 0.02386995 0.023869911 -5.23202801 0.012918338 0.031187689 -5.23202801 4.7118505e-16 0.033757232 -5.23202801
		 4.7221399e-16 -0.033756949 -5.24042988 0.012918313 -0.031187374 -5.24042988 0.023869939 -0.023869956 -5.24042988
		 0.031187572 -0.012918122 -5.24042988 0.033757191 6.0379648e-09 -5.24042988 0.031187579 0.012918357 -5.24042988
		 0.02386995 0.023869911 -5.24042988 0.012918338 0.031187689 -5.24042988 4.7221399e-16 0.033757232 -5.24042988
		 4.7173727e-16 -0.022953041 -5.24042988 0.0087837838 -0.021205917 -5.24042988 0.01623033 -0.016230274 -5.24042988
		 0.021205934 -0.0087835286 -5.24042988 0.022953145 6.8933588e-09 -5.24042988 0.021205939 0.0087837726 -5.24042988
		 0.016230328 0.016230561 -5.24042988 0.008783807 0.021205936 -5.24042988 4.7221399e-16 0.022953317 -5.24042988
		 4.6356509e-16 -0.022953041 -5.20706463 0.0087837838 -0.021205917 -5.20706463 0.01623033 -0.016230274 -5.20706463
		 0.021205934 -0.0087835286 -5.20706463 0.022953145 6.999386e-09 -5.20706463 0.021205939 0.0087837726 -5.20706463
		 0.016230328 0.016230561 -5.20706463 0.008783807 0.021205936 -5.20706463 4.681279e-16 0.022953317 -5.20706463
		 4.5928604e-16 -9.4977821e-09 -5.1908617 4.7249848e-16 -0.032662615 -5.24275303 4.7230626e-16 -0.024706956 -5.24275303
		 0.012499494 -0.030176168 -5.24275303 0.0094549302 -0.022826061 -5.24275303 0.023096062 -0.023096021 -5.24275303
		 0.017470447 -0.017470431 -5.24275303 0.030176453 -0.012499413 -5.24275303 0.022826225 -0.0094547225 -5.24275303
		 0.032662764 5.5312768e-09 -5.24275303 0.024706937 8.5192653e-09 -5.24275303 0.030176461 0.01249965 -5.24275303
		 0.022826232 0.0094549647 -5.24275303 0.023096073 0.023096288 -5.24275303 0.017470445 0.017470716 -5.24275303
		 0.012499519 0.030176478 -5.24275303 0.0094549553 0.022826388 -5.24275303 4.7249848e-16 0.032662898 -5.24275303
		 4.7249848e-16 0.024706924 -5.24275303 0.041526772 -0.017200775 -5.24997234 0.044948261 2.697405e-09 -5.24997234
		 0.031187572 -0.012918122 -5.24901009 0.033757191 5.9942238e-09 -5.24901009 0.041526783 0.017200999 -5.24997234
		 0.031187579 0.012918357 -5.24901009 0.041526772 -0.017200775 -5.25431442 0.044948261 2.697405e-09 -5.25431442
		 0.041526783 0.017200999 -5.25431442 0.036672689 -0.015073634 -5.24432278 0.040094178 3.4466723e-09 -5.24432278
		 0.036365308 -0.015062761 -5.24997234 0.040094178 3.4466723e-09 -5.24997234 0.0366727 0.015122492 -5.24432278
		 0.037142154 0.015385006 -5.24997234 0.036739629 -0.015217941 -5.25599289 0.039766695 4.2238639e-09 -5.25599289
		 0.03673964 0.015218169 -5.25599289 0.033590358 -0.013913386 -5.25504112 0.031187572 -0.012918122 -5.25166225
		 0.031856295 -0.013195137 -5.25377846 0.033757191 5.9942238e-09 -5.25166225 0.034481011 5.7809899e-09 -5.25377846
		 0.036357947 5.2280456e-09 -5.25504112 0.033590365 0.013913614 -5.25504112 0.031856302 0.013195369 -5.25377846
		 0.031187579 0.012918357 -5.25166225 -0.044575363 0.018463854 -5.1896553;
	setAttr ".vt[166:331]" -0.034116518 0.034116618 -5.1896553 -0.01846374 0.044575382 -5.1896553
		 -0.01846371 -0.044575259 -5.1896553 -0.034116495 -0.034116372 -5.1896553 -0.044575352 -0.018463625 -5.1896553
		 -0.048248008 -4.6368598e-10 -5.1896553 -0.05145216 0.021312421 -5.21855164 -0.039379794 0.039379872 -5.21855164
		 -0.021312207 0.051452428 -5.21855164 -0.021312173 -0.051451977 -5.21855164 -0.039379772 -0.039379641 -5.21855164
		 -0.051452149 -0.021312203 -5.21855164 -0.05569141 9.2967412e-11 -5.21855164 -0.044462308 0.01841696 -5.21855164
		 -0.044462308 -0.018416731 -5.21855164 -0.034029976 -0.034029882 -5.21855164 -0.018416883 -0.044462234 -5.21855164
		 -0.018416915 0.044462353 -5.21855164 -0.034029994 0.034030128 -5.21855164 -0.048997402 0.020295504 -5.21855164
		 -0.037501 0.037501179 -5.21855164 -0.020295413 0.048997499 -5.21855164 -0.020295378 -0.048997208 -5.21855164
		 -0.037500981 -0.037500795 -5.21855164 -0.048997391 -0.020295272 -5.21855164 -0.053034399 -1.0581402e-10 -5.21855164
		 -0.052550185 0.0024343752 -5.21855164 -0.047765996 0.0018080923 -5.21855164 -0.05254494 -0.002460612 -5.21855164
		 -0.047760751 -0.0018343267 -5.21855164 -0.044539671 -0.018448904 -5.19497967 -0.034089189 -0.034089036 -5.19497967
		 -0.01844893 -0.044539571 -5.19497967 -0.047831945 -0.0018435866 -5.19497967 -0.0481987 -4.6746607e-10 -5.19497967
		 -0.047837198 0.001817657 -5.19497967 -0.044527423 0.018444039 -5.19497967 -0.034079824 0.03407985 -5.19497967
		 -0.018443881 0.044527467 -5.19497967 -0.050774291 -0.0019007702 -5.19498825 -0.051141042 -2.9971119e-09 -5.19498825
		 -0.050779544 0.0018745287 -5.19498825 -0.021312173 -0.051451977 -5.24432278 -0.039379772 -0.039379641 -5.24432278
		 -0.051452149 -0.021312203 -5.24432278 -0.05569141 9.2967412e-11 -5.24432278 -0.05145216 0.021312421 -5.24432278
		 -0.039379794 0.039379872 -5.24432278 -0.021312207 0.051452428 -5.24432278 -0.017200949 -0.041526675 -5.24432278
		 -0.031783219 -0.031783 -5.24432278 -0.041526772 -0.017200775 -5.24432278 -0.044948261 2.697405e-09 -5.24432278
		 -0.041526783 0.017200999 -5.24432278 -0.031783238 0.031783238 -5.24432278 -0.017200978 0.041526817 -5.24432278
		 -0.017200949 -0.041526675 -5.23202801 -0.031783219 -0.031783 -5.23202801 -0.041526772 -0.017200775 -5.23202801
		 -0.041526783 0.017200999 -5.23202801 -0.031783238 0.031783238 -5.23202801 -0.017200978 0.041526817 -5.23202801
		 -0.012918313 -0.031187374 -5.23202801 -0.023869939 -0.023869956 -5.23202801 -0.031187572 -0.012918122 -5.23202801
		 -0.031187579 0.012918357 -5.23202801 -0.02386995 0.023869911 -5.23202801 -0.012918338 0.031187689 -5.23202801
		 -0.012918313 -0.031187374 -5.24042988 -0.023869939 -0.023869956 -5.24042988 -0.031187572 -0.012918122 -5.24042988
		 -0.033757191 6.0379648e-09 -5.24042988 -0.031187579 0.012918357 -5.24042988 -0.02386995 0.023869911 -5.24042988
		 -0.012918338 0.031187689 -5.24042988 -0.0087837838 -0.021205917 -5.24042988 -0.01623033 -0.016230274 -5.24042988
		 -0.021205934 -0.0087835286 -5.24042988 -0.022953145 6.8933588e-09 -5.24042988 -0.021205939 0.0087837726 -5.24042988
		 -0.016230328 0.016230561 -5.24042988 -0.008783807 0.021205936 -5.24042988 -0.0087837838 -0.021205917 -5.20706463
		 -0.01623033 -0.016230274 -5.20706463 -0.021205934 -0.0087835286 -5.20706463 -0.022953145 6.999386e-09 -5.20706463
		 -0.021205939 0.0087837726 -5.20706463 -0.016230328 0.016230561 -5.20706463 -0.008783807 0.021205936 -5.20706463
		 -0.012499494 -0.030176168 -5.24275303 -0.0094549302 -0.022826061 -5.24275303 -0.023096062 -0.023096021 -5.24275303
		 -0.017470447 -0.017470431 -5.24275303 -0.030176453 -0.012499413 -5.24275303 -0.022826225 -0.0094547225 -5.24275303
		 -0.032662764 5.5312768e-09 -5.24275303 -0.024706937 8.5192653e-09 -5.24275303 -0.030176461 0.01249965 -5.24275303
		 -0.022826232 0.0094549647 -5.24275303 -0.023096073 0.023096288 -5.24275303 -0.017470445 0.017470716 -5.24275303
		 -0.012499519 0.030176478 -5.24275303 -0.0094549553 0.022826388 -5.24275303 -0.041526772 -0.017200775 -5.24997234
		 -0.044948261 2.697405e-09 -5.24997234 -0.031187572 -0.012918122 -5.24901009 -0.033757191 5.9942238e-09 -5.24901009
		 -0.041526783 0.017200999 -5.24997234 -0.031187579 0.012918357 -5.24901009 -0.041526772 -0.017200775 -5.25431442
		 -0.044948261 2.697405e-09 -5.25431442 -0.041526783 0.017200999 -5.25431442 -0.036672689 -0.015073634 -5.24432278
		 -0.040094178 3.4466723e-09 -5.24432278 -0.036365308 -0.015062761 -5.24997234 -0.040094178 3.4466723e-09 -5.24997234
		 -0.0366727 0.015122492 -5.24432278 -0.037142154 0.015385006 -5.24997234 -0.036739629 -0.015217941 -5.25599289
		 -0.039766695 4.2238639e-09 -5.25599289 -0.03673964 0.015218169 -5.25599289 -0.033590358 -0.013913386 -5.25504112
		 -0.031187572 -0.012918122 -5.25166225 -0.031856295 -0.013195137 -5.25377846 -0.033757191 5.9942238e-09 -5.25166225
		 -0.034481011 5.7809899e-09 -5.25377846 -0.036357947 5.2280456e-09 -5.25504112 -0.033590365 0.013913614 -5.25504112
		 -0.031856302 0.013195369 -5.25377846 -0.031187579 0.012918357 -5.25166225 4.6597718e-16 2.5336118e-07 -5.18950319
		 -0.0020837178 -0.047758028 -5.19498062 -0.0026978278 0.05251212 -5.21855164 4.6027987e-16 0.051357709 -5.19499111
		 -0.0020991487 0.050947681 -5.19499111 4.6027966e-16 -0.051162682 -5.19499016 -0.0020621503 -0.050700355 -5.19499016
		 0.0020716283 -0.047665566 -5.21855164 0.0020837178 -0.047758028 -5.19498062 0.0020806489 0.047817029 -5.19497967
		 0.0020991487 0.050947681 -5.19499111 0.0020621503 -0.050700355 -5.19499016 -0.042172767 0.013702986 -5.17266273
		 -0.035874303 0.026064251 -5.17266273 -0.026064202 0.03587446 -5.17266273 -0.013702759 0.042172823 -5.17266273
		 4.6391486e-16 0.044343188 -5.17266273 0.013702759 0.042172823 -5.17266273 0.026064191 0.035874411 -5.17266273
		 0.035874277 0.026064217 -5.17266273 0.042172745 0.013702977 -5.17266273 0.044343047 0 -5.17266273
		 0.042172745 -0.013702672 -5.17266273 0.035874274 -0.026063908 -5.17266273 0.026064187 -0.035874087 -5.17266273
		 0.013702757 -0.042172641 -5.17266273 1.321526e-09 -0.044342857 -5.17266273 -0.01370275 -0.042172641 -5.17266273
		 -0.026064182 -0.035874076 -5.17266273 -0.03587427 -0.026063899 -5.17266273 -0.042172741 -0.013702657 -5.17266273
		 -0.044343043 0 -5.17266273 -0.042172767 0.013702986 -5.18111801 -0.035874303 0.026064251 -5.18111801
		 -0.026064202 0.03587446 -5.18111801 -0.013702759 0.042172823 -5.18111801;
	setAttr ".vt[332:387]" 4.6495025e-16 0.044343188 -5.18111801 0.013702759 0.042172823 -5.18111801
		 0.026064191 0.035874411 -5.18111801 0.035874277 0.026064217 -5.18111801 0.042172745 0.013702977 -5.18111801
		 0.044343047 0 -5.18111801 0.042172745 -0.013702672 -5.18111801 0.035874274 -0.026063908 -5.18111801
		 0.026064187 -0.035874087 -5.18111801 0.013702757 -0.042172641 -5.18111801 1.321526e-09 -0.044342857 -5.18111801
		 -0.01370275 -0.042172641 -5.18111801 -0.026064182 -0.035874076 -5.18111801 -0.03587427 -0.026063899 -5.18111801
		 -0.042172741 -0.013702657 -5.18111801 -0.044343043 0 -5.18111801 -0.03998873 0.012993175 -5.17266273
		 -0.034016445 0.024714492 -5.17266273 -0.024714397 0.03401652 -5.17266273 -0.012993125 0.039988901 -5.17266273
		 4.6391486e-16 0.042046685 -5.17266273 0.012993124 0.039988901 -5.17266273 0.024714386 0.03401649 -5.17266273
		 0.03401643 0.024714462 -5.17266273 0.039988723 0.01299315 -5.17266273 0.042046621 0 -5.17266273
		 0.039988723 -0.012992846 -5.17266273 0.034016427 -0.02471415 -5.17266273 0.024714382 -0.03401617 -5.17266273
		 0.012993122 -0.039988577 -5.17266273 1.3824323e-09 -0.042046495 -5.17266273 -0.012993115 -0.039988577 -5.17266273
		 -0.024714377 -0.034016158 -5.17266273 -0.034016423 -0.024714138 -5.17266273 -0.039988704 -0.012992841 -5.17266273
		 -0.042046614 5.8068963e-09 -5.17266273 -0.03998873 0.012993175 -5.18111801 -0.034016445 0.024714492 -5.18111801
		 -0.024714397 0.03401652 -5.18111801 -0.012993125 0.039988901 -5.18111801 4.6495025e-16 0.042046685 -5.18111801
		 0.012993124 0.039988901 -5.18111801 0.024714386 0.03401649 -5.18111801 0.03401643 0.024714462 -5.18111801
		 0.039988723 0.01299315 -5.18111801 0.042046621 0 -5.18111801 0.039988723 -0.012992846 -5.18111801
		 0.034016427 -0.02471415 -5.18111801 0.024714382 -0.03401617 -5.18111801 0.012993122 -0.039988577 -5.18111801
		 1.3824323e-09 -0.042046495 -5.18111801 -0.012993115 -0.039988577 -5.18111801 -0.024714377 -0.034016158 -5.18111801
		 -0.034016423 -0.024714138 -5.18111801 -0.039988704 -0.012992841 -5.18111801 -0.042046614 5.8068963e-09 -5.18111801;
	setAttr -s 750 ".ed";
	setAttr ".ed[0:165]"  3 5 0 7 297 0 4 299 0 13 14 0 15 16 0 16 17 0 19 32 0
		 20 33 0 21 34 0 22 35 0 23 36 0 24 37 0 25 38 0 20 21 0 22 23 0 23 24 0 19 20 0 12 13 0
		 26 50 1 27 44 1 28 45 1 29 46 1 30 52 1 31 51 1 27 28 0 28 29 0 30 31 0 31 26 0 32 26 0
		 33 31 0 34 30 0 35 29 0 36 28 0 37 27 0 32 33 0 33 34 0 5 43 0 35 36 0 36 37 0 38 39 0
		 26 40 0 25 19 0 39 32 0 39 40 0 18 12 0 40 49 0 41 38 0 41 42 0 42 47 0 24 25 0 37 41 0
		 42 27 0 17 18 0 3 22 0 1 15 0 9 304 0 44 17 1 45 16 1 46 15 1 44 45 0 45 46 0 48 18 1
		 47 48 0 48 49 0 50 12 1 51 13 1 52 14 1 50 51 0 51 52 0 49 50 0 44 47 0 14 0 0 54 4 0
		 53 54 0 21 2 0 299 306 0 306 54 0 43 307 0 47 55 0 48 56 0 55 56 0 41 55 0 38 56 1
		 49 57 0 39 57 0 56 57 0 58 3 1 59 22 1 60 23 1 61 24 1 62 25 1 63 19 1 64 20 1 65 21 1
		 66 2 1 58 59 0 59 60 0 60 61 0 61 62 0 62 63 0 63 64 0 64 65 0 65 66 0 58 67 0 59 68 1
		 67 68 0 60 69 1 68 69 0 61 70 1 69 70 0 62 71 1 70 71 1 63 72 1 71 72 1 64 73 1 72 73 0
		 65 74 1 73 74 0 66 75 0 74 75 0 67 76 1 68 77 1 76 77 0 69 78 1 77 78 0 70 79 0 78 79 0
		 72 80 0 73 81 1 80 81 0 74 82 1 81 82 0 75 83 1 82 83 0 76 84 0 77 85 1 84 85 0 78 86 1
		 85 86 0 79 87 0 86 87 0 80 88 0 81 89 1 88 89 0 82 90 1 89 90 0 83 91 0 90 91 0 84 92 1
		 85 93 1 92 93 0 86 94 1 93 94 0 87 95 0 94 95 0 95 96 0 88 97 0 96 97 0 89 98 1 97 98 0
		 90 99 1 98 99 0 91 100 1 99 100 0 101 102 0 102 103 0;
	setAttr ".ed[166:331]" 103 104 0 104 105 0 105 106 0 106 107 0 107 108 0 108 109 0
		 101 110 1 102 111 1 110 111 1 103 112 1 111 112 1 104 113 1 112 113 1 105 114 1 113 114 1
		 106 115 1 114 115 1 107 116 1 115 116 1 108 117 1 116 117 1 109 118 1 117 118 1 110 119 1
		 111 119 1 112 119 1 113 119 1 114 119 1 115 119 1 116 119 1 117 119 1 118 119 1 92 120 1
		 101 121 1 120 121 0 93 122 1 120 122 0 102 123 1 121 123 0 122 123 1 94 124 1 122 124 0
		 103 125 1 123 125 0 124 125 1 95 126 1 124 126 0 104 127 1 125 127 0 126 127 1 96 128 1
		 126 128 0 105 129 1 127 129 0 128 129 1 97 130 1 128 130 0 106 131 1 129 131 0 130 131 1
		 98 132 1 130 132 0 107 133 1 131 133 0 132 133 1 99 134 1 132 134 0 108 135 1 133 135 0
		 134 135 1 100 136 1 134 136 0 109 137 1 135 137 0 136 137 0 138 139 0 140 141 1 139 142 0
		 141 143 1 96 141 1 95 140 0 97 143 0 138 144 0 139 145 1 144 145 0 140 157 0 144 153 0
		 145 154 1 142 146 0 145 146 0 143 164 0 146 155 0 70 147 0 71 148 1 147 148 0 147 149 0
		 139 150 0 149 150 0 148 150 1 72 151 0 148 151 0 142 152 0 150 152 0 151 152 0 138 149 0
		 149 140 1 152 143 1 97 151 1 87 147 1 153 156 0 155 162 0 153 154 1 154 155 1 156 158 0
		 161 156 1 158 157 0 157 159 1 161 160 1 160 163 1 163 162 0 162 161 1 160 159 1 159 164 1
		 164 163 0 141 159 1 161 154 1 158 160 1 166 167 0 168 169 0 169 170 0 172 185 0 173 186 0
		 174 187 0 175 188 0 176 189 0 177 190 0 178 191 0 173 174 0 175 176 0 176 177 0 172 173 0
		 165 166 0 179 202 1 180 196 1 181 197 1 182 198 1 183 204 1 184 203 1 180 181 0 181 182 0
		 183 184 0 184 179 0 185 179 0 186 184 0 187 183 0 188 182 0 189 181 0 190 180 0 185 186 0
		 186 187 0 188 189 0 189 190 0 191 192 0 179 193 0 178 172 0 192 185 0;
	setAttr ".ed[332:497]" 192 193 0 171 165 0 193 201 0 194 191 0 194 195 0 195 199 0
		 177 178 0 190 194 0 195 180 0 170 171 0 182 7 0 3 175 0 6 188 0 1 168 0 196 170 1
		 197 169 1 198 168 1 196 197 0 197 198 0 200 171 1 199 200 0 200 201 0 202 165 1 203 166 1
		 204 167 1 202 203 0 203 204 0 201 202 0 196 199 0 297 198 0 187 298 0 167 0 0 10 204 0
		 11 183 0 174 2 0 199 205 0 200 206 0 205 206 0 194 205 0 191 206 1 201 207 0 192 207 0
		 206 207 0 208 175 1 209 176 1 210 177 1 211 178 1 212 172 1 213 173 1 214 174 1 58 208 0
		 208 209 0 209 210 0 210 211 0 211 212 0 212 213 0 213 214 0 214 66 0 208 215 1 67 215 0
		 209 216 1 215 216 0 210 217 1 216 217 0 211 218 1 217 218 1 212 219 1 218 219 1 213 220 1
		 219 220 0 214 221 1 220 221 0 221 75 0 215 222 1 76 222 0 216 223 1 222 223 0 217 224 0
		 223 224 0 219 225 0 220 226 1 225 226 0 221 227 1 226 227 0 227 83 0 222 228 1 84 228 0
		 223 229 1 228 229 0 224 230 0 229 230 0 225 231 0 226 232 1 231 232 0 227 233 1 232 233 0
		 233 91 0 228 234 1 92 234 0 229 235 1 234 235 0 230 236 0 235 236 0 236 237 0 231 238 0
		 237 238 0 232 239 1 238 239 0 233 240 1 239 240 0 240 100 0 101 241 0 241 242 0 242 243 0
		 243 244 0 244 245 0 245 246 0 246 247 0 247 109 0 241 248 1 110 248 1 242 249 1 248 249 1
		 243 250 1 249 250 1 244 251 1 250 251 1 245 252 1 251 252 1 246 253 1 252 253 1 247 254 1
		 253 254 1 254 118 1 248 119 1 249 119 1 250 119 1 251 119 1 252 119 1 253 119 1 254 119 1
		 234 255 1 120 255 0 241 256 1 121 256 0 255 256 1 235 257 1 255 257 0 242 258 1 256 258 0
		 257 258 1 236 259 1 257 259 0 243 260 1 258 260 0 259 260 1 237 261 1 259 261 0 244 262 1
		 260 262 0 261 262 1 238 263 1 261 263 0 245 264 1 262 264 0 263 264 1;
	setAttr ".ed[498:663]" 239 265 1 263 265 0 246 266 1 264 266 0 265 266 1 240 267 1
		 265 267 0 247 268 1 266 268 0 267 268 1 267 136 0 268 137 0 269 270 0 271 272 1 270 273 0
		 272 274 1 237 272 1 236 271 0 238 274 0 269 275 0 270 276 1 275 276 0 271 288 0 275 284 0
		 276 285 1 273 277 0 276 277 0 274 295 0 277 286 0 217 278 0 218 279 1 278 279 0 278 280 0
		 270 281 0 280 281 0 279 281 1 219 282 0 279 282 0 273 283 0 281 283 0 282 283 0 269 280 0
		 280 271 1 283 274 1 238 282 1 230 278 1 284 287 0 286 293 0 284 285 1 285 286 1 287 289 0
		 292 287 1 289 288 0 288 290 1 292 291 1 291 294 1 294 293 0 293 292 1 291 290 1 290 295 1
		 295 294 0 272 290 1 292 285 1 289 291 1 298 4 0 2 4 0 6 302 0 6 7 0 8 10 0 9 301 0
		 10 300 0 43 35 0 53 30 0 34 54 0 13 296 1 14 296 1 15 296 1 16 296 1 17 296 1 12 296 1
		 18 296 1 1 296 1 0 296 1 166 296 1 167 296 1 168 296 1 169 296 1 170 296 1 165 296 1
		 171 296 1 9 1 0 8 0 0 5 6 0 5 301 0 8 305 0 8 299 0 9 297 0 297 302 0 10 11 0 11 298 0
		 300 298 0 299 300 0 301 302 0 301 307 0 43 303 0 303 304 0 29 303 0 304 307 0 304 46 0
		 305 53 0 305 306 0 305 52 0 308 309 0 309 310 0 310 311 0 311 312 0 312 313 0 313 314 0
		 314 315 0 315 316 0 316 317 0 317 318 0 318 319 0 319 320 0 320 321 0 321 322 0 322 323 0
		 323 324 0 324 325 0 325 326 0 326 327 0 327 308 0 328 329 0 329 330 0 330 331 0 331 332 0
		 332 333 0 333 334 0 334 335 0 335 336 0 336 337 0 337 338 0 338 339 0 339 340 0 340 341 0
		 341 342 0 342 343 0 343 344 0 344 345 0 345 346 0 346 347 0 347 328 0 308 328 1 309 329 1
		 310 330 1 311 331 1 312 332 1 313 333 1 314 334 1 315 335 1 316 336 1 317 337 1 318 338 1
		 319 339 1 320 340 1 321 341 1;
	setAttr ".ed[664:749]" 322 342 1 323 343 1 324 344 1 325 345 1 326 346 1 327 347 1
		 308 348 1 309 349 1 348 349 0 310 350 1 349 350 0 311 351 1 350 351 0 312 352 1 351 352 0
		 313 353 1 352 353 0 314 354 1 353 354 0 315 355 1 354 355 0 316 356 1 355 356 0 317 357 1
		 356 357 0 318 358 1 357 358 0 319 359 1 358 359 0 320 360 1 359 360 0 321 361 1 360 361 0
		 322 362 1 361 362 0 323 363 1 362 363 0 324 364 1 363 364 0 325 365 1 364 365 0 326 366 1
		 365 366 0 327 367 1 366 367 0 367 348 0 328 368 1 329 369 1 368 369 0 330 370 1 369 370 0
		 331 371 1 370 371 0 332 372 1 371 372 0 333 373 1 372 373 0 334 374 1 373 374 0 335 375 1
		 374 375 0 336 376 1 375 376 0 337 377 1 376 377 0 338 378 1 377 378 0 339 379 1 378 379 0
		 340 380 1 379 380 0 341 381 1 380 381 0 342 382 1 381 382 0 343 383 1 382 383 0 344 384 1
		 383 384 0 345 385 1 384 385 0 346 386 1 385 386 0 347 387 1 386 387 0 387 368 0;
	setAttr -s 364 -ch 1460 ".fc[0:363]" -type "polyFaces"
		f 4 27 -29 34 29
		mu 0 4 0 1 2 3
		f 4 35 30 26 -30
		mu 0 4 3 4 5 0
		f 4 37 32 25 -32
		mu 0 4 6 7 8 9
		f 4 38 33 24 -33
		mu 0 4 7 10 11 8
		f 4 51 -34 50 47
		mu 0 4 12 11 10 13
		f 4 100 92 -17 -92
		mu 0 4 14 15 16 17
		f 4 101 93 -14 -93
		mu 0 4 15 18 19 16
		f 4 102 94 -75 -94
		mu 0 4 18 20 21 19
		f 4 95 87 -54 -87
		mu 0 4 22 23 24 25
		f 4 96 88 -15 -88
		mu 0 4 26 27 28 29
		f 4 97 89 -16 -89
		mu 0 4 27 30 31 28
		f 4 98 90 -50 -90
		mu 0 4 30 32 33 31
		f 4 99 91 -42 -91
		mu 0 4 32 14 17 33
		f 5 69 64 -45 -62 63
		mu 0 5 34 35 36 37 38
		f 5 62 61 -53 -57 70
		mu 0 5 39 38 37 40 41
		f 4 -25 19 59 -21
		mu 0 4 8 11 41 42
		f 4 -26 20 60 -22
		mu 0 4 9 8 42 43
		f 4 68 66 -4 -66
		mu 0 4 44 45 46 47
		f 4 -65 67 65 -18
		mu 0 4 36 35 44 47
		f 4 -35 -7 16 7
		mu 0 4 3 2 48 49
		f 4 13 8 -36 -8
		mu 0 4 49 50 4 3
		f 5 74 563 -73 -572 -9
		mu 0 5 50 51 52 53 4
		f 5 -37 -1 53 9 -570
		mu 0 5 54 55 56 57 58
		f 4 14 10 -38 -10
		mu 0 4 59 60 7 6
		f 4 15 11 -39 -11
		mu 0 4 60 61 10 7
		f 5 -51 -12 49 12 -47
		mu 0 5 13 10 61 62 63
		f 5 -40 -13 41 6 -43
		mu 0 5 64 63 62 48 2
		f 4 40 -44 42 28
		mu 0 4 1 65 64 2
		f 4 604 -603 569 31
		mu 0 4 66 67 54 58
		f 4 -60 56 -6 -58
		mu 0 4 42 41 40 68
		f 4 -61 57 -5 -59
		mu 0 4 43 42 68 69
		f 4 -81 -82 46 82
		mu 0 4 70 71 72 73
		f 4 39 84 -86 -83
		mu 0 4 73 74 75 70
		f 4 -68 -19 -28 23
		mu 0 4 44 35 1 0
		f 4 -27 22 -69 -24
		mu 0 4 0 5 45 44
		f 4 -70 -46 -41 18
		mu 0 4 35 34 65 1
		f 4 -71 -20 -52 48
		mu 0 4 39 41 11 12
		f 4 -607 -604 -605 21
		mu 0 4 76 77 67 66
		f 4 -571 -608 609 -23
		mu 0 4 5 78 79 45
		f 4 571 -74 570 -31
		mu 0 4 4 53 78 5
		f 4 -63 78 80 -80
		mu 0 4 80 81 82 83
		f 4 -49 -48 81 -79
		mu 0 4 84 85 86 87
		f 4 45 83 -85 43
		mu 0 4 88 89 90 91
		f 4 -64 79 85 -84
		mu 0 4 92 80 83 93
		f 4 -96 103 105 -105
		mu 0 4 94 95 96 97
		f 4 -97 104 107 -107
		mu 0 4 98 99 100 101
		f 4 -98 106 109 -109
		mu 0 4 102 98 101 103
		f 4 -99 108 111 -111
		mu 0 4 104 102 103 105
		f 4 -100 110 113 -113
		mu 0 4 106 104 105 107
		f 4 -101 112 115 -115
		mu 0 4 108 106 107 109
		f 4 -102 114 117 -117
		mu 0 4 110 108 109 111
		f 4 -103 116 119 -119
		mu 0 4 112 110 111 113
		f 4 -106 120 122 -122
		mu 0 4 114 115 116 117
		f 4 -108 121 124 -124
		mu 0 4 118 119 120 121
		f 4 -110 123 126 -126
		mu 0 4 122 118 121 123
		f 4 -116 127 129 -129
		mu 0 4 124 125 126 127
		f 4 -118 128 131 -131
		mu 0 4 128 124 127 129
		f 4 -120 130 133 -133
		mu 0 4 130 128 129 131
		f 4 -123 134 136 -136
		mu 0 4 132 133 134 135
		f 4 -125 135 138 -138
		mu 0 4 136 137 138 139
		f 4 -127 137 140 -140
		mu 0 4 140 136 139 141
		f 4 -251 252 277 -254
		mu 0 4 142 143 144 145
		f 4 -256 253 278 -258
		mu 0 4 146 142 145 147
		f 4 -130 141 143 -143
		mu 0 4 148 149 150 151
		f 4 -132 142 145 -145
		mu 0 4 152 148 151 153
		f 4 -134 144 147 -147
		mu 0 4 154 152 153 155
		f 4 -137 148 150 -150
		mu 0 4 156 157 158 159
		f 4 -139 149 152 -152
		mu 0 4 160 161 162 163
		f 4 -141 151 154 -154
		mu 0 4 164 160 163 165
		f 4 -144 156 159 -159
		mu 0 4 166 167 168 169
		f 4 -146 158 161 -161
		mu 0 4 170 166 169 171
		f 4 -148 160 163 -163
		mu 0 4 172 170 171 173
		f 4 -203 200 204 -206
		mu 0 4 174 175 176 177
		f 4 -208 205 209 -211
		mu 0 4 178 179 180 181
		f 4 -213 210 214 -216
		mu 0 4 182 178 181 183
		f 4 -218 215 219 -221
		mu 0 4 184 182 183 185
		f 4 -223 220 224 -226
		mu 0 4 186 184 185 187
		f 4 -228 225 229 -231
		mu 0 4 188 186 187 189
		f 4 -233 230 234 -236
		mu 0 4 190 188 189 191
		f 4 -238 235 239 -241
		mu 0 4 192 190 191 193
		f 4 -165 172 174 -174
		mu 0 4 194 195 196 197
		f 4 -166 173 176 -176
		mu 0 4 198 199 200 201
		f 4 -167 175 178 -178
		mu 0 4 202 198 201 203
		f 4 -168 177 180 -180
		mu 0 4 204 202 203 205
		f 4 -169 179 182 -182
		mu 0 4 206 204 205 207
		f 4 -170 181 184 -184
		mu 0 4 208 206 207 209
		f 4 -171 183 186 -186
		mu 0 4 210 208 209 211
		f 4 -172 185 188 -188
		mu 0 4 212 210 211 213
		f 3 -175 189 -191
		mu 0 3 214 215 216
		f 3 -177 190 -192
		mu 0 3 217 214 216
		f 3 -179 191 -193
		mu 0 3 218 217 216
		f 3 -181 192 -194
		mu 0 3 219 218 216
		f 3 -183 193 -195
		mu 0 3 220 219 216
		f 3 -185 194 -196
		mu 0 3 221 220 216
		f 3 -187 195 -197
		mu 0 3 222 221 216
		f 3 -189 196 -198
		mu 0 3 223 222 216
		f 4 -151 198 202 -202
		mu 0 4 224 225 226 227
		f 4 164 203 -205 -200
		mu 0 4 228 229 230 231
		f 4 -153 201 207 -207
		mu 0 4 232 233 234 235
		f 4 165 208 -210 -204
		mu 0 4 236 237 238 239
		f 4 -155 206 212 -212
		mu 0 4 240 232 235 241
		f 4 166 213 -215 -209
		mu 0 4 237 242 243 238
		f 4 -156 211 217 -217
		mu 0 4 244 240 241 245
		f 4 167 218 -220 -214
		mu 0 4 242 246 247 243
		f 4 -158 216 222 -222
		mu 0 4 248 244 245 249
		f 4 168 223 -225 -219
		mu 0 4 246 250 251 247
		f 4 -160 221 227 -227
		mu 0 4 252 248 249 253
		f 4 169 228 -230 -224
		mu 0 4 250 254 255 251
		f 4 -162 226 232 -232
		mu 0 4 256 252 253 257
		f 4 170 233 -235 -229
		mu 0 4 254 258 259 255
		f 4 -164 231 237 -237
		mu 0 4 260 256 257 261
		f 4 171 238 -240 -234
		mu 0 4 258 262 263 259
		f 4 -261 261 263 -265
		mu 0 4 264 265 266 267
		f 4 -267 264 268 -270
		mu 0 4 268 264 267 269
		f 4 155 245 -243 -247
		mu 0 4 270 271 272 273
		f 4 157 247 -245 -246
		mu 0 4 271 274 275 272
		f 4 -242 248 250 -250
		mu 0 4 276 277 278 279
		f 4 -244 249 255 -255
		mu 0 4 280 276 279 281
		f 4 -112 258 260 -260
		mu 0 4 105 103 282 283
		f 4 -114 259 266 -266
		mu 0 4 107 105 283 284
		f 4 243 267 -269 -263
		mu 0 4 285 286 269 267
		f 4 241 262 -264 -271
		mu 0 4 287 285 267 266
		f 4 273 269 272 -248
		mu 0 4 288 289 290 291
		f 5 -128 265 -274 -157 -142
		mu 0 5 292 293 289 288 294
		f 4 139 274 -259 125
		mu 0 4 295 296 297 298
		f 5 -275 153 246 -272 -262
		mu 0 5 297 296 299 300 301
		f 4 283 284 285 286
		mu 0 4 302 303 304 305
		f 4 287 288 289 -285
		mu 0 4 303 306 307 304
		f 4 242 290 -283 -252
		mu 0 4 273 272 306 308
		f 4 244 256 -289 -291
		mu 0 4 272 275 307 306
		f 4 -278 275 -281 291
		mu 0 4 145 144 309 302
		f 4 -279 -292 -287 -277
		mu 0 4 147 145 302 305
		f 8 -276 -253 -249 270 271 251 -282 -280
		mu 0 8 310 311 312 313 301 300 314 315
		f 8 -273 -268 254 257 276 -286 -290 -257
		mu 0 8 291 290 316 317 318 319 320 321
		f 4 279 292 -284 280
		mu 0 4 309 322 303 302
		f 4 281 282 -288 -293
		mu 0 4 322 308 306 303
		f 4 2 75 76 72
		mu 0 4 323 324 325 326
		f 4 36 77 -602 -592
		mu 0 4 327 328 329 330
		f 4 592 608 -76 -594
		mu 0 4 331 332 333 334
		f 4 607 73 -77 -609
		mu 0 4 335 336 337 338
		f 4 603 605 -78 602
		mu 0 4 339 340 341 342
		f 4 -56 567 601 -606
		mu 0 4 343 344 345 346
		f 4 -320 -325 318 -318
		mu 0 4 347 348 349 350
		f 4 319 -317 -321 -326
		mu 0 4 348 347 351 352
		f 4 321 -316 -323 -327
		mu 0 4 353 354 355 356
		f 4 322 -315 -324 -328
		mu 0 4 356 355 357 358
		f 4 -337 -340 323 -341
		mu 0 4 359 360 358 357
		f 4 379 306 -381 -388
		mu 0 4 361 362 363 364
		f 4 380 303 -382 -389
		mu 0 4 364 363 365 366
		f 4 381 366 -95 -390
		mu 0 4 366 365 21 20
		f 4 86 343 -376 -383
		mu 0 4 22 25 367 368
		f 4 375 304 -377 -384
		mu 0 4 368 367 369 370
		f 4 376 305 -378 -385
		mu 0 4 370 369 371 372
		f 4 377 338 -379 -386
		mu 0 4 372 371 373 374
		f 4 378 330 -380 -387
		mu 0 4 374 373 362 361
		f 4 310 -350 -310 314
		mu 0 4 355 375 376 357
		f 4 311 -351 -311 315
		mu 0 4 354 377 375 355
		f 4 -563 -599 -600 -3
		mu 0 4 323 378 379 324
		f 4 355 293 -357 -359
		mu 0 4 380 381 382 383
		f 4 307 -356 -358 354
		mu 0 4 384 381 380 385
		f 4 -298 -307 296 324
		mu 0 4 348 386 387 349
		f 4 297 325 -299 -304
		mu 0 4 386 348 352 388
		f 5 298 362 562 -564 -367
		mu 0 5 388 352 389 52 51
		f 5 344 -300 -344 0 590
		mu 0 5 390 353 391 56 55
		f 4 299 326 -301 -305
		mu 0 4 391 353 356 392
		f 4 300 327 -302 -306
		mu 0 4 392 356 358 393
		f 5 335 -303 -339 301 339
		mu 0 5 360 394 395 393 358
		f 5 331 -297 -331 302 328
		mu 0 5 396 349 387 395 394
		f 4 -319 -332 332 -330
		mu 0 4 350 349 396 397
		f 4 -322 -345 565 -343
		mu 0 4 354 353 390 398
		f 4 591 600 -565 -591
		mu 0 4 327 330 399 400
		f 4 347 295 -347 349
		mu 0 4 375 401 402 376
		f 4 348 294 -348 350
		mu 0 4 377 403 401 375
		f 4 -372 -336 370 369
		mu 0 4 404 405 406 407
		f 4 371 374 -374 -329
		mu 0 4 405 404 408 409
		f 4 -314 317 308 357
		mu 0 4 380 347 350 385
		f 4 313 358 -313 316
		mu 0 4 347 380 383 351
		f 4 -309 329 334 359
		mu 0 4 385 350 397 410
		f 4 -338 340 309 360
		mu 0 4 411 359 357 376
		f 4 -312 342 1 361
		mu 0 4 377 354 398 412
		f 4 312 -365 596 365
		mu 0 4 351 383 413 414
		f 4 320 -366 597 -363
		mu 0 4 352 351 414 389
		f 4 593 599 -569 -567
		mu 0 4 331 334 415 416
		f 4 568 598 -598 -597
		mu 0 4 417 418 419 420
		f 4 -566 564 -596 -2
		mu 0 4 421 422 423 424
		f 4 595 -601 -568 594
		mu 0 4 425 426 345 344
		f 4 368 -370 -368 352
		mu 0 4 427 428 429 430
		f 4 367 -371 336 337
		mu 0 4 431 432 433 434
		f 4 -333 373 -373 -335
		mu 0 4 435 436 437 438
		f 4 372 -375 -369 353
		mu 0 4 439 440 428 427
		f 5 -354 351 333 -355 -360
		mu 0 5 410 441 442 384 385
		f 5 -361 346 341 -352 -353
		mu 0 5 411 376 402 442 441
		f 4 390 -392 -104 382
		mu 0 4 443 444 96 95
		f 4 392 -394 -391 383
		mu 0 4 445 446 444 443
		f 4 394 -396 -393 384
		mu 0 4 447 448 446 445
		f 4 396 -398 -395 385
		mu 0 4 449 450 448 447
		f 4 398 -400 -397 386
		mu 0 4 451 452 450 449
		f 4 400 -402 -399 387
		mu 0 4 453 454 452 451
		f 4 402 -404 -401 388
		mu 0 4 455 456 454 453
		f 4 118 -405 -403 389
		mu 0 4 112 113 456 455
		f 4 405 -407 -121 391
		mu 0 4 457 458 116 115
		f 4 407 -409 -406 393
		mu 0 4 459 460 458 457
		f 4 409 -411 -408 395
		mu 0 4 461 462 460 459
		f 4 412 -414 -412 401
		mu 0 4 463 464 465 466
		f 4 414 -416 -413 403
		mu 0 4 467 468 464 463
		f 4 132 -417 -415 404
		mu 0 4 130 131 468 467
		f 4 417 -419 -135 406
		mu 0 4 469 470 134 133
		f 4 419 -421 -418 408
		mu 0 4 471 472 470 469
		f 4 421 -423 -420 410
		mu 0 4 473 474 472 471
		f 4 522 -547 -522 519
		mu 0 4 475 476 477 478
		f 4 526 -548 -523 524
		mu 0 4 479 480 476 475
		f 4 424 -426 -424 413
		mu 0 4 481 482 483 484
		f 4 426 -428 -425 415
		mu 0 4 485 486 482 481
		f 4 146 -429 -427 416
		mu 0 4 154 155 486 485
		f 4 429 -431 -149 418
		mu 0 4 487 488 158 157
		f 4 431 -433 -430 420
		mu 0 4 489 490 488 487
		f 4 433 -435 -432 422
		mu 0 4 491 492 490 489
		f 4 438 -440 -437 425
		mu 0 4 493 494 495 496
		f 4 440 -442 -439 427
		mu 0 4 497 498 494 493
		f 4 162 -443 -441 428
		mu 0 4 172 173 498 497
		f 4 477 -477 -201 474
		mu 0 4 499 500 176 175
		f 4 482 -482 -478 479
		mu 0 4 501 502 500 499
		f 4 487 -487 -483 484
		mu 0 4 503 504 502 501
		f 4 492 -492 -488 489
		mu 0 4 505 506 504 503
		f 4 497 -497 -493 494
		mu 0 4 507 508 506 505
		f 4 502 -502 -498 499
		mu 0 4 509 510 508 507
		f 4 507 -507 -503 504
		mu 0 4 511 512 510 509
		f 4 240 -510 -508 508
		mu 0 4 192 193 512 511
		f 4 451 -453 -173 443
		mu 0 4 513 514 196 195
		f 4 453 -455 -452 444
		mu 0 4 515 516 514 513
		f 4 455 -457 -454 445
		mu 0 4 517 518 516 515
		f 4 457 -459 -456 446
		mu 0 4 519 520 518 517
		f 4 459 -461 -458 447
		mu 0 4 521 522 520 519
		f 4 461 -463 -460 448
		mu 0 4 523 524 522 521
		f 4 463 -465 -462 449
		mu 0 4 525 526 524 523
		f 4 187 -466 -464 450
		mu 0 4 212 213 526 525
		f 3 466 -190 452
		mu 0 3 527 216 215
		f 3 467 -467 454
		mu 0 3 528 216 527
		f 3 468 -468 456
		mu 0 3 529 216 528
		f 3 469 -469 458
		mu 0 3 530 216 529
		f 3 470 -470 460
		mu 0 3 531 216 530
		f 3 471 -471 462
		mu 0 3 532 216 531
		f 3 472 -472 464
		mu 0 3 533 216 532
		f 3 197 -473 465
		mu 0 3 223 216 533
		f 4 473 -475 -199 430
		mu 0 4 534 535 226 225
		f 4 199 476 -476 -444
		mu 0 4 228 231 536 537
		f 4 478 -480 -474 432
		mu 0 4 538 539 535 534
		f 4 475 481 -481 -445
		mu 0 4 537 536 540 541
		f 4 483 -485 -479 434
		mu 0 4 542 543 539 538
		f 4 480 486 -486 -446
		mu 0 4 541 540 544 545
		f 4 488 -490 -484 435
		mu 0 4 546 547 543 542
		f 4 485 491 -491 -447
		mu 0 4 545 544 548 549
		f 4 493 -495 -489 437
		mu 0 4 550 551 547 546
		f 4 490 496 -496 -448
		mu 0 4 549 548 552 553
		f 4 498 -500 -494 439
		mu 0 4 554 555 551 550
		f 4 495 501 -501 -449
		mu 0 4 553 552 556 557
		f 4 503 -505 -499 441
		mu 0 4 558 559 555 554
		f 4 500 506 -506 -450
		mu 0 4 557 556 560 561
		f 4 236 -509 -504 442
		mu 0 4 260 261 559 558
		f 4 505 509 -239 -451
		mu 0 4 561 560 263 262
		f 4 533 -533 -531 529
		mu 0 4 562 563 564 565
		f 4 538 -538 -534 535
		mu 0 4 566 567 563 562
		f 4 515 511 -515 -436
		mu 0 4 568 569 570 571
		f 4 514 513 -517 -438
		mu 0 4 571 570 572 573
		f 4 518 -520 -518 510
		mu 0 4 574 575 576 577
		f 4 523 -525 -519 512
		mu 0 4 578 579 575 574
		f 4 528 -530 -528 397
		mu 0 4 450 580 581 448
		f 4 534 -536 -529 399
		mu 0 4 452 582 580 450
		f 4 531 537 -537 -513
		mu 0 4 583 563 567 584
		f 4 539 532 -532 -511
		mu 0 4 585 564 563 583
		f 4 516 -542 -539 -543
		mu 0 4 586 587 588 589
		f 5 423 436 542 -535 411
		mu 0 5 590 591 586 589 592
		f 4 -410 527 -544 -422
		mu 0 4 593 594 595 596
		f 5 530 540 -516 -434 543
		mu 0 5 595 597 598 599 596
		f 4 -556 -555 -554 -553
		mu 0 4 600 601 602 603
		f 4 553 -559 -558 -557
		mu 0 4 603 602 604 605
		f 4 520 551 -560 -512
		mu 0 4 569 606 605 570
		f 4 559 557 -526 -514
		mu 0 4 570 605 604 572
		f 4 -561 549 -545 546
		mu 0 4 476 600 607 477
		f 4 545 555 560 547
		mu 0 4 480 601 600 476
		f 8 548 550 -521 -541 -540 517 521 544
		mu 0 8 608 609 610 598 597 611 612 613
		f 8 525 558 554 -546 -527 -524 536 541
		mu 0 8 587 614 615 616 617 618 619 588
		f 4 -550 552 -562 -549
		mu 0 4 607 600 603 620
		f 4 561 556 -552 -551
		mu 0 4 620 603 605 606
		f 3 3 573 -573
		mu 0 3 621 622 623
		f 3 4 575 -575
		mu 0 3 624 625 623
		f 3 5 576 -576
		mu 0 3 625 626 623
		f 3 17 572 -578
		mu 0 3 627 621 623
		f 3 44 577 -579
		mu 0 3 628 627 623
		f 3 52 578 -577
		mu 0 3 626 628 623
		f 3 54 574 -580
		mu 0 3 629 624 623
		f 3 71 580 -574
		mu 0 3 622 630 623
		f 3 -294 581 -583
		mu 0 3 631 632 623
		f 3 -295 583 -585
		mu 0 3 633 634 623
		f 3 -296 584 -586
		mu 0 3 635 633 623
		f 3 -308 586 -582
		mu 0 3 632 636 623
		f 3 -334 587 -587
		mu 0 3 636 637 623
		f 3 -342 585 -588
		mu 0 3 637 635 623
		f 3 -346 579 -584
		mu 0 3 634 629 623
		f 3 -364 582 -581
		mu 0 3 630 631 623
		f 5 -55 -589 55 606 58
		mu 0 5 638 639 640 77 76
		f 5 345 -349 -362 -595 588
		mu 0 5 639 403 377 412 640
		f 5 363 -590 566 364 356
		mu 0 5 382 641 642 413 383
		f 5 -72 -67 -610 -593 589
		mu 0 5 641 46 45 79 642
		f 4 610 651 -631 -651
		mu 0 4 643 644 645 646
		f 4 611 652 -632 -652
		mu 0 4 644 647 648 645
		f 4 612 653 -633 -653
		mu 0 4 647 649 650 648
		f 4 613 654 -634 -654
		mu 0 4 649 651 652 650
		f 4 614 655 -635 -655
		mu 0 4 651 653 654 652
		f 4 615 656 -636 -656
		mu 0 4 653 655 656 654
		f 4 616 657 -637 -657
		mu 0 4 655 657 658 656
		f 4 617 658 -638 -658
		mu 0 4 657 659 660 658
		f 4 618 659 -639 -659
		mu 0 4 659 661 662 660
		f 4 619 660 -640 -660
		mu 0 4 661 663 664 662
		f 4 620 661 -641 -661
		mu 0 4 663 665 666 664
		f 4 621 662 -642 -662
		mu 0 4 665 667 668 666
		f 4 622 663 -643 -663
		mu 0 4 667 669 670 668
		f 4 623 664 -644 -664
		mu 0 4 669 671 672 670
		f 4 624 665 -645 -665
		mu 0 4 673 674 675 676
		f 4 625 666 -646 -666
		mu 0 4 674 677 678 675
		f 4 626 667 -647 -667
		mu 0 4 677 679 680 678
		f 4 627 668 -648 -668
		mu 0 4 679 681 682 680
		f 4 628 669 -649 -669
		mu 0 4 681 683 684 682
		f 4 629 650 -650 -670
		mu 0 4 683 643 646 684
		f 4 -611 670 672 -672
		mu 0 4 685 686 687 688
		f 4 -612 671 674 -674
		mu 0 4 689 685 688 690
		f 4 -613 673 676 -676
		mu 0 4 691 689 690 692
		f 4 -614 675 678 -678
		mu 0 4 693 691 692 694
		f 4 -615 677 680 -680
		mu 0 4 695 693 694 696
		f 4 -616 679 682 -682
		mu 0 4 697 695 696 698
		f 4 -617 681 684 -684
		mu 0 4 699 697 698 700
		f 4 -618 683 686 -686
		mu 0 4 701 699 700 702
		f 4 -619 685 688 -688
		mu 0 4 703 701 702 704
		f 4 -620 687 690 -690
		mu 0 4 705 703 704 706
		f 4 -621 689 692 -692
		mu 0 4 707 705 706 708
		f 4 -622 691 694 -694
		mu 0 4 709 707 708 710
		f 4 -623 693 696 -696
		mu 0 4 711 709 710 712
		f 4 -624 695 698 -698
		mu 0 4 713 711 712 714
		f 4 -625 697 700 -700
		mu 0 4 715 716 717 718
		f 4 -626 699 702 -702
		mu 0 4 719 715 718 720
		f 4 -627 701 704 -704
		mu 0 4 721 719 720 722
		f 4 -628 703 706 -706
		mu 0 4 723 721 722 724
		f 4 -629 705 708 -708
		mu 0 4 725 723 724 726
		f 4 -630 707 709 -671
		mu 0 4 686 725 726 687
		f 4 630 711 -713 -711
		mu 0 4 727 728 729 730
		f 4 631 713 -715 -712
		mu 0 4 728 731 732 729
		f 4 632 715 -717 -714
		mu 0 4 731 733 734 732
		f 4 633 717 -719 -716
		mu 0 4 733 735 736 734
		f 4 634 719 -721 -718
		mu 0 4 735 737 738 736
		f 4 635 721 -723 -720
		mu 0 4 737 739 740 738
		f 4 636 723 -725 -722
		mu 0 4 739 741 742 740
		f 4 637 725 -727 -724
		mu 0 4 741 743 744 742
		f 4 638 727 -729 -726
		mu 0 4 743 745 746 744
		f 4 639 729 -731 -728
		mu 0 4 745 747 748 746
		f 4 640 731 -733 -730
		mu 0 4 747 749 750 748
		f 4 641 733 -735 -732
		mu 0 4 749 751 752 750
		f 4 642 735 -737 -734
		mu 0 4 751 753 754 752
		f 4 643 737 -739 -736
		mu 0 4 753 755 756 754
		f 4 644 739 -741 -738
		mu 0 4 757 758 759 760
		f 4 645 741 -743 -740
		mu 0 4 758 761 762 759
		f 4 646 743 -745 -742
		mu 0 4 761 763 764 762
		f 4 647 745 -747 -744
		mu 0 4 763 765 766 764
		f 4 648 747 -749 -746
		mu 0 4 765 767 768 766
		f 4 649 710 -750 -748
		mu 0 4 767 727 730 768;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode displayLayer -n "uvmapped";
	rename -uid "9B9FEB34-4F4E-E99D-25C2-228EF740B4B9";
	setAttr ".c" 19;
	setAttr ".do" 1;
createNode displayLayerManager -n "layerManager";
	rename -uid "00BFA754-4C98-34DA-5A62-EBA50C24FD7D";
	setAttr ".cdl" 1;
	setAttr -s 5 ".dli[1:4]"  1 5 3 4;
	setAttr -s 3 ".dli";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "665EA281-444C-5BCB-70B0-6C89CD4FFC41";
	setAttr -s 4 ".lnk";
	setAttr -s 4 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "32FB060F-4274-EB97-9782-4B95BAEFE611";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "17981429-445E-1C23-B161-B0B62D8173C6";
createNode displayLayer -n "defaultLayer";
	rename -uid "CF6B2742-4A67-E755-1FC6-B9B3E1B794AF";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "FBCEE35C-4EF3-4BAC-0039-838F5F706A89";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "BA9F012C-4095-E84F-464F-E98C19B95732";
	setAttr ".g" yes;
createNode phong -n "hose_mat";
	rename -uid "7156A23C-4716-D78C-4BF0-EEB56530E9FF";
	addAttr -ci true -sn "customShader" -ln "customShader" -nn "customShader" -dt "string";
	addAttr -ci true -sn "customParameter_uvScale" -ln "customParameter_uvScale" -nn "customParameter_uvScale"
		-dt "string";
	addAttr -ci true -sn "customParameter_lengthAndDiameter" -ln "customParameter_lengthAndDiameter"
		-nn "customParameter_lengthAndDiameter" -dt "string";
	addAttr -ci true -sn "customParameter_RDT" -ln "customParameter_RDT" -nn "customParameter_RDT"
		-dt "string";
	addAttr -ci true -sn "customParameter_colorMat0" -ln "customParameter_colorMat0"
		-nn "customParameter_colorMat0" -dt "string";
	addAttr -ci true -sn "customParameter_dirtColor" -ln "customParameter_dirtColor"
		-nn "customParameter_dirtColor" -dt "string";
	addAttr -ci true -sn "customShaderVariation" -ln "customShaderVariation" -nn "customShaderVariation"
		-dt "string";
	setAttr ".customShader" -type "string" "$data/shaders/vehicleShader.xml";
	setAttr ".customParameter_uvScale" -type "string" "1.0 1.5 0.0 0.0";
	setAttr ".customParameter_lengthAndDiameter" -type "string" "5 1 0 0";
	setAttr ".customParameter_RDT" -type "string" "1.0 1.0 0.0 0.0";
	setAttr ".customParameter_colorMat0" -type "string" "0.80 0.55 0.05 1.0";
	setAttr ".customParameter_dirtColor" -type "string" "0.20 0.14 0.08 0.0";
	setAttr ".customShaderVariation" -type "string" "localCatmullRom_colorMask_uvScale";
createNode shadingEngine -n "phong1SG";
	rename -uid "32DB6871-4714-0556-02A9-46A561A68630";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "5B9B1B45-4D96-F8A3-1979-FF8E486670B4";
createNode phong -n "coupling_mat";
	rename -uid "96FFEC1B-4130-9675-2D91-B5B06BFCD672";
	addAttr -ci true -sn "customShader" -ln "customShader" -nn "customShader" -dt "string";
	addAttr -ci true -sn "customParameter_RDT" -ln "customParameter_RDT" -nn "customParameter_RDT"
		-dt "string";
	addAttr -ci true -sn "customParameter_dirtColor" -ln "customParameter_dirtColor"
		-nn "customParameter_dirtColor" -dt "string";
	addAttr -ci true -sn "customParameter_colorMat1" -ln "customParameter_colorMat1"
		-nn "customParameter_colorMat1" -dt "string";
	addAttr -ci true -sn "customShaderVariation" -ln "customShaderVariation" -nn "customShaderVariation"
		-dt "string";
	setAttr ".customShader" -type "string" "$data/shaders/vehicleShader.xml";
	setAttr ".customParameter_RDT" -type "string" "1.0 1.0 0.0 0.0";
	setAttr ".customParameter_dirtColor" -type "string" "0.20 0.14 0.08 0.0";
	setAttr -k on ".customParameter_colorMat1" -type "string" "0.05 0.05 0.05 1.0";
	setAttr -k on ".customShaderVariation" -type "string" "colorMask";
createNode shadingEngine -n "phong2SG";
	rename -uid "E19D8701-45D4-0A38-FE1C-27A2DB6578ED";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 4 ".gn";
createNode materialInfo -n "materialInfo2";
	rename -uid "C3E9616F-4C1B-EA00-4D6E-1C8F4D987408";
createNode file -n "file1";
	rename -uid "F30F4FD8-4F0F-018D-3B9A-818F458C6EF4";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "D:/Users/Stijn Wopereis/Documents/My Games/FarmingSimulator2022/mods/FS22_manureSystem/resources/hoses/coupling_normal.png";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture1";
	rename -uid "0B120777-4571-22FC-025D-1CA6065ACC9E";
createNode bump2d -n "bump2d1";
	rename -uid "5AF2A2E9-4A5D-8669-DE28-29A5344BCAF0";
	setAttr ".bi" 1;
	setAttr ".vc1" -type "float3" 0 4.9999999e-05 0 ;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "file2";
	rename -uid "2ACD380F-4598-8AFC-8647-9A87E32B6862";
	setAttr ".ftn" -type "string" "D:/Users/Stijn Wopereis/Documents/My Games/FarmingSimulator2022/mods/FS22_manureSystem/resources/hoses/coupling_gloss.png";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture2";
	rename -uid "71DAD8A9-4BA7-092D-D9E1-40B65B852CB5";
createNode file -n "file3";
	rename -uid "4E17AD9C-466C-2344-589D-FFAE36FAACE0";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "D:/Users/Stijn Wopereis/Documents/My Games/FarmingSimulator2022/mods/FS22_manureSystem/resources/hoses/hose_normal.png";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture3";
	rename -uid "9DC7214C-4B3A-C735-50F6-B4812268BB4B";
createNode bump2d -n "bump2d2";
	rename -uid "5249E8DA-4CE4-BB75-FACA-48A564E3973D";
	setAttr ".bi" 1;
	setAttr ".vc1" -type "float3" 0 9.0000001e-05 0 ;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "file4";
	rename -uid "DFD89EEC-4A39-C171-7088-E4AA292236E9";
	setAttr ".ftn" -type "string" "D:/Users/Stijn Wopereis/Documents/My Games/FarmingSimulator2022/mods/FS22_manureSystem/resources/hoses/hose_gloss.png";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture4";
	rename -uid "12F777F3-4D9E-B07A-07D2-5BA2F6A7B6F7";
createNode displayLayer -n "MERGEGROUP_0";
	rename -uid "C6E94CEF-4665-3DD2-835D-21B14EC54577";
	setAttr ".c" 4;
	setAttr ".do" 2;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "DD0F6B3F-4F79-E072-FE49-84BBFD79BFA6";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1774\n            -height 1163\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n"
		+ "            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -selectCommand \"print(\\\"\\\")\" \n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n"
		+ "            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n"
		+ "            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n"
		+ "            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n"
		+ "                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n"
		+ "                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -keyMinScale 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -valueLinesToggle 1\n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n"
		+ "                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n"
		+ "            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n"
		+ "                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -connectedGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n"
		+ "                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -showUnitConversions 0\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n"
		+ "                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -connectedGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -showUnitConversions 0\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"|persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n"
		+ "                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n"
		+ "                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n"
		+ "                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 0\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n"
		+ "\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 0\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1774\\n    -height 1163\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 0\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1774\\n    -height 1163\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "7C64863A-4797-A78E-DBCD-A3910D3AA3C6";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode groupId -n "groupId23";
	rename -uid "250B1719-48B8-FC93-997A-CF88EC45B6A1";
	setAttr ".ihi" 0;
createNode groupId -n "groupId24";
	rename -uid "F8EA0006-482A-223A-A64F-898003ED6DAC";
	setAttr ".ihi" 0;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "344239A6-41E4-ADBE-55D0-198A2378E300";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -330.95236780151544 -323.80951094248991 ;
	setAttr ".tgi[0].vh" -type "double2" 317.85713022663526 338.09522466054096 ;
createNode groupId -n "groupId25";
	rename -uid "F84B2AA5-4EC0-3EBA-E26F-BD990937DB32";
	setAttr ".ihi" 0;
createNode groupId -n "groupId26";
	rename -uid "3808E6B8-4B13-6344-16AC-1A91BCE6F495";
	setAttr ".ihi" 0;
createNode script -n "I3DExportSettings";
	rename -uid "E284D21B-4156-F057-8508-0EA5FAD4450C";
	addAttr -ci true -sn "i3D_exportIK" -ln "i3D_exportIK" -nn "i3D_exportIK" -min
		0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportAnimation" -ln "i3D_exportAnimation" -nn "i3D_exportAnimation"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportShapes" -ln "i3D_exportShapes" -nn "i3D_exportShapes"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportNurbsCurves" -ln "i3D_exportNurbsCurves" -nn "i3D_exportNurbsCurves"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportLights" -ln "i3D_exportLights" -nn "i3D_exportLights"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportCameras" -ln "i3D_exportCameras" -nn "i3D_exportCameras"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportParticleSystems" -ln "i3D_exportParticleSystems"
		-nn "i3D_exportParticleSystems" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportDefaultCameras" -ln "i3D_exportDefaultCameras" -nn "i3D_exportDefaultCameras"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportUserAttributes" -ln "i3D_exportUserAttributes" -nn "i3D_exportUserAttributes"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportBynaryFiles" -ln "i3D_exportBynaryFiles" -nn "i3D_exportBynaryFiles"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportIgnoreBindPoses" -ln "i3D_exportIgnoreBindPoses"
		-nn "i3D_exportIgnoreBindPoses" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportLockedGroup" -ln "i3D_exportLockedGroup" -nn "i3D_exportLockedGroup"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportObjectDataTexture" -ln "i3D_exportObjectDataTexture"
		-nn "i3D_exportObjectDataTexture" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportNormals" -ln "i3D_exportNormals" -nn "i3D_exportNormals"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportColors" -ln "i3D_exportColors" -nn "i3D_exportColors"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportTexCoords" -ln "i3D_exportTexCoords" -nn "i3D_exportTexCoords"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportSkinWeigths" -ln "i3D_exportSkinWeigths" -nn "i3D_exportSkinWeigths"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportMergeGroups" -ln "i3D_exportMergeGroups" -nn "i3D_exportMergeGroups"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportVerbose" -ln "i3D_exportVerbose" -nn "i3D_exportVerbose"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportRelativePaths" -ln "i3D_exportRelativePaths" -nn "i3D_exportRelativePaths"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportFloatEpsilon" -ln "i3D_exportFloatEpsilon" -nn "i3D_exportFloatEpsilon"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportUseProjectPath" -ln "i3D_exportUseProjectPath" -nn "i3D_exportUseProjectPath"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportBasegamePaths" -ln "i3D_exportBasegamePaths" -nn "i3D_exportBasegamePaths"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportUpdateXML" -ln "i3D_exportUpdateXML" -nn "i3D_exportUpdateXML"
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportUseMayaFilename" -ln "i3D_exportUseMayaFilename"
		-nn "i3D_exportUseMayaFilename" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "i3D_exportOutputFile" -ln "i3D_exportOutputFile" -nn "i3D_exportOutputFile"
		-dt "string";
	addAttr -ci true -sn "i3D_exportXMLConfigFile" -ln "i3D_exportXMLConfigFile" -nn "i3D_exportXMLConfigFile"
		-dt "string";
	addAttr -ci true -sn "i3D_exportGamePath" -ln "i3D_exportGamePath" -nn "i3D_exportGamePath"
		-dt "string";
	setAttr ".b" -type "string" (
		"if(`window -ex \"i3DExport\"`)\n{\n\tif(objExists(\"I3DExportSettings\"))\n\t{\n\t\tint $tmpInt;\n\t\tstring $tmpStr;\n\t\t\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportIK\"`))\n\t\t\tcheckBoxGrp -e -v1 $tmpInt \"ExportParts\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportAnimation\"`))\n\t\t\tcheckBoxGrp -e -v2 $tmpInt \"ExportParts\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportShapes\"`))\n\t\t\tcheckBoxGrp -e -v3 $tmpInt \"ExportParts\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportNurbsCurves\"`))\n\t\t\tcheckBoxGrp -e -v1 $tmpInt \"ExportParts2\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportLights\"`))\n\t\t\tcheckBoxGrp -e -v2 $tmpInt \"ExportParts2\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportCameras\"`))\n\t\t\tcheckBoxGrp -e -v3 $tmpInt \"ExportParts2\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportParticleSystems\"`))\n\t\t\tcheckBoxGrp -e -v1 $tmpInt \"ExportParts3\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportDefaultCameras\"`))\n"
		+ "\t\t\tcheckBoxGrp -e -v2 $tmpInt \"ExportParts3\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportUserAttributes\"`))\n\t\t\tcheckBoxGrp -e -v3 $tmpInt \"ExportParts3\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportBynaryFiles\"`))\n\t\t\tcheckBoxGrp -e -v1 $tmpInt \"ExportParts4\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportIgnoreBindPoses\"`))\n\t\t\tcheckBoxGrp -e -v2 $tmpInt \"ExportParts4\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportLockedGroup\"`))\n\t\t\tcheckBoxGrp -e -v3 $tmpInt \"ExportParts4\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportObjectDataTexture\"`))\n\t\t\tcheckBoxGrp -e -v1 $tmpInt \"ExportParts5\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportNormals\"`))\n\t\t\tcheckBoxGrp -e -v1 $tmpInt \"ShapeIncludes\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportColors\"`))\n\t\t\tcheckBoxGrp -e -v2 $tmpInt \"ShapeIncludes\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportTexCoords\"`))\n"
		+ "\t\t\tcheckBoxGrp -e -v3 $tmpInt \"ShapeIncludes\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportSkinWeigths\"`))\n\t\t\tcheckBoxGrp -e -v1 $tmpInt \"ShapeIncludes2\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportMergeGroups\"`))\n\t\t\tcheckBoxGrp -e -v2 $tmpInt \"ShapeIncludes2\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportVerbose\"`))\n\t\t\tcheckBoxGrp -e -v1 $tmpInt \"Misc\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportRelativePaths\"`))\n\t\t\tcheckBoxGrp -e -v2 $tmpInt \"Misc\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportFloatEpsilon\"`))\n\t\t\tcheckBoxGrp -e -v3 $tmpInt \"Misc\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportUseProjectPath\"`))\n\t\t\tcheckBoxGrp -e -v1 $tmpInt \"GamePath\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportBasegamePaths\"`))\n\t\t\tcheckBoxGrp -e -v2 $tmpInt \"GamePath\";\n\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportUpdateXML\"`))\n\t\t\tcheckBoxGrp -e -v1 $tmpInt \"Misc2\";\n"
		+ "\t\tif (!catchQuiet( $tmpInt = `getAttr \"I3DExportSettings.i3D_exportUseMayaFilename\"`))\n\t\t\tcheckBoxGrp -e -v1 $tmpInt \"FilenameInfo\";\n\t\tif (!catchQuiet( $tmpStr = `getAttr \"I3DExportSettings.i3D_exportOutputFile\"`))\n\t\t\ttextField -e -text $tmpStr \"giants_outputFileLocationPath\";\n\t\tif (!catchQuiet( $tmpStr = `getAttr \"I3DExportSettings.i3D_exportXMLConfigFile\"`))\n\t\t\ttextField -e -text $tmpStr \"giants_xmlConfigFileLocationPath\";\n\t\tif (!catchQuiet( $tmpStr = `getAttr \"I3DExportSettings.i3D_exportGamePath\"`))\n\t\t\ttextField -e -text $tmpStr \"giants_gameLocationPath\";\n\t}\n}");
	setAttr ".st" 2;
	setAttr ".i3D_exportAnimation" yes;
	setAttr ".i3D_exportShapes" yes;
	setAttr ".i3D_exportLights" yes;
	setAttr ".i3D_exportCameras" yes;
	setAttr ".i3D_exportUserAttributes" yes;
	setAttr ".i3D_exportBynaryFiles" yes;
	setAttr ".i3D_exportNormals" yes;
	setAttr ".i3D_exportColors" yes;
	setAttr ".i3D_exportTexCoords" yes;
	setAttr ".i3D_exportSkinWeigths" yes;
	setAttr ".i3D_exportMergeGroups" yes;
	setAttr ".i3D_exportVerbose" yes;
	setAttr ".i3D_exportRelativePaths" yes;
	setAttr ".i3D_exportFloatEpsilon" yes;
	setAttr ".i3D_exportUseProjectPath" yes;
	setAttr ".i3D_exportBasegamePaths" yes;
	setAttr ".i3D_exportUpdateXML" yes;
	setAttr ".i3D_exportOutputFile" -type "string" "D:/Users/Stijn Wopereis/Documents/My Games/FarmingSimulator2022/mods/FS22_manureSystem/resources/hoses/fertilizer/fertilizerHose.i3d";
	setAttr ".i3D_exportXMLConfigFile" -type "string" "fertilizerHose.xml";
	setAttr ".i3D_exportGamePath" -type "string" "";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 4 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 7 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 6 ".u";
select -ne :defaultRenderingList1;
select -ne :defaultTextureList1;
	setAttr -s 4 ".tx";
select -ne :standardSurface1;
	setAttr ".b" 0.80000001192092896;
	setAttr ".bc" -type "float3" 1 1 1 ;
	setAttr ".s" 0.20000000298023224;
select -ne :initialShadingGroup;
	setAttr -s 5 ".dsm";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr ".ren" -type "string" "arnold";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya-legacy/config.ocio";
	setAttr ".vtn" -type "string" "sRGB gamma (legacy)";
	setAttr ".vn" -type "string" "sRGB gamma";
	setAttr ".dn" -type "string" "legacy";
	setAttr ".wsn" -type "string" "scene-linear Rec 709/sRGB";
	setAttr ".ovt" no;
	setAttr ".povt" no;
	setAttr ".otn" -type "string" "sRGB gamma (legacy)";
	setAttr ".potn" -type "string" "sRGB gamma (legacy)";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "MERGEGROUP_0.di" ":persp.do";
connectAttr "MERGEGROUP_0.di" ":top.do";
connectAttr "MERGEGROUP_0.di" ":front.do";
connectAttr "MERGEGROUP_0.di" ":side.do";
connectAttr "MERGEGROUP_0.di" "hose_main_component1.do";
connectAttr "MERGEGROUP_0.di" "fertilizer_coupling_camplock_1.do";
connectAttr "groupId23.id" "fertilizer_coupling_camplock_1Shape.iog.og[0].gid";
connectAttr "phong2SG.mwc" "fertilizer_coupling_camplock_1Shape.iog.og[0].gco";
connectAttr "MERGEGROUP_0.di" "fertilizer_coupling_1.do";
connectAttr "groupId25.id" "fertilizer_coupling_1Shape.iog.og[0].gid";
connectAttr "phong2SG.mwc" "fertilizer_coupling_1Shape.iog.og[0].gco";
connectAttr "MERGEGROUP_0.di" "fertilizer_hose.do";
connectAttr "MERGEGROUP_0.di" "grabNode1.do";
connectAttr "MERGEGROUP_0.di" "baseNode.do";
connectAttr "MERGEGROUP_0.di" "componentJoint1.do";
connectAttr "MERGEGROUP_0.di" "pCylinder1.do";
connectAttr "MERGEGROUP_0.di" "hose_main_component2.do";
connectAttr "MERGEGROUP_0.di" "componentJoint2.do";
connectAttr "MERGEGROUP_0.di" "hose_main_component3.do";
connectAttr "MERGEGROUP_0.di" "componentJoint3.do";
connectAttr "MERGEGROUP_0.di" "hose_main_component4.do";
connectAttr "MERGEGROUP_0.di" "grabNode2.do";
connectAttr "MERGEGROUP_0.di" "targetNode.do";
connectAttr "MERGEGROUP_0.di" "fertilizer_coupling_camplock_2.do";
connectAttr "groupId26.id" "fertilizer_coupling_camplock_2Shape.iog.og[0].gid";
connectAttr "phong2SG.mwc" "fertilizer_coupling_camplock_2Shape.iog.og[0].gco";
connectAttr "MERGEGROUP_0.di" "fertilizer_coupling_2.do";
connectAttr "groupId24.id" "fertilizer_coupling_2Shape.iog.og[0].gid";
connectAttr "phong2SG.mwc" "fertilizer_coupling_2Shape.iog.og[0].gco";
connectAttr "layerManager.dli[1]" "uvmapped.id";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "phong1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "phong2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "phong1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "phong2SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "bump2d2.o" "hose_mat.n";
connectAttr "file4.oc" "hose_mat.sc";
connectAttr "hose_mat.oc" "phong1SG.ss";
connectAttr "fertilizer_hoseShape.iog" "phong1SG.dsm" -na;
connectAttr "phong1SG.msg" "materialInfo1.sg";
connectAttr "hose_mat.msg" "materialInfo1.m";
connectAttr "file3.msg" "materialInfo1.t" -na;
connectAttr "bump2d1.o" "coupling_mat.n";
connectAttr "file2.oc" "coupling_mat.sc";
connectAttr "coupling_mat.oc" "phong2SG.ss";
connectAttr "fertilizer_coupling_camplock_1Shape.iog.og[0]" "phong2SG.dsm" -na;
connectAttr "fertilizer_coupling_2Shape.iog.og[0]" "phong2SG.dsm" -na;
connectAttr "fertilizer_coupling_1Shape.iog.og[0]" "phong2SG.dsm" -na;
connectAttr "fertilizer_coupling_camplock_2Shape.iog.og[0]" "phong2SG.dsm" -na;
connectAttr "groupId23.msg" "phong2SG.gn" -na;
connectAttr "groupId24.msg" "phong2SG.gn" -na;
connectAttr "groupId25.msg" "phong2SG.gn" -na;
connectAttr "groupId26.msg" "phong2SG.gn" -na;
connectAttr "phong2SG.msg" "materialInfo2.sg";
connectAttr "coupling_mat.msg" "materialInfo2.m";
connectAttr ":defaultColorMgtGlobals.cme" "file1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file1.ws";
connectAttr "place2dTexture1.c" "file1.c";
connectAttr "place2dTexture1.tf" "file1.tf";
connectAttr "place2dTexture1.rf" "file1.rf";
connectAttr "place2dTexture1.mu" "file1.mu";
connectAttr "place2dTexture1.mv" "file1.mv";
connectAttr "place2dTexture1.s" "file1.s";
connectAttr "place2dTexture1.wu" "file1.wu";
connectAttr "place2dTexture1.wv" "file1.wv";
connectAttr "place2dTexture1.re" "file1.re";
connectAttr "place2dTexture1.of" "file1.of";
connectAttr "place2dTexture1.r" "file1.ro";
connectAttr "place2dTexture1.n" "file1.n";
connectAttr "place2dTexture1.vt1" "file1.vt1";
connectAttr "place2dTexture1.vt2" "file1.vt2";
connectAttr "place2dTexture1.vt3" "file1.vt3";
connectAttr "place2dTexture1.vc1" "file1.vc1";
connectAttr "place2dTexture1.o" "file1.uv";
connectAttr "place2dTexture1.ofs" "file1.fs";
connectAttr "file1.oa" "bump2d1.bv";
connectAttr ":defaultColorMgtGlobals.cme" "file2.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file2.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file2.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file2.ws";
connectAttr "place2dTexture2.c" "file2.c";
connectAttr "place2dTexture2.tf" "file2.tf";
connectAttr "place2dTexture2.rf" "file2.rf";
connectAttr "place2dTexture2.mu" "file2.mu";
connectAttr "place2dTexture2.mv" "file2.mv";
connectAttr "place2dTexture2.s" "file2.s";
connectAttr "place2dTexture2.wu" "file2.wu";
connectAttr "place2dTexture2.wv" "file2.wv";
connectAttr "place2dTexture2.re" "file2.re";
connectAttr "place2dTexture2.of" "file2.of";
connectAttr "place2dTexture2.r" "file2.ro";
connectAttr "place2dTexture2.n" "file2.n";
connectAttr "place2dTexture2.vt1" "file2.vt1";
connectAttr "place2dTexture2.vt2" "file2.vt2";
connectAttr "place2dTexture2.vt3" "file2.vt3";
connectAttr "place2dTexture2.vc1" "file2.vc1";
connectAttr "place2dTexture2.o" "file2.uv";
connectAttr "place2dTexture2.ofs" "file2.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file3.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file3.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file3.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file3.ws";
connectAttr "place2dTexture3.c" "file3.c";
connectAttr "place2dTexture3.tf" "file3.tf";
connectAttr "place2dTexture3.rf" "file3.rf";
connectAttr "place2dTexture3.mu" "file3.mu";
connectAttr "place2dTexture3.mv" "file3.mv";
connectAttr "place2dTexture3.s" "file3.s";
connectAttr "place2dTexture3.wu" "file3.wu";
connectAttr "place2dTexture3.wv" "file3.wv";
connectAttr "place2dTexture3.re" "file3.re";
connectAttr "place2dTexture3.of" "file3.of";
connectAttr "place2dTexture3.r" "file3.ro";
connectAttr "place2dTexture3.n" "file3.n";
connectAttr "place2dTexture3.vt1" "file3.vt1";
connectAttr "place2dTexture3.vt2" "file3.vt2";
connectAttr "place2dTexture3.vt3" "file3.vt3";
connectAttr "place2dTexture3.vc1" "file3.vc1";
connectAttr "place2dTexture3.o" "file3.uv";
connectAttr "place2dTexture3.ofs" "file3.fs";
connectAttr "file3.oa" "bump2d2.bv";
connectAttr ":defaultColorMgtGlobals.cme" "file4.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file4.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file4.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file4.ws";
connectAttr "place2dTexture4.c" "file4.c";
connectAttr "place2dTexture4.tf" "file4.tf";
connectAttr "place2dTexture4.rf" "file4.rf";
connectAttr "place2dTexture4.mu" "file4.mu";
connectAttr "place2dTexture4.mv" "file4.mv";
connectAttr "place2dTexture4.s" "file4.s";
connectAttr "place2dTexture4.wu" "file4.wu";
connectAttr "place2dTexture4.wv" "file4.wv";
connectAttr "place2dTexture4.re" "file4.re";
connectAttr "place2dTexture4.of" "file4.of";
connectAttr "place2dTexture4.r" "file4.ro";
connectAttr "place2dTexture4.n" "file4.n";
connectAttr "place2dTexture4.vt1" "file4.vt1";
connectAttr "place2dTexture4.vt2" "file4.vt2";
connectAttr "place2dTexture4.vt3" "file4.vt3";
connectAttr "place2dTexture4.vc1" "file4.vc1";
connectAttr "place2dTexture4.o" "file4.uv";
connectAttr "place2dTexture4.ofs" "file4.fs";
connectAttr "layerManager.dli[2]" "MERGEGROUP_0.id";
connectAttr "phong1SG.pa" ":renderPartition.st" -na;
connectAttr "phong2SG.pa" ":renderPartition.st" -na;
connectAttr "hose_mat.msg" ":defaultShaderList1.s" -na;
connectAttr "coupling_mat.msg" ":defaultShaderList1.s" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "bump2d1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "bump2d2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "file3.msg" ":defaultTextureList1.tx" -na;
connectAttr "file4.msg" ":defaultTextureList1.tx" -na;
connectAttr "hose_main_componentShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "hose_main_componentShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "hose_main_componentShape3.iog" ":initialShadingGroup.dsm" -na;
connectAttr "hose_main_componentShape4.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCylinderShape1.iog" ":initialShadingGroup.dsm" -na;
// End of fertilizerHose.ma
