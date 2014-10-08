//POVRay-File created by 3d41.ulp v###VERSIONDUMMY###
///home/kubuntu/Projects/spion_selector/boards/PCB/spion_3d.brd
//10/8/14 8:33 AM

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 257;
#local cam_z = -130;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -5;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 30;
#local lgt1_pos_y = 45;
#local lgt1_pos_z = 30;
#local lgt1_intense = 0.765329;
#local lgt2_pos_x = -30;
#local lgt2_pos_y = 45;
#local lgt2_pos_z = 30;
#local lgt2_intense = 0.765329;
#local lgt3_pos_x = 30;
#local lgt3_pos_y = 45;
#local lgt3_pos_z = -20;
#local lgt3_intense = 0.765329;
#local lgt4_pos_x = -30;
#local lgt4_pos_y = 45;
#local lgt4_pos_z = -20;
#local lgt4_intense = 0.765329;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 80.569000;
#declare pcb_y_size = 56.759000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(112);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-40.284500,0,-28.379500>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro SPION_3D(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<15.494000,13.970000><96.063000,13.970000>
<96.063000,13.970000><96.063000,70.729000>
<96.063000,70.729000><15.494000,70.729000>
<15.494000,70.729000><15.494000,13.970000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
cylinder{<26.416000,1,33.401000><26.416000,-5,33.401000>1.651000 texture{col_hls}}
cylinder{<26.162000,1,21.336000><26.162000,-5,21.336000>1.651000 texture{col_hls}}
//Holes(real)/Board
//Holes(real)/Vias
cylinder{<26.162000,0.095000,51.511000><26.162000,-1.595000,51.511000>1.150000 texture{col_hls}}
cylinder{<26.162000,0.095000,63.551000><26.162000,-1.595000,63.551000>1.150000 texture{col_hls}}
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_BOOT) #declare global_pack_BOOT=yes; object {CON_PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<64.262000,0.000000,59.817000>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) BOOT  1X03
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_CERAMIC_25MM_44MM("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<37.465000,0.000000,44.069000>}#end		//ceramic disc capacitator C1  C025-024X044
#ifndef(pack_C1_32K) #declare global_pack_C1_32K=yes; object {CAP_DIS_CERAMIC_25MM_44MM("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<74.803000,0.000000,64.897000>}#end		//ceramic disc capacitator C1-32K  C025-024X044
#ifndef(pack_C1_BM) #declare global_pack_C1_BM=yes; object {CAP_DIS_CERAMIC_25MM_44MM("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<77.343000,0.000000,59.817000>}#end		//ceramic disc capacitator C1-BM  C025-024X044
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_ELKO_2MM_5MM("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<41.148000,0.000000,43.815000>}#end		//Elko 2mm Pitch, 5mm  Diameter, 11mm High C2  E2-5
#ifndef(pack_C2_8M) #declare global_pack_C2_8M=yes; object {CAP_DIS_CERAMIC_25MM_44MM("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<77.343000,0.000000,54.737000>}#end		//ceramic disc capacitator C2-8M  C025-024X044
#ifndef(pack_C2_32K) #declare global_pack_C2_32K=yes; object {CAP_DIS_CERAMIC_25MM_44MM("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<74.803000,0.000000,62.357000>}#end		//ceramic disc capacitator C2-32K  C025-024X044
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_DIS_CERAMIC_25MM_44MM("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<53.213000,0.000000,19.558000>}#end		//ceramic disc capacitator C3  C025-024X044
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_DIS_ELKO_2MM_5MM("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<48.895000,0.000000,19.431000>}#end		//Elko 2mm Pitch, 5mm  Diameter, 11mm High C4  E2-5
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO41_102MM_H("1N4004",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<25.527000,0.000000,42.164000>}#end		//Diode DO35 10mm hor. D1 1N4004 DO41-10
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_SMD_SSOP28("FT232RL","",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<41.910000,-1.500000,56.388000>translate<0,-0.035000,0> }#end		//SSOP28 IC1 FT232RL SSOP28
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {TR_TO220_3_V("7805TV",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<35.941000,0.000000,45.466000>}#end		//TO220 vertical straight leads IC2 7805TV TO220V
#ifndef(pack_IC3) #declare global_pack_IC3=yes; object {TR_TO220_3_H("7806T",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<31.242000,0.000000,33.401000>}#end		//TO220 horizontal straight leads IC3 7806T TO220H
#ifndef(pack_LED1) #declare global_pack_LED1=yes; object {DIODE_DIS_LED_3MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<45.720000,0.000000,44.069000>}#end		//Diskrete 3MM LED LED1  LED3MM
#ifndef(pack_LED2) #declare global_pack_LED2=yes; object {DIODE_DIS_LED_3MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<60.960000,0.000000,22.098000>}#end		//Diskrete 3MM LED LED2  LED3MM
#ifndef(pack_LED3) #declare global_pack_LED3=yes; object {DIODE_DIS_LED_3MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<85.344000,0.000000,51.435000>}#end		//Diskrete 3MM LED LED3  LED3MM
#ifndef(pack_OK1) #declare global_pack_OK1=yes; object {IC_DIS_DIP4("PC817","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<87.757000,0.000000,38.227000>}#end		//DIP4 OK1 PC817 DIL04
#ifndef(pack_OK2) #declare global_pack_OK2=yes; object {IC_DIS_DIP4("PC817","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<80.645000,0.000000,38.354000>}#end		//DIP4 OK2 PC817 DIL04
#ifndef(pack_OK3) #declare global_pack_OK3=yes; object {IC_DIS_DIP4("PC817","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<73.279000,0.000000,38.227000>}#end		//DIP4 OK3 PC817 DIL04
#ifndef(pack_PWR) #declare global_pack_PWR=yes; object {CON_PH_1X2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<20.193000,0.000000,46.228000>}#end		//Header 2,54mm Grid 2Pin 1Row (jumper.lib) PWR  1X02
#ifndef(pack_Q1) #declare global_pack_Q1=yes; object {SPC_XTAL_5MM("",3,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<73.533000,0.000000,56.007000>}#end		//Quarz 4,9MM Q1  HC49/S
#ifndef(pack_Q2) #declare global_pack_Q2=yes; object {SPC_XTAL_CLOCK_025MM("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<70.993000,0.000000,63.627000>}#end		//Uhrenquarz mit 2,5MM Pitch Q2  TC26V
#ifndef(pack_R_IN1) #declare global_pack_R_IN1=yes; object {RES_DIS_0204_075MM(texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Violet*1.2}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<63.500000,0.000000,26.797000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R-IN1 4k7 0204/7
#ifndef(pack_R_IN2) #declare global_pack_R_IN2=yes; object {RES_DIS_0204_075MM(texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Violet*1.2}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<52.705000,0.000000,26.670000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R-IN2 4k7 0204/7
#ifndef(pack_R_SERVOA1) #declare global_pack_R_SERVOA1=yes; object {RES_DIS_0204_075MM(texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<91.313000,0.000000,38.227000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R-SERVOA1 330 0204/7
#ifndef(pack_R_SERVOA2) #declare global_pack_R_SERVOA2=yes; object {RES_DIS_0204_075MM(texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<84.201000,0.000000,38.227000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R-SERVOA2 330 0204/7
#ifndef(pack_R_SERVOA3) #declare global_pack_R_SERVOA3=yes; object {RES_DIS_0204_075MM(texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<76.962000,0.000000,38.354000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R-SERVOA3 330 0204/7
#ifndef(pack_R_SERVOB1) #declare global_pack_R_SERVOB1=yes; object {RES_DIS_0204_075MM(texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Violet*1.2}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<88.519000,0.000000,31.115000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R-SERVOB1 4k7 0204/7
#ifndef(pack_R_SERVOB2) #declare global_pack_R_SERVOB2=yes; object {RES_DIS_0204_075MM(texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Violet*1.2}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<81.915000,0.000000,28.321000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R-SERVOB2 4k7 0204/7
#ifndef(pack_R_SERVOB3) #declare global_pack_R_SERVOB3=yes; object {RES_DIS_0204_075MM(texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Violet*1.2}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<74.422000,0.000000,30.607000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R-SERVOB3 4k7 0204/7
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0204_075MM(texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<42.926000,0.000000,40.386000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R1 330 0204/7
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0204_075MM(texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<64.262000,0.000000,19.812000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R2 330 0204/7
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0204_075MM(texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<82.296000,0.000000,51.689000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R3 330 0204/7
#ifndef(pack_RV6) #declare global_pack_RV6=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<45.339000,0.000000,31.369000>}#end		//Discrete Resistor 0,15W 7,5MM Grid RV6 1k 0204/7
#ifndef(pack_S1) #declare global_pack_S1=yes; object {SWITCH_B3F_10XX1()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<63.500000,0.000000,34.163000>}#end		//Tactile Switch-Omron S1  B3F-10XX
#ifndef(pack_S2) #declare global_pack_S2=yes; object {SWITCH_B3F_10XX1()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<53.340000,0.000000,34.036000>}#end		//Tactile Switch-Omron S2  B3F-10XX
#ifndef(pack_SERVOA) #declare global_pack_SERVOA=yes; object {CON_PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<90.170000,0.000000,24.765000>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) SERVOA  1X03
#ifndef(pack_SERVOB) #declare global_pack_SERVOB=yes; object {CON_PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<82.042000,0.000000,24.638000>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) SERVOB  1X03
#ifndef(pack_SERVOC) #declare global_pack_SERVOC=yes; object {CON_PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<73.914000,0.000000,24.511000>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) SERVOC  1X03
#ifndef(pack_SWD) #declare global_pack_SWD=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<52.959000,0.000000,59.563000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) SWD  1X04
#ifndef(pack_T1) #declare global_pack_T1=yes; object {TR_TO220_3_H("TIP31C",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<37.338000,0.000000,21.336000>}#end		//TO220 horizontal straight leads T1 TIP31C TO220
#ifndef(pack_U1) #declare global_pack_U1=yes; object {QFP_TQFP_64_080MM("STM32F10XRXT6","",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<62.103000,-1.500000,49.657000>translate<0,-0.035000,0> }#end		//TQFP-64 U1 STM32F10XRXT6 TQFP64
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_BOOT) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<66.802000,0,59.817000> texture{col_thl}}
#ifndef(global_pack_BOOT) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<64.262000,0,59.817000> texture{col_thl}}
#ifndef(global_pack_BOOT) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<61.722000,0,59.817000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<37.465000,0,42.799000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<37.465000,0,45.339000> texture{col_thl}}
#ifndef(global_pack_C1_32K) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<76.073000,0,64.897000> texture{col_thl}}
#ifndef(global_pack_C1_32K) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<73.533000,0,64.897000> texture{col_thl}}
#ifndef(global_pack_C1_BM) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<77.343000,0,58.547000> texture{col_thl}}
#ifndef(global_pack_C1_BM) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<77.343000,0,61.087000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<41.148000,0,42.799000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<41.148000,0,44.831000> texture{col_thl}}
#ifndef(global_pack_C2_8M) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<77.343000,0,56.007000> texture{col_thl}}
#ifndef(global_pack_C2_8M) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<77.343000,0,53.467000> texture{col_thl}}
#ifndef(global_pack_C2_32K) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<76.073000,0,62.357000> texture{col_thl}}
#ifndef(global_pack_C2_32K) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<73.533000,0,62.357000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<53.213000,0,18.288000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<53.213000,0,20.828000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<48.895000,0,18.415000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<48.895000,0,20.447000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<30.607000,0,42.164000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<20.447000,0,42.164000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<45.535000,-1.537000,60.613000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<45.535000,-1.537000,59.963000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<45.535000,-1.537000,59.313000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<45.535000,-1.537000,58.663000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<45.535000,-1.537000,58.013000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<45.535000,-1.537000,57.363000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<45.535000,-1.537000,56.713000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<45.535000,-1.537000,56.063000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<45.535000,-1.537000,55.413000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<45.535000,-1.537000,54.763000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<45.535000,-1.537000,54.113000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<45.535000,-1.537000,53.463000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<45.535000,-1.537000,52.813000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<45.535000,-1.537000,52.163000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.285000,-1.537000,52.163000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.285000,-1.537000,52.813000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.285000,-1.537000,53.463000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.285000,-1.537000,54.113000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.285000,-1.537000,54.763000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.285000,-1.537000,55.413000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.285000,-1.537000,56.063000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.285000,-1.537000,56.713000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.285000,-1.537000,57.363000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.285000,-1.537000,58.013000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.285000,-1.537000,58.663000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.285000,-1.537000,59.313000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.285000,-1.537000,59.963000>}
object{TOOLS_PCB_SMD(0.400000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.285000,-1.537000,60.613000>}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<33.401000,0,48.006000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<33.401000,0,45.466000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<33.401000,0,42.926000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<41.402000,0,30.861000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<41.402000,0,33.401000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<41.402000,0,35.941000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<45.720000,0,42.799000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<45.720000,0,45.339000> texture{col_thl}}
#ifndef(global_pack_LED2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<60.960000,0,23.368000> texture{col_thl}}
#ifndef(global_pack_LED2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<60.960000,0,20.828000> texture{col_thl}}
#ifndef(global_pack_LED3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<85.344000,0,52.705000> texture{col_thl}}
#ifndef(global_pack_LED3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<85.344000,0,50.165000> texture{col_thl}}
#ifndef(global_pack_OK1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-90.000000,0>translate<89.027000,0,42.037000> texture{col_thl}}
#ifndef(global_pack_OK1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-90.000000,0>translate<86.487000,0,42.037000> texture{col_thl}}
#ifndef(global_pack_OK1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-270.000000,0>translate<86.487000,0,34.417000> texture{col_thl}}
#ifndef(global_pack_OK1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-270.000000,0>translate<89.027000,0,34.417000> texture{col_thl}}
#ifndef(global_pack_OK2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-90.000000,0>translate<81.915000,0,42.164000> texture{col_thl}}
#ifndef(global_pack_OK2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-90.000000,0>translate<79.375000,0,42.164000> texture{col_thl}}
#ifndef(global_pack_OK2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-270.000000,0>translate<79.375000,0,34.544000> texture{col_thl}}
#ifndef(global_pack_OK2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-270.000000,0>translate<81.915000,0,34.544000> texture{col_thl}}
#ifndef(global_pack_OK3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-90.000000,0>translate<74.549000,0,42.037000> texture{col_thl}}
#ifndef(global_pack_OK3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-90.000000,0>translate<72.009000,0,42.037000> texture{col_thl}}
#ifndef(global_pack_OK3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-270.000000,0>translate<72.009000,0,34.417000> texture{col_thl}}
#ifndef(global_pack_OK3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-270.000000,0>translate<74.549000,0,34.417000> texture{col_thl}}
#ifndef(global_pack_PWR) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<20.193000,0,44.958000> texture{col_thl}}
#ifndef(global_pack_PWR) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<20.193000,0,47.498000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<73.533000,0,53.594000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<73.533000,0,58.420000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<70.993000,0,62.357000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<70.993000,0,64.897000> texture{col_thl}}
#ifndef(global_pack_R_IN1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<67.310000,0,26.797000> texture{col_thl}}
#ifndef(global_pack_R_IN1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<59.690000,0,26.797000> texture{col_thl}}
#ifndef(global_pack_R_IN2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<56.515000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_R_IN2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<48.895000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_R_SERVOA1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<91.313000,0,42.037000> texture{col_thl}}
#ifndef(global_pack_R_SERVOA1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<91.313000,0,34.417000> texture{col_thl}}
#ifndef(global_pack_R_SERVOA2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<84.201000,0,42.037000> texture{col_thl}}
#ifndef(global_pack_R_SERVOA2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<84.201000,0,34.417000> texture{col_thl}}
#ifndef(global_pack_R_SERVOA3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<76.962000,0,42.164000> texture{col_thl}}
#ifndef(global_pack_R_SERVOA3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<76.962000,0,34.544000> texture{col_thl}}
#ifndef(global_pack_R_SERVOB1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<84.709000,0,31.115000> texture{col_thl}}
#ifndef(global_pack_R_SERVOB1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<92.329000,0,31.115000> texture{col_thl}}
#ifndef(global_pack_R_SERVOB2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<78.105000,0,28.321000> texture{col_thl}}
#ifndef(global_pack_R_SERVOB2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<85.725000,0,28.321000> texture{col_thl}}
#ifndef(global_pack_R_SERVOB3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<70.612000,0,30.607000> texture{col_thl}}
#ifndef(global_pack_R_SERVOB3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<78.232000,0,30.607000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<46.736000,0,40.386000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<39.116000,0,40.386000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<64.262000,0,23.622000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<64.262000,0,16.002000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<82.296000,0,47.879000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<82.296000,0,55.499000> texture{col_thl}}
#ifndef(global_pack_RV6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<45.339000,0,27.559000> texture{col_thl}}
#ifndef(global_pack_RV6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<45.339000,0,35.179000> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<65.760600,0,37.414200> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<65.760600,0,30.911800> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<61.239400,0,37.414200> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<61.239400,0,30.911800> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<55.600600,0,37.287200> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<55.600600,0,30.784800> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<51.079400,0,37.287200> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<51.079400,0,30.784800> texture{col_thl}}
#ifndef(global_pack_SERVOA) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<92.710000,0,24.765000> texture{col_thl}}
#ifndef(global_pack_SERVOA) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<90.170000,0,24.765000> texture{col_thl}}
#ifndef(global_pack_SERVOA) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<87.630000,0,24.765000> texture{col_thl}}
#ifndef(global_pack_SERVOB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<84.582000,0,24.638000> texture{col_thl}}
#ifndef(global_pack_SERVOB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<82.042000,0,24.638000> texture{col_thl}}
#ifndef(global_pack_SERVOB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<79.502000,0,24.638000> texture{col_thl}}
#ifndef(global_pack_SERVOC) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<76.454000,0,24.511000> texture{col_thl}}
#ifndef(global_pack_SERVOC) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<73.914000,0,24.511000> texture{col_thl}}
#ifndef(global_pack_SERVOC) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<71.374000,0,24.511000> texture{col_thl}}
#ifndef(global_pack_SWD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<56.769000,0,59.563000> texture{col_thl}}
#ifndef(global_pack_SWD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<54.229000,0,59.563000> texture{col_thl}}
#ifndef(global_pack_SWD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<51.689000,0,59.563000> texture{col_thl}}
#ifndef(global_pack_SWD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<49.149000,0,59.563000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<43.688000,0,18.796000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<43.688000,0,21.336000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<43.688000,0,23.876000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.803000,-1.537000,53.407000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.803000,-1.537000,52.907000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.803000,-1.537000,52.407000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.803000,-1.537000,51.907000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.803000,-1.537000,51.407000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.803000,-1.537000,50.907000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.803000,-1.537000,50.407000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.803000,-1.537000,49.907000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.803000,-1.537000,49.407000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.803000,-1.537000,48.907000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.803000,-1.537000,48.407000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.803000,-1.537000,47.907000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.803000,-1.537000,47.407000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.803000,-1.537000,46.907000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.803000,-1.537000,46.407000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.803000,-1.537000,45.907000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<65.853000,-1.537000,43.957000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<65.353000,-1.537000,43.957000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<64.853000,-1.537000,43.957000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<64.353000,-1.537000,43.957000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<63.853000,-1.537000,43.957000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<63.353000,-1.537000,43.957000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<62.853000,-1.537000,43.957000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<62.353000,-1.537000,43.957000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<61.853000,-1.537000,43.957000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<61.353000,-1.537000,43.957000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.853000,-1.537000,43.957000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.353000,-1.537000,43.957000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<59.853000,-1.537000,43.957000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<59.353000,-1.537000,43.957000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<58.853000,-1.537000,43.957000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<58.353000,-1.537000,43.957000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.403000,-1.537000,45.907000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.403000,-1.537000,46.407000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.403000,-1.537000,46.907000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.403000,-1.537000,47.407000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.403000,-1.537000,47.907000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.403000,-1.537000,48.407000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.403000,-1.537000,48.907000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.403000,-1.537000,49.407000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.403000,-1.537000,49.907000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.403000,-1.537000,50.407000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.403000,-1.537000,50.907000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.403000,-1.537000,51.407000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.403000,-1.537000,51.907000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.403000,-1.537000,52.407000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.403000,-1.537000,52.907000>}
object{TOOLS_PCB_SMD(1.200000,0.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.403000,-1.537000,53.407000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<58.353000,-1.537000,55.357000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<58.853000,-1.537000,55.357000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<59.353000,-1.537000,55.357000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<59.853000,-1.537000,55.357000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.353000,-1.537000,55.357000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.853000,-1.537000,55.357000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<61.353000,-1.537000,55.357000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<61.853000,-1.537000,55.357000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<62.353000,-1.537000,55.357000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<62.853000,-1.537000,55.357000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<63.353000,-1.537000,55.357000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<63.853000,-1.537000,55.357000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<64.353000,-1.537000,55.357000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<64.853000,-1.537000,55.357000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<65.353000,-1.537000,55.357000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<65.853000,-1.537000,55.357000>}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<30.872000,0,56.281000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<30.872000,0,58.781000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<28.872000,0,58.781000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<28.872000,0,56.281000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.316000,2.300000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<26.162000,0,63.551000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.316000,2.300000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<26.162000,0,51.511000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,0,0) translate<39.497000,0,48.514000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,0,0) translate<39.497000,0,42.418000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,0,0) translate<59.944000,0,68.961000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,0,0) translate<59.817000,0,60.452000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,0,0) translate<55.372000,0,41.656000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,0,0) translate<49.657000,0,41.656000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,0,0) translate<49.911000,0,41.402000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.162000,-1.535000,51.511000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.087000,-1.535000,51.511000>}
box{<0,0,-0.304800><7.925000,0.035000,0.304800> rotate<0,0.000000,0> translate<26.162000,-1.535000,51.511000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.162000,-1.535000,55.499000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.162000,-1.535000,51.511000>}
box{<0,0,-0.304800><3.988000,0.035000,0.304800> rotate<0,-90.000000,0> translate<26.162000,-1.535000,51.511000> }
}cylinder{<26.162000,1,51.511000><26.162000,-2.500000,51.511000>1.150000 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.162000,-1.535000,63.551000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.162000,-1.535000,61.087000>}
box{<0,0,-0.304800><2.464000,0.035000,0.304800> rotate<0,-90.000000,0> translate<26.162000,-1.535000,61.087000> }
}cylinder{<26.162000,1,63.551000><26.162000,-2.500000,63.551000>1.150000 texture{col_thl}}}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,-1.535000,30.734000>}
box{<0,0,-0.304800><14.986000,0.035000,0.304800> rotate<0,-90.000000,0> translate<17.272000,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.177000,-1.535000,47.625000>}
box{<0,0,-0.304800><2.694077,0.035000,0.304800> rotate<0,-44.997030,0> translate<17.272000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.177000,-1.535000,47.625000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.066000,-1.535000,47.625000>}
box{<0,0,-0.304800><0.889000,0.035000,0.304800> rotate<0,0.000000,0> translate<19.177000,-1.535000,47.625000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.193000,-1.535000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.193000,-1.535000,43.053000>}
box{<0,0,-0.304800><1.905000,0.035000,0.304800> rotate<0,-90.000000,0> translate<20.193000,-1.535000,43.053000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.066000,-1.535000,47.625000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.193000,-1.535000,47.498000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,44.997030,0> translate<20.066000,-1.535000,47.625000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.320000,-1.535000,27.686000>}
box{<0,0,-0.304800><4.310523,0.035000,0.304800> rotate<0,44.997030,0> translate<17.272000,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.193000,-1.535000,47.498000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.701000,-1.535000,48.006000>}
box{<0,0,-0.304800><0.718420,0.035000,0.304800> rotate<0,-44.997030,0> translate<20.193000,-1.535000,47.498000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.193000,-1.535000,43.053000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.082000,-1.535000,42.164000>}
box{<0,0,-0.304800><1.257236,0.035000,0.304800> rotate<0,44.997030,0> translate<20.193000,-1.535000,43.053000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.447000,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.082000,-1.535000,42.164000>}
box{<0,0,-0.304800><0.635000,0.035000,0.304800> rotate<0,0.000000,0> translate<20.447000,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.336000,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.336000,-1.535000,38.354000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.336000,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.082000,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.336000,-1.535000,42.164000>}
box{<0,0,-0.304800><0.254000,0.035000,0.304800> rotate<0,0.000000,0> translate<21.082000,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.162000,-1.535000,61.087000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.162000,-1.535000,55.499000>}
box{<0,0,-0.304800><5.588000,0.035000,0.304800> rotate<0,-90.000000,0> translate<26.162000,-1.535000,55.499000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.162000,-1.535000,61.087000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.416000,-1.535000,60.833000>}
box{<0,0,-0.304800><0.359210,0.035000,0.304800> rotate<0,44.997030,0> translate<26.162000,-1.535000,61.087000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.162000,-1.535000,55.499000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.944000,-1.535000,56.281000>}
box{<0,0,-0.304800><1.105915,0.035000,0.304800> rotate<0,-44.997030,0> translate<26.162000,-1.535000,55.499000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.416000,-1.535000,60.833000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.829000,-1.535000,60.833000>}
box{<0,0,-0.304800><2.413000,0.035000,0.304800> rotate<0,0.000000,0> translate<26.416000,-1.535000,60.833000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.944000,-1.535000,56.281000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.872000,-1.535000,56.281000>}
box{<0,0,-0.304800><1.928000,0.035000,0.304800> rotate<0,0.000000,0> translate<26.944000,-1.535000,56.281000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.872000,-1.535000,58.781000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.872000,-1.535000,58.631000>}
box{<0,0,-0.152400><0.150000,0.035000,0.152400> rotate<0,-90.000000,0> translate<28.872000,-1.535000,58.631000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.336000,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,38.354000>}
box{<0,0,-0.304800><7.874000,0.035000,0.304800> rotate<0,0.000000,0> translate<21.336000,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.872000,-1.535000,58.631000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.099000,-1.535000,57.404000>}
box{<0,0,-0.152400><1.735240,0.035000,0.152400> rotate<0,44.997030,0> translate<28.872000,-1.535000,58.631000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.607000,-1.535000,36.957000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.607000,-1.535000,33.909000>}
box{<0,0,-0.304800><3.048000,0.035000,0.304800> rotate<0,-90.000000,0> translate<30.607000,-1.535000,33.909000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.607000,-1.535000,36.957000>}
box{<0,0,-0.304800><1.975656,0.035000,0.304800> rotate<0,44.997030,0> translate<29.210000,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.607000,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.607000,-1.535000,44.069000>}
box{<0,0,-0.304800><1.905000,0.035000,0.304800> rotate<0,90.000000,0> translate<30.607000,-1.535000,44.069000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.607000,-1.535000,33.909000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.115000,-1.535000,33.401000>}
box{<0,0,-0.304800><0.718420,0.035000,0.304800> rotate<0,44.997030,0> translate<30.607000,-1.535000,33.909000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.872000,-1.535000,58.781000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.614000,-1.535000,58.039000>}
box{<0,0,-0.152400><1.049346,0.035000,0.152400> rotate<0,44.997030,0> translate<30.872000,-1.535000,58.781000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.872000,-1.535000,56.281000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.730000,-1.535000,56.281000>}
box{<0,0,-0.152400><0.858000,0.035000,0.152400> rotate<0,0.000000,0> translate<30.872000,-1.535000,56.281000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.099000,-1.535000,57.404000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,-1.535000,57.404000>}
box{<0,0,-0.152400><1.651000,0.035000,0.152400> rotate<0,0.000000,0> translate<30.099000,-1.535000,57.404000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.607000,-1.535000,44.069000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.004000,-1.535000,45.466000>}
box{<0,0,-0.304800><1.975656,0.035000,0.304800> rotate<0,-44.997030,0> translate<30.607000,-1.535000,44.069000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.614000,-1.535000,58.039000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,-1.535000,58.039000>}
box{<0,0,-0.152400><0.390000,0.035000,0.152400> rotate<0,0.000000,0> translate<31.614000,-1.535000,58.039000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.004000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.401000,-1.535000,45.466000>}
box{<0,0,-0.304800><1.397000,0.035000,0.304800> rotate<0,0.000000,0> translate<32.004000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.701000,-1.535000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.401000,-1.535000,48.006000>}
box{<0,0,-0.304800><12.700000,0.035000,0.304800> rotate<0,0.000000,0> translate<20.701000,-1.535000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.401000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.528000,-1.535000,45.339000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,44.997030,0> translate<33.401000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.829000,-1.535000,60.833000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.163000,-1.535000,66.167000>}
box{<0,0,-0.304800><7.543415,0.035000,0.304800> rotate<0,-44.997030,0> translate<28.829000,-1.535000,60.833000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.417000,-1.535000,53.594000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.417000,-1.535000,53.467000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,-90.000000,0> translate<34.417000,-1.535000,53.467000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.730000,-1.535000,56.281000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.417000,-1.535000,53.594000>}
box{<0,0,-0.152400><3.799992,0.035000,0.152400> rotate<0,44.997030,0> translate<31.730000,-1.535000,56.281000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.941000,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.941000,-1.535000,60.960000>}
box{<0,0,-0.152400><6.096000,0.035000,0.152400> rotate<0,90.000000,0> translate<35.941000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,49.276000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,45.466000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,-90.000000,0> translate<36.322000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.087000,-1.535000,51.511000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,49.276000>}
box{<0,0,-0.304800><3.160767,0.035000,0.304800> rotate<0,44.997030,0> translate<34.087000,-1.535000,51.511000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.528000,-1.535000,45.339000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.449000,-1.535000,45.339000>}
box{<0,0,-0.304800><2.921000,0.035000,0.304800> rotate<0,0.000000,0> translate<33.528000,-1.535000,45.339000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.322000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.449000,-1.535000,45.339000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,44.997030,0> translate<36.322000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.449000,-1.535000,49.149000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.449000,-1.535000,46.101000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.449000,-1.535000,46.101000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.087000,-1.535000,51.511000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.449000,-1.535000,49.149000>}
box{<0,0,-0.203200><3.340372,0.035000,0.203200> rotate<0,44.997030,0> translate<34.087000,-1.535000,51.511000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.417000,-1.535000,53.467000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.703000,-1.535000,51.181000>}
box{<0,0,-0.152400><3.232892,0.035000,0.152400> rotate<0,44.997030,0> translate<34.417000,-1.535000,53.467000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.703000,-1.535000,54.737000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.703000,-1.535000,56.134000>}
box{<0,0,-0.152400><1.397000,0.035000,0.152400> rotate<0,90.000000,0> translate<36.703000,-1.535000,56.134000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.703000,-1.535000,56.134000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.703000,-1.535000,58.801000>}
box{<0,0,-0.152400><2.667000,0.035000,0.152400> rotate<0,90.000000,0> translate<36.703000,-1.535000,58.801000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.703000,-1.535000,58.801000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.766500,-1.535000,58.864500>}
box{<0,0,-0.152400><0.089803,0.035000,0.152400> rotate<0,-44.997030,0> translate<36.703000,-1.535000,58.801000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.703000,-1.535000,56.134000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.774000,-1.535000,56.063000>}
box{<0,0,-0.152400><0.100409,0.035000,0.152400> rotate<0,44.997030,0> translate<36.703000,-1.535000,56.134000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.766500,-1.535000,58.864500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.968000,-1.535000,58.663000>}
box{<0,0,-0.152400><0.284964,0.035000,0.152400> rotate<0,44.997030,0> translate<36.766500,-1.535000,58.864500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,-1.535000,57.404000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.991000,-1.535000,52.163000>}
box{<0,0,-0.152400><7.411893,0.035000,0.152400> rotate<0,44.997030,0> translate<31.750000,-1.535000,57.404000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.320000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.211000,-1.535000,27.686000>}
box{<0,0,-0.304800><16.891000,0.035000,0.304800> rotate<0,0.000000,0> translate<20.320000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.766500,-1.535000,58.864500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.215000,-1.535000,59.313000>}
box{<0,0,-0.152400><0.634275,0.035000,0.152400> rotate<0,-44.997030,0> translate<36.766500,-1.535000,58.864500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,-1.535000,58.039000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.230000,-1.535000,52.813000>}
box{<0,0,-0.152400><7.390680,0.035000,0.152400> rotate<0,44.997030,0> translate<32.004000,-1.535000,58.039000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.703000,-1.535000,54.737000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.327000,-1.535000,54.113000>}
box{<0,0,-0.152400><0.882469,0.035000,0.152400> rotate<0,44.997030,0> translate<36.703000,-1.535000,54.737000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.211000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.338000,-1.535000,27.559000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,44.997030,0> translate<37.211000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.338000,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.338000,-1.535000,27.559000>}
box{<0,0,-0.304800><5.207000,0.035000,0.304800> rotate<0,90.000000,0> translate<37.338000,-1.535000,27.559000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.338000,-1.535000,27.559000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.338000,-1.535000,30.861000>}
box{<0,0,-0.304800><3.302000,0.035000,0.304800> rotate<0,90.000000,0> translate<37.338000,-1.535000,30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.401000,-1.535000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.338000,-1.535000,42.926000>}
box{<0,0,-0.304800><3.937000,0.035000,0.304800> rotate<0,0.000000,0> translate<33.401000,-1.535000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.941000,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.342000,-1.535000,53.463000>}
box{<0,0,-0.152400><1.981313,0.035000,0.152400> rotate<0,44.997030,0> translate<35.941000,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.465000,-1.535000,42.799000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.465000,-1.535000,42.037000>}
box{<0,0,-0.304800><0.762000,0.035000,0.304800> rotate<0,-90.000000,0> translate<37.465000,-1.535000,42.037000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.338000,-1.535000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.465000,-1.535000,42.799000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,44.997030,0> translate<37.338000,-1.535000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.449000,-1.535000,46.101000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.465000,-1.535000,45.085000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<36.449000,-1.535000,46.101000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.449000,-1.535000,45.339000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.465000,-1.535000,45.339000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<36.449000,-1.535000,45.339000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.941000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.465000,-1.535000,62.484000>}
box{<0,0,-0.152400><2.155261,0.035000,0.152400> rotate<0,-44.997030,0> translate<35.941000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.465000,-1.535000,45.339000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.973000,-1.535000,44.831000>}
box{<0,0,-0.304800><0.718420,0.035000,0.304800> rotate<0,44.997030,0> translate<37.465000,-1.535000,45.339000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.991000,-1.535000,52.163000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.285000,-1.535000,52.163000>}
box{<0,0,-0.152400><1.294000,0.035000,0.152400> rotate<0,0.000000,0> translate<36.991000,-1.535000,52.163000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.230000,-1.535000,52.813000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.285000,-1.535000,52.813000>}
box{<0,0,-0.152400><1.055000,0.035000,0.152400> rotate<0,0.000000,0> translate<37.230000,-1.535000,52.813000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.342000,-1.535000,53.463000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.285000,-1.535000,53.463000>}
box{<0,0,-0.152400><0.943000,0.035000,0.152400> rotate<0,0.000000,0> translate<37.342000,-1.535000,53.463000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.327000,-1.535000,54.113000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.285000,-1.535000,54.113000>}
box{<0,0,-0.152400><0.958000,0.035000,0.152400> rotate<0,0.000000,0> translate<37.327000,-1.535000,54.113000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.774000,-1.535000,56.063000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.285000,-1.535000,56.063000>}
box{<0,0,-0.152400><1.511000,0.035000,0.152400> rotate<0,0.000000,0> translate<36.774000,-1.535000,56.063000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.968000,-1.535000,58.663000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.285000,-1.535000,58.663000>}
box{<0,0,-0.152400><1.317000,0.035000,0.152400> rotate<0,0.000000,0> translate<36.968000,-1.535000,58.663000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.215000,-1.535000,59.313000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.285000,-1.535000,59.313000>}
box{<0,0,-0.152400><1.070000,0.035000,0.152400> rotate<0,0.000000,0> translate<37.215000,-1.535000,59.313000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.338000,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.354000,-1.535000,21.336000>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,44.997030,0> translate<37.338000,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.465000,-1.535000,42.037000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.116000,-1.535000,40.386000>}
box{<0,0,-0.304800><2.334867,0.035000,0.304800> rotate<0,44.997030,0> translate<37.465000,-1.535000,42.037000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.116000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.116000,-1.535000,40.767000>}
box{<0,0,-0.304800><0.381000,0.035000,0.304800> rotate<0,90.000000,0> translate<39.116000,-1.535000,40.767000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.285000,-1.535000,55.413000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.202000,-1.535000,55.413000>}
box{<0,0,-0.152400><0.917000,0.035000,0.152400> rotate<0,0.000000,0> translate<38.285000,-1.535000,55.413000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.116000,-1.535000,40.767000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.497000,-1.535000,41.148000>}
box{<0,0,-0.304800><0.538815,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.116000,-1.535000,40.767000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.497000,-1.535000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.497000,-1.535000,41.148000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<39.497000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.497000,0.000000,48.514000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.497000,0.000000,42.418000>}
box{<0,0,-0.304800><6.096000,0.035000,0.304800> rotate<0,-90.000000,0> translate<39.497000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.497000,-1.535000,50.673000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.497000,-1.535000,48.514000>}
box{<0,0,-0.304800><2.159000,0.035000,0.304800> rotate<0,-90.000000,0> translate<39.497000,-1.535000,48.514000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.703000,-1.535000,51.181000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.624000,-1.535000,51.181000>}
box{<0,0,-0.152400><2.921000,0.035000,0.152400> rotate<0,0.000000,0> translate<36.703000,-1.535000,51.181000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.497000,-1.535000,50.673000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.005000,-1.535000,51.181000>}
box{<0,0,-0.304800><0.718420,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.497000,-1.535000,50.673000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.005000,-1.535000,51.181000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.132000,-1.535000,51.181000>}
box{<0,0,-0.304800><0.127000,0.035000,0.304800> rotate<0,0.000000,0> translate<40.005000,-1.535000,51.181000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.132000,-1.535000,51.689000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.132000,-1.535000,51.181000>}
box{<0,0,-0.152400><0.508000,0.035000,0.152400> rotate<0,-90.000000,0> translate<40.132000,-1.535000,51.181000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.624000,-1.535000,51.181000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.132000,-1.535000,51.689000>}
box{<0,0,-0.152400><0.718420,0.035000,0.152400> rotate<0,-44.997030,0> translate<39.624000,-1.535000,51.181000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.202000,-1.535000,55.413000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.132000,-1.535000,54.483000>}
box{<0,0,-0.152400><1.315219,0.035000,0.152400> rotate<0,44.997030,0> translate<39.202000,-1.535000,55.413000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.132000,-1.535000,51.689000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.132000,-1.535000,54.483000>}
box{<0,0,-0.152400><2.794000,0.035000,0.152400> rotate<0,90.000000,0> translate<40.132000,-1.535000,54.483000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.285000,-1.535000,56.063000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.569000,-1.535000,56.063000>}
box{<0,0,-0.152400><2.284000,0.035000,0.152400> rotate<0,0.000000,0> translate<38.285000,-1.535000,56.063000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.894000,-1.535000,24.257000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.894000,-1.535000,23.495000>}
box{<0,0,-0.152400><0.762000,0.035000,0.152400> rotate<0,-90.000000,0> translate<40.894000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.497000,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.148000,-1.535000,42.799000>}
box{<0,0,-0.304800><2.334867,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.497000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.973000,-1.535000,44.831000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.148000,-1.535000,44.831000>}
box{<0,0,-0.304800><3.175000,0.035000,0.304800> rotate<0,0.000000,0> translate<37.973000,-1.535000,44.831000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.569000,-1.535000,56.063000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.219000,-1.535000,56.713000>}
box{<0,0,-0.152400><0.919239,0.035000,0.152400> rotate<0,-44.997030,0> translate<40.569000,-1.535000,56.063000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.338000,-1.535000,30.861000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.402000,-1.535000,30.861000>}
box{<0,0,-0.304800><4.064000,0.035000,0.304800> rotate<0,0.000000,0> translate<37.338000,-1.535000,30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.402000,-1.535000,33.401000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.529000,-1.535000,33.528000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,-44.997030,0> translate<41.402000,-1.535000,33.401000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.894000,-1.535000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.783000,-1.535000,22.606000>}
box{<0,0,-0.152400><1.257236,0.035000,0.152400> rotate<0,44.997030,0> translate<40.894000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.115000,-1.535000,33.401000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.783000,-1.535000,33.401000>}
box{<0,0,-0.304800><10.668000,0.035000,0.304800> rotate<0,0.000000,0> translate<31.115000,-1.535000,33.401000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.529000,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,-1.535000,33.528000>}
box{<0,0,-0.304800><0.381000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.529000,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.783000,-1.535000,33.401000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,-1.535000,33.528000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,-44.997030,0> translate<41.783000,-1.535000,33.401000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.465000,-1.535000,45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.672000,-1.535000,45.085000>}
box{<0,0,-0.203200><5.207000,0.035000,0.203200> rotate<0,0.000000,0> translate<37.465000,-1.535000,45.085000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.465000,-1.535000,62.484000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.672000,-1.535000,62.484000>}
box{<0,0,-0.152400><5.207000,0.035000,0.152400> rotate<0,0.000000,0> translate<37.465000,-1.535000,62.484000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.672000,-1.535000,58.928000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.672000,-1.535000,62.484000>}
box{<0,0,-0.152400><3.556000,0.035000,0.152400> rotate<0,90.000000,0> translate<42.672000,-1.535000,62.484000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.672000,-1.535000,45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.926000,-1.535000,45.339000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.672000,-1.535000,45.085000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.926000,-1.535000,45.339000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.926000,-1.535000,56.205000>}
box{<0,0,-0.203200><10.866000,0.035000,0.203200> rotate<0,90.000000,0> translate<42.926000,-1.535000,56.205000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.672000,-1.535000,58.928000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.937000,-1.535000,58.663000>}
box{<0,0,-0.152400><0.374767,0.035000,0.152400> rotate<0,44.997030,0> translate<42.672000,-1.535000,58.928000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.219000,-1.535000,56.713000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.434000,-1.535000,56.713000>}
box{<0,0,-0.152400><2.215000,0.035000,0.152400> rotate<0,0.000000,0> translate<41.219000,-1.535000,56.713000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.926000,-1.535000,56.205000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,-1.535000,56.713000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.926000,-1.535000,56.205000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.354000,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.688000,-1.535000,21.336000>}
box{<0,0,-0.304800><5.334000,0.035000,0.304800> rotate<0,0.000000,0> translate<38.354000,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.894000,-1.535000,24.257000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.196000,-1.535000,27.559000>}
box{<0,0,-0.152400><4.669733,0.035000,0.152400> rotate<0,-44.997030,0> translate<40.894000,-1.535000,24.257000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.672000,-1.535000,62.484000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.450000,-1.535000,62.484000>}
box{<0,0,-0.152400><1.778000,0.035000,0.152400> rotate<0,0.000000,0> translate<42.672000,-1.535000,62.484000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.402000,-1.535000,35.941000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.577000,-1.535000,35.941000>}
box{<0,0,-0.304800><3.175000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.402000,-1.535000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.831000,-1.535000,33.528000>}
box{<0,0,-0.304800><2.921000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.910000,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.450000,-1.535000,62.484000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.831000,-1.535000,62.103000>}
box{<0,0,-0.152400><0.538815,0.035000,0.152400> rotate<0,44.997030,0> translate<44.450000,-1.535000,62.484000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.688000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.958000,-1.535000,23.876000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<43.688000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.783000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.085000,-1.535000,22.606000>}
box{<0,0,-0.152400><3.302000,0.035000,0.152400> rotate<0,0.000000,0> translate<41.783000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.148000,-1.535000,44.831000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.212000,-1.535000,44.831000>}
box{<0,0,-0.304800><4.064000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.148000,-1.535000,44.831000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.196000,-1.535000,27.559000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.339000,-1.535000,27.559000>}
box{<0,0,-0.152400><1.143000,0.035000,0.152400> rotate<0,0.000000,0> translate<44.196000,-1.535000,27.559000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.577000,-1.535000,35.941000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.339000,-1.535000,35.179000>}
box{<0,0,-0.304800><1.077631,0.035000,0.304800> rotate<0,44.997030,0> translate<44.577000,-1.535000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.434000,-1.535000,56.713000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.535000,-1.535000,56.713000>}
box{<0,0,-0.152400><2.101000,0.035000,0.152400> rotate<0,0.000000,0> translate<43.434000,-1.535000,56.713000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.937000,-1.535000,58.663000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.535000,-1.535000,58.663000>}
box{<0,0,-0.152400><2.598000,0.035000,0.152400> rotate<0,0.000000,0> translate<42.937000,-1.535000,58.663000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.688000,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.593000,-1.535000,18.796000>}
box{<0,0,-0.304800><1.905000,0.035000,0.304800> rotate<0,0.000000,0> translate<43.688000,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.593000,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.720000,-1.535000,18.923000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,-44.997030,0> translate<45.593000,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.212000,-1.535000,44.831000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.720000,-1.535000,45.339000>}
box{<0,0,-0.304800><0.718420,0.035000,0.304800> rotate<0,-44.997030,0> translate<45.212000,-1.535000,44.831000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.720000,-1.535000,18.923000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.974000,-1.535000,19.177000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,-44.997030,0> translate<45.720000,-1.535000,18.923000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.974000,-1.535000,21.717000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.974000,-1.535000,19.177000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,-90.000000,0> translate<45.974000,-1.535000,19.177000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.085000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.974000,-1.535000,21.717000>}
box{<0,0,-0.152400><1.257236,0.035000,0.152400> rotate<0,44.997030,0> translate<45.085000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.720000,-1.535000,45.339000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.355000,-1.535000,44.704000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<45.720000,-1.535000,45.339000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.535000,-1.535000,58.013000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.508000,-1.535000,58.013000>}
box{<0,0,-0.152400><0.973000,0.035000,0.152400> rotate<0,0.000000,0> translate<45.535000,-1.535000,58.013000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.831000,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.736000,-1.535000,31.623000>}
box{<0,0,-0.304800><2.694077,0.035000,0.304800> rotate<0,44.997030,0> translate<44.831000,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.736000,-1.535000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.736000,-1.535000,31.623000>}
box{<0,0,-0.304800><6.858000,0.035000,0.304800> rotate<0,90.000000,0> translate<46.736000,-1.535000,31.623000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.720000,-1.535000,42.799000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.736000,-1.535000,41.783000>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,44.997030,0> translate<45.720000,-1.535000,42.799000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.736000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.736000,-1.535000,41.783000>}
box{<0,0,-0.304800><1.397000,0.035000,0.304800> rotate<0,90.000000,0> translate<46.736000,-1.535000,41.783000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.535000,-1.535000,60.613000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.829000,-1.535000,60.613000>}
box{<0,0,-0.152400><1.294000,0.035000,0.152400> rotate<0,0.000000,0> translate<45.535000,-1.535000,60.613000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.863000,-1.535000,21.971000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.863000,-1.535000,20.447000>}
box{<0,0,-0.304800><1.524000,0.035000,0.304800> rotate<0,-90.000000,0> translate<46.863000,-1.535000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.958000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.863000,-1.535000,21.971000>}
box{<0,0,-0.304800><2.694077,0.035000,0.304800> rotate<0,44.997030,0> translate<44.958000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.625000,-1.535000,56.896000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.625000,-1.535000,51.689000>}
box{<0,0,-0.152400><5.207000,0.035000,0.152400> rotate<0,-90.000000,0> translate<47.625000,-1.535000,51.689000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.508000,-1.535000,58.013000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.625000,-1.535000,56.896000>}
box{<0,0,-0.152400><1.579677,0.035000,0.152400> rotate<0,44.997030,0> translate<46.508000,-1.535000,58.013000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.752000,-1.535000,25.781000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.752000,-1.535000,33.959800>}
box{<0,0,-0.152400><8.178800,0.035000,0.152400> rotate<0,90.000000,0> translate<47.752000,-1.535000,33.959800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.752000,-1.535000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.752000,-1.535000,58.039000>}
box{<0,0,-0.152400><1.651000,0.035000,0.152400> rotate<0,-90.000000,0> translate<47.752000,-1.535000,58.039000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.829000,-1.535000,60.613000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.752000,-1.535000,59.690000>}
box{<0,0,-0.152400><1.305319,0.035000,0.152400> rotate<0,44.997030,0> translate<46.829000,-1.535000,60.613000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.260000,-1.535000,57.531000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.260000,-1.535000,51.816000>}
box{<0,0,-0.152400><5.715000,0.035000,0.152400> rotate<0,-90.000000,0> translate<48.260000,-1.535000,51.816000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.752000,-1.535000,58.039000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.260000,-1.535000,57.531000>}
box{<0,0,-0.152400><0.718420,0.035000,0.152400> rotate<0,44.997030,0> translate<47.752000,-1.535000,58.039000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.863000,-1.535000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.895000,-1.535000,18.415000>}
box{<0,0,-0.304800><2.873682,0.035000,0.304800> rotate<0,44.997030,0> translate<46.863000,-1.535000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.736000,-1.535000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.895000,-1.535000,22.606000>}
box{<0,0,-0.304800><3.053287,0.035000,0.304800> rotate<0,44.997030,0> translate<46.736000,-1.535000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.895000,-1.535000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.895000,-1.535000,22.606000>}
box{<0,0,-0.304800><2.159000,0.035000,0.304800> rotate<0,90.000000,0> translate<48.895000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.625000,-1.535000,51.689000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.895000,-1.535000,50.419000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<47.625000,-1.535000,51.689000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.260000,-1.535000,51.816000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.149000,-1.535000,50.927000>}
box{<0,0,-0.152400><1.257236,0.035000,0.152400> rotate<0,44.997030,0> translate<48.260000,-1.535000,51.816000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.149000,-1.535000,55.626000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.149000,-1.535000,59.563000>}
box{<0,0,-0.152400><3.937000,0.035000,0.152400> rotate<0,90.000000,0> translate<49.149000,-1.535000,59.563000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.752000,-1.535000,25.781000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.276000,-1.535000,24.257000>}
box{<0,0,-0.152400><2.155261,0.035000,0.152400> rotate<0,44.997030,0> translate<47.752000,-1.535000,25.781000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.355000,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.530000,-1.535000,44.704000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,0.000000,0> translate<46.355000,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.530000,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.657000,-1.535000,44.577000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,44.997030,0> translate<49.530000,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.657000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.657000,-1.535000,44.577000>}
box{<0,0,-0.152400><2.921000,0.035000,0.152400> rotate<0,90.000000,0> translate<49.657000,-1.535000,44.577000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.895000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.784000,-1.535000,26.670000>}
box{<0,0,-0.304800><0.889000,0.035000,0.304800> rotate<0,0.000000,0> translate<48.895000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.657000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.911000,-1.535000,41.402000>}
box{<0,0,-0.304800><0.359210,0.035000,0.304800> rotate<0,44.997030,0> translate<49.657000,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.911000,-1.535000,40.005000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.911000,-1.535000,41.402000>}
box{<0,0,-0.304800><1.397000,0.035000,0.304800> rotate<0,90.000000,0> translate<49.911000,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.752000,-1.535000,33.959800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.079400,-1.535000,37.287200>}
box{<0,0,-0.152400><4.705654,0.035000,0.152400> rotate<0,-44.997030,0> translate<47.752000,-1.535000,33.959800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.911000,-1.535000,40.005000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.079400,-1.535000,38.836600>}
box{<0,0,-0.304800><1.652367,0.035000,0.304800> rotate<0,44.997030,0> translate<49.911000,-1.535000,40.005000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.079400,-1.535000,37.287200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.079400,-1.535000,38.836600>}
box{<0,0,-0.304800><1.549400,0.035000,0.304800> rotate<0,90.000000,0> translate<51.079400,-1.535000,38.836600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.784000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.435000,-1.535000,25.019000>}
box{<0,0,-0.304800><2.334867,0.035000,0.304800> rotate<0,44.997030,0> translate<49.784000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.689000,-1.535000,59.563000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.689000,-1.535000,54.102000>}
box{<0,0,-0.152400><5.461000,0.035000,0.152400> rotate<0,-90.000000,0> translate<51.689000,-1.535000,54.102000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.149000,-1.535000,55.626000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.368000,-1.535000,52.407000>}
box{<0,0,-0.152400><4.552353,0.035000,0.152400> rotate<0,44.997030,0> translate<49.149000,-1.535000,55.626000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.435000,-1.535000,25.019000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.705000,-1.535000,25.019000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<51.435000,-1.535000,25.019000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.895000,-1.535000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.832000,-1.535000,20.447000>}
box{<0,0,-0.304800><3.937000,0.035000,0.304800> rotate<0,0.000000,0> translate<48.895000,-1.535000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.832000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.832000,-1.535000,61.214000>}
box{<0,0,-0.152400><6.604000,0.035000,0.152400> rotate<0,90.000000,0> translate<52.832000,-1.535000,61.214000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.689000,-1.535000,54.102000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.884000,-1.535000,52.907000>}
box{<0,0,-0.152400><1.689985,0.035000,0.152400> rotate<0,44.997030,0> translate<51.689000,-1.535000,54.102000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.895000,-1.535000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.086000,-1.535000,18.415000>}
box{<0,0,-0.304800><4.191000,0.035000,0.304800> rotate<0,0.000000,0> translate<48.895000,-1.535000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.086000,-1.535000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.213000,-1.535000,18.288000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,44.997030,0> translate<53.086000,-1.535000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.832000,-1.535000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.213000,-1.535000,20.828000>}
box{<0,0,-0.304800><0.538815,0.035000,0.304800> rotate<0,-44.997030,0> translate<52.832000,-1.535000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.705000,-1.535000,25.019000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.721000,-1.535000,26.035000>}
box{<0,0,-0.152400><1.436841,0.035000,0.152400> rotate<0,-44.997030,0> translate<52.705000,-1.535000,25.019000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.721000,-1.535000,43.307000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.721000,-1.535000,26.035000>}
box{<0,0,-0.152400><17.272000,0.035000,0.152400> rotate<0,-90.000000,0> translate<53.721000,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.831000,-1.535000,62.103000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.721000,-1.535000,62.103000>}
box{<0,0,-0.152400><8.890000,0.035000,0.152400> rotate<0,0.000000,0> translate<44.831000,-1.535000,62.103000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.832000,-1.535000,61.214000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.721000,-1.535000,62.103000>}
box{<0,0,-0.152400><1.257236,0.035000,0.152400> rotate<0,-44.997030,0> translate<52.832000,-1.535000,61.214000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.832000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.035000,-1.535000,53.407000>}
box{<0,0,-0.152400><1.701299,0.035000,0.152400> rotate<0,44.997030,0> translate<52.832000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.229000,-1.535000,57.658000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.229000,-1.535000,59.563000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<54.229000,-1.535000,59.563000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.721000,-1.535000,43.307000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.356000,-1.535000,43.942000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<53.721000,-1.535000,43.307000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.911000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.118000,0.000000,41.402000>}
box{<0,0,-0.304800><5.207000,0.035000,0.304800> rotate<0,0.000000,0> translate<49.911000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.118000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.372000,0.000000,41.656000>}
box{<0,0,-0.304800><0.359210,0.035000,0.304800> rotate<0,-44.997030,0> translate<55.118000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.229000,-1.535000,57.658000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.372000,-1.535000,56.515000>}
box{<0,0,-0.152400><1.616446,0.035000,0.152400> rotate<0,44.997030,0> translate<54.229000,-1.535000,57.658000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.600600,-1.535000,37.287200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.600600,-1.535000,37.109400>}
box{<0,0,-0.304800><0.177800,0.035000,0.304800> rotate<0,-90.000000,0> translate<55.600600,-1.535000,37.109400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.600600,-1.535000,37.287200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.626000,-1.535000,37.312600>}
box{<0,0,-0.152400><0.035921,0.035000,0.152400> rotate<0,-44.997030,0> translate<55.600600,-1.535000,37.287200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.626000,-1.535000,38.989000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.626000,-1.535000,37.312600>}
box{<0,0,-0.152400><1.676400,0.035000,0.152400> rotate<0,-90.000000,0> translate<55.626000,-1.535000,37.312600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.149000,-1.535000,50.927000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.383000,-1.535000,50.927000>}
box{<0,0,-0.152400><7.234000,0.035000,0.152400> rotate<0,0.000000,0> translate<49.149000,-1.535000,50.927000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.895000,-1.535000,50.419000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.391000,-1.535000,50.419000>}
box{<0,0,-0.152400><7.496000,0.035000,0.152400> rotate<0,0.000000,0> translate<48.895000,-1.535000,50.419000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.391000,-1.535000,50.419000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.403000,-1.535000,50.407000>}
box{<0,0,-0.152400><0.016971,0.035000,0.152400> rotate<0,44.997030,0> translate<56.391000,-1.535000,50.419000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.383000,-1.535000,50.927000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.403000,-1.535000,50.907000>}
box{<0,0,-0.152400><0.028284,0.035000,0.152400> rotate<0,44.997030,0> translate<56.383000,-1.535000,50.927000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.368000,-1.535000,52.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.403000,-1.535000,52.407000>}
box{<0,0,-0.152400><4.035000,0.035000,0.152400> rotate<0,0.000000,0> translate<52.368000,-1.535000,52.407000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.884000,-1.535000,52.907000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.403000,-1.535000,52.907000>}
box{<0,0,-0.152400><3.519000,0.035000,0.152400> rotate<0,0.000000,0> translate<52.884000,-1.535000,52.907000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.035000,-1.535000,53.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.403000,-1.535000,53.407000>}
box{<0,0,-0.152400><2.368000,0.035000,0.152400> rotate<0,0.000000,0> translate<54.035000,-1.535000,53.407000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.721000,-1.535000,62.103000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.515000,-1.535000,62.103000>}
box{<0,0,-0.152400><2.794000,0.035000,0.152400> rotate<0,0.000000,0> translate<53.721000,-1.535000,62.103000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.642000,-1.535000,61.976000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.642000,-1.535000,59.690000>}
box{<0,0,-0.152400><2.286000,0.035000,0.152400> rotate<0,-90.000000,0> translate<56.642000,-1.535000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.515000,-1.535000,62.103000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.642000,-1.535000,61.976000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,44.997030,0> translate<56.515000,-1.535000,62.103000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.530000,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.769000,-1.535000,44.704000>}
box{<0,0,-0.152400><7.239000,0.035000,0.152400> rotate<0,0.000000,0> translate<49.530000,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.642000,-1.535000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.769000,-1.535000,59.563000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,44.997030,0> translate<56.642000,-1.535000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.626000,-1.535000,38.989000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.150000,-1.535000,40.513000>}
box{<0,0,-0.152400><2.155261,0.035000,0.152400> rotate<0,-44.997030,0> translate<55.626000,-1.535000,38.989000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.356000,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.150000,-1.535000,43.942000>}
box{<0,0,-0.152400><2.794000,0.035000,0.152400> rotate<0,0.000000,0> translate<54.356000,-1.535000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.150000,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.165000,-1.535000,43.957000>}
box{<0,0,-0.152400><0.021213,0.035000,0.152400> rotate<0,-44.997030,0> translate<57.150000,-1.535000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.403000,-1.535000,52.907000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.329000,-1.535000,52.907000>}
box{<0,0,-0.152400><0.926000,0.035000,0.152400> rotate<0,0.000000,0> translate<56.403000,-1.535000,52.907000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.515000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.531000,-1.535000,27.686000>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,-44.997030,0> translate<56.515000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.531000,-1.535000,35.179000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.531000,-1.535000,27.686000>}
box{<0,0,-0.304800><7.493000,0.035000,0.304800> rotate<0,-90.000000,0> translate<57.531000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.600600,-1.535000,37.109400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.531000,-1.535000,35.179000>}
box{<0,0,-0.304800><2.729998,0.035000,0.304800> rotate<0,44.997030,0> translate<55.600600,-1.535000,37.109400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.769000,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.531000,-1.535000,45.466000>}
box{<0,0,-0.152400><1.077631,0.035000,0.152400> rotate<0,-44.997030,0> translate<56.769000,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.531000,-1.535000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.531000,-1.535000,45.466000>}
box{<0,0,-0.152400><7.239000,0.035000,0.152400> rotate<0,-90.000000,0> translate<57.531000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.329000,-1.535000,52.907000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.531000,-1.535000,52.705000>}
box{<0,0,-0.152400><0.285671,0.035000,0.152400> rotate<0,44.997030,0> translate<57.329000,-1.535000,52.907000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.372000,-1.535000,56.515000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.785000,-1.535000,56.515000>}
box{<0,0,-0.152400><2.413000,0.035000,0.152400> rotate<0,0.000000,0> translate<55.372000,-1.535000,56.515000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.705000,-1.535000,25.019000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.912000,-1.535000,25.019000>}
box{<0,0,-0.304800><5.207000,0.035000,0.304800> rotate<0,0.000000,0> translate<52.705000,-1.535000,25.019000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.912000,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.912000,-1.535000,35.941000>}
box{<0,0,-0.152400><2.413000,0.035000,0.152400> rotate<0,-90.000000,0> translate<57.912000,-1.535000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.293000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.293000,-1.535000,28.194000>}
box{<0,0,-0.152400><7.366000,0.035000,0.152400> rotate<0,-90.000000,0> translate<58.293000,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.912000,-1.535000,35.941000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.293000,-1.535000,35.560000>}
box{<0,0,-0.152400><0.538815,0.035000,0.152400> rotate<0,44.997030,0> translate<57.912000,-1.535000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.165000,-1.535000,43.957000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.353000,-1.535000,43.957000>}
box{<0,0,-0.152400><1.188000,0.035000,0.152400> rotate<0,0.000000,0> translate<57.165000,-1.535000,43.957000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.353000,-1.535000,43.957000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.353000,-1.535000,53.213000>}
box{<0,0,-0.152400><9.256000,0.035000,0.152400> rotate<0,90.000000,0> translate<58.353000,-1.535000,53.213000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.785000,-1.535000,56.515000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.353000,-1.535000,55.947000>}
box{<0,0,-0.152400><0.803273,0.035000,0.152400> rotate<0,44.997030,0> translate<57.785000,-1.535000,56.515000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.353000,-1.535000,55.357000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.353000,-1.535000,55.947000>}
box{<0,0,-0.152400><0.590000,0.035000,0.152400> rotate<0,90.000000,0> translate<58.353000,-1.535000,55.947000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.403000,-1.535000,53.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.547000,-1.535000,53.407000>}
box{<0,0,-0.152400><2.144000,0.035000,0.152400> rotate<0,0.000000,0> translate<56.403000,-1.535000,53.407000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.353000,-1.535000,53.213000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.547000,-1.535000,53.407000>}
box{<0,0,-0.152400><0.274357,0.035000,0.152400> rotate<0,-44.997030,0> translate<58.353000,-1.535000,53.213000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.372000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.674000,-1.535000,41.656000>}
box{<0,0,-0.152400><3.302000,0.035000,0.152400> rotate<0,0.000000,0> translate<55.372000,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.674000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.853000,-1.535000,41.835000>}
box{<0,0,-0.152400><0.253144,0.035000,0.152400> rotate<0,-44.997030,0> translate<58.674000,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.853000,-1.535000,43.957000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.853000,-1.535000,41.835000>}
box{<0,0,-0.152400><2.122000,0.035000,0.152400> rotate<0,-90.000000,0> translate<58.853000,-1.535000,41.835000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.912000,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.055000,-1.535000,39.497000>}
box{<0,0,-0.152400><1.616446,0.035000,0.152400> rotate<0,-44.997030,0> translate<57.912000,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.276000,-1.535000,24.257000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.309000,-1.535000,24.257000>}
box{<0,0,-0.152400><10.033000,0.035000,0.152400> rotate<0,0.000000,0> translate<49.276000,-1.535000,24.257000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.436000,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.436000,-1.535000,29.591000>}
box{<0,0,-0.152400><6.985000,0.035000,0.152400> rotate<0,-90.000000,0> translate<59.436000,-1.535000,29.591000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.674000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.563000,-1.535000,41.656000>}
box{<0,0,-0.152400><0.889000,0.035000,0.152400> rotate<0,0.000000,0> translate<58.674000,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.912000,-1.535000,25.019000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690000,-1.535000,26.797000>}
box{<0,0,-0.304800><2.514472,0.035000,0.304800> rotate<0,-44.997030,0> translate<57.912000,-1.535000,25.019000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.293000,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.690000,-1.535000,26.797000>}
box{<0,0,-0.152400><1.975656,0.035000,0.152400> rotate<0,44.997030,0> translate<58.293000,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.769000,-1.535000,59.563000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.817000,-1.535000,59.563000>}
box{<0,0,-0.304800><3.048000,0.035000,0.304800> rotate<0,0.000000,0> translate<56.769000,-1.535000,59.563000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.817000,-1.535000,60.452000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.817000,-1.535000,59.563000>}
box{<0,0,-0.304800><0.889000,0.035000,0.304800> rotate<0,-90.000000,0> translate<59.817000,-1.535000,59.563000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.817000,0.000000,60.452000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.944000,0.000000,60.579000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,-44.997030,0> translate<59.817000,0.000000,60.452000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.944000,0.000000,68.961000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.944000,0.000000,60.579000>}
box{<0,0,-0.304800><8.382000,0.035000,0.304800> rotate<0,-90.000000,0> translate<59.944000,0.000000,60.579000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.436000,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.274200,-1.535000,37.414200>}
box{<0,0,-0.152400><1.185394,0.035000,0.152400> rotate<0,-44.997030,0> translate<59.436000,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.563000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.353000,-1.535000,42.446000>}
box{<0,0,-0.152400><1.117229,0.035000,0.152400> rotate<0,-44.997030,0> translate<59.563000,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.353000,-1.535000,43.957000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.353000,-1.535000,42.446000>}
box{<0,0,-0.152400><1.511000,0.035000,0.152400> rotate<0,-90.000000,0> translate<60.353000,-1.535000,42.446000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.213000,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960000,-1.535000,20.828000>}
box{<0,0,-0.304800><7.747000,0.035000,0.304800> rotate<0,0.000000,0> translate<53.213000,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960000,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.087000,-1.535000,20.701000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,44.997030,0> translate<60.960000,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.274200,-1.535000,37.414200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.239400,-1.535000,37.414200>}
box{<0,0,-0.152400><0.965200,0.035000,0.152400> rotate<0,0.000000,0> translate<60.274200,-1.535000,37.414200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.239400,-1.535000,37.414200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.315600,-1.535000,37.338000>}
box{<0,0,-0.152400><0.107763,0.035000,0.152400> rotate<0,44.997030,0> translate<61.239400,-1.535000,37.414200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.309000,-1.535000,24.257000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.341000,-1.535000,26.289000>}
box{<0,0,-0.152400><2.873682,0.035000,0.152400> rotate<0,-44.997030,0> translate<59.309000,-1.535000,24.257000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.341000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.341000,-1.535000,26.289000>}
box{<0,0,-0.152400><1.397000,0.035000,0.152400> rotate<0,-90.000000,0> translate<61.341000,-1.535000,26.289000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.436000,-1.535000,29.591000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.341000,-1.535000,27.686000>}
box{<0,0,-0.152400><2.694077,0.035000,0.152400> rotate<0,44.997030,0> translate<59.436000,-1.535000,29.591000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.817000,-1.535000,59.563000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.468000,-1.535000,59.563000>}
box{<0,0,-0.304800><1.651000,0.035000,0.304800> rotate<0,0.000000,0> translate<59.817000,-1.535000,59.563000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.468000,-1.535000,59.563000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.722000,-1.535000,59.817000>}
box{<0,0,-0.304800><0.359210,0.035000,0.304800> rotate<0,-44.997030,0> translate<61.468000,-1.535000,59.563000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.315600,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.992000,-1.535000,37.338000>}
box{<0,0,-0.152400><1.676400,0.035000,0.152400> rotate<0,0.000000,0> translate<61.315600,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.150000,-1.535000,40.513000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.373000,-1.535000,40.513000>}
box{<0,0,-0.152400><6.223000,0.035000,0.152400> rotate<0,0.000000,0> translate<57.150000,-1.535000,40.513000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.055000,-1.535000,39.497000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.754000,-1.535000,39.497000>}
box{<0,0,-0.152400><4.699000,0.035000,0.152400> rotate<0,0.000000,0> translate<59.055000,-1.535000,39.497000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.853000,-1.535000,55.357000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.853000,-1.535000,59.408000>}
box{<0,0,-0.152400><4.051000,0.035000,0.152400> rotate<0,90.000000,0> translate<63.853000,-1.535000,59.408000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960000,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.008000,-1.535000,23.368000>}
box{<0,0,-0.304800><3.048000,0.035000,0.304800> rotate<0,0.000000,0> translate<60.960000,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.213000,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.135000,-1.535000,18.288000>}
box{<0,0,-0.304800><10.922000,0.035000,0.304800> rotate<0,0.000000,0> translate<53.213000,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.135000,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.262000,-1.535000,18.161000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,44.997030,0> translate<64.135000,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.262000,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.262000,-1.535000,18.161000>}
box{<0,0,-0.304800><2.159000,0.035000,0.304800> rotate<0,90.000000,0> translate<64.262000,-1.535000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.008000,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.262000,-1.535000,23.622000>}
box{<0,0,-0.304800><0.359210,0.035000,0.304800> rotate<0,-44.997030,0> translate<64.008000,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.853000,-1.535000,59.408000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.262000,-1.535000,59.817000>}
box{<0,0,-0.152400><0.578413,0.035000,0.152400> rotate<0,-44.997030,0> translate<63.853000,-1.535000,59.408000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.373000,-1.535000,40.513000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.353000,-1.535000,41.493000>}
box{<0,0,-0.152400><1.385929,0.035000,0.152400> rotate<0,-44.997030,0> translate<63.373000,-1.535000,40.513000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.353000,-1.535000,43.957000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.353000,-1.535000,41.493000>}
box{<0,0,-0.152400><2.464000,0.035000,0.152400> rotate<0,-90.000000,0> translate<64.353000,-1.535000,41.493000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.547000,-1.535000,53.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.516000,-1.535000,53.407000>}
box{<0,0,-0.152400><5.969000,0.035000,0.152400> rotate<0,0.000000,0> translate<58.547000,-1.535000,53.407000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.754000,-1.535000,39.497000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.853000,-1.535000,40.596000>}
box{<0,0,-0.152400><1.554221,0.035000,0.152400> rotate<0,-44.997030,0> translate<63.754000,-1.535000,39.497000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.853000,-1.535000,43.957000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.853000,-1.535000,40.596000>}
box{<0,0,-0.152400><3.361000,0.035000,0.152400> rotate<0,-90.000000,0> translate<64.853000,-1.535000,40.596000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.853000,-1.535000,43.957000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.853000,-1.535000,47.244000>}
box{<0,0,-0.152400><3.287000,0.035000,0.152400> rotate<0,90.000000,0> translate<64.853000,-1.535000,47.244000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.853000,-1.535000,47.244000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.853000,-1.535000,50.546000>}
box{<0,0,-0.152400><3.302000,0.035000,0.152400> rotate<0,90.000000,0> translate<64.853000,-1.535000,50.546000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.516000,-1.535000,53.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.853000,-1.535000,53.070000>}
box{<0,0,-0.152400><0.476590,0.035000,0.152400> rotate<0,44.997030,0> translate<64.516000,-1.535000,53.407000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.853000,-1.535000,50.546000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.853000,-1.535000,53.070000>}
box{<0,0,-0.152400><2.524000,0.035000,0.152400> rotate<0,90.000000,0> translate<64.853000,-1.535000,53.070000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.853000,-1.535000,50.546000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.992000,-1.535000,50.407000>}
box{<0,0,-0.152400><0.196576,0.035000,0.152400> rotate<0,44.997030,0> translate<64.853000,-1.535000,50.546000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.853000,-1.535000,47.244000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.016000,-1.535000,47.407000>}
box{<0,0,-0.152400><0.230517,0.035000,0.152400> rotate<0,-44.997030,0> translate<64.853000,-1.535000,47.244000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.992000,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.353000,-1.535000,39.699000>}
box{<0,0,-0.152400><3.338958,0.035000,0.152400> rotate<0,-44.997030,0> translate<62.992000,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.353000,-1.535000,43.957000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.353000,-1.535000,39.699000>}
box{<0,0,-0.152400><4.258000,0.035000,0.152400> rotate<0,-90.000000,0> translate<65.353000,-1.535000,39.699000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.353000,-1.535000,43.957000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.353000,-1.535000,44.652000>}
box{<0,0,-0.152400><0.695000,0.035000,0.152400> rotate<0,90.000000,0> translate<65.353000,-1.535000,44.652000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.353000,-1.535000,55.357000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.353000,-1.535000,57.479000>}
box{<0,0,-0.152400><2.122000,0.035000,0.152400> rotate<0,90.000000,0> translate<65.353000,-1.535000,57.479000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.760600,-1.535000,37.414200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.760600,-1.535000,36.601400>}
box{<0,0,-0.304800><0.812800,0.035000,0.304800> rotate<0,-90.000000,0> translate<65.760600,-1.535000,36.601400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.760600,-1.535000,37.414200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.853000,-1.535000,37.506600>}
box{<0,0,-0.152400><0.130673,0.035000,0.152400> rotate<0,-44.997030,0> translate<65.760600,-1.535000,37.414200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.853000,-1.535000,43.957000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.853000,-1.535000,37.506600>}
box{<0,0,-0.152400><6.450400,0.035000,0.152400> rotate<0,-90.000000,0> translate<65.853000,-1.535000,37.506600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.853000,-1.535000,55.357000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.853000,-1.535000,53.721000>}
box{<0,0,-0.152400><1.636000,0.035000,0.152400> rotate<0,-90.000000,0> translate<65.853000,-1.535000,53.721000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.353000,-1.535000,44.652000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.913000,-1.535000,45.212000>}
box{<0,0,-0.152400><0.791960,0.035000,0.152400> rotate<0,-44.997030,0> translate<65.353000,-1.535000,44.652000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.516000,-1.535000,53.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.167000,-1.535000,53.407000>}
box{<0,0,-0.152400><1.651000,0.035000,0.152400> rotate<0,0.000000,0> translate<64.516000,-1.535000,53.407000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.853000,-1.535000,53.721000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.167000,-1.535000,53.407000>}
box{<0,0,-0.152400><0.444063,0.035000,0.152400> rotate<0,44.997030,0> translate<65.853000,-1.535000,53.721000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.802000,-1.535000,59.817000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.802000,-1.535000,65.024000>}
box{<0,0,-0.304800><5.207000,0.035000,0.304800> rotate<0,90.000000,0> translate<66.802000,-1.535000,65.024000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.353000,-1.535000,57.479000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.929000,-1.535000,59.055000>}
box{<0,0,-0.152400><2.228801,0.035000,0.152400> rotate<0,-44.997030,0> translate<65.353000,-1.535000,57.479000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.802000,-1.535000,59.817000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.929000,-1.535000,59.690000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,44.997030,0> translate<66.802000,-1.535000,59.817000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.929000,-1.535000,59.055000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.929000,-1.535000,59.690000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,90.000000,0> translate<66.929000,-1.535000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.929000,-1.535000,59.055000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.056000,-1.535000,59.182000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,-44.997030,0> translate<66.929000,-1.535000,59.055000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.056000,-1.535000,59.182000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.056000,-1.535000,65.024000>}
box{<0,0,-0.304800><5.842000,0.035000,0.304800> rotate<0,90.000000,0> translate<67.056000,-1.535000,65.024000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.310000,-1.535000,26.797000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.691000,-1.535000,27.178000>}
box{<0,0,-0.304800><0.538815,0.035000,0.304800> rotate<0,-44.997030,0> translate<67.310000,-1.535000,26.797000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.691000,-1.535000,34.671000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.691000,-1.535000,27.178000>}
box{<0,0,-0.304800><7.493000,0.035000,0.304800> rotate<0,-90.000000,0> translate<67.691000,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.760600,-1.535000,36.601400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.691000,-1.535000,34.671000>}
box{<0,0,-0.304800><2.729998,0.035000,0.304800> rotate<0,44.997030,0> translate<65.760600,-1.535000,36.601400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.016000,-1.535000,47.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.803000,-1.535000,47.407000>}
box{<0,0,-0.152400><2.787000,0.035000,0.152400> rotate<0,0.000000,0> translate<65.016000,-1.535000,47.407000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.992000,-1.535000,50.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.803000,-1.535000,50.407000>}
box{<0,0,-0.152400><2.811000,0.035000,0.152400> rotate<0,0.000000,0> translate<64.992000,-1.535000,50.407000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.167000,-1.535000,53.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.803000,-1.535000,53.407000>}
box{<0,0,-0.152400><1.636000,0.035000,0.152400> rotate<0,0.000000,0> translate<66.167000,-1.535000,53.407000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.163000,-1.535000,66.167000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.945000,-1.535000,66.167000>}
box{<0,0,-0.304800><33.782000,0.035000,0.304800> rotate<0,0.000000,0> translate<34.163000,-1.535000,66.167000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.802000,-1.535000,65.024000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.945000,-1.535000,66.167000>}
box{<0,0,-0.304800><1.616446,0.035000,0.304800> rotate<0,-44.997030,0> translate<66.802000,-1.535000,65.024000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.056000,-1.535000,65.024000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.199000,-1.535000,66.167000>}
box{<0,0,-0.304800><1.616446,0.035000,0.304800> rotate<0,-44.997030,0> translate<67.056000,-1.535000,65.024000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.945000,-1.535000,66.167000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.199000,-1.535000,66.167000>}
box{<0,0,-0.304800><0.254000,0.035000,0.304800> rotate<0,0.000000,0> translate<67.945000,-1.535000,66.167000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.803000,-1.535000,52.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.536000,-1.535000,52.407000>}
box{<0,0,-0.152400><0.733000,0.035000,0.152400> rotate<0,0.000000,0> translate<67.803000,-1.535000,52.407000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.834000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.834000,-1.535000,21.463000>}
box{<0,0,-0.304800><10.287000,0.035000,0.304800> rotate<0,-90.000000,0> translate<68.834000,-1.535000,21.463000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.803000,-1.535000,51.907000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.052000,-1.535000,51.907000>}
box{<0,0,-0.152400><1.249000,0.035000,0.152400> rotate<0,0.000000,0> translate<67.803000,-1.535000,51.907000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.803000,-1.535000,47.907000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.060000,-1.535000,47.907000>}
box{<0,0,-0.152400><1.257000,0.035000,0.152400> rotate<0,0.000000,0> translate<67.803000,-1.535000,47.907000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.803000,-1.535000,51.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.441000,-1.535000,51.407000>}
box{<0,0,-0.152400><1.638000,0.035000,0.152400> rotate<0,0.000000,0> translate<67.803000,-1.535000,51.407000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.913000,-1.535000,45.212000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.469000,-1.535000,45.212000>}
box{<0,0,-0.152400><3.556000,0.035000,0.152400> rotate<0,0.000000,0> translate<65.913000,-1.535000,45.212000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.060000,-1.535000,47.907000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.469000,-1.535000,47.498000>}
box{<0,0,-0.152400><0.578413,0.035000,0.152400> rotate<0,44.997030,0> translate<69.060000,-1.535000,47.907000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.469000,-1.535000,45.212000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.469000,-1.535000,47.498000>}
box{<0,0,-0.152400><2.286000,0.035000,0.152400> rotate<0,90.000000,0> translate<69.469000,-1.535000,47.498000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.803000,-1.535000,48.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.576000,-1.535000,48.407000>}
box{<0,0,-0.152400><1.773000,0.035000,0.152400> rotate<0,0.000000,0> translate<67.803000,-1.535000,48.407000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.087000,-1.535000,20.701000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.596000,-1.535000,20.701000>}
box{<0,0,-0.304800><8.509000,0.035000,0.304800> rotate<0,0.000000,0> translate<61.087000,-1.535000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.834000,-1.535000,21.463000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.596000,-1.535000,20.701000>}
box{<0,0,-0.304800><1.077631,0.035000,0.304800> rotate<0,44.997030,0> translate<68.834000,-1.535000,21.463000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.596000,-1.535000,61.849000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.596000,-1.535000,63.500000>}
box{<0,0,-0.152400><1.651000,0.035000,0.152400> rotate<0,90.000000,0> translate<69.596000,-1.535000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.803000,-1.535000,48.907000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.965000,-1.535000,48.907000>}
box{<0,0,-0.152400><2.162000,0.035000,0.152400> rotate<0,0.000000,0> translate<67.803000,-1.535000,48.907000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.104000,-1.535000,47.879000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.104000,-1.535000,42.037000>}
box{<0,0,-0.152400><5.842000,0.035000,0.152400> rotate<0,-90.000000,0> translate<70.104000,-1.535000,42.037000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.576000,-1.535000,48.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.104000,-1.535000,47.879000>}
box{<0,0,-0.152400><0.746705,0.035000,0.152400> rotate<0,44.997030,0> translate<69.576000,-1.535000,48.407000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.536000,-1.535000,52.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.485000,-1.535000,54.356000>}
box{<0,0,-0.152400><2.756302,0.035000,0.152400> rotate<0,-44.997030,0> translate<68.536000,-1.535000,52.407000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.596000,-1.535000,61.849000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.485000,-1.535000,60.960000>}
box{<0,0,-0.152400><1.257236,0.035000,0.152400> rotate<0,44.997030,0> translate<69.596000,-1.535000,61.849000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.485000,-1.535000,54.356000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.485000,-1.535000,60.960000>}
box{<0,0,-0.152400><6.604000,0.035000,0.152400> rotate<0,90.000000,0> translate<70.485000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.803000,-1.535000,50.907000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.846000,-1.535000,50.907000>}
box{<0,0,-0.152400><3.043000,0.035000,0.152400> rotate<0,0.000000,0> translate<67.803000,-1.535000,50.907000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.596000,-1.535000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.993000,-1.535000,64.897000>}
box{<0,0,-0.152400><1.975656,0.035000,0.152400> rotate<0,-44.997030,0> translate<69.596000,-1.535000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.612000,-1.535000,30.607000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.374000,-1.535000,29.845000>}
box{<0,0,-0.304800><1.077631,0.035000,0.304800> rotate<0,44.997030,0> translate<70.612000,-1.535000,30.607000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.374000,-1.535000,24.511000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.374000,-1.535000,29.845000>}
box{<0,0,-0.304800><5.334000,0.035000,0.304800> rotate<0,90.000000,0> translate<71.374000,-1.535000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.834000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.501000,-1.535000,34.417000>}
box{<0,0,-0.304800><3.771708,0.035000,0.304800> rotate<0,-44.997030,0> translate<68.834000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.052000,-1.535000,51.907000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.501000,-1.535000,54.356000>}
box{<0,0,-0.152400><3.463409,0.035000,0.152400> rotate<0,-44.997030,0> translate<69.052000,-1.535000,51.907000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.993000,-1.535000,62.357000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.501000,-1.535000,61.849000>}
box{<0,0,-0.152400><0.718420,0.035000,0.152400> rotate<0,44.997030,0> translate<70.993000,-1.535000,62.357000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.501000,-1.535000,54.356000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.501000,-1.535000,61.849000>}
box{<0,0,-0.152400><7.493000,0.035000,0.152400> rotate<0,90.000000,0> translate<71.501000,-1.535000,61.849000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.104000,-1.535000,42.037000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.755000,-1.535000,40.386000>}
box{<0,0,-0.152400><2.334867,0.035000,0.152400> rotate<0,44.997030,0> translate<70.104000,-1.535000,42.037000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.501000,-1.535000,34.417000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.009000,-1.535000,34.417000>}
box{<0,0,-0.304800><0.508000,0.035000,0.304800> rotate<0,0.000000,0> translate<71.501000,-1.535000,34.417000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.009000,-1.535000,34.417000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.009000,-1.535000,36.195000>}
box{<0,0,-0.304800><1.778000,0.035000,0.304800> rotate<0,90.000000,0> translate<72.009000,-1.535000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.009000,-1.535000,46.863000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.009000,-1.535000,42.037000>}
box{<0,0,-0.152400><4.826000,0.035000,0.152400> rotate<0,-90.000000,0> translate<72.009000,-1.535000,42.037000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.965000,-1.535000,48.907000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.009000,-1.535000,46.863000>}
box{<0,0,-0.152400><2.890653,0.035000,0.152400> rotate<0,44.997030,0> translate<69.965000,-1.535000,48.907000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.596000,-1.535000,20.701000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.136000,-1.535000,20.701000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<69.596000,-1.535000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.441000,-1.535000,51.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.390000,-1.535000,54.356000>}
box{<0,0,-0.152400><4.170516,0.035000,0.152400> rotate<0,-44.997030,0> translate<69.441000,-1.535000,51.407000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.390000,-1.535000,54.356000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.390000,-1.535000,57.277000>}
box{<0,0,-0.152400><2.921000,0.035000,0.152400> rotate<0,90.000000,0> translate<72.390000,-1.535000,57.277000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.009000,-1.535000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.898000,-1.535000,37.084000>}
box{<0,0,-0.304800><1.257236,0.035000,0.304800> rotate<0,-44.997030,0> translate<72.009000,-1.535000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.612000,-1.535000,30.607000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.533000,-1.535000,30.607000>}
box{<0,0,-0.304800><2.921000,0.035000,0.304800> rotate<0,0.000000,0> translate<70.612000,-1.535000,30.607000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.846000,-1.535000,50.907000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.533000,-1.535000,53.594000>}
box{<0,0,-0.152400><3.799992,0.035000,0.152400> rotate<0,-44.997030,0> translate<70.846000,-1.535000,50.907000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.390000,-1.535000,57.277000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.533000,-1.535000,58.420000>}
box{<0,0,-0.152400><1.616446,0.035000,0.152400> rotate<0,-44.997030,0> translate<72.390000,-1.535000,57.277000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.533000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.533000,-1.535000,60.198000>}
box{<0,0,-0.304800><1.778000,0.035000,0.304800> rotate<0,90.000000,0> translate<73.533000,-1.535000,60.198000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.993000,-1.535000,62.357000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.533000,-1.535000,62.357000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<70.993000,-1.535000,62.357000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.993000,-1.535000,64.897000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.533000,-1.535000,64.897000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<70.993000,-1.535000,64.897000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.136000,-1.535000,20.701000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.914000,-1.535000,22.479000>}
box{<0,0,-0.304800><2.514472,0.035000,0.304800> rotate<0,-44.997030,0> translate<72.136000,-1.535000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.914000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.914000,-1.535000,22.479000>}
box{<0,0,-0.304800><0.381000,0.035000,0.304800> rotate<0,-90.000000,0> translate<73.914000,-1.535000,22.479000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.914000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.914000,-1.535000,24.511000>}
box{<0,0,-0.304800><1.651000,0.035000,0.304800> rotate<0,90.000000,0> translate<73.914000,-1.535000,24.511000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.533000,-1.535000,60.198000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.914000,-1.535000,60.579000>}
box{<0,0,-0.304800><0.538815,0.035000,0.304800> rotate<0,-44.997030,0> translate<73.533000,-1.535000,60.198000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.803000,-1.535000,49.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.418000,-1.535000,49.407000>}
box{<0,0,-0.152400><6.615000,0.035000,0.152400> rotate<0,0.000000,0> translate<67.803000,-1.535000,49.407000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.533000,-1.535000,30.607000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.422000,-1.535000,31.496000>}
box{<0,0,-0.304800><1.257236,0.035000,0.304800> rotate<0,-44.997030,0> translate<73.533000,-1.535000,30.607000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.422000,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.422000,-1.535000,34.290000>}
box{<0,0,-0.304800><2.794000,0.035000,0.304800> rotate<0,90.000000,0> translate<74.422000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.422000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.549000,-1.535000,34.417000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,-44.997030,0> translate<74.422000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.199000,-1.535000,66.167000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.803000,-1.535000,66.167000>}
box{<0,0,-0.304800><6.604000,0.035000,0.304800> rotate<0,0.000000,0> translate<68.199000,-1.535000,66.167000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.914000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.057000,-1.535000,21.717000>}
box{<0,0,-0.304800><1.616446,0.035000,0.304800> rotate<0,44.997030,0> translate<73.914000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.803000,-1.535000,49.907000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.188000,-1.535000,49.907000>}
box{<0,0,-0.152400><7.385000,0.035000,0.152400> rotate<0,0.000000,0> translate<67.803000,-1.535000,49.907000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.073000,-1.535000,64.897000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.073000,-1.535000,62.357000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,-90.000000,0> translate<76.073000,-1.535000,62.357000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.803000,-1.535000,66.167000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.073000,-1.535000,64.897000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<74.803000,-1.535000,66.167000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.454000,-1.535000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.454000,-1.535000,24.511000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,90.000000,0> translate<76.454000,-1.535000,24.511000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.454000,-1.535000,24.511000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.454000,-1.535000,28.829000>}
box{<0,0,-0.304800><4.318000,0.035000,0.304800> rotate<0,90.000000,0> translate<76.454000,-1.535000,28.829000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.549000,-1.535000,42.037000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.835000,-1.535000,42.037000>}
box{<0,0,-0.304800><2.286000,0.035000,0.304800> rotate<0,0.000000,0> translate<74.549000,-1.535000,42.037000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.914000,-1.535000,60.579000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.835000,-1.535000,60.579000>}
box{<0,0,-0.304800><2.921000,0.035000,0.304800> rotate<0,0.000000,0> translate<73.914000,-1.535000,60.579000> }
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<76.962000,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<76.962000,-1.535000,33.782000>}
box{<0,0,0.000000><0.254000,0.035000,0.000000> rotate<0,-90.000000,0> translate<76.962000,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.962000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.962000,-1.535000,34.036000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,-90.000000,0> translate<76.962000,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.835000,-1.535000,42.037000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.962000,-1.535000,42.164000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,-44.997030,0> translate<76.835000,-1.535000,42.037000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.533000,-1.535000,53.594000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.216000,-1.535000,53.594000>}
box{<0,0,-0.304800><3.683000,0.035000,0.304800> rotate<0,0.000000,0> translate<73.533000,-1.535000,53.594000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.454000,-1.535000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.343000,-1.535000,22.606000>}
box{<0,0,-0.203200><1.257236,0.035000,0.203200> rotate<0,44.997030,0> translate<76.454000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.343000,-1.535000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.343000,-1.535000,33.401000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,-90.000000,0> translate<77.343000,-1.535000,33.401000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.962000,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.343000,-1.535000,33.655000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,44.997030,0> translate<76.962000,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.216000,-1.535000,53.594000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.343000,-1.535000,53.467000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,44.997030,0> translate<77.216000,-1.535000,53.594000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.343000,-1.535000,56.007000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.343000,-1.535000,58.547000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<77.343000,-1.535000,58.547000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.835000,-1.535000,60.579000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.343000,-1.535000,61.087000>}
box{<0,0,-0.304800><0.718420,0.035000,0.304800> rotate<0,-44.997030,0> translate<76.835000,-1.535000,60.579000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.073000,-1.535000,64.897000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.597000,-1.535000,64.897000>}
box{<0,0,-0.304800><1.524000,0.035000,0.304800> rotate<0,0.000000,0> translate<76.073000,-1.535000,64.897000> }
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<76.962000,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<78.105000,-1.535000,32.639000>}
box{<0,0,0.000000><1.616446,0.035000,0.000000> rotate<0,44.997030,0> translate<76.962000,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.343000,-1.535000,33.401000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.105000,-1.535000,32.639000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<77.343000,-1.535000,33.401000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.343000,-1.535000,58.547000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.105000,-1.535000,58.547000>}
box{<0,0,-0.304800><0.762000,0.035000,0.304800> rotate<0,0.000000,0> translate<77.343000,-1.535000,58.547000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.454000,-1.535000,28.829000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.232000,-1.535000,30.607000>}
box{<0,0,-0.304800><2.514472,0.035000,0.304800> rotate<0,-44.997030,0> translate<76.454000,-1.535000,28.829000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.944000,-1.535000,68.961000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.613000,-1.535000,68.961000>}
box{<0,0,-0.304800><18.669000,0.035000,0.304800> rotate<0,0.000000,0> translate<59.944000,-1.535000,68.961000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.105000,-1.535000,28.321000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.740000,-1.535000,28.321000>}
box{<0,0,-0.304800><0.635000,0.035000,0.304800> rotate<0,0.000000,0> translate<78.105000,-1.535000,28.321000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.105000,-1.535000,32.639000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.994000,-1.535000,31.750000>}
box{<0,0,-0.203200><1.257236,0.035000,0.203200> rotate<0,44.997030,0> translate<78.105000,-1.535000,32.639000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.105000,-1.535000,58.547000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.994000,-1.535000,59.436000>}
box{<0,0,-0.304800><1.257236,0.035000,0.304800> rotate<0,-44.997030,0> translate<78.105000,-1.535000,58.547000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.597000,-1.535000,64.897000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.994000,-1.535000,63.500000>}
box{<0,0,-0.304800><1.975656,0.035000,0.304800> rotate<0,44.997030,0> translate<77.597000,-1.535000,64.897000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.994000,-1.535000,59.436000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.994000,-1.535000,63.500000>}
box{<0,0,-0.304800><4.064000,0.035000,0.304800> rotate<0,90.000000,0> translate<78.994000,-1.535000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.898000,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.375000,-1.535000,37.084000>}
box{<0,0,-0.304800><6.477000,0.035000,0.304800> rotate<0,0.000000,0> translate<72.898000,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.375000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.375000,-1.535000,37.084000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<79.375000,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.375000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.375000,-1.535000,42.164000>}
box{<0,0,-0.152400><2.286000,0.035000,0.152400> rotate<0,-90.000000,0> translate<79.375000,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.418000,-1.535000,49.407000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.375000,-1.535000,44.450000>}
box{<0,0,-0.152400><7.010257,0.035000,0.152400> rotate<0,44.997030,0> translate<74.418000,-1.535000,49.407000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.740000,-1.535000,28.321000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.502000,-1.535000,27.559000>}
box{<0,0,-0.304800><1.077631,0.035000,0.304800> rotate<0,44.997030,0> translate<78.740000,-1.535000,28.321000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.502000,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.502000,-1.535000,27.559000>}
box{<0,0,-0.304800><2.921000,0.035000,0.304800> rotate<0,90.000000,0> translate<79.502000,-1.535000,27.559000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.994000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<80.137000,-1.535000,31.750000>}
box{<0,0,-0.203200><1.143000,0.035000,0.203200> rotate<0,0.000000,0> translate<78.994000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.188000,-1.535000,49.907000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.137000,-1.535000,44.958000>}
box{<0,0,-0.152400><6.998943,0.035000,0.152400> rotate<0,44.997030,0> translate<75.188000,-1.535000,49.907000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.343000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<80.391000,-1.535000,22.606000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,0.000000,0> translate<77.343000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<80.137000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<80.645000,-1.535000,32.258000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<80.137000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<80.645000,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<80.645000,-1.535000,35.052000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,90.000000,0> translate<80.645000,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<80.391000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<80.772000,-1.535000,22.987000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,-44.997030,0> translate<80.391000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<80.772000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<80.772000,-1.535000,22.987000>}
box{<0,0,-0.203200><3.683000,0.035000,0.203200> rotate<0,-90.000000,0> translate<80.772000,-1.535000,22.987000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.740000,-1.535000,28.321000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.899000,-1.535000,28.321000>}
box{<0,0,-0.304800><2.159000,0.035000,0.304800> rotate<0,0.000000,0> translate<78.740000,-1.535000,28.321000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<80.772000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<81.280000,-1.535000,27.178000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<80.772000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.613000,-1.535000,68.961000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.280000,-1.535000,66.294000>}
box{<0,0,-0.304800><3.771708,0.035000,0.304800> rotate<0,44.997030,0> translate<78.613000,-1.535000,68.961000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.280000,-1.535000,56.515000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.280000,-1.535000,66.294000>}
box{<0,0,-0.304800><9.779000,0.035000,0.304800> rotate<0,90.000000,0> translate<81.280000,-1.535000,66.294000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<80.645000,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<81.661000,-1.535000,36.068000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<80.645000,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.042000,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.042000,-1.535000,22.733000>}
box{<0,0,-0.304800><1.905000,0.035000,0.304800> rotate<0,-90.000000,0> translate<82.042000,-1.535000,22.733000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.042000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.042000,-1.535000,24.638000>}
box{<0,0,-0.304800><2.032000,0.035000,0.304800> rotate<0,90.000000,0> translate<82.042000,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.899000,-1.535000,28.321000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.042000,-1.535000,29.464000>}
box{<0,0,-0.304800><1.616446,0.035000,0.304800> rotate<0,-44.997030,0> translate<80.899000,-1.535000,28.321000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.915000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.042000,-1.535000,34.417000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,44.997030,0> translate<81.915000,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.042000,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.042000,-1.535000,34.417000>}
box{<0,0,-0.304800><4.953000,0.035000,0.304800> rotate<0,90.000000,0> translate<82.042000,-1.535000,34.417000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.296000,-1.535000,47.879000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.296000,-1.535000,49.657000>}
box{<0,0,-0.304800><1.778000,0.035000,0.304800> rotate<0,90.000000,0> translate<82.296000,-1.535000,49.657000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.280000,-1.535000,56.515000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.296000,-1.535000,55.499000>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,44.997030,0> translate<81.280000,-1.535000,56.515000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.296000,-1.535000,55.499000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.931000,-1.535000,54.864000>}
box{<0,0,-0.304800><0.898026,0.035000,0.304800> rotate<0,44.997030,0> translate<82.296000,-1.535000,55.499000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.042000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.058000,-1.535000,21.590000>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,44.997030,0> translate<82.042000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.057000,-1.535000,21.717000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.058000,-1.535000,21.717000>}
box{<0,0,-0.304800><8.001000,0.035000,0.304800> rotate<0,0.000000,0> translate<75.057000,-1.535000,21.717000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.042000,-1.535000,22.733000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.058000,-1.535000,21.717000>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,44.997030,0> translate<82.042000,-1.535000,22.733000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<81.661000,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<83.693000,-1.535000,36.068000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<81.661000,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<81.661000,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<83.820000,-1.535000,36.068000>}
box{<0,0,0.000000><2.159000,0.035000,0.000000> rotate<0,0.000000,0> translate<81.661000,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.915000,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.074000,-1.535000,42.164000>}
box{<0,0,-0.304800><2.159000,0.035000,0.304800> rotate<0,0.000000,0> translate<81.915000,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<84.201000,-1.535000,35.687000>}
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<84.201000,-1.535000,33.274000>}
box{<0,0,0.000000><2.413000,0.035000,0.000000> rotate<0,-90.000000,0> translate<84.201000,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.201000,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.201000,-1.535000,34.417000>}
box{<0,0,-0.203200><1.143000,0.035000,0.203200> rotate<0,90.000000,0> translate<84.201000,-1.535000,34.417000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.201000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.201000,-1.535000,34.417000>}
box{<0,0,-0.203200><1.143000,0.035000,0.203200> rotate<0,-90.000000,0> translate<84.201000,-1.535000,34.417000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<83.693000,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.201000,-1.535000,35.560000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<83.693000,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<83.820000,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<84.201000,-1.535000,35.687000>}
box{<0,0,0.000000><0.538815,0.035000,0.000000> rotate<0,44.997030,0> translate<83.820000,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.074000,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.201000,-1.535000,42.037000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,44.997030,0> translate<84.074000,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<81.280000,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.582000,-1.535000,27.178000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,0.000000,0> translate<81.280000,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.582000,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.582000,-1.535000,27.178000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<84.582000,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.582000,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.709000,-1.535000,24.511000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<84.582000,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.709000,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.709000,-1.535000,24.511000>}
box{<0,0,-0.203200><1.143000,0.035000,0.203200> rotate<0,90.000000,0> translate<84.709000,-1.535000,24.511000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.375000,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.217000,-1.535000,37.084000>}
box{<0,0,-0.304800><5.842000,0.035000,0.304800> rotate<0,0.000000,0> translate<79.375000,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.296000,-1.535000,49.657000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.344000,-1.535000,52.705000>}
box{<0,0,-0.304800><4.310523,0.035000,0.304800> rotate<0,-44.997030,0> translate<82.296000,-1.535000,49.657000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.137000,-1.535000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<85.471000,-1.535000,44.958000>}
box{<0,0,-0.152400><5.334000,0.035000,0.152400> rotate<0,0.000000,0> translate<80.137000,-1.535000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.709000,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<85.598000,-1.535000,22.479000>}
box{<0,0,-0.203200><1.257236,0.035000,0.203200> rotate<0,44.997030,0> translate<84.709000,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.201000,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<85.598000,-1.535000,31.877000>}
box{<0,0,-0.203200><1.975656,0.035000,0.203200> rotate<0,44.997030,0> translate<84.201000,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.582000,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.725000,-1.535000,28.321000>}
box{<0,0,-0.304800><1.616446,0.035000,0.304800> rotate<0,-44.997030,0> translate<84.582000,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.487000,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.487000,-1.535000,34.417000>}
box{<0,0,-0.304800><1.397000,0.035000,0.304800> rotate<0,-90.000000,0> translate<86.487000,-1.535000,34.417000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.217000,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.487000,-1.535000,35.814000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<85.217000,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<86.487000,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<86.487000,-1.535000,42.037000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,-90.000000,0> translate<86.487000,-1.535000,42.037000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<85.471000,-1.535000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<86.487000,-1.535000,43.942000>}
box{<0,0,-0.152400><1.436841,0.035000,0.152400> rotate<0,44.997030,0> translate<85.471000,-1.535000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<85.598000,-1.535000,31.877000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.249000,-1.535000,31.877000>}
box{<0,0,-0.203200><1.651000,0.035000,0.203200> rotate<0,0.000000,0> translate<85.598000,-1.535000,31.877000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.630000,-1.535000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.630000,-1.535000,30.861000>}
box{<0,0,-0.304800><6.096000,0.035000,0.304800> rotate<0,90.000000,0> translate<87.630000,-1.535000,30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.249000,-1.535000,31.877000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.630000,-1.535000,32.258000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,-44.997030,0> translate<87.249000,-1.535000,31.877000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.630000,-1.535000,36.703000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.630000,-1.535000,32.258000>}
box{<0,0,-0.203200><4.445000,0.035000,0.203200> rotate<0,-90.000000,0> translate<87.630000,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.709000,-1.535000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.884000,-1.535000,31.115000>}
box{<0,0,-0.304800><3.175000,0.035000,0.304800> rotate<0,0.000000,0> translate<84.709000,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.630000,-1.535000,30.861000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.884000,-1.535000,31.115000>}
box{<0,0,-0.304800><0.359210,0.035000,0.304800> rotate<0,-44.997030,0> translate<87.630000,-1.535000,30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.630000,-1.535000,36.703000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<88.011000,-1.535000,37.084000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,-44.997030,0> translate<87.630000,-1.535000,36.703000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.135000,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.138000,-1.535000,18.288000>}
box{<0,0,-0.304800><24.003000,0.035000,0.304800> rotate<0,0.000000,0> translate<64.135000,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<85.598000,-1.535000,22.479000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<88.138000,-1.535000,22.479000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<85.598000,-1.535000,22.479000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.344000,-1.535000,50.165000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.138000,-1.535000,47.371000>}
box{<0,0,-0.304800><3.951313,0.035000,0.304800> rotate<0,44.997030,0> translate<85.344000,-1.535000,50.165000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.058000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.773000,-1.535000,21.590000>}
box{<0,0,-0.304800><5.715000,0.035000,0.304800> rotate<0,0.000000,0> translate<83.058000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<88.138000,-1.535000,22.479000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<88.773000,-1.535000,23.114000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<88.138000,-1.535000,22.479000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<88.773000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<88.773000,-1.535000,23.114000>}
box{<0,0,-0.203200><5.842000,0.035000,0.203200> rotate<0,-90.000000,0> translate<88.773000,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.884000,-1.535000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.900000,-1.535000,31.115000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<87.884000,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.900000,-1.535000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.027000,-1.535000,31.242000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,-44.997030,0> translate<88.900000,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.027000,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.027000,-1.535000,34.417000>}
box{<0,0,-0.304800><3.175000,0.035000,0.304800> rotate<0,90.000000,0> translate<89.027000,-1.535000,34.417000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.931000,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.535000,-1.535000,54.864000>}
box{<0,0,-0.304800><6.604000,0.035000,0.304800> rotate<0,0.000000,0> translate<82.931000,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.773000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.170000,-1.535000,22.987000>}
box{<0,0,-0.304800><1.975656,0.035000,0.304800> rotate<0,-44.997030,0> translate<88.773000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.170000,-1.535000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.170000,-1.535000,22.987000>}
box{<0,0,-0.304800><1.778000,0.035000,0.304800> rotate<0,-90.000000,0> translate<90.170000,-1.535000,22.987000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<88.773000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<90.932000,-1.535000,31.115000>}
box{<0,0,-0.203200><3.053287,0.035000,0.203200> rotate<0,-44.997030,0> translate<88.773000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<88.011000,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.059000,-1.535000,37.084000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,0.000000,0> translate<88.011000,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<88.011000,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<91.186000,-1.535000,37.084000>}
box{<0,0,0.000000><3.175000,0.035000,0.000000> rotate<0,0.000000,0> translate<88.011000,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.059000,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.313000,-1.535000,36.830000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<91.059000,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.313000,-1.535000,34.417000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.313000,-1.535000,36.830000>}
box{<0,0,-0.203200><2.413000,0.035000,0.203200> rotate<0,90.000000,0> translate<91.313000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.313000,-1.535000,34.417000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.313000,-1.535000,37.338000>}
box{<0,0,-0.304800><2.921000,0.035000,0.304800> rotate<0,90.000000,0> translate<91.313000,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.027000,-1.535000,42.037000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.313000,-1.535000,42.037000>}
box{<0,0,-0.304800><2.286000,0.035000,0.304800> rotate<0,0.000000,0> translate<89.027000,-1.535000,42.037000> }
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<91.186000,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<91.440000,-1.535000,37.338000>}
box{<0,0,0.000000><0.359210,0.035000,0.000000> rotate<0,-44.997030,0> translate<91.186000,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<91.440000,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<91.440000,-1.535000,37.465000>}
box{<0,0,0.000000><0.127000,0.035000,0.000000> rotate<0,90.000000,0> translate<91.440000,-1.535000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.138000,-1.535000,47.371000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.821000,-1.535000,47.371000>}
box{<0,0,-0.304800><3.683000,0.035000,0.304800> rotate<0,0.000000,0> translate<88.138000,-1.535000,47.371000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.755000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<91.948000,-1.535000,40.386000>}
box{<0,0,-0.152400><20.193000,0.035000,0.152400> rotate<0,0.000000,0> translate<71.755000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<90.932000,-1.535000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.329000,-1.535000,31.115000>}
box{<0,0,-0.203200><1.397000,0.035000,0.203200> rotate<0,0.000000,0> translate<90.932000,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.329000,-1.535000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.710000,-1.535000,30.734000>}
box{<0,0,-0.304800><0.538815,0.035000,0.304800> rotate<0,44.997030,0> translate<92.329000,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.710000,-1.535000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.710000,-1.535000,30.734000>}
box{<0,0,-0.304800><5.969000,0.035000,0.304800> rotate<0,90.000000,0> translate<92.710000,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.138000,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.837000,-1.535000,22.987000>}
box{<0,0,-0.304800><6.645390,0.035000,0.304800> rotate<0,-44.997030,0> translate<88.138000,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.710000,-1.535000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.837000,-1.535000,24.638000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,44.997030,0> translate<92.710000,-1.535000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.837000,-1.535000,22.987000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.837000,-1.535000,24.638000>}
box{<0,0,-0.304800><1.651000,0.035000,0.304800> rotate<0,90.000000,0> translate<92.837000,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<91.948000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<92.964000,-1.535000,41.402000>}
box{<0,0,-0.152400><1.436841,0.035000,0.152400> rotate<0,-44.997030,0> translate<91.948000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.821000,-1.535000,47.371000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.964000,-1.535000,46.228000>}
box{<0,0,-0.304800><1.616446,0.035000,0.304800> rotate<0,44.997030,0> translate<91.821000,-1.535000,47.371000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.964000,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.964000,-1.535000,46.228000>}
box{<0,0,-0.304800><4.826000,0.035000,0.304800> rotate<0,90.000000,0> translate<92.964000,-1.535000,46.228000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.313000,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.488000,-1.535000,40.513000>}
box{<0,0,-0.304800><4.490128,0.035000,0.304800> rotate<0,-44.997030,0> translate<91.313000,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<91.440000,-1.535000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.000000 translate<94.488000,-1.535000,40.513000>}
box{<0,0,0.000000><4.310523,0.035000,0.000000> rotate<0,-44.997030,0> translate<91.440000,-1.535000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.535000,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.488000,-1.535000,49.911000>}
box{<0,0,-0.304800><7.004600,0.035000,0.304800> rotate<0,44.997030,0> translate<89.535000,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.488000,-1.535000,40.513000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.488000,-1.535000,49.911000>}
box{<0,0,-0.304800><9.398000,0.035000,0.304800> rotate<0,90.000000,0> translate<94.488000,-1.535000,49.911000> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,15.034722>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,29.466997>}
box{<0,0,-0.304800><14.432275,0.035000,0.304800> rotate<0,90.000000,0> translate<16.814797,-1.535000,29.466997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,15.034722>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.074869,-1.535000,14.962031>}
box{<0,0,-0.304800><46.260129,0.035000,0.304800> rotate<0,0.090026,0> translate<16.814797,-1.535000,15.034722> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.796897,-1.535000,15.240000>}
box{<0,0,-0.304800><45.982100,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.687200,-1.535000,15.849600>}
box{<0,0,-0.304800><45.872403,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.636713,-1.535000,16.459200>}
box{<0,0,-0.304800><7.821916,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.342203,-1.535000,17.068800>}
box{<0,0,-0.304800><6.527406,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.599472,-1.535000,17.678400>}
box{<0,0,-0.304800><5.784675,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.026553,-1.535000,18.288000>}
box{<0,0,-0.304800><5.211756,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.674600,-1.535000,18.897600>}
box{<0,0,-0.304800><4.859803,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.366525,-1.535000,19.507200>}
box{<0,0,-0.304800><4.551728,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.203181,-1.535000,20.116800>}
box{<0,0,-0.304800><4.388384,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.056600,-1.535000,20.726400>}
box{<0,0,-0.304800><4.241803,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.056600,-1.535000,21.336000>}
box{<0,0,-0.304800><4.241803,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.056600,-1.535000,21.945600>}
box{<0,0,-0.304800><4.241803,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.203188,-1.535000,22.555200>}
box{<0,0,-0.304800><4.388391,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.366528,-1.535000,23.164800>}
box{<0,0,-0.304800><4.551731,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.674606,-1.535000,23.774400>}
box{<0,0,-0.304800><4.859809,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.026556,-1.535000,24.384000>}
box{<0,0,-0.304800><5.211759,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.599475,-1.535000,24.993600>}
box{<0,0,-0.304800><5.784678,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.342213,-1.535000,25.603200>}
box{<0,0,-0.304800><6.527416,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.636728,-1.535000,26.212800>}
box{<0,0,-0.304800><7.821931,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.459391,-1.535000,26.822400>}
box{<0,0,-0.304800><2.644594,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.849791,-1.535000,27.432000>}
box{<0,0,-0.304800><2.034994,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.240191,-1.535000,28.041600>}
box{<0,0,-0.304800><1.425394,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.630591,-1.535000,28.651200>}
box{<0,0,-0.304800><0.815794,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.020991,-1.535000,29.260800>}
box{<0,0,-0.304800><0.206194,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,29.466997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.286413,-1.535000,26.995378>}
box{<0,0,-0.304800><3.495395,0.035000,0.304800> rotate<0,44.997066,0> translate<16.814797,-1.535000,29.466997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,46.987000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,69.408200>}
box{<0,0,-0.304800><22.421200,0.035000,0.304800> rotate<0,90.000000,0> translate<16.814797,-1.535000,69.408200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,46.987000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.822022,-1.535000,47.994225>}
box{<0,0,-0.304800><1.424431,0.035000,0.304800> rotate<0,-44.997030,0> translate<16.814797,-1.535000,46.987000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.376597,-1.535000,47.548800>}
box{<0,0,-0.304800><0.561800,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.890025,-1.535000,48.158400>}
box{<0,0,-0.304800><1.075228,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.330213,-1.535000,48.768000>}
box{<0,0,-0.304800><1.515416,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,49.377600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.712353,-1.535000,49.377600>}
box{<0,0,-0.304800><7.897556,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,49.377600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.071409,-1.535000,49.987200>}
box{<0,0,-0.304800><7.256612,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,50.596800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.743809,-1.535000,50.596800>}
box{<0,0,-0.304800><6.929012,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,50.596800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.589600,-1.535000,51.206400>}
box{<0,0,-0.304800><6.774803,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,51.816000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.589600,-1.535000,51.816000>}
box{<0,0,-0.304800><6.774803,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,51.816000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.743922,-1.535000,52.425600>}
box{<0,0,-0.304800><6.929125,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,53.035200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.071647,-1.535000,53.035200>}
box{<0,0,-0.304800><7.256850,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,53.035200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.713053,-1.535000,53.644800>}
box{<0,0,-0.304800><7.898256,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,54.254400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.942800,-1.535000,54.254400>}
box{<0,0,-0.304800><8.128003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,54.254400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.942800,-1.535000,54.864000>}
box{<0,0,-0.304800><8.128003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,55.473600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.942800,-1.535000,55.473600>}
box{<0,0,-0.304800><8.128003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,55.473600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.942800,-1.535000,56.083200>}
box{<0,0,-0.304800><8.128003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,56.692800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.942800,-1.535000,56.692800>}
box{<0,0,-0.304800><8.128003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,56.692800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,57.302400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.942800,-1.535000,57.302400>}
box{<0,0,-0.304800><8.128003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,57.302400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.942800,-1.535000,57.912000>}
box{<0,0,-0.304800><8.128003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,58.521600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.942800,-1.535000,58.521600>}
box{<0,0,-0.304800><8.128003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,58.521600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,59.131200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.942800,-1.535000,59.131200>}
box{<0,0,-0.304800><8.128003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,59.131200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,59.740800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.942800,-1.535000,59.740800>}
box{<0,0,-0.304800><8.128003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,59.740800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,60.350400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.942800,-1.535000,60.350400>}
box{<0,0,-0.304800><8.128003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,60.350400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.942800,-1.535000,60.960000>}
box{<0,0,-0.304800><8.128003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,61.569600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.505475,-1.535000,61.569600>}
box{<0,0,-0.304800><7.690678,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,61.569600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,62.179200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.983653,-1.535000,62.179200>}
box{<0,0,-0.304800><7.168856,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,62.179200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,62.788800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.703084,-1.535000,62.788800>}
box{<0,0,-0.304800><6.888287,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,62.788800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,63.398400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.589600,-1.535000,63.398400>}
box{<0,0,-0.304800><6.774803,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,63.398400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,64.008000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.621309,-1.535000,64.008000>}
box{<0,0,-0.304800><6.806513,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,64.008000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,64.617600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.807450,-1.535000,64.617600>}
box{<0,0,-0.304800><6.992653,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,64.617600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,65.227200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.200278,-1.535000,65.227200>}
box{<0,0,-0.304800><7.385481,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,65.227200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,65.836800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.976325,-1.535000,65.836800>}
box{<0,0,-0.304800><8.161528,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,65.836800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,66.446400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.718194,-1.535000,66.446400>}
box{<0,0,-0.304800><15.903397,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,66.446400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,67.056000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.327794,-1.535000,67.056000>}
box{<0,0,-0.304800><16.512997,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,67.056000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,67.665600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.839841,-1.535000,67.665600>}
box{<0,0,-0.304800><42.025044,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,67.665600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,68.275200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.476400,-1.535000,68.275200>}
box{<0,0,-0.304800><41.661603,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,68.275200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,68.884800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.476400,-1.535000,68.884800>}
box{<0,0,-0.304800><41.661603,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,68.884800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.814797,-1.535000,69.408200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.476400,-1.535000,69.408200>}
box{<0,0,-0.304800><41.661603,0.035000,0.304800> rotate<0,0.000000,0> translate<16.814797,-1.535000,69.408200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.822022,-1.535000,47.994225>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.009816,-1.535000,48.447603>}
box{<0,0,-0.304800><0.490732,0.035000,0.304800> rotate<0,-67.495720,0> translate<17.822022,-1.535000,47.994225> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.009816,-1.535000,48.447603>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.481394,-1.535000,48.919181>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-44.997030,0> translate<18.009816,-1.535000,48.447603> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.481394,-1.535000,48.919181>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.097541,-1.535000,49.174397>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-22.498454,0> translate<18.481394,-1.535000,48.919181> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,31.239006>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,43.532756>}
box{<0,0,-0.304800><12.293750,0.035000,0.304800> rotate<0,90.000000,0> translate<18.491197,-1.535000,43.532756> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,31.239006>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.825006,-1.535000,28.905197>}
box{<0,0,-0.304800><3.300505,0.035000,0.304800> rotate<0,44.997030,0> translate<18.491197,-1.535000,31.239006> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.409734,-1.535000,31.699200>}
box{<0,0,-0.304800><4.918538,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.132394,-1.535000,32.308800>}
box{<0,0,-0.304800><4.641197,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.969053,-1.535000,32.918400>}
box{<0,0,-0.304800><4.477856,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.961600,-1.535000,33.528000>}
box{<0,0,-0.304800><4.470403,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.037116,-1.535000,34.137600>}
box{<0,0,-0.304800><4.545919,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.204434,-1.535000,34.747200>}
box{<0,0,-0.304800><4.713238,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.556384,-1.535000,35.356800>}
box{<0,0,-0.304800><5.065188,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.096141,-1.535000,35.966400>}
box{<0,0,-0.304800><5.604944,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.006469,-1.535000,36.576000>}
box{<0,0,-0.304800><6.515272,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.970841,-1.535000,37.185600>}
box{<0,0,-0.304800><2.479644,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.247809,-1.535000,37.795200>}
box{<0,0,-0.304800><1.756612,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.116800,-1.535000,38.404800>}
box{<0,0,-0.304800><1.625603,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.116800,-1.535000,39.014400>}
box{<0,0,-0.304800><1.625603,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.116800,-1.535000,39.624000>}
box{<0,0,-0.304800><1.625603,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.116800,-1.535000,40.233600>}
box{<0,0,-0.304800><1.625603,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,40.843200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.289247,-1.535000,40.843200>}
box{<0,0,-0.304800><0.798050,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,40.843200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.844584,-1.535000,41.452800>}
box{<0,0,-0.304800><0.353388,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.694400,-1.535000,42.062400>}
box{<0,0,-0.304800><0.203203,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.760422,-1.535000,42.672000>}
box{<0,0,-0.304800><0.269225,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.973800,-1.535000,43.281600>}
box{<0,0,-0.304800><0.482603,0.035000,0.304800> rotate<0,0.000000,0> translate<18.491197,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.491197,-1.535000,43.532756>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.973800,-1.535000,43.332856>}
box{<0,0,-0.304800><0.522366,0.035000,0.304800> rotate<0,22.498438,0> translate<18.491197,-1.535000,43.532756> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.640603,-1.535000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.842137,-1.535000,31.089600>}
box{<0,0,-0.304800><5.201534,0.035000,0.304800> rotate<0,0.000000,0> translate<18.640603,-1.535000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.694400,-1.535000,41.815384>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.961216,-1.535000,41.171231>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,67.495647,0> translate<18.694400,-1.535000,41.815384> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.694400,-1.535000,42.512613>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.694400,-1.535000,41.815384>}
box{<0,0,-0.304800><0.697228,0.035000,0.304800> rotate<0,-90.000000,0> translate<18.694400,-1.535000,41.815384> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.694400,-1.535000,42.512613>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.961216,-1.535000,43.156766>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,-67.495647,0> translate<18.694400,-1.535000,42.512613> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.961216,-1.535000,41.171231>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.454231,-1.535000,40.678216>}
box{<0,0,-0.304800><0.697229,0.035000,0.304800> rotate<0,44.997030,0> translate<18.961216,-1.535000,41.171231> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.961216,-1.535000,43.156766>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.973800,-1.535000,43.169350>}
box{<0,0,-0.304800><0.017797,0.035000,0.304800> rotate<0,-44.997030,0> translate<18.961216,-1.535000,43.156766> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.973800,-1.535000,43.332856>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.973800,-1.535000,43.169350>}
box{<0,0,-0.304800><0.163506,0.035000,0.304800> rotate<0,-90.000000,0> translate<18.973800,-1.535000,43.169350> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.097541,-1.535000,49.174397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.335844,-1.535000,49.174397>}
box{<0,0,-0.304800><1.238303,0.035000,0.304800> rotate<0,0.000000,0> translate<19.097541,-1.535000,49.174397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.250203,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.566516,-1.535000,30.480000>}
box{<0,0,-0.304800><5.316312,0.035000,0.304800> rotate<0,0.000000,0> translate<19.250203,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.286413,-1.535000,26.995378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.629378,-1.535000,26.652413>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,44.997030,0> translate<19.286413,-1.535000,26.995378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.454231,-1.535000,40.678216>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.098384,-1.535000,40.411400>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,22.498414,0> translate<19.454231,-1.535000,40.678216> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.629378,-1.535000,26.652413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.077484,-1.535000,26.466800>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,22.498604,0> translate<19.629378,-1.535000,26.652413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.859803,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,29.870400>}
box{<0,0,-0.304800><16.258997,0.035000,0.304800> rotate<0,0.000000,0> translate<19.859803,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.077484,-1.535000,26.466800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,26.466800>}
box{<0,0,-0.304800><16.041316,0.035000,0.304800> rotate<0,0.000000,0> translate<20.077484,-1.535000,26.466800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.098384,-1.535000,40.411400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.116800,-1.535000,40.411400>}
box{<0,0,-0.304800><0.018416,0.035000,0.304800> rotate<0,0.000000,0> translate<20.098384,-1.535000,40.411400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.116800,-1.535000,38.111484>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.302413,-1.535000,37.663378>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,67.495456,0> translate<20.116800,-1.535000,38.111484> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.116800,-1.535000,40.411400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.116800,-1.535000,38.111484>}
box{<0,0,-0.304800><2.299916,0.035000,0.304800> rotate<0,-90.000000,0> translate<20.116800,-1.535000,38.111484> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.302413,-1.535000,37.663378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.645378,-1.535000,37.320413>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,44.997030,0> translate<20.302413,-1.535000,37.663378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.335844,-1.535000,49.174397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.458484,-1.535000,49.225197>}
box{<0,0,-0.304800><0.132745,0.035000,0.304800> rotate<0,-22.498750,0> translate<20.335844,-1.535000,49.174397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.458484,-1.535000,49.225197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.976325,-1.535000,49.225197>}
box{<0,0,-0.304800><4.517841,0.035000,0.304800> rotate<0,0.000000,0> translate<20.458484,-1.535000,49.225197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.469403,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,29.260800>}
box{<0,0,-0.304800><15.649397,0.035000,0.304800> rotate<0,0.000000,0> translate<20.469403,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.645378,-1.535000,37.320413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.093484,-1.535000,37.134800>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,22.498604,0> translate<20.645378,-1.535000,37.320413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.825006,-1.535000,28.905197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,28.905197>}
box{<0,0,-0.304800><15.293794,0.035000,0.304800> rotate<0,0.000000,0> translate<20.825006,-1.535000,28.905197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.056600,-1.535000,20.663859>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.404525,-1.535000,19.365388>}
box{<0,0,-0.304800><1.344277,0.035000,0.304800> rotate<0,74.995029,0> translate<21.056600,-1.535000,20.663859> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.056600,-1.535000,22.008138>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.056600,-1.535000,20.663859>}
box{<0,0,-0.304800><1.344278,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.056600,-1.535000,20.663859> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.056600,-1.535000,22.008138>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.404525,-1.535000,23.306609>}
box{<0,0,-0.304800><1.344277,0.035000,0.304800> rotate<0,-74.995029,0> translate<21.056600,-1.535000,22.008138> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.093484,-1.535000,37.134800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.704991,-1.535000,37.134800>}
box{<0,0,-0.304800><7.611506,0.035000,0.304800> rotate<0,0.000000,0> translate<21.093484,-1.535000,37.134800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.404525,-1.535000,19.365388>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.076663,-1.535000,18.201209>}
box{<0,0,-0.304800><1.344277,0.035000,0.304800> rotate<0,59.996079,0> translate<21.404525,-1.535000,19.365388> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.404525,-1.535000,23.306609>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.076663,-1.535000,24.470788>}
box{<0,0,-0.304800><1.344277,0.035000,0.304800> rotate<0,-59.996079,0> translate<21.404525,-1.535000,23.306609> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.655791,-1.535000,43.433756>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.796744,-1.535000,43.292800>}
box{<0,0,-0.304800><0.199340,0.035000,0.304800> rotate<0,44.997665,0> translate<21.655791,-1.535000,43.433756> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.655791,-1.535000,43.433756>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.904603,-1.535000,43.536816>}
box{<0,0,-0.304800><0.269312,0.035000,0.304800> rotate<0,-22.498095,0> translate<21.655791,-1.535000,43.433756> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.796744,-1.535000,43.292800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.026619,-1.535000,43.197584>}
box{<0,0,-0.304800><0.248814,0.035000,0.304800> rotate<0,22.498150,0> translate<21.796744,-1.535000,43.292800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.823784,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.246050,-1.535000,43.281600>}
box{<0,0,-0.304800><7.422266,0.035000,0.304800> rotate<0,0.000000,0> translate<21.823784,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.904603,-1.535000,43.536816>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.376181,-1.535000,44.008394>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.904603,-1.535000,43.536816> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.026619,-1.535000,43.197584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.369584,-1.535000,42.854619>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,44.997030,0> translate<22.026619,-1.535000,43.197584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.055784,-1.535000,46.227997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.376181,-1.535000,45.907603>}
box{<0,0,-0.304800><0.453107,0.035000,0.304800> rotate<0,44.996751,0> translate<22.055784,-1.535000,46.227997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.055784,-1.535000,46.227997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.376181,-1.535000,46.548394>}
box{<0,0,-0.304800><0.453110,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.055784,-1.535000,46.227997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.076663,-1.535000,18.201209>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.027209,-1.535000,17.250663>}
box{<0,0,-0.304800><1.344276,0.035000,0.304800> rotate<0,44.997030,0> translate<22.076663,-1.535000,18.201209> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.076663,-1.535000,24.470788>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.027209,-1.535000,25.421334>}
box{<0,0,-0.304800><1.344276,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.076663,-1.535000,24.470788> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.157388,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.143394,-1.535000,46.329600>}
box{<0,0,-0.304800><8.986006,0.035000,0.304800> rotate<0,0.000000,0> translate<22.157388,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.258987,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.387800,-1.535000,43.891200>}
box{<0,0,-0.304800><7.128813,0.035000,0.304800> rotate<0,0.000000,0> translate<22.258987,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.369584,-1.535000,42.854619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.555197,-1.535000,42.406513>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,67.495456,0> translate<22.369584,-1.535000,42.854619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.376181,-1.535000,44.008394>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.631397,-1.535000,44.624541>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-67.495606,0> translate<22.376181,-1.535000,44.008394> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.376181,-1.535000,45.907603>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.631397,-1.535000,45.291456>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,67.495606,0> translate<22.376181,-1.535000,45.907603> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.376181,-1.535000,46.548394>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.474931,-1.535000,46.786800>}
box{<0,0,-0.304800><0.258049,0.035000,0.304800> rotate<0,-67.495771,0> translate<22.376181,-1.535000,46.548394> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.445228,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.920422,-1.535000,42.672000>}
box{<0,0,-0.304800><6.475194,0.035000,0.304800> rotate<0,0.000000,0> translate<22.445228,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.453891,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.533794,-1.535000,45.720000>}
box{<0,0,-0.304800><8.079903,0.035000,0.304800> rotate<0,0.000000,0> translate<22.453891,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.474931,-1.535000,46.786800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.487413,-1.535000,46.786800>}
box{<0,0,-0.304800><9.012481,0.035000,0.304800> rotate<0,0.000000,0> translate<22.474931,-1.535000,46.786800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.555197,-1.535000,39.573197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.555197,-1.535000,42.406513>}
box{<0,0,-0.304800><2.833316,0.035000,0.304800> rotate<0,90.000000,0> translate<22.555197,-1.535000,42.406513> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.555197,-1.535000,39.573197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.452513,-1.535000,39.573197>}
box{<0,0,-0.304800><6.897316,0.035000,0.304800> rotate<0,0.000000,0> translate<22.555197,-1.535000,39.573197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.555197,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.650897,-1.535000,39.624000>}
box{<0,0,-0.304800><15.095700,0.035000,0.304800> rotate<0,0.000000,0> translate<22.555197,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.555197,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.541200,-1.535000,40.233600>}
box{<0,0,-0.304800><14.986003,0.035000,0.304800> rotate<0,0.000000,0> translate<22.555197,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.555197,-1.535000,40.843200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.449247,-1.535000,40.843200>}
box{<0,0,-0.304800><6.894050,0.035000,0.304800> rotate<0,0.000000,0> translate<22.555197,-1.535000,40.843200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.555197,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.004584,-1.535000,41.452800>}
box{<0,0,-0.304800><6.449388,0.035000,0.304800> rotate<0,0.000000,0> translate<22.555197,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.555197,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.854400,-1.535000,42.062400>}
box{<0,0,-0.304800><6.299203,0.035000,0.304800> rotate<0,0.000000,0> translate<22.555197,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.580141,-1.535000,44.500800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.466206,-1.535000,44.500800>}
box{<0,0,-0.304800><6.886066,0.035000,0.304800> rotate<0,0.000000,0> translate<22.580141,-1.535000,44.500800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.631397,-1.535000,44.624541>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.631397,-1.535000,45.291456>}
box{<0,0,-0.304800><0.666916,0.035000,0.304800> rotate<0,90.000000,0> translate<22.631397,-1.535000,45.291456> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.631397,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.924194,-1.535000,45.110400>}
box{<0,0,-0.304800><7.292797,0.035000,0.304800> rotate<0,0.000000,0> translate<22.631397,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.961600,-1.535000,32.946216>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.197012,-1.535000,32.067650>}
box{<0,0,-0.304800><0.909558,0.035000,0.304800> rotate<0,74.994956,0> translate<22.961600,-1.535000,32.946216> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.961600,-1.535000,33.855781>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.961600,-1.535000,32.946216>}
box{<0,0,-0.304800><0.909566,0.035000,0.304800> rotate<0,-90.000000,0> translate<22.961600,-1.535000,32.946216> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.961600,-1.535000,33.855781>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.197012,-1.535000,34.734347>}
box{<0,0,-0.304800><0.909558,0.035000,0.304800> rotate<0,-74.994956,0> translate<22.961600,-1.535000,33.855781> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.027209,-1.535000,17.250663>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.191388,-1.535000,16.578525>}
box{<0,0,-0.304800><1.344277,0.035000,0.304800> rotate<0,29.997981,0> translate<23.027209,-1.535000,17.250663> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.027209,-1.535000,25.421334>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.191388,-1.535000,26.093472>}
box{<0,0,-0.304800><1.344277,0.035000,0.304800> rotate<0,-29.997981,0> translate<23.027209,-1.535000,25.421334> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.197012,-1.535000,32.067650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.651791,-1.535000,31.279947>}
box{<0,0,-0.304800><0.909560,0.035000,0.304800> rotate<0,59.996176,0> translate<23.197012,-1.535000,32.067650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.197012,-1.535000,34.734347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.651791,-1.535000,35.522050>}
box{<0,0,-0.304800><0.909560,0.035000,0.304800> rotate<0,-59.996176,0> translate<23.197012,-1.535000,34.734347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.589600,-1.535000,51.172334>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.764903,-1.535000,50.518088>}
box{<0,0,-0.304800><0.677326,0.035000,0.304800> rotate<0,74.995197,0> translate<23.589600,-1.535000,51.172334> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.589600,-1.535000,51.849663>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.589600,-1.535000,51.172334>}
box{<0,0,-0.304800><0.677328,0.035000,0.304800> rotate<0,-90.000000,0> translate<23.589600,-1.535000,51.172334> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.589600,-1.535000,51.849663>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.764903,-1.535000,52.503909>}
box{<0,0,-0.304800><0.677326,0.035000,0.304800> rotate<0,-74.995197,0> translate<23.589600,-1.535000,51.849663> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.589600,-1.535000,63.212334>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.764903,-1.535000,62.558088>}
box{<0,0,-0.304800><0.677326,0.035000,0.304800> rotate<0,74.995197,0> translate<23.589600,-1.535000,63.212334> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.589600,-1.535000,63.889663>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.589600,-1.535000,63.212334>}
box{<0,0,-0.304800><0.677328,0.035000,0.304800> rotate<0,-90.000000,0> translate<23.589600,-1.535000,63.212334> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.589600,-1.535000,63.889663>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.764903,-1.535000,64.543909>}
box{<0,0,-0.304800><0.677326,0.035000,0.304800> rotate<0,-74.995197,0> translate<23.589600,-1.535000,63.889663> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.651791,-1.535000,31.279947>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.294947,-1.535000,30.636791>}
box{<0,0,-0.304800><0.909560,0.035000,0.304800> rotate<0,44.997030,0> translate<23.651791,-1.535000,31.279947> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.651791,-1.535000,35.522050>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.294947,-1.535000,36.165206>}
box{<0,0,-0.304800><0.909560,0.035000,0.304800> rotate<0,-44.997030,0> translate<23.651791,-1.535000,35.522050> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.764903,-1.535000,50.518088>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.103566,-1.535000,49.931509>}
box{<0,0,-0.304800><0.677323,0.035000,0.304800> rotate<0,59.995933,0> translate<23.764903,-1.535000,50.518088> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.764903,-1.535000,52.503909>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.103566,-1.535000,53.090488>}
box{<0,0,-0.304800><0.677323,0.035000,0.304800> rotate<0,-59.995933,0> translate<23.764903,-1.535000,52.503909> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.764903,-1.535000,62.558088>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.103566,-1.535000,61.971509>}
box{<0,0,-0.304800><0.677323,0.035000,0.304800> rotate<0,59.995933,0> translate<23.764903,-1.535000,62.558088> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.764903,-1.535000,64.543909>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.103566,-1.535000,65.130488>}
box{<0,0,-0.304800><0.677323,0.035000,0.304800> rotate<0,-59.995933,0> translate<23.764903,-1.535000,64.543909> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.103566,-1.535000,49.931509>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.582509,-1.535000,49.452566>}
box{<0,0,-0.304800><0.677329,0.035000,0.304800> rotate<0,44.997030,0> translate<24.103566,-1.535000,49.931509> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.103566,-1.535000,53.090488>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.582509,-1.535000,53.569431>}
box{<0,0,-0.304800><0.677329,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.103566,-1.535000,53.090488> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.103566,-1.535000,61.971509>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.582509,-1.535000,61.492566>}
box{<0,0,-0.304800><0.677329,0.035000,0.304800> rotate<0,44.997030,0> translate<24.103566,-1.535000,61.971509> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.103566,-1.535000,65.130488>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.582509,-1.535000,65.609431>}
box{<0,0,-0.304800><0.677329,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.103566,-1.535000,65.130488> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.191388,-1.535000,16.578525>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.489859,-1.535000,16.230600>}
box{<0,0,-0.304800><1.344277,0.035000,0.304800> rotate<0,14.999031,0> translate<24.191388,-1.535000,16.578525> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.191388,-1.535000,26.093472>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.489859,-1.535000,26.441397>}
box{<0,0,-0.304800><1.344277,0.035000,0.304800> rotate<0,-14.999031,0> translate<24.191388,-1.535000,26.093472> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.294947,-1.535000,30.636791>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.082650,-1.535000,30.182013>}
box{<0,0,-0.304800><0.909560,0.035000,0.304800> rotate<0,29.997884,0> translate<24.294947,-1.535000,30.636791> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.294947,-1.535000,36.165206>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.082650,-1.535000,36.619984>}
box{<0,0,-0.304800><0.909560,0.035000,0.304800> rotate<0,-29.997884,0> translate<24.294947,-1.535000,36.165206> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.582509,-1.535000,49.452566>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.976325,-1.535000,49.225197>}
box{<0,0,-0.304800><0.454739,0.035000,0.304800> rotate<0,29.997932,0> translate<24.582509,-1.535000,49.452566> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.582509,-1.535000,53.569431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.942800,-1.535000,53.777444>}
box{<0,0,-0.304800><0.416027,0.035000,0.304800> rotate<0,-29.997854,0> translate<24.582509,-1.535000,53.569431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.582509,-1.535000,61.492566>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.942800,-1.535000,61.284553>}
box{<0,0,-0.304800><0.416027,0.035000,0.304800> rotate<0,29.997854,0> translate<24.582509,-1.535000,61.492566> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.582509,-1.535000,65.609431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.169087,-1.535000,65.948094>}
box{<0,0,-0.304800><0.677323,0.035000,0.304800> rotate<0,-29.998127,0> translate<24.582509,-1.535000,65.609431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.942800,-1.535000,61.284553>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.942800,-1.535000,53.777444>}
box{<0,0,-0.304800><7.507109,0.035000,0.304800> rotate<0,-90.000000,0> translate<24.942800,-1.535000,53.777444> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.082650,-1.535000,30.182013>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.961216,-1.535000,29.946600>}
box{<0,0,-0.304800><0.909558,0.035000,0.304800> rotate<0,14.999104,0> translate<25.082650,-1.535000,30.182013> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.082650,-1.535000,36.619984>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.961216,-1.535000,36.855397>}
box{<0,0,-0.304800><0.909558,0.035000,0.304800> rotate<0,-14.999104,0> translate<25.082650,-1.535000,36.619984> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.169087,-1.535000,65.948094>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.823334,-1.535000,66.123397>}
box{<0,0,-0.304800><0.677326,0.035000,0.304800> rotate<0,-14.998863,0> translate<25.169087,-1.535000,65.948094> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.489859,-1.535000,16.230600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.834138,-1.535000,16.230600>}
box{<0,0,-0.304800><1.344278,0.035000,0.304800> rotate<0,0.000000,0> translate<25.489859,-1.535000,16.230600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.489859,-1.535000,26.441397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.834138,-1.535000,26.441397>}
box{<0,0,-0.304800><1.344278,0.035000,0.304800> rotate<0,0.000000,0> translate<25.489859,-1.535000,26.441397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.823334,-1.535000,66.123397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.500663,-1.535000,66.123397>}
box{<0,0,-0.304800><0.677328,0.035000,0.304800> rotate<0,0.000000,0> translate<25.823334,-1.535000,66.123397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.961216,-1.535000,29.946600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.870781,-1.535000,29.946600>}
box{<0,0,-0.304800><0.909566,0.035000,0.304800> rotate<0,0.000000,0> translate<25.961216,-1.535000,29.946600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.961216,-1.535000,36.855397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.870781,-1.535000,36.855397>}
box{<0,0,-0.304800><0.909566,0.035000,0.304800> rotate<0,0.000000,0> translate<25.961216,-1.535000,36.855397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.500663,-1.535000,66.123397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.154909,-1.535000,65.948094>}
box{<0,0,-0.304800><0.677326,0.035000,0.304800> rotate<0,14.998863,0> translate<26.500663,-1.535000,66.123397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.834138,-1.535000,16.230600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.132609,-1.535000,16.578525>}
box{<0,0,-0.304800><1.344277,0.035000,0.304800> rotate<0,-14.999031,0> translate<26.834138,-1.535000,16.230600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.834138,-1.535000,26.441397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.132609,-1.535000,26.093472>}
box{<0,0,-0.304800><1.344277,0.035000,0.304800> rotate<0,14.999031,0> translate<26.834138,-1.535000,26.441397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.870781,-1.535000,29.946600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.749347,-1.535000,30.182013>}
box{<0,0,-0.304800><0.909558,0.035000,0.304800> rotate<0,-14.999104,0> translate<26.870781,-1.535000,29.946600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.870781,-1.535000,36.855397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.749347,-1.535000,36.619984>}
box{<0,0,-0.304800><0.909558,0.035000,0.304800> rotate<0,14.999104,0> translate<26.870781,-1.535000,36.855397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.154909,-1.535000,65.948094>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.741488,-1.535000,65.609431>}
box{<0,0,-0.304800><0.677323,0.035000,0.304800> rotate<0,29.998127,0> translate<27.154909,-1.535000,65.948094> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.347672,-1.535000,49.225197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.741488,-1.535000,49.452566>}
box{<0,0,-0.304800><0.454739,0.035000,0.304800> rotate<0,-29.997932,0> translate<27.347672,-1.535000,49.225197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.347672,-1.535000,49.225197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.487413,-1.535000,49.225197>}
box{<0,0,-0.304800><4.139741,0.035000,0.304800> rotate<0,0.000000,0> translate<27.347672,-1.535000,49.225197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.347675,-1.535000,65.836800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.108594,-1.535000,65.836800>}
box{<0,0,-0.304800><4.760919,0.035000,0.304800> rotate<0,0.000000,0> translate<27.347675,-1.535000,65.836800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.381197,-1.535000,53.777444>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.381197,-1.535000,54.993991>}
box{<0,0,-0.304800><1.216547,0.035000,0.304800> rotate<0,90.000000,0> translate<27.381197,-1.535000,54.993991> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.381197,-1.535000,53.777444>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.741488,-1.535000,53.569431>}
box{<0,0,-0.304800><0.416027,0.035000,0.304800> rotate<0,29.997854,0> translate<27.381197,-1.535000,53.777444> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.381197,-1.535000,54.254400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.247916,-1.535000,54.254400>}
box{<0,0,-0.304800><4.866719,0.035000,0.304800> rotate<0,0.000000,0> translate<27.381197,-1.535000,54.254400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.381197,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.964881,-1.535000,54.864000>}
box{<0,0,-0.304800><0.583684,0.035000,0.304800> rotate<0,0.000000,0> translate<27.381197,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.381197,-1.535000,54.993991>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.449006,-1.535000,55.061800>}
box{<0,0,-0.304800><0.095897,0.035000,0.304800> rotate<0,-44.997030,0> translate<27.381197,-1.535000,54.993991> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.381197,-1.535000,57.500197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.381197,-1.535000,57.947688>}
box{<0,0,-0.304800><0.447491,0.035000,0.304800> rotate<0,90.000000,0> translate<27.381197,-1.535000,57.947688> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.381197,-1.535000,57.500197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.767084,-1.535000,57.500197>}
box{<0,0,-0.304800><0.385887,0.035000,0.304800> rotate<0,0.000000,0> translate<27.381197,-1.535000,57.500197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.381197,-1.535000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.416884,-1.535000,57.912000>}
box{<0,0,-0.304800><0.035688,0.035000,0.304800> rotate<0,0.000000,0> translate<27.381197,-1.535000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.381197,-1.535000,57.947688>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.797884,-1.535000,57.531000>}
box{<0,0,-0.304800><0.589285,0.035000,0.304800> rotate<0,44.997030,0> translate<27.381197,-1.535000,57.947688> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.449006,-1.535000,55.061800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.767084,-1.535000,55.061800>}
box{<0,0,-0.304800><0.318078,0.035000,0.304800> rotate<0,0.000000,0> translate<27.449006,-1.535000,55.061800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.610947,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.857516,-1.535000,53.644800>}
box{<0,0,-0.304800><5.246569,0.035000,0.304800> rotate<0,0.000000,0> translate<27.610947,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.611641,-1.535000,49.377600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.639816,-1.535000,49.377600>}
box{<0,0,-0.304800><4.028175,0.035000,0.304800> rotate<0,0.000000,0> translate<27.611641,-1.535000,49.377600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.687272,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,26.212800>}
box{<0,0,-0.304800><8.431528,0.035000,0.304800> rotate<0,0.000000,0> translate<27.687272,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.687281,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.687200,-1.535000,16.459200>}
box{<0,0,-0.304800><34.999919,0.035000,0.304800> rotate<0,0.000000,0> translate<27.687281,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.741488,-1.535000,49.452566>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.220431,-1.535000,49.931509>}
box{<0,0,-0.304800><0.677329,0.035000,0.304800> rotate<0,-44.997030,0> translate<27.741488,-1.535000,49.452566> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.741488,-1.535000,53.569431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.220431,-1.535000,53.090488>}
box{<0,0,-0.304800><0.677329,0.035000,0.304800> rotate<0,44.997030,0> translate<27.741488,-1.535000,53.569431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.741488,-1.535000,65.609431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.220431,-1.535000,65.130488>}
box{<0,0,-0.304800><0.677329,0.035000,0.304800> rotate<0,44.997030,0> translate<27.741488,-1.535000,65.609431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.749347,-1.535000,30.182013>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.537050,-1.535000,30.636791>}
box{<0,0,-0.304800><0.909560,0.035000,0.304800> rotate<0,-29.997884,0> translate<27.749347,-1.535000,30.182013> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.749347,-1.535000,36.619984>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.537050,-1.535000,36.165206>}
box{<0,0,-0.304800><0.909560,0.035000,0.304800> rotate<0,29.997884,0> translate<27.749347,-1.535000,36.619984> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.767084,-1.535000,55.061800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.191281,-1.535000,54.637600>}
box{<0,0,-0.304800><0.599907,0.035000,0.304800> rotate<0,44.997241,0> translate<27.767084,-1.535000,55.061800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.767084,-1.535000,57.500197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.797884,-1.535000,57.531000>}
box{<0,0,-0.304800><0.043560,0.035000,0.304800> rotate<0,-44.999936,0> translate<27.767084,-1.535000,57.500197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.825531,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.263791,-1.535000,36.576000>}
box{<0,0,-0.304800><1.438259,0.035000,0.304800> rotate<0,0.000000,0> translate<27.825531,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.123719,-1.535000,65.227200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.498994,-1.535000,65.227200>}
box{<0,0,-0.304800><3.375275,0.035000,0.304800> rotate<0,0.000000,0> translate<28.123719,-1.535000,65.227200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.132609,-1.535000,16.578525>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.296788,-1.535000,17.250663>}
box{<0,0,-0.304800><1.344277,0.035000,0.304800> rotate<0,-29.997981,0> translate<28.132609,-1.535000,16.578525> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.132609,-1.535000,26.093472>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.296788,-1.535000,25.421334>}
box{<0,0,-0.304800><1.344277,0.035000,0.304800> rotate<0,29.997981,0> translate<28.132609,-1.535000,26.093472> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.191281,-1.535000,54.637600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.552716,-1.535000,54.637600>}
box{<0,0,-0.304800><1.361434,0.035000,0.304800> rotate<0,0.000000,0> translate<28.191281,-1.535000,54.637600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.220431,-1.535000,49.931509>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.428444,-1.535000,50.291800>}
box{<0,0,-0.304800><0.416027,0.035000,0.304800> rotate<0,-59.996206,0> translate<28.220431,-1.535000,49.931509> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.220431,-1.535000,53.090488>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.428444,-1.535000,52.730197>}
box{<0,0,-0.304800><0.416027,0.035000,0.304800> rotate<0,59.996206,0> translate<28.220431,-1.535000,53.090488> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.220431,-1.535000,65.130488>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.559094,-1.535000,64.543909>}
box{<0,0,-0.304800><0.677323,0.035000,0.304800> rotate<0,59.995933,0> translate<28.220431,-1.535000,65.130488> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.252353,-1.535000,53.035200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.441159,-1.535000,53.035200>}
box{<0,0,-0.304800><5.188806,0.035000,0.304800> rotate<0,0.000000,0> translate<28.252353,-1.535000,53.035200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.252581,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.886591,-1.535000,49.987200>}
box{<0,0,-0.304800><5.634009,0.035000,0.304800> rotate<0,0.000000,0> translate<28.252581,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.265478,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,30.480000>}
box{<0,0,-0.304800><7.853322,0.035000,0.304800> rotate<0,0.000000,0> translate<28.265478,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.267012,-1.535000,62.052197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.323991,-1.535000,62.052197>}
box{<0,0,-0.304800><0.056978,0.035000,0.304800> rotate<0,0.000000,0> translate<28.267012,-1.535000,62.052197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.267012,-1.535000,62.052197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.559094,-1.535000,62.558088>}
box{<0,0,-0.304800><0.584155,0.035000,0.304800> rotate<0,-59.995602,0> translate<28.267012,-1.535000,62.052197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.323991,-1.535000,62.052197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.472378,-1.535000,67.200584>}
box{<0,0,-0.304800><7.280919,0.035000,0.304800> rotate<0,-44.997030,0> translate<28.323991,-1.535000,62.052197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.340338,-1.535000,62.179200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.450994,-1.535000,62.179200>}
box{<0,0,-0.304800><0.110656,0.035000,0.304800> rotate<0,0.000000,0> translate<28.340338,-1.535000,62.179200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.428444,-1.535000,50.291800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.581991,-1.535000,50.291800>}
box{<0,0,-0.304800><5.153547,0.035000,0.304800> rotate<0,0.000000,0> translate<28.428444,-1.535000,50.291800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.428444,-1.535000,52.730197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.645122,-1.535000,52.730197>}
box{<0,0,-0.304800><5.216678,0.035000,0.304800> rotate<0,0.000000,0> translate<28.428444,-1.535000,52.730197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.516550,-1.535000,64.617600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.889394,-1.535000,64.617600>}
box{<0,0,-0.304800><2.372844,0.035000,0.304800> rotate<0,0.000000,0> translate<28.516550,-1.535000,64.617600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.537050,-1.535000,30.636791>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.180206,-1.535000,31.279947>}
box{<0,0,-0.304800><0.909560,0.035000,0.304800> rotate<0,-44.997030,0> translate<28.537050,-1.535000,30.636791> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.537050,-1.535000,36.165206>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.180206,-1.535000,35.522050>}
box{<0,0,-0.304800><0.909560,0.035000,0.304800> rotate<0,44.997030,0> translate<28.537050,-1.535000,36.165206> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.559094,-1.535000,62.558088>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.734397,-1.535000,63.212334>}
box{<0,0,-0.304800><0.677326,0.035000,0.304800> rotate<0,-74.995197,0> translate<28.559094,-1.535000,62.558088> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.559094,-1.535000,64.543909>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.734397,-1.535000,63.889663>}
box{<0,0,-0.304800><0.677326,0.035000,0.304800> rotate<0,74.995197,0> translate<28.559094,-1.535000,64.543909> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.620909,-1.535000,62.788800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.060594,-1.535000,62.788800>}
box{<0,0,-0.304800><0.439684,0.035000,0.304800> rotate<0,0.000000,0> translate<28.620909,-1.535000,62.788800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.702691,-1.535000,64.008000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.279794,-1.535000,64.008000>}
box{<0,0,-0.304800><1.577103,0.035000,0.304800> rotate<0,0.000000,0> translate<28.702691,-1.535000,64.008000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.704991,-1.535000,37.134800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.387800,-1.535000,36.451991>}
box{<0,0,-0.304800><0.965638,0.035000,0.304800> rotate<0,44.997030,0> translate<28.704991,-1.535000,37.134800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.734397,-1.535000,63.212334>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.734397,-1.535000,63.889663>}
box{<0,0,-0.304800><0.677328,0.035000,0.304800> rotate<0,90.000000,0> translate<28.734397,-1.535000,63.889663> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.734397,-1.535000,63.398400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.670194,-1.535000,63.398400>}
box{<0,0,-0.304800><0.935797,0.035000,0.304800> rotate<0,0.000000,0> translate<28.734397,-1.535000,63.398400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.735856,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.387800,-1.535000,35.966400>}
box{<0,0,-0.304800><0.651944,0.035000,0.304800> rotate<0,0.000000,0> translate<28.735856,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.854400,-1.535000,41.815384>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.121216,-1.535000,41.171231>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,67.495647,0> translate<28.854400,-1.535000,41.815384> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.854400,-1.535000,42.512613>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.854400,-1.535000,41.815384>}
box{<0,0,-0.304800><0.697228,0.035000,0.304800> rotate<0,-90.000000,0> translate<28.854400,-1.535000,41.815384> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.854400,-1.535000,42.512613>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.121216,-1.535000,43.156766>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,-67.495647,0> translate<28.854400,-1.535000,42.512613> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.981788,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,25.603200>}
box{<0,0,-0.304800><7.137012,0.035000,0.304800> rotate<0,0.000000,0> translate<28.981788,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.981791,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.439863,-1.535000,17.068800>}
box{<0,0,-0.304800><13.458072,0.035000,0.304800> rotate<0,0.000000,0> translate<28.981791,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.989859,-1.535000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,31.089600>}
box{<0,0,-0.304800><7.128941,0.035000,0.304800> rotate<0,0.000000,0> translate<28.989859,-1.535000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.121216,-1.535000,41.171231>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.614231,-1.535000,40.678216>}
box{<0,0,-0.304800><0.697229,0.035000,0.304800> rotate<0,44.997030,0> translate<29.121216,-1.535000,41.171231> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.121216,-1.535000,43.156766>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.387800,-1.535000,43.423350>}
box{<0,0,-0.304800><0.377007,0.035000,0.304800> rotate<0,-44.997030,0> translate<29.121216,-1.535000,43.156766> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.180206,-1.535000,31.279947>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.634984,-1.535000,32.067650>}
box{<0,0,-0.304800><0.909560,0.035000,0.304800> rotate<0,-59.996176,0> translate<29.180206,-1.535000,31.279947> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.180206,-1.535000,35.522050>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.387800,-1.535000,35.162481>}
box{<0,0,-0.304800><0.415193,0.035000,0.304800> rotate<0,59.996442,0> translate<29.180206,-1.535000,35.522050> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.275613,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.387800,-1.535000,35.356800>}
box{<0,0,-0.304800><0.112188,0.035000,0.304800> rotate<0,0.000000,0> translate<29.275613,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.296788,-1.535000,17.250663>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.247334,-1.535000,18.201209>}
box{<0,0,-0.304800><1.344276,0.035000,0.304800> rotate<0,-44.997030,0> translate<29.296788,-1.535000,17.250663> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.296788,-1.535000,25.421334>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.247334,-1.535000,24.470788>}
box{<0,0,-0.304800><1.344276,0.035000,0.304800> rotate<0,44.997030,0> translate<29.296788,-1.535000,25.421334> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.387800,-1.535000,36.451991>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.387800,-1.535000,35.162481>}
box{<0,0,-0.304800><1.289509,0.035000,0.304800> rotate<0,-90.000000,0> translate<29.387800,-1.535000,35.162481> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.387800,-1.535000,44.311512>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.387800,-1.535000,43.423350>}
box{<0,0,-0.304800><0.888162,0.035000,0.304800> rotate<0,-90.000000,0> translate<29.387800,-1.535000,43.423350> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.387800,-1.535000,44.311512>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.573412,-1.535000,44.759619>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-67.495456,0> translate<29.387800,-1.535000,44.311512> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.422259,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.451994,-1.535000,31.699200>}
box{<0,0,-0.304800><7.029734,0.035000,0.304800> rotate<0,0.000000,0> translate<29.422259,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.452513,-1.535000,39.573197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.900619,-1.535000,39.387584>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,22.498604,0> translate<29.452513,-1.535000,39.573197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.552716,-1.535000,54.637600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.872000,-1.535000,54.956884>}
box{<0,0,-0.304800><0.451536,0.035000,0.304800> rotate<0,-44.997030,0> translate<29.552716,-1.535000,54.637600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.573412,-1.535000,44.759619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.970413,-1.535000,46.156619>}
box{<0,0,-0.304800><1.975656,0.035000,0.304800> rotate<0,-44.997030,0> translate<29.573412,-1.535000,44.759619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.614231,-1.535000,40.678216>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.258384,-1.535000,40.411400>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,22.498414,0> translate<29.614231,-1.535000,40.678216> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.634984,-1.535000,32.067650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.865150,-1.535000,32.926644>}
box{<0,0,-0.304800><0.889295,0.035000,0.304800> rotate<0,-74.995116,0> translate<29.634984,-1.535000,32.067650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.699600,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.565878,-1.535000,32.308800>}
box{<0,0,-0.304800><0.866278,0.035000,0.304800> rotate<0,0.000000,0> translate<29.699600,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.724522,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,24.993600>}
box{<0,0,-0.304800><6.394278,0.035000,0.304800> rotate<0,0.000000,0> translate<29.724522,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.724525,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.488847,-1.535000,17.678400>}
box{<0,0,-0.304800><11.764322,0.035000,0.304800> rotate<0,0.000000,0> translate<29.724525,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.779116,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.964881,-1.535000,54.864000>}
box{<0,0,-0.304800><0.185766,0.035000,0.304800> rotate<0,0.000000,0> translate<29.779116,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.848656,-1.535000,60.128453>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.862584,-1.535000,60.142378>}
box{<0,0,-0.304800><0.019695,0.035000,0.304800> rotate<0,-44.990602,0> translate<29.848656,-1.535000,60.128453> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.848656,-1.535000,60.128453>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.872000,-1.535000,60.105113>}
box{<0,0,-0.304800><0.033011,0.035000,0.304800> rotate<0,44.993195,0> translate<29.848656,-1.535000,60.128453> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.862584,-1.535000,60.142378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.668006,-1.535000,64.947800>}
box{<0,0,-0.304800><6.795893,0.035000,0.304800> rotate<0,-44.997030,0> translate<29.862584,-1.535000,60.142378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.862941,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.873391,-1.535000,32.918400>}
box{<0,0,-0.304800><0.010450,0.035000,0.304800> rotate<0,0.000000,0> translate<29.862941,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.865150,-1.535000,32.926644>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.424378,-1.535000,32.367413>}
box{<0,0,-0.304800><0.790870,0.035000,0.304800> rotate<0,44.997190,0> translate<29.865150,-1.535000,32.926644> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.872000,-1.535000,54.956884>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.191281,-1.535000,54.637600>}
box{<0,0,-0.304800><0.451534,0.035000,0.304800> rotate<0,44.997311,0> translate<29.872000,-1.535000,54.956884> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.872000,-1.535000,60.105113>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.191281,-1.535000,60.424397>}
box{<0,0,-0.304800><0.451534,0.035000,0.304800> rotate<0,-44.997311,0> translate<29.872000,-1.535000,60.105113> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.900619,-1.535000,39.387584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.297619,-1.535000,37.990584>}
box{<0,0,-0.304800><1.975656,0.035000,0.304800> rotate<0,44.997030,0> translate<29.900619,-1.535000,39.387584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.070606,-1.535000,60.350400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.117287,-1.535000,60.350400>}
box{<0,0,-0.304800><0.046681,0.035000,0.304800> rotate<0,0.000000,0> translate<30.070606,-1.535000,60.350400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.191281,-1.535000,54.637600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.552716,-1.535000,54.637600>}
box{<0,0,-0.304800><1.361434,0.035000,0.304800> rotate<0,0.000000,0> translate<30.191281,-1.535000,54.637600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.191281,-1.535000,60.424397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.552716,-1.535000,60.424397>}
box{<0,0,-0.304800><1.361434,0.035000,0.304800> rotate<0,0.000000,0> translate<30.191281,-1.535000,60.424397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.247334,-1.535000,18.201209>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.919472,-1.535000,19.365388>}
box{<0,0,-0.304800><1.344277,0.035000,0.304800> rotate<0,-59.996079,0> translate<30.247334,-1.535000,18.201209> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.247334,-1.535000,24.470788>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.919472,-1.535000,23.306609>}
box{<0,0,-0.304800><1.344277,0.035000,0.304800> rotate<0,59.996079,0> translate<30.247334,-1.535000,24.470788> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.258384,-1.535000,40.411400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.955613,-1.535000,40.411400>}
box{<0,0,-0.304800><0.697228,0.035000,0.304800> rotate<0,0.000000,0> translate<30.258384,-1.535000,40.411400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.273803,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.260497,-1.535000,39.014400>}
box{<0,0,-0.304800><7.986694,0.035000,0.304800> rotate<0,0.000000,0> translate<30.273803,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.297441,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.163219,-1.535000,18.288000>}
box{<0,0,-0.304800><10.865778,0.035000,0.304800> rotate<0,0.000000,0> translate<30.297441,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.297444,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,24.384000>}
box{<0,0,-0.304800><5.821356,0.035000,0.304800> rotate<0,0.000000,0> translate<30.297444,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.424378,-1.535000,32.367413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.872484,-1.535000,32.181800>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,22.498604,0> translate<30.424378,-1.535000,32.367413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.649394,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.097200,-1.535000,18.897600>}
box{<0,0,-0.304800><10.447806,0.035000,0.304800> rotate<0,0.000000,0> translate<30.649394,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.649394,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,23.774400>}
box{<0,0,-0.304800><5.469406,0.035000,0.304800> rotate<0,0.000000,0> translate<30.649394,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.680206,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.874200,-1.535000,60.960000>}
box{<0,0,-0.304800><4.193994,0.035000,0.304800> rotate<0,0.000000,0> translate<30.680206,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.872484,-1.535000,32.181800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.304447,-1.535000,32.181800>}
box{<0,0,-0.304800><8.431963,0.035000,0.304800> rotate<0,0.000000,0> translate<30.872484,-1.535000,32.181800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.883403,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.412175,-1.535000,38.404800>}
box{<0,0,-0.304800><18.528772,0.035000,0.304800> rotate<0,0.000000,0> translate<30.883403,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.919472,-1.535000,19.365388>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.267397,-1.535000,20.663859>}
box{<0,0,-0.304800><1.344277,0.035000,0.304800> rotate<0,-74.995029,0> translate<30.919472,-1.535000,19.365388> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.919472,-1.535000,23.306609>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.267397,-1.535000,22.008138>}
box{<0,0,-0.304800><1.344277,0.035000,0.304800> rotate<0,74.995029,0> translate<30.919472,-1.535000,23.306609> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.955613,-1.535000,40.411400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.599766,-1.535000,40.678216>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,-22.498414,0> translate<30.955613,-1.535000,40.411400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.957469,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.247391,-1.535000,19.507200>}
box{<0,0,-0.304800><10.289922,0.035000,0.304800> rotate<0,0.000000,0> translate<30.957469,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.957472,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,23.164800>}
box{<0,0,-0.304800><5.161328,0.035000,0.304800> rotate<0,0.000000,0> translate<30.957472,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.970413,-1.535000,46.156619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.209628,-1.535000,46.395834>}
box{<0,0,-0.304800><0.338302,0.035000,0.304800> rotate<0,-44.997030,0> translate<30.970413,-1.535000,46.156619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.120813,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.111484,-1.535000,20.116800>}
box{<0,0,-0.304800><6.990672,0.035000,0.304800> rotate<0,0.000000,0> translate<31.120813,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.120813,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,22.555200>}
box{<0,0,-0.304800><4.997987,0.035000,0.304800> rotate<0,0.000000,0> translate<31.120813,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.209628,-1.535000,46.395834>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.217816,-1.535000,46.415603>}
box{<0,0,-0.304800><0.021397,0.035000,0.304800> rotate<0,-67.497980,0> translate<31.209628,-1.535000,46.395834> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.217816,-1.535000,46.415603>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.538213,-1.535000,46.736000>}
box{<0,0,-0.304800><0.453110,0.035000,0.304800> rotate<0,-44.997030,0> translate<31.217816,-1.535000,46.415603> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.267397,-1.535000,20.663859>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.267397,-1.535000,22.008138>}
box{<0,0,-0.304800><1.344278,0.035000,0.304800> rotate<0,90.000000,0> translate<31.267397,-1.535000,22.008138> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.267397,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.239391,-1.535000,20.726400>}
box{<0,0,-0.304800><5.971994,0.035000,0.304800> rotate<0,0.000000,0> translate<31.267397,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.267397,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.629791,-1.535000,21.336000>}
box{<0,0,-0.304800><5.362394,0.035000,0.304800> rotate<0,0.000000,0> translate<31.267397,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.267397,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.186681,-1.535000,21.945600>}
box{<0,0,-0.304800><4.919284,0.035000,0.304800> rotate<0,0.000000,0> translate<31.267397,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.289806,-1.535000,61.569600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.041919,-1.535000,61.569600>}
box{<0,0,-0.304800><3.752112,0.035000,0.304800> rotate<0,0.000000,0> translate<31.289806,-1.535000,61.569600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.297619,-1.535000,37.990584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.640584,-1.535000,37.647619>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,44.997030,0> translate<31.297619,-1.535000,37.990584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.487413,-1.535000,46.786800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.538213,-1.535000,46.736000>}
box{<0,0,-0.304800><0.071842,0.035000,0.304800> rotate<0,44.997030,0> translate<31.487413,-1.535000,46.786800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.487413,-1.535000,49.225197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.689394,-1.535000,49.427181>}
box{<0,0,-0.304800><0.285647,0.035000,0.304800> rotate<0,-44.997473,0> translate<31.487413,-1.535000,49.225197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.493003,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.403000,-1.535000,37.795200>}
box{<0,0,-0.304800><17.909997,0.035000,0.304800> rotate<0,0.000000,0> translate<31.493003,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.552716,-1.535000,54.637600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.708716,-1.535000,54.793603>}
box{<0,0,-0.304800><0.220620,0.035000,0.304800> rotate<0,-44.997604,0> translate<31.552716,-1.535000,54.637600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.552716,-1.535000,60.424397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.515397,-1.535000,59.461716>}
box{<0,0,-0.304800><1.361437,0.035000,0.304800> rotate<0,44.997030,0> translate<31.552716,-1.535000,60.424397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.599766,-1.535000,40.678216>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.092781,-1.535000,41.171231>}
box{<0,0,-0.304800><0.697229,0.035000,0.304800> rotate<0,-44.997030,0> translate<31.599766,-1.535000,40.678216> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.626713,-1.535000,60.350400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.874200,-1.535000,60.350400>}
box{<0,0,-0.304800><3.247488,0.035000,0.304800> rotate<0,0.000000,0> translate<31.626713,-1.535000,60.350400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.640584,-1.535000,37.647619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.826197,-1.535000,37.199513>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,67.495456,0> translate<31.640584,-1.535000,37.647619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.689394,-1.535000,49.427181>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.305541,-1.535000,49.682397>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-22.498454,0> translate<31.689394,-1.535000,49.427181> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.708716,-1.535000,54.793603>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.422806,-1.535000,53.079509>}
box{<0,0,-0.304800><2.424092,0.035000,0.304800> rotate<0,44.997082,0> translate<31.708716,-1.535000,54.793603> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.764750,-1.535000,40.843200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.934591,-1.535000,40.843200>}
box{<0,0,-0.304800><5.169841,0.035000,0.304800> rotate<0,0.000000,0> translate<31.764750,-1.535000,40.843200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.826197,-1.535000,34.620197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.826197,-1.535000,37.199513>}
box{<0,0,-0.304800><2.579316,0.035000,0.304800> rotate<0,90.000000,0> translate<31.826197,-1.535000,37.199513> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.826197,-1.535000,34.620197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.304447,-1.535000,34.620197>}
box{<0,0,-0.304800><7.478250,0.035000,0.304800> rotate<0,0.000000,0> translate<31.826197,-1.535000,34.620197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.826197,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.279047,-1.535000,34.747200>}
box{<0,0,-0.304800><7.452850,0.035000,0.304800> rotate<0,0.000000,0> translate<31.826197,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.826197,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.908781,-1.535000,35.356800>}
box{<0,0,-0.304800><7.082584,0.035000,0.304800> rotate<0,0.000000,0> translate<31.826197,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.826197,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.811200,-1.535000,35.966400>}
box{<0,0,-0.304800><6.985003,0.035000,0.304800> rotate<0,0.000000,0> translate<31.826197,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.826197,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.929825,-1.535000,36.576000>}
box{<0,0,-0.304800><7.103628,0.035000,0.304800> rotate<0,0.000000,0> translate<31.826197,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.826197,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.329850,-1.535000,37.185600>}
box{<0,0,-0.304800><7.503653,0.035000,0.304800> rotate<0,0.000000,0> translate<31.826197,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.899406,-1.535000,62.179200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.651519,-1.535000,62.179200>}
box{<0,0,-0.304800><3.752112,0.035000,0.304800> rotate<0,0.000000,0> translate<31.899406,-1.535000,62.179200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.092781,-1.535000,41.171231>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.151647,-1.535000,41.313347>}
box{<0,0,-0.304800><0.153825,0.035000,0.304800> rotate<0,-67.495750,0> translate<32.092781,-1.535000,41.171231> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.151647,-1.535000,41.313347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.305541,-1.535000,41.249600>}
box{<0,0,-0.304800><0.166574,0.035000,0.304800> rotate<0,22.499150,0> translate<32.151647,-1.535000,41.313347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.236313,-1.535000,59.740800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.874200,-1.535000,59.740800>}
box{<0,0,-0.304800><2.637887,0.035000,0.304800> rotate<0,0.000000,0> translate<32.236313,-1.535000,59.740800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.305541,-1.535000,41.249600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.496456,-1.535000,41.249600>}
box{<0,0,-0.304800><2.190916,0.035000,0.304800> rotate<0,0.000000,0> translate<32.305541,-1.535000,41.249600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.305541,-1.535000,49.682397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.191397,-1.535000,49.682397>}
box{<0,0,-0.304800><1.885856,0.035000,0.304800> rotate<0,0.000000,0> translate<32.305541,-1.535000,49.682397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.509006,-1.535000,62.788800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.261119,-1.535000,62.788800>}
box{<0,0,-0.304800><3.752113,0.035000,0.304800> rotate<0,0.000000,0> translate<32.509006,-1.535000,62.788800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.515397,-1.535000,58.981866>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.515397,-1.535000,59.461716>}
box{<0,0,-0.304800><0.479850,0.035000,0.304800> rotate<0,90.000000,0> translate<32.515397,-1.535000,59.461716> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.515397,-1.535000,58.981866>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.608291,-1.535000,58.943388>}
box{<0,0,-0.304800><0.100548,0.035000,0.304800> rotate<0,22.498659,0> translate<32.515397,-1.535000,58.981866> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.515397,-1.535000,59.131200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.874200,-1.535000,59.131200>}
box{<0,0,-0.304800><2.358803,0.035000,0.304800> rotate<0,0.000000,0> translate<32.515397,-1.535000,59.131200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.608291,-1.535000,58.943388>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.908388,-1.535000,58.643291>}
box{<0,0,-0.304800><0.424401,0.035000,0.304800> rotate<0,44.997030,0> translate<32.608291,-1.535000,58.943388> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.908388,-1.535000,58.643291>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.874200,-1.535000,56.677475>}
box{<0,0,-0.304800><2.780081,0.035000,0.304800> rotate<0,44.997076,0> translate<32.908388,-1.535000,58.643291> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.030078,-1.535000,58.521600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.874200,-1.535000,58.521600>}
box{<0,0,-0.304800><1.844122,0.035000,0.304800> rotate<0,0.000000,0> translate<33.030078,-1.535000,58.521600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.118606,-1.535000,63.398400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.884881,-1.535000,63.398400>}
box{<0,0,-0.304800><3.766275,0.035000,0.304800> rotate<0,0.000000,0> translate<33.118606,-1.535000,63.398400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.422806,-1.535000,53.079509>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.512609,-1.535000,52.862706>}
box{<0,0,-0.304800><0.234666,0.035000,0.304800> rotate<0,67.495471,0> translate<33.422806,-1.535000,53.079509> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.472378,-1.535000,67.200584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.920484,-1.535000,67.386197>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-22.498604,0> translate<33.472378,-1.535000,67.200584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.512609,-1.535000,52.862706>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.645122,-1.535000,52.730197>}
box{<0,0,-0.304800><0.187399,0.035000,0.304800> rotate<0,44.996355,0> translate<33.512609,-1.535000,52.862706> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.581991,-1.535000,50.291800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.191397,-1.535000,49.682397>}
box{<0,0,-0.304800><0.861828,0.035000,0.304800> rotate<0,44.996883,0> translate<33.581991,-1.535000,50.291800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.639678,-1.535000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.874200,-1.535000,57.912000>}
box{<0,0,-0.304800><1.234522,0.035000,0.304800> rotate<0,0.000000,0> translate<33.639678,-1.535000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.728206,-1.535000,64.008000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.582800,-1.535000,64.008000>}
box{<0,0,-0.304800><31.854594,0.035000,0.304800> rotate<0,0.000000,0> translate<33.728206,-1.535000,64.008000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.920484,-1.535000,67.386197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.045513,-1.535000,67.386197>}
box{<0,0,-0.304800><41.125028,0.035000,0.304800> rotate<0,0.000000,0> translate<33.920484,-1.535000,67.386197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.249278,-1.535000,57.302400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.874200,-1.535000,57.302400>}
box{<0,0,-0.304800><0.624922,0.035000,0.304800> rotate<0,0.000000,0> translate<34.249278,-1.535000,57.302400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.337806,-1.535000,64.617600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.582800,-1.535000,64.617600>}
box{<0,0,-0.304800><31.244994,0.035000,0.304800> rotate<0,0.000000,0> translate<34.337806,-1.535000,64.617600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.496456,-1.535000,41.249600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.112603,-1.535000,41.504816>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-22.498454,0> translate<34.496456,-1.535000,41.249600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.668006,-1.535000,64.947800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.582800,-1.535000,64.947800>}
box{<0,0,-0.304800><30.914794,0.035000,0.304800> rotate<0,0.000000,0> translate<34.668006,-1.535000,64.947800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.858878,-1.535000,56.692800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.874200,-1.535000,56.692800>}
box{<0,0,-0.304800><0.015322,0.035000,0.304800> rotate<0,0.000000,0> translate<34.858878,-1.535000,56.692800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.874200,-1.535000,61.172200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.874200,-1.535000,56.677475>}
box{<0,0,-0.304800><4.494725,0.035000,0.304800> rotate<0,-90.000000,0> translate<34.874200,-1.535000,56.677475> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.874200,-1.535000,61.172200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.036609,-1.535000,61.564291>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,-67.495530,0> translate<34.874200,-1.535000,61.172200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.987025,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.387331,-1.535000,41.452800>}
box{<0,0,-0.304800><1.400306,0.035000,0.304800> rotate<0,0.000000,0> translate<34.987025,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.036609,-1.535000,61.564291>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.560609,-1.535000,63.088291>}
box{<0,0,-0.304800><2.155261,0.035000,0.304800> rotate<0,-44.997030,0> translate<35.036609,-1.535000,61.564291> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.112603,-1.535000,41.504816>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.314588,-1.535000,41.706800>}
box{<0,0,-0.304800><0.285649,0.035000,0.304800> rotate<0,-44.997030,0> translate<35.112603,-1.535000,41.504816> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.314588,-1.535000,41.706800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.282122,-1.535000,41.706800>}
box{<0,0,-0.304800><0.967534,0.035000,0.304800> rotate<0,0.000000,0> translate<35.314588,-1.535000,41.706800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,22.109484>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.304413,-1.535000,21.661378>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,67.495456,0> translate<36.118800,-1.535000,22.109484> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,26.466800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,22.109484>}
box{<0,0,-0.304800><4.357316,0.035000,0.304800> rotate<0,-90.000000,0> translate<36.118800,-1.535000,22.109484> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,31.103513>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,28.905197>}
box{<0,0,-0.304800><2.198316,0.035000,0.304800> rotate<0,-90.000000,0> translate<36.118800,-1.535000,28.905197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.118800,-1.535000,31.103513>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.304413,-1.535000,31.551619>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-67.495456,0> translate<36.118800,-1.535000,31.103513> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.282122,-1.535000,41.706800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.431413,-1.535000,41.346378>}
box{<0,0,-0.304800><0.390117,0.035000,0.304800> rotate<0,67.495681,0> translate<36.282122,-1.535000,41.706800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.304413,-1.535000,21.661378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.647378,-1.535000,21.318413>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,44.997030,0> translate<36.304413,-1.535000,21.661378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.304413,-1.535000,31.551619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.647378,-1.535000,31.894584>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-44.997030,0> translate<36.304413,-1.535000,31.551619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.431413,-1.535000,41.346378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.541200,-1.535000,40.236594>}
box{<0,0,-0.304800><1.569474,0.035000,0.304800> rotate<0,44.996950,0> translate<36.431413,-1.535000,41.346378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.560609,-1.535000,63.088291>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.860706,-1.535000,63.388388>}
box{<0,0,-0.304800><0.424401,0.035000,0.304800> rotate<0,-44.997030,0> translate<36.560609,-1.535000,63.088291> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.647378,-1.535000,21.318413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.663378,-1.535000,20.302413>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,44.997030,0> translate<36.647378,-1.535000,21.318413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.647378,-1.535000,31.894584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.095484,-1.535000,32.080197>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-22.498604,0> translate<36.647378,-1.535000,31.894584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.860706,-1.535000,63.388388>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.252797,-1.535000,63.550797>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,-22.498530,0> translate<36.860706,-1.535000,63.388388> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.095484,-1.535000,32.080197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.304450,-1.535000,32.080197>}
box{<0,0,-0.304800><2.208966,0.035000,0.304800> rotate<0,0.000000,0> translate<37.095484,-1.535000,32.080197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.208000,-1.535000,50.114200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.355584,-1.535000,49.966619>}
box{<0,0,-0.304800><0.208714,0.035000,0.304800> rotate<0,44.996424,0> translate<37.208000,-1.535000,50.114200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.208000,-1.535000,50.114200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.277800,-1.535000,50.114200>}
box{<0,0,-0.304800><1.069800,0.035000,0.304800> rotate<0,0.000000,0> translate<37.208000,-1.535000,50.114200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.252797,-1.535000,63.550797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.662200,-1.535000,63.550797>}
box{<0,0,-0.304800><7.409403,0.035000,0.304800> rotate<0,0.000000,0> translate<37.252797,-1.535000,63.550797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.335003,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.277800,-1.535000,49.987200>}
box{<0,0,-0.304800><0.942797,0.035000,0.304800> rotate<0,0.000000,0> translate<37.335003,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.355584,-1.535000,49.966619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.541197,-1.535000,49.518512>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,67.495456,0> translate<37.355584,-1.535000,49.966619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.541197,-1.535000,49.432622>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.541197,-1.535000,49.518512>}
box{<0,0,-0.304800><0.085891,0.035000,0.304800> rotate<0,90.000000,0> translate<37.541197,-1.535000,49.518512> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.541197,-1.535000,49.432622>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.566597,-1.535000,49.371303>}
box{<0,0,-0.304800><0.066371,0.035000,0.304800> rotate<0,67.494794,0> translate<37.541197,-1.535000,49.432622> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.541200,-1.535000,39.733697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.463697,-1.535000,38.811200>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,44.997030,0> translate<37.541200,-1.535000,39.733697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.541200,-1.535000,40.236594>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.541200,-1.535000,39.733697>}
box{<0,0,-0.304800><0.502897,0.035000,0.304800> rotate<0,-90.000000,0> translate<37.541200,-1.535000,39.733697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.563991,-1.535000,49.377600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.082634,-1.535000,49.377600>}
box{<0,0,-0.304800><0.518644,0.035000,0.304800> rotate<0,0.000000,0> translate<37.563991,-1.535000,49.377600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.566597,-1.535000,46.913797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.566597,-1.535000,49.371303>}
box{<0,0,-0.304800><2.457506,0.035000,0.304800> rotate<0,90.000000,0> translate<37.566597,-1.535000,49.371303> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.566597,-1.535000,46.913797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.117300,-1.535000,46.913797>}
box{<0,0,-0.304800><0.550703,0.035000,0.304800> rotate<0,0.000000,0> translate<37.566597,-1.535000,46.913797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.566597,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,46.939200>}
box{<0,0,-0.304800><4.241803,0.035000,0.304800> rotate<0,0.000000,0> translate<37.566597,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.566597,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.124716,-1.535000,47.548800>}
box{<0,0,-0.304800><0.558119,0.035000,0.304800> rotate<0,0.000000,0> translate<37.566597,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.566597,-1.535000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.029400,-1.535000,48.158400>}
box{<0,0,-0.304800><0.462803,0.035000,0.304800> rotate<0,0.000000,0> translate<37.566597,-1.535000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.566597,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.029400,-1.535000,48.768000>}
box{<0,0,-0.304800><0.462803,0.035000,0.304800> rotate<0,0.000000,0> translate<37.566597,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.663378,-1.535000,20.302413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.111484,-1.535000,20.116800>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,22.498604,0> translate<37.663378,-1.535000,20.302413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.029400,-1.535000,47.778913>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.168609,-1.535000,47.442831>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,67.495551,0> translate<38.029400,-1.535000,47.778913> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.029400,-1.535000,49.249084>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.029400,-1.535000,47.778913>}
box{<0,0,-0.304800><1.470172,0.035000,0.304800> rotate<0,-90.000000,0> translate<38.029400,-1.535000,47.778913> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.029400,-1.535000,49.249084>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.168609,-1.535000,49.585166>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,-67.495551,0> translate<38.029400,-1.535000,49.249084> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.111484,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.590447,-1.535000,20.116800>}
box{<0,0,-0.304800><3.478963,0.035000,0.304800> rotate<0,0.000000,0> translate<38.111484,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.117300,-1.535000,46.913797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.828500,-1.535000,46.202597>}
box{<0,0,-0.304800><1.005789,0.035000,0.304800> rotate<0,44.997030,0> translate<38.117300,-1.535000,46.913797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.168609,-1.535000,47.442831>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.425831,-1.535000,47.185609>}
box{<0,0,-0.304800><0.363767,0.035000,0.304800> rotate<0,44.997030,0> translate<38.168609,-1.535000,47.442831> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.168609,-1.535000,49.585166>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.277800,-1.535000,49.694356>}
box{<0,0,-0.304800><0.154419,0.035000,0.304800> rotate<0,-44.997030,0> translate<38.168609,-1.535000,49.585166> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.277800,-1.535000,50.114200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.277800,-1.535000,49.694356>}
box{<0,0,-0.304800><0.419844,0.035000,0.304800> rotate<0,-90.000000,0> translate<38.277800,-1.535000,49.694356> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.425831,-1.535000,47.185609>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.761913,-1.535000,47.046400>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,22.498510,0> translate<38.425831,-1.535000,47.185609> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.463697,-1.535000,38.811200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.768300,-1.535000,38.811200>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,0.000000,0> translate<38.463697,-1.535000,38.811200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.557197,-1.535000,22.857006>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.557197,-1.535000,29.641800>}
box{<0,0,-0.304800><6.784794,0.035000,0.304800> rotate<0,90.000000,0> translate<38.557197,-1.535000,29.641800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.557197,-1.535000,22.857006>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.859006,-1.535000,22.555197>}
box{<0,0,-0.304800><0.426823,0.035000,0.304800> rotate<0,44.997030,0> translate<38.557197,-1.535000,22.857006> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.557197,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.876075,-1.535000,23.164800>}
box{<0,0,-0.304800><1.318878,0.035000,0.304800> rotate<0,0.000000,0> translate<38.557197,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.557197,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,23.774400>}
box{<0,0,-0.304800><1.270003,0.035000,0.304800> rotate<0,0.000000,0> translate<38.557197,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.557197,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,24.384000>}
box{<0,0,-0.304800><1.270003,0.035000,0.304800> rotate<0,0.000000,0> translate<38.557197,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.557197,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.121919,-1.535000,24.993600>}
box{<0,0,-0.304800><1.564722,0.035000,0.304800> rotate<0,0.000000,0> translate<38.557197,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.557197,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.731519,-1.535000,25.603200>}
box{<0,0,-0.304800><2.174322,0.035000,0.304800> rotate<0,0.000000,0> translate<38.557197,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.557197,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.341119,-1.535000,26.212800>}
box{<0,0,-0.304800><2.783922,0.035000,0.304800> rotate<0,0.000000,0> translate<38.557197,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.557197,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.950719,-1.535000,26.822400>}
box{<0,0,-0.304800><3.393522,0.035000,0.304800> rotate<0,0.000000,0> translate<38.557197,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.557197,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.560319,-1.535000,27.432000>}
box{<0,0,-0.304800><4.003122,0.035000,0.304800> rotate<0,0.000000,0> translate<38.557197,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.557197,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.169919,-1.535000,28.041600>}
box{<0,0,-0.304800><4.612722,0.035000,0.304800> rotate<0,0.000000,0> translate<38.557197,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.557197,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.204100,-1.535000,28.651200>}
box{<0,0,-0.304800><5.646903,0.035000,0.304800> rotate<0,0.000000,0> translate<38.557197,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.557197,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.847256,-1.535000,29.260800>}
box{<0,0,-0.304800><1.290059,0.035000,0.304800> rotate<0,0.000000,0> translate<38.557197,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.557197,-1.535000,29.641800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.304450,-1.535000,29.641800>}
box{<0,0,-0.304800><0.747253,0.035000,0.304800> rotate<0,0.000000,0> translate<38.557197,-1.535000,29.641800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.701497,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.419500,-1.535000,46.329600>}
box{<0,0,-0.304800><1.718003,0.035000,0.304800> rotate<0,0.000000,0> translate<38.701497,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.761913,-1.535000,47.046400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.232084,-1.535000,47.046400>}
box{<0,0,-0.304800><1.470172,0.035000,0.304800> rotate<0,0.000000,0> translate<38.761913,-1.535000,47.046400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.811200,-1.535000,35.592384>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.078016,-1.535000,34.948231>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,67.495647,0> translate<38.811200,-1.535000,35.592384> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.811200,-1.535000,36.289613>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.811200,-1.535000,35.592384>}
box{<0,0,-0.304800><0.697228,0.035000,0.304800> rotate<0,-90.000000,0> translate<38.811200,-1.535000,35.592384> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.811200,-1.535000,36.289613>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.078016,-1.535000,36.933766>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,-67.495647,0> translate<38.811200,-1.535000,36.289613> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.828500,-1.535000,46.202597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.292497,-1.535000,46.202597>}
box{<0,0,-0.304800><1.463997,0.035000,0.304800> rotate<0,0.000000,0> translate<38.828500,-1.535000,46.202597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.859003,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.325116,-1.535000,22.555200>}
box{<0,0,-0.304800><1.466113,0.035000,0.304800> rotate<0,0.000000,0> translate<38.859003,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.859006,-1.535000,22.555197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.325122,-1.535000,22.555197>}
box{<0,0,-0.304800><1.466116,0.035000,0.304800> rotate<0,0.000000,0> translate<38.859006,-1.535000,22.555197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.078016,-1.535000,34.948231>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.355250,-1.535000,34.670997>}
box{<0,0,-0.304800><0.392069,0.035000,0.304800> rotate<0,44.997030,0> translate<39.078016,-1.535000,34.948231> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.078016,-1.535000,36.933766>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.571031,-1.535000,37.426781>}
box{<0,0,-0.304800><0.697229,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.078016,-1.535000,36.933766> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.304447,-1.535000,32.181800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.355250,-1.535000,32.130997>}
box{<0,0,-0.304800><0.071846,0.035000,0.304800> rotate<0,44.997030,0> translate<39.304447,-1.535000,32.181800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.304447,-1.535000,34.620197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.355250,-1.535000,34.670997>}
box{<0,0,-0.304800><0.071844,0.035000,0.304800> rotate<0,-44.995268,0> translate<39.304447,-1.535000,34.620197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.304450,-1.535000,29.641800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.571031,-1.535000,29.375216>}
box{<0,0,-0.304800><0.377005,0.035000,0.304800> rotate<0,44.997366,0> translate<39.304450,-1.535000,29.641800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.304450,-1.535000,32.080197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.355250,-1.535000,32.130997>}
box{<0,0,-0.304800><0.071842,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.304450,-1.535000,32.080197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.571031,-1.535000,29.375216>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.215184,-1.535000,29.108400>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,22.498414,0> translate<39.571031,-1.535000,29.375216> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.571031,-1.535000,37.426781>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.215184,-1.535000,37.693597>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,-22.498414,0> translate<39.571031,-1.535000,37.426781> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.723950,-1.535000,61.417200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.810188,-1.535000,61.330966>}
box{<0,0,-0.304800><0.121956,0.035000,0.304800> rotate<0,44.995992,0> translate<39.723950,-1.535000,61.417200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.723950,-1.535000,61.417200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.605200,-1.535000,61.417200>}
box{<0,0,-0.304800><1.881250,0.035000,0.304800> rotate<0,0.000000,0> translate<39.723950,-1.535000,61.417200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.768300,-1.535000,38.811200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.690797,-1.535000,39.733697>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.768300,-1.535000,38.811200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.810188,-1.535000,61.330966>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.949397,-1.535000,60.994884>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,67.495551,0> translate<39.810188,-1.535000,61.330966> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,23.282797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.989609,-1.535000,22.890706>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,67.495530,0> translate<39.827200,-1.535000,23.282797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,24.469200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,23.282797>}
box{<0,0,-0.304800><1.186403,0.035000,0.304800> rotate<0,-90.000000,0> translate<39.827200,-1.535000,23.282797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,24.469200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.989609,-1.535000,24.861291>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,-67.495530,0> translate<39.827200,-1.535000,24.469200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.949397,-1.535000,57.129797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.949397,-1.535000,60.994884>}
box{<0,0,-0.304800><3.865088,0.035000,0.304800> rotate<0,90.000000,0> translate<39.949397,-1.535000,60.994884> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.949397,-1.535000,57.129797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.127119,-1.535000,57.129797>}
box{<0,0,-0.304800><0.177722,0.035000,0.304800> rotate<0,0.000000,0> translate<39.949397,-1.535000,57.129797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.949397,-1.535000,57.302400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.299722,-1.535000,57.302400>}
box{<0,0,-0.304800><0.350325,0.035000,0.304800> rotate<0,0.000000,0> translate<39.949397,-1.535000,57.302400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.949397,-1.535000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.179316,-1.535000,57.912000>}
box{<0,0,-0.304800><2.229919,0.035000,0.304800> rotate<0,0.000000,0> translate<39.949397,-1.535000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.949397,-1.535000,58.521600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.685637,-1.535000,58.521600>}
box{<0,0,-0.304800><1.736241,0.035000,0.304800> rotate<0,0.000000,0> translate<39.949397,-1.535000,58.521600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.949397,-1.535000,59.131200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.605200,-1.535000,59.131200>}
box{<0,0,-0.304800><1.655803,0.035000,0.304800> rotate<0,0.000000,0> translate<39.949397,-1.535000,59.131200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.949397,-1.535000,59.740800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.605200,-1.535000,59.740800>}
box{<0,0,-0.304800><1.655803,0.035000,0.304800> rotate<0,0.000000,0> translate<39.949397,-1.535000,59.740800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.949397,-1.535000,60.350400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.605200,-1.535000,60.350400>}
box{<0,0,-0.304800><1.655803,0.035000,0.304800> rotate<0,0.000000,0> translate<39.949397,-1.535000,60.350400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.949397,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.605200,-1.535000,60.960000>}
box{<0,0,-0.304800><1.655803,0.035000,0.304800> rotate<0,0.000000,0> translate<39.949397,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.971500,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.880497,-1.535000,39.014400>}
box{<0,0,-0.304800><5.908997,0.035000,0.304800> rotate<0,0.000000,0> translate<39.971500,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.989609,-1.535000,22.890706>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.325122,-1.535000,22.555197>}
box{<0,0,-0.304800><0.474484,0.035000,0.304800> rotate<0,44.996763,0> translate<39.989609,-1.535000,22.890706> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.989609,-1.535000,24.861291>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.289706,-1.535000,25.161388>}
box{<0,0,-0.304800><0.424401,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.989609,-1.535000,24.861291> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.127119,-1.535000,57.129797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.614706,-1.535000,57.617387>}
box{<0,0,-0.304800><0.689555,0.035000,0.304800> rotate<0,-44.997214,0> translate<40.127119,-1.535000,57.129797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.215184,-1.535000,29.108400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.588813,-1.535000,29.108400>}
box{<0,0,-0.304800><2.373628,0.035000,0.304800> rotate<0,0.000000,0> translate<40.215184,-1.535000,29.108400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.215184,-1.535000,37.693597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.588813,-1.535000,37.693597>}
box{<0,0,-0.304800><2.373628,0.035000,0.304800> rotate<0,0.000000,0> translate<40.215184,-1.535000,37.693597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.232084,-1.535000,47.046400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.568166,-1.535000,47.185609>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,-22.498510,0> translate<40.232084,-1.535000,47.046400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.289706,-1.535000,25.161388>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.591706,-1.535000,28.463387>}
box{<0,0,-0.304800><4.669733,0.035000,0.304800> rotate<0,-44.997030,0> translate<40.289706,-1.535000,25.161388> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.292497,-1.535000,46.202597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.495697,-1.535000,46.405797>}
box{<0,0,-0.304800><0.287368,0.035000,0.304800> rotate<0,-44.997030,0> translate<40.292497,-1.535000,46.202597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.495697,-1.535000,46.405797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.800300,-1.535000,46.405797>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,0.000000,0> translate<40.495697,-1.535000,46.405797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.568166,-1.535000,47.185609>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.825388,-1.535000,47.442831>}
box{<0,0,-0.304800><0.363767,0.035000,0.304800> rotate<0,-44.997030,0> translate<40.568166,-1.535000,47.185609> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.581100,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.270897,-1.535000,39.624000>}
box{<0,0,-0.304800><4.689797,0.035000,0.304800> rotate<0,0.000000,0> translate<40.581100,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.614706,-1.535000,57.617387>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.006797,-1.535000,57.779797>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,-22.498530,0> translate<40.614706,-1.535000,57.617387> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.690797,-1.535000,39.733697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.690797,-1.535000,40.617594>}
box{<0,0,-0.304800><0.883897,0.035000,0.304800> rotate<0,90.000000,0> translate<40.690797,-1.535000,40.617594> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.690797,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.161200,-1.535000,40.233600>}
box{<0,0,-0.304800><4.470403,0.035000,0.304800> rotate<0,0.000000,0> translate<40.690797,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.690797,-1.535000,40.617594>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.297406,-1.535000,41.224200>}
box{<0,0,-0.304800><0.857873,0.035000,0.304800> rotate<0,-44.996883,0> translate<40.690797,-1.535000,40.617594> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.716197,-1.535000,49.694356>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.716197,-1.535000,50.103331>}
box{<0,0,-0.304800><0.408975,0.035000,0.304800> rotate<0,90.000000,0> translate<40.716197,-1.535000,50.103331> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.716197,-1.535000,49.694356>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.825388,-1.535000,49.585166>}
box{<0,0,-0.304800><0.154419,0.035000,0.304800> rotate<0,44.997030,0> translate<40.716197,-1.535000,49.694356> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.716197,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,49.987200>}
box{<0,0,-0.304800><1.092203,0.035000,0.304800> rotate<0,0.000000,0> translate<40.716197,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.716197,-1.535000,50.103331>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.822619,-1.535000,50.147413>}
box{<0,0,-0.304800><0.115190,0.035000,0.304800> rotate<0,-22.498454,0> translate<40.716197,-1.535000,50.103331> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.822619,-1.535000,50.147413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.165584,-1.535000,50.490378>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-44.997030,0> translate<40.822619,-1.535000,50.147413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.825388,-1.535000,47.442831>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.964597,-1.535000,47.778913>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,-67.495551,0> translate<40.825388,-1.535000,47.442831> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.825388,-1.535000,49.585166>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.964597,-1.535000,49.249084>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,67.495551,0> translate<40.825388,-1.535000,49.585166> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.869278,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,47.548800>}
box{<0,0,-0.304800><0.939122,0.035000,0.304800> rotate<0,0.000000,0> translate<40.869278,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.911366,-1.535000,49.377600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,49.377600>}
box{<0,0,-0.304800><0.897034,0.035000,0.304800> rotate<0,0.000000,0> translate<40.911366,-1.535000,49.377600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.916403,-1.535000,40.843200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.161200,-1.535000,40.843200>}
box{<0,0,-0.304800><4.244797,0.035000,0.304800> rotate<0,0.000000,0> translate<40.916403,-1.535000,40.843200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.964597,-1.535000,47.778913>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.964597,-1.535000,49.249084>}
box{<0,0,-0.304800><1.470172,0.035000,0.304800> rotate<0,90.000000,0> translate<40.964597,-1.535000,49.249084> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.964597,-1.535000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,48.158400>}
box{<0,0,-0.304800><0.843803,0.035000,0.304800> rotate<0,0.000000,0> translate<40.964597,-1.535000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.964597,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,48.768000>}
box{<0,0,-0.304800><0.843803,0.035000,0.304800> rotate<0,0.000000,0> translate<40.964597,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.006797,-1.535000,57.779797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.311522,-1.535000,57.779797>}
box{<0,0,-0.304800><1.304725,0.035000,0.304800> rotate<0,0.000000,0> translate<41.006797,-1.535000,57.779797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.026053,-1.535000,55.097625>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.036388,-1.535000,55.087291>}
box{<0,0,-0.304800><0.014615,0.035000,0.304800> rotate<0,44.997030,0> translate<41.026053,-1.535000,55.097625> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.026053,-1.535000,55.097625>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.173291,-1.535000,55.158609>}
box{<0,0,-0.304800><0.159367,0.035000,0.304800> rotate<0,-22.497388,0> translate<41.026053,-1.535000,55.097625> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.036388,-1.535000,55.087291>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.198797,-1.535000,54.695200>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,67.495530,0> translate<41.036388,-1.535000,55.087291> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.097200,-1.535000,18.447384>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.364016,-1.535000,17.803231>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,67.495647,0> translate<41.097200,-1.535000,18.447384> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.097200,-1.535000,19.144613>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.097200,-1.535000,18.447384>}
box{<0,0,-0.304800><0.697228,0.035000,0.304800> rotate<0,-90.000000,0> translate<41.097200,-1.535000,18.447384> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.097200,-1.535000,19.144613>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.364016,-1.535000,19.788766>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,-67.495647,0> translate<41.097200,-1.535000,19.144613> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.128878,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,54.864000>}
box{<0,0,-0.304800><0.679522,0.035000,0.304800> rotate<0,0.000000,0> translate<41.128878,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.165584,-1.535000,50.490378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.351197,-1.535000,50.938484>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-67.495456,0> translate<41.165584,-1.535000,50.490378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.173291,-1.535000,55.158609>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.473388,-1.535000,55.458706>}
box{<0,0,-0.304800><0.424401,0.035000,0.304800> rotate<0,-44.997030,0> translate<41.173291,-1.535000,55.158609> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.198797,-1.535000,51.791434>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.198797,-1.535000,54.695200>}
box{<0,0,-0.304800><2.903766,0.035000,0.304800> rotate<0,90.000000,0> translate<41.198797,-1.535000,54.695200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.198797,-1.535000,51.791434>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.351197,-1.535000,51.423513>}
box{<0,0,-0.304800><0.398236,0.035000,0.304800> rotate<0,67.495310,0> translate<41.198797,-1.535000,51.791434> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.198797,-1.535000,51.816000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,51.816000>}
box{<0,0,-0.304800><0.609603,0.035000,0.304800> rotate<0,0.000000,0> translate<41.198797,-1.535000,51.816000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.198797,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,52.425600>}
box{<0,0,-0.304800><0.609603,0.035000,0.304800> rotate<0,0.000000,0> translate<41.198797,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.198797,-1.535000,53.035200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,53.035200>}
box{<0,0,-0.304800><0.609603,0.035000,0.304800> rotate<0,0.000000,0> translate<41.198797,-1.535000,53.035200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.198797,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,53.644800>}
box{<0,0,-0.304800><0.609603,0.035000,0.304800> rotate<0,0.000000,0> translate<41.198797,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.198797,-1.535000,54.254400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,54.254400>}
box{<0,0,-0.304800><0.609603,0.035000,0.304800> rotate<0,0.000000,0> translate<41.198797,-1.535000,54.254400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.209666,-1.535000,50.596800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,50.596800>}
box{<0,0,-0.304800><0.598734,0.035000,0.304800> rotate<0,0.000000,0> translate<41.209666,-1.535000,50.596800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.297406,-1.535000,41.224200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.461247,-1.535000,41.224200>}
box{<0,0,-0.304800><0.163841,0.035000,0.304800> rotate<0,0.000000,0> translate<41.297406,-1.535000,41.224200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.351197,-1.535000,50.938484>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.351197,-1.535000,51.423513>}
box{<0,0,-0.304800><0.485028,0.035000,0.304800> rotate<0,90.000000,0> translate<41.351197,-1.535000,51.423513> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.351197,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,51.206400>}
box{<0,0,-0.304800><0.457203,0.035000,0.304800> rotate<0,0.000000,0> translate<41.351197,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.364016,-1.535000,17.803231>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.857031,-1.535000,17.310216>}
box{<0,0,-0.304800><0.697229,0.035000,0.304800> rotate<0,44.997030,0> translate<41.364016,-1.535000,17.803231> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.364016,-1.535000,19.788766>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.641250,-1.535000,20.065997>}
box{<0,0,-0.304800><0.392066,0.035000,0.304800> rotate<0,-44.996707,0> translate<41.364016,-1.535000,19.788766> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.461247,-1.535000,41.224200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.040050,-1.535000,41.463950>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,-22.498675,0> translate<41.461247,-1.535000,41.224200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.473388,-1.535000,55.458706>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.473388,-1.535000,55.458709>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<41.473388,-1.535000,55.458709> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.473388,-1.535000,55.458709>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.660881,-1.535000,55.646200>}
box{<0,0,-0.304800><0.265154,0.035000,0.304800> rotate<0,-44.996553,0> translate<41.473388,-1.535000,55.458709> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.488278,-1.535000,55.473600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,55.473600>}
box{<0,0,-0.304800><0.320122,0.035000,0.304800> rotate<0,0.000000,0> translate<41.488278,-1.535000,55.473600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.590447,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.641250,-1.535000,20.065997>}
box{<0,0,-0.304800><0.071846,0.035000,0.304800> rotate<0,44.997030,0> translate<41.590447,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.605200,-1.535000,58.715797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.767609,-1.535000,58.323706>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,67.495530,0> translate<41.605200,-1.535000,58.715797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.605200,-1.535000,61.417200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.605200,-1.535000,58.715797>}
box{<0,0,-0.304800><2.701403,0.035000,0.304800> rotate<0,-90.000000,0> translate<41.605200,-1.535000,58.715797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.660881,-1.535000,55.646200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,55.646200>}
box{<0,0,-0.304800><0.147519,0.035000,0.304800> rotate<0,0.000000,0> translate<41.660881,-1.535000,55.646200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.767609,-1.535000,58.323706>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.067706,-1.535000,58.023609>}
box{<0,0,-0.304800><0.424401,0.035000,0.304800> rotate<0,44.997030,0> translate<41.767609,-1.535000,58.323706> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.800300,-1.535000,46.405797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,46.397694>}
box{<0,0,-0.304800><0.011457,0.035000,0.304800> rotate<0,45.008080,0> translate<41.800300,-1.535000,46.405797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,55.646200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.808400,-1.535000,46.397694>}
box{<0,0,-0.304800><9.248506,0.035000,0.304800> rotate<0,-90.000000,0> translate<41.808400,-1.535000,46.397694> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.857031,-1.535000,17.310216>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.501184,-1.535000,17.043400>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,22.498414,0> translate<41.857031,-1.535000,17.310216> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.013131,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.839097,-1.535000,41.452800>}
box{<0,0,-0.304800><2.825966,0.035000,0.304800> rotate<0,0.000000,0> translate<42.013131,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.040050,-1.535000,41.463950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.483047,-1.535000,41.906947>}
box{<0,0,-0.304800><0.626492,0.035000,0.304800> rotate<0,-44.997030,0> translate<42.040050,-1.535000,41.463950> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.067706,-1.535000,58.023609>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.311522,-1.535000,57.779797>}
box{<0,0,-0.304800><0.344805,0.035000,0.304800> rotate<0,44.996663,0> translate<42.067706,-1.535000,58.023609> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.483047,-1.535000,41.906947>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.722797,-1.535000,42.485750>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,-67.495385,0> translate<42.483047,-1.535000,41.906947> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.501184,-1.535000,17.043400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.874813,-1.535000,17.043400>}
box{<0,0,-0.304800><2.373628,0.035000,0.304800> rotate<0,0.000000,0> translate<42.501184,-1.535000,17.043400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.515872,-1.535000,43.611800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.722797,-1.535000,43.112247>}
box{<0,0,-0.304800><0.540714,0.035000,0.304800> rotate<0,67.495220,0> translate<42.515872,-1.535000,43.611800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.515872,-1.535000,43.611800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.305703,-1.535000,43.611800>}
box{<0,0,-0.304800><1.789831,0.035000,0.304800> rotate<0,0.000000,0> translate<42.515872,-1.535000,43.611800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.547438,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.229497,-1.535000,42.062400>}
box{<0,0,-0.304800><1.682059,0.035000,0.304800> rotate<0,0.000000,0> translate<42.547438,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.588813,-1.535000,29.108400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.232966,-1.535000,29.375216>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,-22.498414,0> translate<42.588813,-1.535000,29.108400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.588813,-1.535000,37.693597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.232966,-1.535000,37.426781>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,22.498414,0> translate<42.588813,-1.535000,37.693597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.652650,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.145200,-1.535000,43.281600>}
box{<0,0,-0.304800><1.492550,0.035000,0.304800> rotate<0,0.000000,0> translate<42.652650,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.722797,-1.535000,42.485750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.722797,-1.535000,43.112247>}
box{<0,0,-0.304800><0.626497,0.035000,0.304800> rotate<0,90.000000,0> translate<42.722797,-1.535000,43.112247> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.722797,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.145200,-1.535000,42.672000>}
box{<0,0,-0.304800><1.422403,0.035000,0.304800> rotate<0,0.000000,0> translate<42.722797,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.956738,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.516800,-1.535000,29.260800>}
box{<0,0,-0.304800><2.560063,0.035000,0.304800> rotate<0,0.000000,0> translate<42.956738,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.232966,-1.535000,29.375216>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.725981,-1.535000,29.868231>}
box{<0,0,-0.304800><0.697229,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.232966,-1.535000,29.375216> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.232966,-1.535000,37.426781>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.499550,-1.535000,37.160197>}
box{<0,0,-0.304800><0.377007,0.035000,0.304800> rotate<0,44.997030,0> translate<43.232966,-1.535000,37.426781> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.448747,-1.535000,32.130997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.626547,-1.535000,32.308800>}
box{<0,0,-0.304800><0.251449,0.035000,0.304800> rotate<0,-44.997534,0> translate<43.448747,-1.535000,32.130997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.448747,-1.535000,32.130997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.725981,-1.535000,31.853766>}
box{<0,0,-0.304800><0.392066,0.035000,0.304800> rotate<0,44.996707,0> translate<43.448747,-1.535000,32.130997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.474147,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.403000,-1.535000,37.185600>}
box{<0,0,-0.304800><5.928853,0.035000,0.304800> rotate<0,0.000000,0> translate<43.474147,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.499550,-1.535000,37.160197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.819513,-1.535000,37.160197>}
box{<0,0,-0.304800><1.319963,0.035000,0.304800> rotate<0,0.000000,0> translate<43.499550,-1.535000,37.160197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.591706,-1.535000,28.463387>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.983797,-1.535000,28.625797>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,-22.498530,0> translate<43.591706,-1.535000,28.463387> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.626547,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.325991,-1.535000,32.308800>}
box{<0,0,-0.304800><0.699444,0.035000,0.304800> rotate<0,0.000000,0> translate<43.626547,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.725981,-1.535000,29.868231>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.992797,-1.535000,30.512384>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,-67.495647,0> translate<43.725981,-1.535000,29.868231> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.725981,-1.535000,31.853766>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.992797,-1.535000,31.209613>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,67.495647,0> translate<43.725981,-1.535000,31.853766> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.726878,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.516800,-1.535000,29.870400>}
box{<0,0,-0.304800><1.789922,0.035000,0.304800> rotate<0,0.000000,0> translate<43.726878,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.738797,-1.535000,59.729797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.738797,-1.535000,61.417200>}
box{<0,0,-0.304800><1.687403,0.035000,0.304800> rotate<0,90.000000,0> translate<43.738797,-1.535000,61.417200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.738797,-1.535000,59.729797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.870600,-1.535000,59.729797>}
box{<0,0,-0.304800><0.131803,0.035000,0.304800> rotate<0,0.000000,0> translate<43.738797,-1.535000,59.729797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.738797,-1.535000,59.740800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.870600,-1.535000,59.740800>}
box{<0,0,-0.304800><0.131803,0.035000,0.304800> rotate<0,0.000000,0> translate<43.738797,-1.535000,59.740800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.738797,-1.535000,60.350400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.870600,-1.535000,60.350400>}
box{<0,0,-0.304800><0.131803,0.035000,0.304800> rotate<0,0.000000,0> translate<43.738797,-1.535000,60.350400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.738797,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.870600,-1.535000,60.960000>}
box{<0,0,-0.304800><0.131803,0.035000,0.304800> rotate<0,0.000000,0> translate<43.738797,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.738797,-1.535000,61.417200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.008116,-1.535000,61.417200>}
box{<0,0,-0.304800><0.269319,0.035000,0.304800> rotate<0,0.000000,0> translate<43.738797,-1.535000,61.417200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.774275,-1.535000,25.628597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.408288,-1.535000,26.262609>}
box{<0,0,-0.304800><0.896629,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.774275,-1.535000,25.628597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.774275,-1.535000,25.628597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.874813,-1.535000,25.628597>}
box{<0,0,-0.304800><1.100538,0.035000,0.304800> rotate<0,0.000000,0> translate<43.774275,-1.535000,25.628597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.790006,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.935591,-1.535000,31.699200>}
box{<0,0,-0.304800><1.145584,0.035000,0.304800> rotate<0,0.000000,0> translate<43.790006,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.870600,-1.535000,60.994884>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.870600,-1.535000,59.729797>}
box{<0,0,-0.304800><1.265087,0.035000,0.304800> rotate<0,-90.000000,0> translate<43.870600,-1.535000,59.729797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.870600,-1.535000,60.994884>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.009809,-1.535000,61.330966>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,-67.495551,0> translate<43.870600,-1.535000,60.994884> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.979381,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.516800,-1.535000,30.480000>}
box{<0,0,-0.304800><1.537419,0.035000,0.304800> rotate<0,0.000000,0> translate<43.979381,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.983797,-1.535000,28.625797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.178697,-1.535000,28.625797>}
box{<0,0,-0.304800><0.194900,0.035000,0.304800> rotate<0,0.000000,0> translate<43.983797,-1.535000,28.625797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.992797,-1.535000,30.512384>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.992797,-1.535000,31.209613>}
box{<0,0,-0.304800><0.697228,0.035000,0.304800> rotate<0,90.000000,0> translate<43.992797,-1.535000,31.209613> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.992797,-1.535000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.516800,-1.535000,31.089600>}
box{<0,0,-0.304800><1.524003,0.035000,0.304800> rotate<0,0.000000,0> translate<43.992797,-1.535000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.008116,-1.535000,61.417200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.052081,-1.535000,61.373234>}
box{<0,0,-0.304800><0.062177,0.035000,0.304800> rotate<0,44.997030,0> translate<44.008116,-1.535000,61.417200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.009809,-1.535000,61.330966>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.052081,-1.535000,61.373234>}
box{<0,0,-0.304800><0.059779,0.035000,0.304800> rotate<0,-44.994912,0> translate<44.009809,-1.535000,61.330966> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.043597,-1.535000,46.050197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.043597,-1.535000,51.411247>}
box{<0,0,-0.304800><5.361050,0.035000,0.304800> rotate<0,90.000000,0> translate<44.043597,-1.535000,51.411247> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.043597,-1.535000,46.050197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.204100,-1.535000,46.050197>}
box{<0,0,-0.304800><0.160503,0.035000,0.304800> rotate<0,0.000000,0> translate<44.043597,-1.535000,46.050197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.043597,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.483503,-1.535000,46.329600>}
box{<0,0,-0.304800><0.439906,0.035000,0.304800> rotate<0,0.000000,0> translate<44.043597,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.043597,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.888600,-1.535000,46.939200>}
box{<0,0,-0.304800><10.845003,0.035000,0.304800> rotate<0,0.000000,0> translate<44.043597,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.043597,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.888600,-1.535000,47.548800>}
box{<0,0,-0.304800><10.845003,0.035000,0.304800> rotate<0,0.000000,0> translate<44.043597,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.043597,-1.535000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.888600,-1.535000,48.158400>}
box{<0,0,-0.304800><10.845003,0.035000,0.304800> rotate<0,0.000000,0> translate<44.043597,-1.535000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.043597,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.888600,-1.535000,48.768000>}
box{<0,0,-0.304800><10.845003,0.035000,0.304800> rotate<0,0.000000,0> translate<44.043597,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.043597,-1.535000,49.377600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.621475,-1.535000,49.377600>}
box{<0,0,-0.304800><4.577878,0.035000,0.304800> rotate<0,0.000000,0> translate<44.043597,-1.535000,49.377600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.043597,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.818116,-1.535000,49.987200>}
box{<0,0,-0.304800><3.774519,0.035000,0.304800> rotate<0,0.000000,0> translate<44.043597,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.043597,-1.535000,50.596800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.208516,-1.535000,50.596800>}
box{<0,0,-0.304800><3.164919,0.035000,0.304800> rotate<0,0.000000,0> translate<44.043597,-1.535000,50.596800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.043597,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.248441,-1.535000,51.206400>}
box{<0,0,-0.304800><0.204844,0.035000,0.304800> rotate<0,0.000000,0> translate<44.043597,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.043597,-1.535000,51.411247>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.267031,-1.535000,51.187809>}
box{<0,0,-0.304800><0.315986,0.035000,0.304800> rotate<0,44.997431,0> translate<44.043597,-1.535000,51.411247> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.145200,-1.535000,42.146697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.067697,-1.535000,41.224200>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,44.997030,0> translate<44.145200,-1.535000,42.146697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.145200,-1.535000,43.451300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.145200,-1.535000,42.146697>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,-90.000000,0> translate<44.145200,-1.535000,42.146697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.145200,-1.535000,43.451300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.305703,-1.535000,43.611800>}
box{<0,0,-0.304800><0.226983,0.035000,0.304800> rotate<0,-44.996472,0> translate<44.145200,-1.535000,43.451300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.178697,-1.535000,28.625797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.686697,-1.535000,29.133797>}
box{<0,0,-0.304800><0.718420,0.035000,0.304800> rotate<0,-44.997030,0> translate<44.178697,-1.535000,28.625797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.204100,-1.535000,46.050197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.067697,-1.535000,46.913797>}
box{<0,0,-0.304800><1.221313,0.035000,0.304800> rotate<0,-44.997134,0> translate<44.204100,-1.535000,46.050197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.267031,-1.535000,51.187809>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.603113,-1.535000,51.048600>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,22.498510,0> translate<44.267031,-1.535000,51.187809> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.325991,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.516800,-1.535000,31.117991>}
box{<0,0,-0.304800><1.684059,0.035000,0.304800> rotate<0,44.997030,0> translate<44.325991,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.358478,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.458097,-1.535000,26.212800>}
box{<0,0,-0.304800><0.099619,0.035000,0.304800> rotate<0,0.000000,0> translate<44.358478,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.408288,-1.535000,26.262609>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.686697,-1.535000,25.984200>}
box{<0,0,-0.304800><0.393730,0.035000,0.304800> rotate<0,44.997030,0> translate<44.408288,-1.535000,26.262609> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.603113,-1.535000,51.048600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.466884,-1.535000,51.048600>}
box{<0,0,-0.304800><1.863772,0.035000,0.304800> rotate<0,0.000000,0> translate<44.603113,-1.535000,51.048600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.662200,-1.535000,63.550797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.054291,-1.535000,63.388388>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,22.498530,0> translate<44.662200,-1.535000,63.550797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.686697,-1.535000,25.984200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.516800,-1.535000,25.984200>}
box{<0,0,-0.304800><0.830103,0.035000,0.304800> rotate<0,0.000000,0> translate<44.686697,-1.535000,25.984200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.686697,-1.535000,29.133797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.516800,-1.535000,29.133797>}
box{<0,0,-0.304800><0.830103,0.035000,0.304800> rotate<0,0.000000,0> translate<44.686697,-1.535000,29.133797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.819513,-1.535000,37.160197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.267619,-1.535000,36.974584>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,22.498604,0> translate<44.819513,-1.535000,37.160197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.874813,-1.535000,17.043400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.518966,-1.535000,17.310216>}
box{<0,0,-0.304800><0.697226,0.035000,0.304800> rotate<0,-22.498414,0> translate<44.874813,-1.535000,17.043400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.874813,-1.535000,25.628597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.516800,-1.535000,25.362678>}
box{<0,0,-0.304800><0.694882,0.035000,0.304800> rotate<0,22.498425,0> translate<44.874813,-1.535000,25.628597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.936128,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.516800,-1.535000,25.603200>}
box{<0,0,-0.304800><0.580672,0.035000,0.304800> rotate<0,0.000000,0> translate<44.936128,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.936131,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.029863,-1.535000,17.068800>}
box{<0,0,-0.304800><3.093731,0.035000,0.304800> rotate<0,0.000000,0> translate<44.936131,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.030119,-1.535000,63.398400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.582800,-1.535000,63.398400>}
box{<0,0,-0.304800><20.552681,0.035000,0.304800> rotate<0,0.000000,0> translate<45.030119,-1.535000,63.398400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.054291,-1.535000,63.388388>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.272881,-1.535000,63.169797>}
box{<0,0,-0.304800><0.309134,0.035000,0.304800> rotate<0,44.997030,0> translate<45.054291,-1.535000,63.388388> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.067697,-1.535000,41.224200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.347103,-1.535000,41.224200>}
box{<0,0,-0.304800><0.279406,0.035000,0.304800> rotate<0,0.000000,0> translate<45.067697,-1.535000,41.224200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.067697,-1.535000,46.913797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.372300,-1.535000,46.913797>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,0.000000,0> translate<45.067697,-1.535000,46.913797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.161200,-1.535000,39.733697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.083697,-1.535000,38.811200>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,44.997030,0> translate<45.161200,-1.535000,39.733697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.161200,-1.535000,41.038300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.161200,-1.535000,39.733697>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,-90.000000,0> translate<45.161200,-1.535000,39.733697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.161200,-1.535000,41.038300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.347103,-1.535000,41.224200>}
box{<0,0,-0.304800><0.262905,0.035000,0.304800> rotate<0,-44.996549,0> translate<45.161200,-1.535000,41.038300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.267619,-1.535000,36.974584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.488403,-1.535000,36.753797>}
box{<0,0,-0.304800><0.312238,0.035000,0.304800> rotate<0,44.997436,0> translate<45.267619,-1.535000,36.974584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.272881,-1.535000,63.169797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.727200,-1.535000,63.169797>}
box{<0,0,-0.304800><11.454319,0.035000,0.304800> rotate<0,0.000000,0> translate<45.272881,-1.535000,63.169797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.488403,-1.535000,36.753797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.991300,-1.535000,36.753797>}
box{<0,0,-0.304800><0.502897,0.035000,0.304800> rotate<0,0.000000,0> translate<45.488403,-1.535000,36.753797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.516800,-1.535000,25.984200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.516800,-1.535000,25.362678>}
box{<0,0,-0.304800><0.621522,0.035000,0.304800> rotate<0,-90.000000,0> translate<45.516800,-1.535000,25.362678> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.516800,-1.535000,31.117991>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.516800,-1.535000,29.133797>}
box{<0,0,-0.304800><1.984194,0.035000,0.304800> rotate<0,-90.000000,0> translate<45.516800,-1.535000,29.133797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.518966,-1.535000,17.310216>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.785550,-1.535000,17.576800>}
box{<0,0,-0.304800><0.377007,0.035000,0.304800> rotate<0,-44.997030,0> translate<45.518966,-1.535000,17.310216> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.785550,-1.535000,17.576800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.835513,-1.535000,17.576800>}
box{<0,0,-0.304800><0.049962,0.035000,0.304800> rotate<0,0.000000,0> translate<45.785550,-1.535000,17.576800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.835513,-1.535000,17.576800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.283619,-1.535000,17.762412>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-22.498604,0> translate<45.835513,-1.535000,17.576800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.991300,-1.535000,36.753797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.913797,-1.535000,35.831300>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,44.997030,0> translate<45.991300,-1.535000,36.753797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.080794,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.495556,-1.535000,17.678400>}
box{<0,0,-0.304800><1.414762,0.035000,0.304800> rotate<0,0.000000,0> translate<46.080794,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.083697,-1.535000,38.811200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.388300,-1.535000,38.811200>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,0.000000,0> translate<46.083697,-1.535000,38.811200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.169097,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.859522,-1.535000,36.576000>}
box{<0,0,-0.304800><2.690425,0.035000,0.304800> rotate<0,0.000000,0> translate<46.169097,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.235150,-1.535000,33.848053>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.685200,-1.535000,33.398000>}
box{<0,0,-0.304800><0.636469,0.035000,0.304800> rotate<0,44.997229,0> translate<46.235150,-1.535000,33.848053> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.235150,-1.535000,33.848053>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.774372,-1.535000,34.387272>}
box{<0,0,-0.304800><0.762573,0.035000,0.304800> rotate<0,-44.996864,0> translate<46.235150,-1.535000,33.848053> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.283619,-1.535000,17.762412>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.753584,-1.535000,18.232378>}
box{<0,0,-0.304800><0.664632,0.035000,0.304800> rotate<0,-44.997030,0> translate<46.283619,-1.535000,17.762412> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.372300,-1.535000,46.913797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.294797,-1.535000,45.991300>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,44.997030,0> translate<46.372300,-1.535000,46.913797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.466884,-1.535000,51.048600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.696219,-1.535000,51.143594>}
box{<0,0,-0.304800><0.248230,0.035000,0.304800> rotate<0,-22.498588,0> translate<46.466884,-1.535000,51.048600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.524697,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.685200,-1.535000,34.137600>}
box{<0,0,-0.304800><0.160503,0.035000,0.304800> rotate<0,0.000000,0> translate<46.524697,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.555203,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.685200,-1.535000,33.528000>}
box{<0,0,-0.304800><0.129997,0.035000,0.304800> rotate<0,0.000000,0> translate<46.555203,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.685200,-1.535000,34.172000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.685200,-1.535000,33.398000>}
box{<0,0,-0.304800><0.774000,0.035000,0.304800> rotate<0,-90.000000,0> translate<46.685200,-1.535000,33.398000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.685200,-1.535000,34.172000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.774372,-1.535000,34.387272>}
box{<0,0,-0.304800><0.233010,0.035000,0.304800> rotate<0,-67.494785,0> translate<46.685200,-1.535000,34.172000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.696219,-1.535000,51.143594>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.720609,-1.535000,51.084706>}
box{<0,0,-0.304800><0.063739,0.035000,0.304800> rotate<0,67.496688,0> translate<46.696219,-1.535000,51.143594> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.720609,-1.535000,51.084706>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.990609,-1.535000,49.814706>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<46.720609,-1.535000,51.084706> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.753584,-1.535000,18.232378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.929269,-1.535000,18.656522>}
box{<0,0,-0.304800><0.459089,0.035000,0.304800> rotate<0,-67.495743,0> translate<46.753584,-1.535000,18.232378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.776622,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.297791,-1.535000,18.288000>}
box{<0,0,-0.304800><0.521169,0.035000,0.304800> rotate<0,0.000000,0> translate<46.776622,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.778697,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.249922,-1.535000,35.966400>}
box{<0,0,-0.304800><1.471225,0.035000,0.304800> rotate<0,0.000000,0> translate<46.778697,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.913797,-1.535000,34.630275>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.913797,-1.535000,35.831300>}
box{<0,0,-0.304800><1.201025,0.035000,0.304800> rotate<0,90.000000,0> translate<46.913797,-1.535000,35.831300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.913797,-1.535000,34.630275>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.403000,-1.535000,37.119481>}
box{<0,0,-0.304800><3.520267,0.035000,0.304800> rotate<0,-44.997066,0> translate<46.913797,-1.535000,34.630275> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.913797,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.030722,-1.535000,34.747200>}
box{<0,0,-0.304800><0.116925,0.035000,0.304800> rotate<0,0.000000,0> translate<46.913797,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.913797,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.640322,-1.535000,35.356800>}
box{<0,0,-0.304800><0.726525,0.035000,0.304800> rotate<0,0.000000,0> translate<46.913797,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.929269,-1.535000,18.656522>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.320200,-1.535000,18.265591>}
box{<0,0,-0.304800><0.552860,0.035000,0.304800> rotate<0,44.997030,0> translate<46.929269,-1.535000,18.656522> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.956497,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.888600,-1.535000,46.329600>}
box{<0,0,-0.304800><7.932103,0.035000,0.304800> rotate<0,0.000000,0> translate<46.956497,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.108894,-1.535000,43.637200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.294797,-1.535000,43.451300>}
box{<0,0,-0.304800><0.262905,0.035000,0.304800> rotate<0,44.996549,0> translate<47.108894,-1.535000,43.637200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.108894,-1.535000,43.637200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.590200,-1.535000,43.637200>}
box{<0,0,-0.304800><1.481306,0.035000,0.304800> rotate<0,0.000000,0> translate<47.108894,-1.535000,43.637200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.294797,-1.535000,42.948406>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.294797,-1.535000,43.451300>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,90.000000,0> translate<47.294797,-1.535000,43.451300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.294797,-1.535000,42.948406>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.769584,-1.535000,42.473619>}
box{<0,0,-0.304800><0.671451,0.035000,0.304800> rotate<0,44.997030,0> translate<47.294797,-1.535000,42.948406> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.294797,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.590200,-1.535000,43.281600>}
box{<0,0,-0.304800><1.295403,0.035000,0.304800> rotate<0,0.000000,0> translate<47.294797,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.294797,-1.535000,45.770797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.294797,-1.535000,45.991300>}
box{<0,0,-0.304800><0.220503,0.035000,0.304800> rotate<0,90.000000,0> translate<47.294797,-1.535000,45.991300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.294797,-1.535000,45.770797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.888600,-1.535000,45.770797>}
box{<0,0,-0.304800><7.593803,0.035000,0.304800> rotate<0,0.000000,0> translate<47.294797,-1.535000,45.770797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.320200,-1.535000,18.101750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.559950,-1.535000,17.522947>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,67.495385,0> translate<47.320200,-1.535000,18.101750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.320200,-1.535000,18.265591>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.320200,-1.535000,18.101750>}
box{<0,0,-0.304800><0.163841,0.035000,0.304800> rotate<0,-90.000000,0> translate<47.320200,-1.535000,18.101750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.388300,-1.535000,38.811200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.310797,-1.535000,39.733697>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,-44.997030,0> translate<47.388300,-1.535000,38.811200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.559950,-1.535000,17.522947>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.002947,-1.535000,17.079950>}
box{<0,0,-0.304800><0.626492,0.035000,0.304800> rotate<0,44.997030,0> translate<47.559950,-1.535000,17.522947> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.571203,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.305759,-1.535000,42.672000>}
box{<0,0,-0.304800><0.734556,0.035000,0.304800> rotate<0,0.000000,0> translate<47.571203,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.591500,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.177391,-1.535000,39.014400>}
box{<0,0,-0.304800><1.585891,0.035000,0.304800> rotate<0,0.000000,0> translate<47.591500,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.769584,-1.535000,42.473619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.955197,-1.535000,42.025513>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,67.495456,0> translate<47.769584,-1.535000,42.473619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.939919,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.189400,-1.535000,42.062400>}
box{<0,0,-0.304800><0.249481,0.035000,0.304800> rotate<0,0.000000,0> translate<47.939919,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.955197,-1.535000,41.393897>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.955197,-1.535000,42.025513>}
box{<0,0,-0.304800><0.631616,0.035000,0.304800> rotate<0,90.000000,0> translate<47.955197,-1.535000,42.025513> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.955197,-1.535000,41.393897>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.189400,-1.535000,41.159694>}
box{<0,0,-0.304800><0.331213,0.035000,0.304800> rotate<0,44.997030,0> translate<47.955197,-1.535000,41.393897> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.955197,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.189400,-1.535000,41.452800>}
box{<0,0,-0.304800><0.234203,0.035000,0.304800> rotate<0,0.000000,0> translate<47.955197,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.990609,-1.535000,49.814706>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.290706,-1.535000,49.514609>}
box{<0,0,-0.304800><0.424401,0.035000,0.304800> rotate<0,44.997030,0> translate<47.990609,-1.535000,49.814706> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.002947,-1.535000,17.079950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.581750,-1.535000,16.840200>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,22.498675,0> translate<48.002947,-1.535000,17.079950> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.189400,-1.535000,42.391084>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.189400,-1.535000,41.159694>}
box{<0,0,-0.304800><1.231391,0.035000,0.304800> rotate<0,-90.000000,0> translate<48.189400,-1.535000,41.159694> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.189400,-1.535000,42.391084>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.328609,-1.535000,42.727166>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,-67.495551,0> translate<48.189400,-1.535000,42.391084> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.201100,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.749159,-1.535000,39.624000>}
box{<0,0,-0.304800><0.548059,0.035000,0.304800> rotate<0,0.000000,0> translate<48.201100,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.290706,-1.535000,49.514609>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.682797,-1.535000,49.352200>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,22.498530,0> translate<48.290706,-1.535000,49.514609> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.310797,-1.535000,39.733697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.310797,-1.535000,40.627841>}
box{<0,0,-0.304800><0.894144,0.035000,0.304800> rotate<0,90.000000,0> translate<48.310797,-1.535000,40.627841> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.310797,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.679841,-1.535000,40.233600>}
box{<0,0,-0.304800><0.369044,0.035000,0.304800> rotate<0,0.000000,0> translate<48.310797,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.310797,-1.535000,40.627841>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.328609,-1.535000,40.584831>}
box{<0,0,-0.304800><0.046552,0.035000,0.304800> rotate<0,67.498463,0> translate<48.310797,-1.535000,40.627841> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.328609,-1.535000,40.584831>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.582609,-1.535000,40.330831>}
box{<0,0,-0.304800><0.359210,0.035000,0.304800> rotate<0,44.997030,0> translate<48.328609,-1.535000,40.584831> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.328609,-1.535000,42.727166>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.585831,-1.535000,42.984388>}
box{<0,0,-0.304800><0.363767,0.035000,0.304800> rotate<0,-44.997030,0> translate<48.328609,-1.535000,42.727166> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.581750,-1.535000,16.840200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.208247,-1.535000,16.840200>}
box{<0,0,-0.304800><0.626497,0.035000,0.304800> rotate<0,0.000000,0> translate<48.581750,-1.535000,16.840200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.582609,-1.535000,40.330831>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.691800,-1.535000,40.221641>}
box{<0,0,-0.304800><0.154419,0.035000,0.304800> rotate<0,44.997030,0> translate<48.582609,-1.535000,40.330831> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.585831,-1.535000,42.984388>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.590200,-1.535000,42.986197>}
box{<0,0,-0.304800><0.004729,0.035000,0.304800> rotate<0,-22.496047,0> translate<48.585831,-1.535000,42.984388> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.590200,-1.535000,43.637200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.590200,-1.535000,42.986197>}
box{<0,0,-0.304800><0.651003,0.035000,0.304800> rotate<0,-90.000000,0> translate<48.590200,-1.535000,42.986197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.682797,-1.535000,49.352200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.888600,-1.535000,49.352200>}
box{<0,0,-0.304800><6.205803,0.035000,0.304800> rotate<0,0.000000,0> translate<48.682797,-1.535000,49.352200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.691800,-1.535000,39.762484>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.877413,-1.535000,39.314378>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,67.495456,0> translate<48.691800,-1.535000,39.762484> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.691800,-1.535000,40.221641>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.691800,-1.535000,39.762484>}
box{<0,0,-0.304800><0.459156,0.035000,0.304800> rotate<0,-90.000000,0> translate<48.691800,-1.535000,39.762484> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.818797,-1.535000,28.244797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.818797,-1.535000,33.517916>}
box{<0,0,-0.304800><5.273119,0.035000,0.304800> rotate<0,90.000000,0> translate<48.818797,-1.535000,33.517916> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.818797,-1.535000,28.244797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.547300,-1.535000,28.244797>}
box{<0,0,-0.304800><0.728503,0.035000,0.304800> rotate<0,0.000000,0> translate<48.818797,-1.535000,28.244797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.818797,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.080209,-1.535000,28.651200>}
box{<0,0,-0.304800><1.261412,0.035000,0.304800> rotate<0,0.000000,0> translate<48.818797,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.818797,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.580506,-1.535000,29.260800>}
box{<0,0,-0.304800><0.761709,0.035000,0.304800> rotate<0,0.000000,0> translate<48.818797,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.818797,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.403000,-1.535000,29.870400>}
box{<0,0,-0.304800><0.584203,0.035000,0.304800> rotate<0,0.000000,0> translate<48.818797,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.818797,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.403000,-1.535000,30.480000>}
box{<0,0,-0.304800><0.584203,0.035000,0.304800> rotate<0,0.000000,0> translate<48.818797,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.818797,-1.535000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.403000,-1.535000,31.089600>}
box{<0,0,-0.304800><0.584203,0.035000,0.304800> rotate<0,0.000000,0> translate<48.818797,-1.535000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.818797,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.403000,-1.535000,31.699200>}
box{<0,0,-0.304800><0.584203,0.035000,0.304800> rotate<0,0.000000,0> translate<48.818797,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.818797,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.580509,-1.535000,32.308800>}
box{<0,0,-0.304800><0.761713,0.035000,0.304800> rotate<0,0.000000,0> translate<48.818797,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.818797,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.080213,-1.535000,32.918400>}
box{<0,0,-0.304800><1.261416,0.035000,0.304800> rotate<0,0.000000,0> translate<48.818797,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.818797,-1.535000,33.517916>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.324322,-1.535000,35.023441>}
box{<0,0,-0.304800><2.129134,0.035000,0.304800> rotate<0,-44.997030,0> translate<48.818797,-1.535000,33.517916> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.828881,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,33.528000>}
box{<0,0,-0.304800><3.825319,0.035000,0.304800> rotate<0,0.000000,0> translate<48.828881,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.877413,-1.535000,39.314378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.220378,-1.535000,38.971412>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,44.997030,0> translate<48.877413,-1.535000,39.314378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.208247,-1.535000,16.840200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.787050,-1.535000,17.079950>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,-22.498675,0> translate<49.208247,-1.535000,16.840200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.220378,-1.535000,38.971412>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.521956,-1.535000,38.669837>}
box{<0,0,-0.304800><0.426494,0.035000,0.304800> rotate<0,44.996733,0> translate<49.220378,-1.535000,38.971412> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.326797,-1.535000,52.257881>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.326797,-1.535000,53.939522>}
box{<0,0,-0.304800><1.681641,0.035000,0.304800> rotate<0,90.000000,0> translate<49.326797,-1.535000,53.939522> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.326797,-1.535000,52.257881>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.590881,-1.535000,51.993797>}
box{<0,0,-0.304800><0.373472,0.035000,0.304800> rotate<0,44.997030,0> translate<49.326797,-1.535000,52.257881> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.326797,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.840719,-1.535000,52.425600>}
box{<0,0,-0.304800><1.513922,0.035000,0.304800> rotate<0,0.000000,0> translate<49.326797,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.326797,-1.535000,53.035200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.231119,-1.535000,53.035200>}
box{<0,0,-0.304800><0.904322,0.035000,0.304800> rotate<0,0.000000,0> translate<49.326797,-1.535000,53.035200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.326797,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.621519,-1.535000,53.644800>}
box{<0,0,-0.304800><0.294722,0.035000,0.304800> rotate<0,0.000000,0> translate<49.326797,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.326797,-1.535000,53.939522>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.272522,-1.535000,51.993797>}
box{<0,0,-0.304800><2.751671,0.035000,0.304800> rotate<0,44.997030,0> translate<49.326797,-1.535000,53.939522> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.403000,-1.535000,29.689341>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.658216,-1.535000,29.073194>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,67.495606,0> translate<49.403000,-1.535000,29.689341> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.403000,-1.535000,31.880256>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.403000,-1.535000,29.689341>}
box{<0,0,-0.304800><2.190916,0.035000,0.304800> rotate<0,-90.000000,0> translate<49.403000,-1.535000,29.689341> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.403000,-1.535000,31.880256>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.658216,-1.535000,32.496403>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-67.495606,0> translate<49.403000,-1.535000,31.880256> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.403000,-1.535000,38.382656>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.403000,-1.535000,37.119481>}
box{<0,0,-0.304800><1.263175,0.035000,0.304800> rotate<0,-90.000000,0> translate<49.403000,-1.535000,37.119481> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.403000,-1.535000,38.382656>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.521956,-1.535000,38.669837>}
box{<0,0,-0.304800><0.310843,0.035000,0.304800> rotate<0,-67.495225,0> translate<49.403000,-1.535000,38.382656> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.438481,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,34.137600>}
box{<0,0,-0.304800><3.215719,0.035000,0.304800> rotate<0,0.000000,0> translate<49.438481,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.547300,-1.535000,28.244797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.902897,-1.535000,27.889197>}
box{<0,0,-0.304800><0.502892,0.035000,0.304800> rotate<0,44.997282,0> translate<49.547300,-1.535000,28.244797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.590881,-1.535000,51.993797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.272522,-1.535000,51.993797>}
box{<0,0,-0.304800><1.681641,0.035000,0.304800> rotate<0,0.000000,0> translate<49.590881,-1.535000,51.993797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.658216,-1.535000,29.073194>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.129794,-1.535000,28.601616>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,44.997030,0> translate<49.658216,-1.535000,29.073194> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.658216,-1.535000,32.496403>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.129794,-1.535000,32.967981>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-44.997030,0> translate<49.658216,-1.535000,32.496403> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.750497,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,28.041600>}
box{<0,0,-0.304800><2.903703,0.035000,0.304800> rotate<0,0.000000,0> translate<49.750497,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.760131,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.205097,-1.535000,17.068800>}
box{<0,0,-0.304800><2.444966,0.035000,0.304800> rotate<0,0.000000,0> translate<49.760131,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.787050,-1.535000,17.079950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.902897,-1.535000,17.195800>}
box{<0,0,-0.304800><0.163834,0.035000,0.304800> rotate<0,-44.997803,0> translate<49.787050,-1.535000,17.079950> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.902897,-1.535000,17.195800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.078100,-1.535000,17.195800>}
box{<0,0,-0.304800><2.175203,0.035000,0.304800> rotate<0,0.000000,0> translate<49.902897,-1.535000,17.195800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.902897,-1.535000,27.889197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.026513,-1.535000,27.889197>}
box{<0,0,-0.304800><0.123616,0.035000,0.304800> rotate<0,0.000000,0> translate<49.902897,-1.535000,27.889197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.972663,-1.535000,23.190200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.114197,-1.535000,22.848513>}
box{<0,0,-0.304800><0.369841,0.035000,0.304800> rotate<0,67.495148,0> translate<49.972663,-1.535000,23.190200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.972663,-1.535000,23.190200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.385200,-1.535000,23.190200>}
box{<0,0,-0.304800><9.412537,0.035000,0.304800> rotate<0,0.000000,0> translate<49.972663,-1.535000,23.190200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.983184,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.385200,-1.535000,23.164800>}
box{<0,0,-0.304800><9.402016,0.035000,0.304800> rotate<0,0.000000,0> translate<49.983184,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.026513,-1.535000,27.889197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.474619,-1.535000,27.703584>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,22.498604,0> translate<50.026513,-1.535000,27.889197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.048081,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,34.747200>}
box{<0,0,-0.304800><2.606119,0.035000,0.304800> rotate<0,0.000000,0> translate<50.048081,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.114197,-1.535000,21.666197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.114197,-1.535000,22.848513>}
box{<0,0,-0.304800><1.182316,0.035000,0.304800> rotate<0,90.000000,0> translate<50.114197,-1.535000,22.848513> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.114197,-1.535000,21.666197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.824100,-1.535000,21.666197>}
box{<0,0,-0.304800><1.709903,0.035000,0.304800> rotate<0,0.000000,0> translate<50.114197,-1.535000,21.666197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.114197,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.103503,-1.535000,21.945600>}
box{<0,0,-0.304800><1.989306,0.035000,0.304800> rotate<0,0.000000,0> translate<50.114197,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.114197,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.545697,-1.535000,22.555200>}
box{<0,0,-0.304800><9.431500,0.035000,0.304800> rotate<0,0.000000,0> translate<50.114197,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.129794,-1.535000,28.601616>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.745941,-1.535000,28.346400>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,22.498454,0> translate<50.129794,-1.535000,28.601616> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.129794,-1.535000,32.967981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.745941,-1.535000,33.223197>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-22.498454,0> translate<50.129794,-1.535000,32.967981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.215797,-1.535000,56.067881>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.215797,-1.535000,57.497009>}
box{<0,0,-0.304800><1.429128,0.035000,0.304800> rotate<0,90.000000,0> translate<50.215797,-1.535000,57.497009> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.215797,-1.535000,56.067881>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.622200,-1.535000,55.661475>}
box{<0,0,-0.304800><0.574743,0.035000,0.304800> rotate<0,44.997250,0> translate<50.215797,-1.535000,56.067881> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.215797,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.622200,-1.535000,56.083200>}
box{<0,0,-0.304800><0.406403,0.035000,0.304800> rotate<0,0.000000,0> translate<50.215797,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.215797,-1.535000,56.692800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.622200,-1.535000,56.692800>}
box{<0,0,-0.304800><0.406403,0.035000,0.304800> rotate<0,0.000000,0> translate<50.215797,-1.535000,56.692800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.215797,-1.535000,57.302400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.622200,-1.535000,57.302400>}
box{<0,0,-0.304800><0.406403,0.035000,0.304800> rotate<0,0.000000,0> translate<50.215797,-1.535000,57.302400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.215797,-1.535000,57.497009>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.419000,-1.535000,57.700212>}
box{<0,0,-0.304800><0.287373,0.035000,0.304800> rotate<0,-44.997030,0> translate<50.215797,-1.535000,57.497009> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.324322,-1.535000,35.023441>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.745941,-1.535000,34.848800>}
box{<0,0,-0.304800><0.456357,0.035000,0.304800> rotate<0,22.498564,0> translate<50.324322,-1.535000,35.023441> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.419000,-1.535000,57.700212>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.622200,-1.535000,57.497013>}
box{<0,0,-0.304800><0.287368,0.035000,0.304800> rotate<0,44.997030,0> translate<50.419000,-1.535000,57.700212> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.474619,-1.535000,27.703584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.817584,-1.535000,27.360619>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,44.997030,0> translate<50.474619,-1.535000,27.703584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.622200,-1.535000,57.497013>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.622200,-1.535000,55.661475>}
box{<0,0,-0.304800><1.835538,0.035000,0.304800> rotate<0,-90.000000,0> translate<50.622200,-1.535000,55.661475> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.723797,-1.535000,42.986197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.723797,-1.535000,43.637200>}
box{<0,0,-0.304800><0.651003,0.035000,0.304800> rotate<0,90.000000,0> translate<50.723797,-1.535000,43.637200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.723797,-1.535000,42.986197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.728166,-1.535000,42.984388>}
box{<0,0,-0.304800><0.004729,0.035000,0.304800> rotate<0,22.496047,0> translate<50.723797,-1.535000,42.986197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.723797,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,43.281600>}
box{<0,0,-0.304800><1.930403,0.035000,0.304800> rotate<0,0.000000,0> translate<50.723797,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.723797,-1.535000,43.637200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.703078,-1.535000,43.637200>}
box{<0,0,-0.304800><1.979281,0.035000,0.304800> rotate<0,0.000000,0> translate<50.723797,-1.535000,43.637200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.728166,-1.535000,42.984388>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.982166,-1.535000,42.730387>}
box{<0,0,-0.304800><0.359210,0.035000,0.304800> rotate<0,44.997030,0> translate<50.728166,-1.535000,42.984388> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.745941,-1.535000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.412856,-1.535000,28.346400>}
box{<0,0,-0.304800><0.666916,0.035000,0.304800> rotate<0,0.000000,0> translate<50.745941,-1.535000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.745941,-1.535000,33.223197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.412856,-1.535000,33.223197>}
box{<0,0,-0.304800><0.666916,0.035000,0.304800> rotate<0,0.000000,0> translate<50.745941,-1.535000,33.223197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.745941,-1.535000,34.848800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.412856,-1.535000,34.848800>}
box{<0,0,-0.304800><0.666916,0.035000,0.304800> rotate<0,0.000000,0> translate<50.745941,-1.535000,34.848800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.746203,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,27.432000>}
box{<0,0,-0.304800><1.907997,0.035000,0.304800> rotate<0,0.000000,0> translate<50.746203,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.817584,-1.535000,27.360616>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.817584,-1.535000,27.360619>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<50.817584,-1.535000,27.360619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.817584,-1.535000,27.360616>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.940003,-1.535000,26.238197>}
box{<0,0,-0.304800><1.587340,0.035000,0.304800> rotate<0,44.997030,0> translate<50.817584,-1.535000,27.360616> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.982166,-1.535000,42.730387>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.239387,-1.535000,42.473166>}
box{<0,0,-0.304800><0.363767,0.035000,0.304800> rotate<0,44.997030,0> translate<50.982166,-1.535000,42.730387> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.040553,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,42.672000>}
box{<0,0,-0.304800><1.613647,0.035000,0.304800> rotate<0,0.000000,0> translate<51.040553,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.239387,-1.535000,42.473166>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.378597,-1.535000,42.137084>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,67.495551,0> translate<51.239387,-1.535000,42.473166> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.259884,-1.535000,40.380319>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.378597,-1.535000,40.666913>}
box{<0,0,-0.304800><0.310207,0.035000,0.304800> rotate<0,-67.495292,0> translate<51.259884,-1.535000,40.380319> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.259884,-1.535000,40.380319>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.112984,-1.535000,39.527219>}
box{<0,0,-0.304800><1.206466,0.035000,0.304800> rotate<0,44.997030,0> translate<51.259884,-1.535000,40.380319> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.355800,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,26.822400>}
box{<0,0,-0.304800><1.298400,0.035000,0.304800> rotate<0,0.000000,0> translate<51.355800,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.378597,-1.535000,40.666913>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.378597,-1.535000,42.137084>}
box{<0,0,-0.304800><1.470172,0.035000,0.304800> rotate<0,90.000000,0> translate<51.378597,-1.535000,42.137084> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.378597,-1.535000,40.843200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,40.843200>}
box{<0,0,-0.304800><1.275603,0.035000,0.304800> rotate<0,0.000000,0> translate<51.378597,-1.535000,40.843200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.378597,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,41.452800>}
box{<0,0,-0.304800><1.275603,0.035000,0.304800> rotate<0,0.000000,0> translate<51.378597,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.378597,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,42.062400>}
box{<0,0,-0.304800><1.275603,0.035000,0.304800> rotate<0,0.000000,0> translate<51.378597,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.406603,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,40.233600>}
box{<0,0,-0.304800><1.247597,0.035000,0.304800> rotate<0,0.000000,0> translate<51.406603,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.412856,-1.535000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.029003,-1.535000,28.601616>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-22.498454,0> translate<51.412856,-1.535000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.412856,-1.535000,33.223197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.029003,-1.535000,32.967981>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,22.498454,0> translate<51.412856,-1.535000,33.223197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.412856,-1.535000,34.848800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.029003,-1.535000,35.104016>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-22.498454,0> translate<51.412856,-1.535000,34.848800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.824100,-1.535000,21.666197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.560697,-1.535000,22.402797>}
box{<0,0,-0.304800><1.041708,0.035000,0.304800> rotate<0,-44.997152,0> translate<51.824100,-1.535000,21.666197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.940003,-1.535000,26.238197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.415516,-1.535000,26.238197>}
box{<0,0,-0.304800><0.475513,0.035000,0.304800> rotate<0,0.000000,0> translate<51.940003,-1.535000,26.238197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.016203,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,39.624000>}
box{<0,0,-0.304800><0.637997,0.035000,0.304800> rotate<0,0.000000,0> translate<52.016203,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.029003,-1.535000,28.601616>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.500581,-1.535000,29.073194>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-44.997030,0> translate<52.029003,-1.535000,28.601616> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.029003,-1.535000,32.967981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.500581,-1.535000,32.496403>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,44.997030,0> translate<52.029003,-1.535000,32.967981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.029003,-1.535000,35.104016>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.500581,-1.535000,35.575594>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-44.997030,0> translate<52.029003,-1.535000,35.104016> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.078100,-1.535000,17.195800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.560697,-1.535000,16.713200>}
box{<0,0,-0.304800><0.682497,0.035000,0.304800> rotate<0,44.997216,0> translate<52.078100,-1.535000,17.195800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.078584,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,32.918400>}
box{<0,0,-0.304800><0.575616,0.035000,0.304800> rotate<0,0.000000,0> translate<52.078584,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.078588,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,28.651200>}
box{<0,0,-0.304800><0.575612,0.035000,0.304800> rotate<0,0.000000,0> translate<52.078588,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.112984,-1.535000,39.527219>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.212559,-1.535000,39.286822>}
box{<0,0,-0.304800><0.260203,0.035000,0.304800> rotate<0,67.495677,0> translate<52.112984,-1.535000,39.527219> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.212559,-1.535000,39.286822>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.500581,-1.535000,38.998803>}
box{<0,0,-0.304800><0.407322,0.035000,0.304800> rotate<0,44.996719,0> translate<52.212559,-1.535000,39.286822> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.281788,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,35.356800>}
box{<0,0,-0.304800><0.372413,0.035000,0.304800> rotate<0,0.000000,0> translate<52.281788,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.415516,-1.535000,26.238197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,26.476881>}
box{<0,0,-0.304800><0.337551,0.035000,0.304800> rotate<0,-44.997030,0> translate<52.415516,-1.535000,26.238197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.484984,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,39.014400>}
box{<0,0,-0.304800><0.169216,0.035000,0.304800> rotate<0,0.000000,0> translate<52.484984,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.500581,-1.535000,29.073194>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,29.444069>}
box{<0,0,-0.304800><0.401431,0.035000,0.304800> rotate<0,-67.495902,0> translate<52.500581,-1.535000,29.073194> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.500581,-1.535000,32.496403>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,32.125528>}
box{<0,0,-0.304800><0.401431,0.035000,0.304800> rotate<0,67.495902,0> translate<52.500581,-1.535000,32.496403> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.500581,-1.535000,35.575594>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,35.946469>}
box{<0,0,-0.304800><0.401431,0.035000,0.304800> rotate<0,-67.495902,0> translate<52.500581,-1.535000,35.575594> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.500581,-1.535000,38.998803>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,38.627928>}
box{<0,0,-0.304800><0.401431,0.035000,0.304800> rotate<0,67.495902,0> translate<52.500581,-1.535000,38.998803> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.560697,-1.535000,16.713200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.865300,-1.535000,16.713200>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,0.000000,0> translate<52.560697,-1.535000,16.713200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.560697,-1.535000,22.402797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.865300,-1.535000,22.402797>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,0.000000,0> translate<52.560697,-1.535000,22.402797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.578288,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,29.260800>}
box{<0,0,-0.304800><0.075913,0.035000,0.304800> rotate<0,0.000000,0> translate<52.578288,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.578291,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,32.308800>}
box{<0,0,-0.304800><0.075909,0.035000,0.304800> rotate<0,0.000000,0> translate<52.578291,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,29.444069>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,26.476881>}
box{<0,0,-0.304800><2.967188,0.035000,0.304800> rotate<0,-90.000000,0> translate<52.654200,-1.535000,26.476881> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,35.946469>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,32.125528>}
box{<0,0,-0.304800><3.820941,0.035000,0.304800> rotate<0,-90.000000,0> translate<52.654200,-1.535000,32.125528> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,43.519200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,38.627928>}
box{<0,0,-0.304800><4.891272,0.035000,0.304800> rotate<0,-90.000000,0> translate<52.654200,-1.535000,38.627928> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.654200,-1.535000,43.519200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.703078,-1.535000,43.637200>}
box{<0,0,-0.304800><0.127723,0.035000,0.304800> rotate<0,-67.495162,0> translate<52.654200,-1.535000,43.519200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.865300,-1.535000,16.713200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.220900,-1.535000,17.068800>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<53.865300,-1.535000,16.713200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.865300,-1.535000,22.402797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.220897,-1.535000,22.047197>}
box{<0,0,-0.304800><0.502892,0.035000,0.304800> rotate<0,44.997282,0> translate<53.865300,-1.535000,22.402797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.898797,-1.535000,55.051881>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.898797,-1.535000,56.479522>}
box{<0,0,-0.304800><1.427641,0.035000,0.304800> rotate<0,90.000000,0> translate<53.898797,-1.535000,56.479522> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.898797,-1.535000,55.051881>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.476881,-1.535000,54.473797>}
box{<0,0,-0.304800><0.817535,0.035000,0.304800> rotate<0,44.997030,0> translate<53.898797,-1.535000,55.051881> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.898797,-1.535000,55.473600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.098475,-1.535000,55.473600>}
box{<0,0,-0.304800><1.199678,0.035000,0.304800> rotate<0,0.000000,0> translate<53.898797,-1.535000,55.473600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.898797,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.295116,-1.535000,56.083200>}
box{<0,0,-0.304800><0.396319,0.035000,0.304800> rotate<0,0.000000,0> translate<53.898797,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.898797,-1.535000,56.479522>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.767706,-1.535000,55.610609>}
box{<0,0,-0.304800><1.228826,0.035000,0.304800> rotate<0,44.997133,0> translate<53.898797,-1.535000,56.479522> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.086678,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.288600,-1.535000,54.864000>}
box{<0,0,-0.304800><3.201922,0.035000,0.304800> rotate<0,0.000000,0> translate<54.086678,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.170097,-1.535000,19.557997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.220897,-1.535000,19.608800>}
box{<0,0,-0.304800><0.071844,0.035000,0.304800> rotate<0,-44.998792,0> translate<54.170097,-1.535000,19.557997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.170097,-1.535000,19.557997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.220900,-1.535000,19.507197>}
box{<0,0,-0.304800><0.071844,0.035000,0.304800> rotate<0,44.995268,0> translate<54.170097,-1.535000,19.557997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.220897,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.053697,-1.535000,19.507200>}
box{<0,0,-0.304800><5.832800,0.035000,0.304800> rotate<0,0.000000,0> translate<54.220897,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.220897,-1.535000,19.608800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.952097,-1.535000,19.608800>}
box{<0,0,-0.304800><5.731200,0.035000,0.304800> rotate<0,0.000000,0> translate<54.220897,-1.535000,19.608800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.220897,-1.535000,22.047197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.952097,-1.535000,22.047197>}
box{<0,0,-0.304800><5.731200,0.035000,0.304800> rotate<0,0.000000,0> translate<54.220897,-1.535000,22.047197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.220900,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.042800,-1.535000,17.068800>}
box{<0,0,-0.304800><8.821900,0.035000,0.304800> rotate<0,0.000000,0> translate<54.220900,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.220900,-1.535000,19.507197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.053703,-1.535000,19.507197>}
box{<0,0,-0.304800><5.832803,0.035000,0.304800> rotate<0,0.000000,0> translate<54.220900,-1.535000,19.507197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.476881,-1.535000,54.473797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.330569,-1.535000,54.473797>}
box{<0,0,-0.304800><2.853687,0.035000,0.304800> rotate<0,0.000000,0> translate<54.476881,-1.535000,54.473797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.767706,-1.535000,55.610609>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.159797,-1.535000,55.448200>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,22.498530,0> translate<54.767706,-1.535000,55.610609> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,26.238197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,28.544953>}
box{<0,0,-0.304800><2.306756,0.035000,0.304800> rotate<0,90.000000,0> translate<54.787797,-1.535000,28.544953> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,26.238197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.940200,-1.535000,26.238197>}
box{<0,0,-0.304800><0.152403,0.035000,0.304800> rotate<0,0.000000,0> translate<54.787797,-1.535000,26.238197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.940200,-1.535000,26.822400>}
box{<0,0,-0.304800><0.152403,0.035000,0.304800> rotate<0,0.000000,0> translate<54.787797,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.049900,-1.535000,27.432000>}
box{<0,0,-0.304800><0.262103,0.035000,0.304800> rotate<0,0.000000,0> translate<54.787797,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.659500,-1.535000,28.041600>}
box{<0,0,-0.304800><0.871703,0.035000,0.304800> rotate<0,0.000000,0> translate<54.787797,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,28.544953>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.267141,-1.535000,28.346400>}
box{<0,0,-0.304800><0.518839,0.035000,0.304800> rotate<0,22.498764,0> translate<54.787797,-1.535000,28.544953> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,33.024644>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,35.047353>}
box{<0,0,-0.304800><2.022709,0.035000,0.304800> rotate<0,90.000000,0> translate<54.787797,-1.535000,35.047353> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,33.024644>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.267141,-1.535000,33.223197>}
box{<0,0,-0.304800><0.518839,0.035000,0.304800> rotate<0,-22.498764,0> translate<54.787797,-1.535000,33.024644> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.311800,-1.535000,33.528000>}
box{<0,0,-0.304800><1.524003,0.035000,0.304800> rotate<0,0.000000,0> translate<54.787797,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.311800,-1.535000,34.137600>}
box{<0,0,-0.304800><1.524003,0.035000,0.304800> rotate<0,0.000000,0> translate<54.787797,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.238591,-1.535000,34.747200>}
box{<0,0,-0.304800><1.450794,0.035000,0.304800> rotate<0,0.000000,0> translate<54.787797,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,35.047353>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.267141,-1.535000,34.848800>}
box{<0,0,-0.304800><0.518839,0.035000,0.304800> rotate<0,22.498764,0> translate<54.787797,-1.535000,35.047353> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,39.659475>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,40.188400>}
box{<0,0,-0.304800><0.528925,0.035000,0.304800> rotate<0,90.000000,0> translate<54.787797,-1.535000,40.188400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,39.659475>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.021706,-1.535000,39.893388>}
box{<0,0,-0.304800><0.330800,0.035000,0.304800> rotate<0,-44.997413,0> translate<54.787797,-1.535000,39.659475> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.787797,-1.535000,40.188400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.316722,-1.535000,40.188400>}
box{<0,0,-0.304800><0.528925,0.035000,0.304800> rotate<0,0.000000,0> translate<54.787797,-1.535000,40.188400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.888600,-1.535000,49.075113>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.888600,-1.535000,45.770797>}
box{<0,0,-0.304800><3.304316,0.035000,0.304800> rotate<0,-90.000000,0> translate<54.888600,-1.535000,45.770797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.888600,-1.535000,49.352200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.888600,-1.535000,49.075113>}
box{<0,0,-0.304800><0.277088,0.035000,0.304800> rotate<0,-90.000000,0> translate<54.888600,-1.535000,49.075113> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.940200,-1.535000,27.322300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.940200,-1.535000,26.238197>}
box{<0,0,-0.304800><1.084103,0.035000,0.304800> rotate<0,-90.000000,0> translate<54.940200,-1.535000,26.238197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.940200,-1.535000,27.322300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.862697,-1.535000,28.244797>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,-44.997030,0> translate<54.940200,-1.535000,27.322300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.021706,-1.535000,39.893388>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.316722,-1.535000,40.188400>}
box{<0,0,-0.304800><0.417213,0.035000,0.304800> rotate<0,-44.996727,0> translate<55.021706,-1.535000,39.893388> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.159797,-1.535000,55.448200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.286200,-1.535000,55.448200>}
box{<0,0,-0.304800><2.126403,0.035000,0.304800> rotate<0,0.000000,0> translate<55.159797,-1.535000,55.448200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.267141,-1.535000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.934056,-1.535000,28.346400>}
box{<0,0,-0.304800><0.666916,0.035000,0.304800> rotate<0,0.000000,0> translate<55.267141,-1.535000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.267141,-1.535000,33.223197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.934056,-1.535000,33.223197>}
box{<0,0,-0.304800><0.666916,0.035000,0.304800> rotate<0,0.000000,0> translate<55.267141,-1.535000,33.223197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.267141,-1.535000,34.848800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.934056,-1.535000,34.848800>}
box{<0,0,-0.304800><0.666916,0.035000,0.304800> rotate<0,0.000000,0> translate<55.267141,-1.535000,34.848800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.862697,-1.535000,28.244797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.311800,-1.535000,28.244797>}
box{<0,0,-0.304800><0.449103,0.035000,0.304800> rotate<0,0.000000,0> translate<55.862697,-1.535000,28.244797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.934056,-1.535000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.311800,-1.535000,28.502869>}
box{<0,0,-0.304800><0.408868,0.035000,0.304800> rotate<0,-22.498795,0> translate<55.934056,-1.535000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.934056,-1.535000,33.223197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.311800,-1.535000,33.066728>}
box{<0,0,-0.304800><0.408868,0.035000,0.304800> rotate<0,22.498795,0> translate<55.934056,-1.535000,33.223197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.934056,-1.535000,34.848800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.077553,-1.535000,34.908241>}
box{<0,0,-0.304800><0.155321,0.035000,0.304800> rotate<0,-22.499290,0> translate<55.934056,-1.535000,34.848800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.077553,-1.535000,34.908241>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.311800,-1.535000,34.673991>}
box{<0,0,-0.304800><0.331277,0.035000,0.304800> rotate<0,44.997412,0> translate<56.077553,-1.535000,34.908241> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.311800,-1.535000,28.502869>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.311800,-1.535000,28.244797>}
box{<0,0,-0.304800><0.258072,0.035000,0.304800> rotate<0,-90.000000,0> translate<56.311800,-1.535000,28.244797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.311800,-1.535000,34.673991>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.311800,-1.535000,33.066728>}
box{<0,0,-0.304800><1.607262,0.035000,0.304800> rotate<0,-90.000000,0> translate<56.311800,-1.535000,33.066728> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.552350,-1.535000,42.875200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.700388,-1.535000,42.727166>}
box{<0,0,-0.304800><0.209354,0.035000,0.304800> rotate<0,44.996425,0> translate<56.552350,-1.535000,42.875200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.552350,-1.535000,42.875200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.362200,-1.535000,42.875200>}
box{<0,0,-0.304800><0.809850,0.035000,0.304800> rotate<0,0.000000,0> translate<56.552350,-1.535000,42.875200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.700388,-1.535000,42.727166>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.702197,-1.535000,42.722797>}
box{<0,0,-0.304800><0.004729,0.035000,0.304800> rotate<0,67.498013,0> translate<56.700388,-1.535000,42.727166> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.702197,-1.535000,42.722797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.544047,-1.535000,42.722797>}
box{<0,0,-0.304800><0.841850,0.035000,0.304800> rotate<0,0.000000,0> translate<56.702197,-1.535000,42.722797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.727200,-1.535000,63.169797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.119291,-1.535000,63.007388>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,22.498530,0> translate<56.727200,-1.535000,63.169797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.119291,-1.535000,63.007388>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.246291,-1.535000,62.880388>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,44.997030,0> translate<57.119291,-1.535000,63.007388> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.246291,-1.535000,62.880388>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.546388,-1.535000,62.580291>}
box{<0,0,-0.304800><0.424401,0.035000,0.304800> rotate<0,44.997030,0> translate<57.246291,-1.535000,62.880388> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.286200,-1.535000,55.144797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.288600,-1.535000,55.139006>}
box{<0,0,-0.304800><0.006268,0.035000,0.304800> rotate<0,67.483347,0> translate<57.286200,-1.535000,55.144797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.286200,-1.535000,55.448200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.286200,-1.535000,55.144797>}
box{<0,0,-0.304800><0.303403,0.035000,0.304800> rotate<0,-90.000000,0> translate<57.286200,-1.535000,55.144797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.288600,-1.535000,54.575113>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.330569,-1.535000,54.473797>}
box{<0,0,-0.304800><0.109664,0.035000,0.304800> rotate<0,67.494366,0> translate<57.288600,-1.535000,54.575113> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.288600,-1.535000,55.139006>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.288600,-1.535000,54.575113>}
box{<0,0,-0.304800><0.563894,0.035000,0.304800> rotate<0,-90.000000,0> translate<57.288600,-1.535000,54.575113> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.337878,-1.535000,62.788800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.582800,-1.535000,62.788800>}
box{<0,0,-0.304800><8.244922,0.035000,0.304800> rotate<0,0.000000,0> translate<57.337878,-1.535000,62.788800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.362200,-1.535000,42.875200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.398413,-1.535000,42.890200>}
box{<0,0,-0.304800><0.039196,0.035000,0.304800> rotate<0,-22.498909,0> translate<57.362200,-1.535000,42.875200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.398413,-1.535000,42.890200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.406616,-1.535000,42.890200>}
box{<0,0,-0.304800><0.008203,0.035000,0.304800> rotate<0,0.000000,0> translate<57.398413,-1.535000,42.890200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.406616,-1.535000,42.890200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.427809,-1.535000,42.839031>}
box{<0,0,-0.304800><0.055384,0.035000,0.304800> rotate<0,67.496539,0> translate<57.406616,-1.535000,42.890200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.427809,-1.535000,42.839031>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.544047,-1.535000,42.722797>}
box{<0,0,-0.304800><0.164382,0.035000,0.304800> rotate<0,44.996260,0> translate<57.427809,-1.535000,42.839031> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.546388,-1.535000,62.580291>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.708797,-1.535000,62.188200>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,67.495530,0> translate<57.546388,-1.535000,62.580291> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.708797,-1.535000,61.750241>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.708797,-1.535000,62.188200>}
box{<0,0,-0.304800><0.437959,0.035000,0.304800> rotate<0,90.000000,0> translate<57.708797,-1.535000,62.188200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.708797,-1.535000,61.750241>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.718603,-1.535000,61.746181>}
box{<0,0,-0.304800><0.010613,0.035000,0.304800> rotate<0,22.486013,0> translate<57.708797,-1.535000,61.750241> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.708797,-1.535000,62.179200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.204588,-1.535000,62.179200>}
box{<0,0,-0.304800><3.495791,0.035000,0.304800> rotate<0,0.000000,0> translate<57.708797,-1.535000,62.179200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.718603,-1.535000,61.746181>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.190181,-1.535000,61.274603>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,44.997030,0> translate<57.718603,-1.535000,61.746181> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.895184,-1.535000,61.569600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.535044,-1.535000,61.569600>}
box{<0,0,-0.304800><0.639859,0.035000,0.304800> rotate<0,0.000000,0> translate<57.895184,-1.535000,61.569600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.920581,-1.535000,57.581797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.997200,-1.535000,57.581797>}
box{<0,0,-0.304800><0.076619,0.035000,0.304800> rotate<0,0.000000,0> translate<57.920581,-1.535000,57.581797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.920581,-1.535000,57.581797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.190181,-1.535000,57.851394>}
box{<0,0,-0.304800><0.381270,0.035000,0.304800> rotate<0,-44.996698,0> translate<57.920581,-1.535000,57.581797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.997200,-1.535000,57.581797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.389291,-1.535000,57.419388>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,22.498530,0> translate<57.997200,-1.535000,57.581797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.190181,-1.535000,57.851394>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.394141,-1.535000,58.343800>}
box{<0,0,-0.304800><0.532976,0.035000,0.304800> rotate<0,-67.495741,0> translate<58.190181,-1.535000,57.851394> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.190181,-1.535000,61.274603>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.349400,-1.535000,60.890209>}
box{<0,0,-0.304800><0.416064,0.035000,0.304800> rotate<0,67.495845,0> translate<58.190181,-1.535000,61.274603> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.215284,-1.535000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.494209,-1.535000,57.912000>}
box{<0,0,-0.304800><2.278925,0.035000,0.304800> rotate<0,0.000000,0> translate<58.215284,-1.535000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.320494,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.349400,-1.535000,60.960000>}
box{<0,0,-0.304800><0.028906,0.035000,0.304800> rotate<0,0.000000,0> translate<58.320494,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.349400,-1.535000,61.187084>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.349400,-1.535000,60.890209>}
box{<0,0,-0.304800><0.296875,0.035000,0.304800> rotate<0,-90.000000,0> translate<58.349400,-1.535000,60.890209> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.349400,-1.535000,61.187084>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.488609,-1.535000,61.523166>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,-67.495551,0> translate<58.349400,-1.535000,61.187084> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.389291,-1.535000,57.419388>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.689388,-1.535000,57.119291>}
box{<0,0,-0.304800><0.424401,0.035000,0.304800> rotate<0,44.997030,0> translate<58.389291,-1.535000,57.419388> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.394141,-1.535000,58.343800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.202066,-1.535000,58.343800>}
box{<0,0,-0.304800><1.807925,0.035000,0.304800> rotate<0,0.000000,0> translate<58.394141,-1.535000,58.343800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.476400,-1.535000,68.225913>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.615609,-1.535000,67.889831>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,67.495551,0> translate<58.476400,-1.535000,68.225913> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.476400,-1.535000,69.408200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.476400,-1.535000,68.225913>}
box{<0,0,-0.304800><1.182288,0.035000,0.304800> rotate<0,-90.000000,0> translate<58.476400,-1.535000,68.225913> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.488609,-1.535000,61.523166>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.745831,-1.535000,61.780388>}
box{<0,0,-0.304800><0.363767,0.035000,0.304800> rotate<0,-44.997030,0> translate<58.488609,-1.535000,61.523166> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.506278,-1.535000,57.302400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.786200,-1.535000,57.302400>}
box{<0,0,-0.304800><4.279922,0.035000,0.304800> rotate<0,0.000000,0> translate<58.506278,-1.535000,57.302400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.615609,-1.535000,67.889831>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.872831,-1.535000,67.632609>}
box{<0,0,-0.304800><0.363767,0.035000,0.304800> rotate<0,44.997030,0> translate<58.615609,-1.535000,67.889831> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.689388,-1.535000,57.119291>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.937278,-1.535000,56.871397>}
box{<0,0,-0.304800><0.350572,0.035000,0.304800> rotate<0,44.997391,0> translate<58.689388,-1.535000,57.119291> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.745831,-1.535000,61.780388>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.081913,-1.535000,61.919597>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,-22.498510,0> translate<58.745831,-1.535000,61.780388> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.872831,-1.535000,67.632609>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.208913,-1.535000,67.493400>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,22.498510,0> translate<58.872831,-1.535000,67.632609> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.937278,-1.535000,56.871397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.786200,-1.535000,56.871397>}
box{<0,0,-0.304800><3.848922,0.035000,0.304800> rotate<0,0.000000,0> translate<58.937278,-1.535000,56.871397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.978797,-1.535000,37.627475>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.978797,-1.535000,37.912116>}
box{<0,0,-0.304800><0.284641,0.035000,0.304800> rotate<0,90.000000,0> translate<58.978797,-1.535000,37.912116> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.978797,-1.535000,37.627475>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.563000,-1.535000,38.211681>}
box{<0,0,-0.304800><0.826190,0.035000,0.304800> rotate<0,-44.997183,0> translate<58.978797,-1.535000,37.627475> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.978797,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.146522,-1.535000,37.795200>}
box{<0,0,-0.304800><0.167725,0.035000,0.304800> rotate<0,0.000000,0> translate<58.978797,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.978797,-1.535000,37.912116>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.496881,-1.535000,38.430200>}
box{<0,0,-0.304800><0.732682,0.035000,0.304800> rotate<0,-44.997030,0> translate<58.978797,-1.535000,37.912116> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.081913,-1.535000,61.919597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.552084,-1.535000,61.919597>}
box{<0,0,-0.304800><1.470172,0.035000,0.304800> rotate<0,0.000000,0> translate<59.081913,-1.535000,61.919597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.208913,-1.535000,67.493400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.679084,-1.535000,67.493400>}
box{<0,0,-0.304800><1.470172,0.035000,0.304800> rotate<0,0.000000,0> translate<59.208913,-1.535000,67.493400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.385200,-1.535000,22.715697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.002900,-1.535000,22.098000>}
box{<0,0,-0.304800><0.873558,0.035000,0.304800> rotate<0,44.996885,0> translate<59.385200,-1.535000,22.715697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.385200,-1.535000,23.190200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.385200,-1.535000,22.715697>}
box{<0,0,-0.304800><0.474503,0.035000,0.304800> rotate<0,-90.000000,0> translate<59.385200,-1.535000,22.715697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.419797,-1.535000,45.471397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.419797,-1.535000,52.340200>}
box{<0,0,-0.304800><6.868803,0.035000,0.304800> rotate<0,90.000000,0> translate<59.419797,-1.535000,52.340200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.419797,-1.535000,45.471397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,45.471397>}
box{<0,0,-0.304800><4.366403,0.035000,0.304800> rotate<0,0.000000,0> translate<59.419797,-1.535000,45.471397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.419797,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,45.720000>}
box{<0,0,-0.304800><4.366403,0.035000,0.304800> rotate<0,0.000000,0> translate<59.419797,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.419797,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,46.329600>}
box{<0,0,-0.304800><4.366403,0.035000,0.304800> rotate<0,0.000000,0> translate<59.419797,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.419797,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,46.939200>}
box{<0,0,-0.304800><4.366403,0.035000,0.304800> rotate<0,0.000000,0> translate<59.419797,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.419797,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,47.548800>}
box{<0,0,-0.304800><4.366403,0.035000,0.304800> rotate<0,0.000000,0> translate<59.419797,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.419797,-1.535000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,48.158400>}
box{<0,0,-0.304800><4.366403,0.035000,0.304800> rotate<0,0.000000,0> translate<59.419797,-1.535000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.419797,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,48.768000>}
box{<0,0,-0.304800><4.366403,0.035000,0.304800> rotate<0,0.000000,0> translate<59.419797,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.419797,-1.535000,49.377600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,49.377600>}
box{<0,0,-0.304800><4.366403,0.035000,0.304800> rotate<0,0.000000,0> translate<59.419797,-1.535000,49.377600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.419797,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,49.987200>}
box{<0,0,-0.304800><4.366403,0.035000,0.304800> rotate<0,0.000000,0> translate<59.419797,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.419797,-1.535000,50.596800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,50.596800>}
box{<0,0,-0.304800><4.366403,0.035000,0.304800> rotate<0,0.000000,0> translate<59.419797,-1.535000,50.596800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.419797,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,51.206400>}
box{<0,0,-0.304800><4.366403,0.035000,0.304800> rotate<0,0.000000,0> translate<59.419797,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.419797,-1.535000,51.816000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,51.816000>}
box{<0,0,-0.304800><4.366403,0.035000,0.304800> rotate<0,0.000000,0> translate<59.419797,-1.535000,51.816000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.419797,-1.535000,52.340200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,52.340200>}
box{<0,0,-0.304800><4.366403,0.035000,0.304800> rotate<0,0.000000,0> translate<59.419797,-1.535000,52.340200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.471481,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.563000,-1.535000,38.404800>}
box{<0,0,-0.304800><0.091519,0.035000,0.304800> rotate<0,0.000000,0> translate<59.471481,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.496881,-1.535000,38.430200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.563000,-1.535000,38.430200>}
box{<0,0,-0.304800><0.066119,0.035000,0.304800> rotate<0,0.000000,0> translate<59.496881,-1.535000,38.430200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.563000,-1.535000,38.430200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.563000,-1.535000,38.211681>}
box{<0,0,-0.304800><0.218519,0.035000,0.304800> rotate<0,-90.000000,0> translate<59.563000,-1.535000,38.211681> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.952097,-1.535000,19.608800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.053703,-1.535000,19.507197>}
box{<0,0,-0.304800><0.143691,0.035000,0.304800> rotate<0,44.996149,0> translate<59.952097,-1.535000,19.608800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.952097,-1.535000,22.047197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.002900,-1.535000,22.098000>}
box{<0,0,-0.304800><0.071846,0.035000,0.304800> rotate<0,-44.997030,0> translate<59.952097,-1.535000,22.047197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.202066,-1.535000,58.343800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.300816,-1.535000,58.105394>}
box{<0,0,-0.304800><0.258049,0.035000,0.304800> rotate<0,67.495771,0> translate<60.202066,-1.535000,58.343800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.300816,-1.535000,58.105394>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.772394,-1.535000,57.633816>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,44.997030,0> translate<60.300816,-1.535000,58.105394> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.502797,-1.535000,33.183206>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.502797,-1.535000,35.142791>}
box{<0,0,-0.304800><1.959584,0.035000,0.304800> rotate<0,90.000000,0> translate<60.502797,-1.535000,35.142791> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.502797,-1.535000,33.183206>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.905941,-1.535000,33.350197>}
box{<0,0,-0.304800><0.436361,0.035000,0.304800> rotate<0,-22.498881,0> translate<60.502797,-1.535000,33.183206> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.502797,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.471800,-1.535000,33.528000>}
box{<0,0,-0.304800><5.969003,0.035000,0.304800> rotate<0,0.000000,0> translate<60.502797,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.502797,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.471800,-1.535000,34.137600>}
box{<0,0,-0.304800><5.969003,0.035000,0.304800> rotate<0,0.000000,0> translate<60.502797,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.502797,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.890591,-1.535000,34.747200>}
box{<0,0,-0.304800><5.387794,0.035000,0.304800> rotate<0,0.000000,0> translate<60.502797,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.502797,-1.535000,35.142791>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.905941,-1.535000,34.975800>}
box{<0,0,-0.304800><0.436361,0.035000,0.304800> rotate<0,22.498881,0> translate<60.502797,-1.535000,35.142791> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.552084,-1.535000,61.919597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.650888,-1.535000,61.878672>}
box{<0,0,-0.304800><0.106944,0.035000,0.304800> rotate<0,22.498221,0> translate<60.552084,-1.535000,61.919597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.650888,-1.535000,61.878672>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.772394,-1.535000,62.000181>}
box{<0,0,-0.304800><0.171838,0.035000,0.304800> rotate<0,-44.997767,0> translate<60.650888,-1.535000,61.878672> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.679084,-1.535000,67.493400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.015166,-1.535000,67.632609>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,-22.498510,0> translate<60.679084,-1.535000,67.493400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.772394,-1.535000,57.633816>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.388541,-1.535000,57.378600>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,22.498454,0> translate<60.772394,-1.535000,57.633816> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.772394,-1.535000,62.000181>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.388541,-1.535000,62.255397>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-22.498454,0> translate<60.772394,-1.535000,62.000181> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.905941,-1.535000,33.350197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.572856,-1.535000,33.350197>}
box{<0,0,-0.304800><0.666916,0.035000,0.304800> rotate<0,0.000000,0> translate<60.905941,-1.535000,33.350197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.905941,-1.535000,34.975800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.572856,-1.535000,34.975800>}
box{<0,0,-0.304800><0.666916,0.035000,0.304800> rotate<0,0.000000,0> translate<60.905941,-1.535000,34.975800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.995475,-1.535000,41.579797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.257388,-1.535000,41.841706>}
box{<0,0,-0.304800><0.370398,0.035000,0.304800> rotate<0,-44.996688,0> translate<60.995475,-1.535000,41.579797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.995475,-1.535000,41.579797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.931116,-1.535000,41.579797>}
box{<0,0,-0.304800><1.935641,0.035000,0.304800> rotate<0,0.000000,0> translate<60.995475,-1.535000,41.579797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.015166,-1.535000,67.632609>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.124356,-1.535000,67.741800>}
box{<0,0,-0.304800><0.154419,0.035000,0.304800> rotate<0,-44.997030,0> translate<61.015166,-1.535000,67.632609> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.048156,-1.535000,67.665600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.184191,-1.535000,67.665600>}
box{<0,0,-0.304800><17.136034,0.035000,0.304800> rotate<0,0.000000,0> translate<61.048156,-1.535000,67.665600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.124356,-1.535000,67.741800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.107991,-1.535000,67.741800>}
box{<0,0,-0.304800><16.983634,0.035000,0.304800> rotate<0,0.000000,0> translate<61.124356,-1.535000,67.741800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.257388,-1.535000,41.841706>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.419797,-1.535000,42.233797>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,-67.495530,0> translate<61.257388,-1.535000,41.841706> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.348800,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.286200,-1.535000,42.062400>}
box{<0,0,-0.304800><1.937400,0.035000,0.304800> rotate<0,0.000000,0> translate<61.348800,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.388541,-1.535000,57.378600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.055456,-1.535000,57.378600>}
box{<0,0,-0.304800><0.666916,0.035000,0.304800> rotate<0,0.000000,0> translate<61.388541,-1.535000,57.378600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.388541,-1.535000,62.255397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.055456,-1.535000,62.255397>}
box{<0,0,-0.304800><0.666916,0.035000,0.304800> rotate<0,0.000000,0> translate<61.388541,-1.535000,62.255397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.419797,-1.535000,42.233797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.419797,-1.535000,42.442600>}
box{<0,0,-0.304800><0.208803,0.035000,0.304800> rotate<0,90.000000,0> translate<61.419797,-1.535000,42.442600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.419797,-1.535000,42.442600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.286200,-1.535000,42.442600>}
box{<0,0,-0.304800><1.866403,0.035000,0.304800> rotate<0,0.000000,0> translate<61.419797,-1.535000,42.442600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.503475,-1.535000,24.942797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.612300,-1.535000,24.942797>}
box{<0,0,-0.304800><0.108825,0.035000,0.304800> rotate<0,0.000000,0> translate<61.503475,-1.535000,24.942797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.503475,-1.535000,24.942797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.245387,-1.535000,25.684706>}
box{<0,0,-0.304800><1.049221,0.035000,0.304800> rotate<0,-44.996910,0> translate<61.503475,-1.535000,24.942797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.554278,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.406500,-1.535000,24.993600>}
box{<0,0,-0.304800><1.852222,0.035000,0.304800> rotate<0,0.000000,0> translate<61.554278,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.572856,-1.535000,33.350197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.189003,-1.535000,33.094981>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,22.498454,0> translate<61.572856,-1.535000,33.350197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.572856,-1.535000,34.975800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.189003,-1.535000,35.231016>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-22.498454,0> translate<61.572856,-1.535000,34.975800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.612300,-1.535000,24.942797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.967900,-1.535000,24.587197>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<61.612300,-1.535000,24.942797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.917097,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.967900,-1.535000,22.148800>}
box{<0,0,-0.304800><0.071844,0.035000,0.304800> rotate<0,-44.995268,0> translate<61.917097,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.917097,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.094900,-1.535000,21.920197>}
box{<0,0,-0.304800><0.251452,0.035000,0.304800> rotate<0,44.997030,0> translate<61.917097,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.918928,-1.535000,28.616750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.189003,-1.535000,28.728616>}
box{<0,0,-0.304800><0.292326,0.035000,0.304800> rotate<0,-22.497953,0> translate<61.918928,-1.535000,28.616750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.918928,-1.535000,28.616750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.245387,-1.535000,28.290291>}
box{<0,0,-0.304800><0.461683,0.035000,0.304800> rotate<0,44.997030,0> translate<61.918928,-1.535000,28.616750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.967900,-1.535000,22.148800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.508097,-1.535000,22.148800>}
box{<0,0,-0.304800><1.540197,0.035000,0.304800> rotate<0,0.000000,0> translate<61.967900,-1.535000,22.148800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.967900,-1.535000,24.587197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.000097,-1.535000,24.587197>}
box{<0,0,-0.304800><1.032197,0.035000,0.304800> rotate<0,0.000000,0> translate<61.967900,-1.535000,24.587197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.002100,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.997891,-1.535000,28.651200>}
box{<0,0,-0.304800><2.995791,0.035000,0.304800> rotate<0,0.000000,0> translate<62.002100,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.055456,-1.535000,57.378600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.671603,-1.535000,57.633816>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-22.498454,0> translate<62.055456,-1.535000,57.378600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.055456,-1.535000,62.255397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.671603,-1.535000,62.000181>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,22.498454,0> translate<62.055456,-1.535000,62.255397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.069497,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.614800,-1.535000,21.945600>}
box{<0,0,-0.304800><5.545303,0.035000,0.304800> rotate<0,0.000000,0> translate<62.069497,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.094900,-1.535000,21.920197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.614800,-1.535000,21.920197>}
box{<0,0,-0.304800><5.519900,0.035000,0.304800> rotate<0,0.000000,0> translate<62.094900,-1.535000,21.920197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.163878,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.276697,-1.535000,25.603200>}
box{<0,0,-0.304800><4.112819,0.035000,0.304800> rotate<0,0.000000,0> translate<62.163878,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.189003,-1.535000,28.728616>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.660581,-1.535000,29.200194>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-44.997030,0> translate<62.189003,-1.535000,28.728616> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.189003,-1.535000,33.094981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.660581,-1.535000,32.623403>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,44.997030,0> translate<62.189003,-1.535000,33.094981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.189003,-1.535000,35.231016>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.660581,-1.535000,35.702594>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-44.997030,0> translate<62.189003,-1.535000,35.231016> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.239413,-1.535000,62.179200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.744588,-1.535000,62.179200>}
box{<0,0,-0.304800><1.505175,0.035000,0.304800> rotate<0,0.000000,0> translate<62.239413,-1.535000,62.179200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.245387,-1.535000,25.684706>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.407797,-1.535000,26.076797>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,-67.495530,0> translate<62.245387,-1.535000,25.684706> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.245387,-1.535000,28.290291>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.407797,-1.535000,27.898200>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,67.495530,0> translate<62.245387,-1.535000,28.290291> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.314788,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.685209,-1.535000,35.356800>}
box{<0,0,-0.304800><2.370422,0.035000,0.304800> rotate<0,0.000000,0> translate<62.314788,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.348400,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.327500,-1.535000,28.041600>}
box{<0,0,-0.304800><3.979100,0.035000,0.304800> rotate<0,0.000000,0> translate<62.348400,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.365584,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.634412,-1.535000,32.918400>}
box{<0,0,-0.304800><2.268828,0.035000,0.304800> rotate<0,0.000000,0> translate<62.365584,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.407797,-1.535000,26.076797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.407797,-1.535000,27.898200>}
box{<0,0,-0.304800><1.821403,0.035000,0.304800> rotate<0,90.000000,0> translate<62.407797,-1.535000,27.898200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.407797,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.735200,-1.535000,26.212800>}
box{<0,0,-0.304800><3.327403,0.035000,0.304800> rotate<0,0.000000,0> translate<62.407797,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.407797,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.735200,-1.535000,26.822400>}
box{<0,0,-0.304800><3.327403,0.035000,0.304800> rotate<0,0.000000,0> translate<62.407797,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.407797,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.735200,-1.535000,27.432000>}
box{<0,0,-0.304800><3.327403,0.035000,0.304800> rotate<0,0.000000,0> translate<62.407797,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.660581,-1.535000,29.200194>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.915797,-1.535000,29.816341>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-67.495606,0> translate<62.660581,-1.535000,29.200194> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.660581,-1.535000,32.623403>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.915797,-1.535000,32.007256>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,67.495606,0> translate<62.660581,-1.535000,32.623403> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.660581,-1.535000,35.702594>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.896103,-1.535000,36.271200>}
box{<0,0,-0.304800><0.615454,0.035000,0.304800> rotate<0,-67.495764,0> translate<62.660581,-1.535000,35.702594> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.671603,-1.535000,57.633816>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.786200,-1.535000,57.748416>}
box{<0,0,-0.304800><0.162067,0.035000,0.304800> rotate<0,-44.997811,0> translate<62.671603,-1.535000,57.633816> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.671603,-1.535000,62.000181>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.992000,-1.535000,61.679784>}
box{<0,0,-0.304800><0.453110,0.035000,0.304800> rotate<0,44.997030,0> translate<62.671603,-1.535000,62.000181> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.685684,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.314309,-1.535000,29.260800>}
box{<0,0,-0.304800><1.628625,0.035000,0.304800> rotate<0,0.000000,0> translate<62.685684,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.687200,-1.535000,15.349697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.074869,-1.535000,14.962031>}
box{<0,0,-0.304800><0.548244,0.035000,0.304800> rotate<0,44.996799,0> translate<62.687200,-1.535000,15.349697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.687200,-1.535000,16.654300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.687200,-1.535000,15.349697>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,-90.000000,0> translate<62.687200,-1.535000,15.349697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.687200,-1.535000,16.654300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.042800,-1.535000,17.009900>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<62.687200,-1.535000,16.654300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.769850,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.230144,-1.535000,35.966400>}
box{<0,0,-0.304800><1.460294,0.035000,0.304800> rotate<0,0.000000,0> translate<62.769850,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.786200,-1.535000,57.748416>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.786200,-1.535000,56.871397>}
box{<0,0,-0.304800><0.877019,0.035000,0.304800> rotate<0,-90.000000,0> translate<62.786200,-1.535000,56.871397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.790894,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.209106,-1.535000,32.308800>}
box{<0,0,-0.304800><1.418213,0.035000,0.304800> rotate<0,0.000000,0> translate<62.790894,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.896103,-1.535000,36.271200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.204200,-1.535000,36.271200>}
box{<0,0,-0.304800><0.308097,0.035000,0.304800> rotate<0,0.000000,0> translate<62.896103,-1.535000,36.271200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.915797,-1.535000,29.816341>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.915797,-1.535000,32.007256>}
box{<0,0,-0.304800><2.190916,0.035000,0.304800> rotate<0,90.000000,0> translate<62.915797,-1.535000,32.007256> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.915797,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.084200,-1.535000,29.870400>}
box{<0,0,-0.304800><1.168403,0.035000,0.304800> rotate<0,0.000000,0> translate<62.915797,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.915797,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.084200,-1.535000,30.480000>}
box{<0,0,-0.304800><1.168403,0.035000,0.304800> rotate<0,0.000000,0> translate<62.915797,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.915797,-1.535000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.084200,-1.535000,31.089600>}
box{<0,0,-0.304800><1.168403,0.035000,0.304800> rotate<0,0.000000,0> translate<62.915797,-1.535000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.915797,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.084200,-1.535000,31.699200>}
box{<0,0,-0.304800><1.168403,0.035000,0.304800> rotate<0,0.000000,0> translate<62.915797,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.931116,-1.535000,41.579797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.286200,-1.535000,41.934881>}
box{<0,0,-0.304800><0.502165,0.035000,0.304800> rotate<0,-44.997030,0> translate<62.931116,-1.535000,41.579797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.992000,-1.535000,61.679784>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.312394,-1.535000,62.000181>}
box{<0,0,-0.304800><0.453107,0.035000,0.304800> rotate<0,-44.997310,0> translate<62.992000,-1.535000,61.679784> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.000097,-1.535000,24.587197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.609697,-1.535000,25.196797>}
box{<0,0,-0.304800><0.862105,0.035000,0.304800> rotate<0,-44.997030,0> translate<63.000097,-1.535000,24.587197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.042800,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.042800,-1.535000,17.009900>}
box{<0,0,-0.304800><0.058900,0.035000,0.304800> rotate<0,-90.000000,0> translate<63.042800,-1.535000,17.009900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.204200,-1.535000,36.271200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.596291,-1.535000,36.433609>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,-22.498530,0> translate<63.204200,-1.535000,36.271200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.286200,-1.535000,42.442600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.286200,-1.535000,41.934881>}
box{<0,0,-0.304800><0.507719,0.035000,0.304800> rotate<0,-90.000000,0> translate<63.286200,-1.535000,41.934881> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.312394,-1.535000,62.000181>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.928541,-1.535000,62.255397>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-22.498454,0> translate<63.312394,-1.535000,62.000181> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.508097,-1.535000,22.148800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.609697,-1.535000,22.047200>}
box{<0,0,-0.304800><0.143684,0.035000,0.304800> rotate<0,44.997030,0> translate<63.508097,-1.535000,22.148800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.596291,-1.535000,36.433609>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.896388,-1.535000,36.733706>}
box{<0,0,-0.304800><0.424401,0.035000,0.304800> rotate<0,-44.997030,0> translate<63.596291,-1.535000,36.433609> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.609697,-1.535000,22.047200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.914300,-1.535000,22.047200>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,0.000000,0> translate<63.609697,-1.535000,22.047200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.609697,-1.535000,25.196797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.914300,-1.535000,25.196797>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,0.000000,0> translate<63.609697,-1.535000,25.196797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.738681,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.084200,-1.535000,36.576000>}
box{<0,0,-0.304800><0.345519,0.035000,0.304800> rotate<0,0.000000,0> translate<63.738681,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,47.031797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,45.471397>}
box{<0,0,-0.304800><1.560400,0.035000,0.304800> rotate<0,-90.000000,0> translate<63.786200,-1.535000,45.471397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,52.340200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.786200,-1.535000,47.031797>}
box{<0,0,-0.304800><5.308403,0.035000,0.304800> rotate<0,-90.000000,0> translate<63.786200,-1.535000,47.031797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.896388,-1.535000,36.733706>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.084200,-1.535000,36.921522>}
box{<0,0,-0.304800><0.265609,0.035000,0.304800> rotate<0,-44.997507,0> translate<63.896388,-1.535000,36.733706> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.928541,-1.535000,62.255397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.595456,-1.535000,62.255397>}
box{<0,0,-0.304800><0.666916,0.035000,0.304800> rotate<0,0.000000,0> translate<63.928541,-1.535000,62.255397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.084200,-1.535000,29.816341>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.339416,-1.535000,29.200194>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,67.495606,0> translate<64.084200,-1.535000,29.816341> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.084200,-1.535000,32.007256>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.084200,-1.535000,29.816341>}
box{<0,0,-0.304800><2.190916,0.035000,0.304800> rotate<0,-90.000000,0> translate<64.084200,-1.535000,29.816341> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.084200,-1.535000,32.007256>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.339416,-1.535000,32.623403>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-67.495606,0> translate<64.084200,-1.535000,32.007256> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.084200,-1.535000,36.318741>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.339416,-1.535000,35.702594>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,67.495606,0> translate<64.084200,-1.535000,36.318741> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.084200,-1.535000,36.921522>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.084200,-1.535000,36.318741>}
box{<0,0,-0.304800><0.602781,0.035000,0.304800> rotate<0,-90.000000,0> translate<64.084200,-1.535000,36.318741> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.339416,-1.535000,29.200194>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.810994,-1.535000,28.728616>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,44.997030,0> translate<64.339416,-1.535000,29.200194> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.339416,-1.535000,32.623403>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.810994,-1.535000,33.094981>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-44.997030,0> translate<64.339416,-1.535000,32.623403> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.339416,-1.535000,35.702594>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.810994,-1.535000,35.231016>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,44.997030,0> translate<64.339416,-1.535000,35.702594> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.595456,-1.535000,62.255397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.211603,-1.535000,62.000181>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,22.498454,0> translate<64.595456,-1.535000,62.255397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.779413,-1.535000,62.179200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.582800,-1.535000,62.179200>}
box{<0,0,-0.304800><0.803387,0.035000,0.304800> rotate<0,0.000000,0> translate<64.779413,-1.535000,62.179200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.810994,-1.535000,28.728616>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.427141,-1.535000,28.473400>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,22.498454,0> translate<64.810994,-1.535000,28.728616> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.810994,-1.535000,33.094981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.427141,-1.535000,33.350197>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-22.498454,0> translate<64.810994,-1.535000,33.094981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.810994,-1.535000,35.231016>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.427141,-1.535000,34.975800>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,22.498454,0> translate<64.810994,-1.535000,35.231016> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.914300,-1.535000,22.047200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.836797,-1.535000,22.969697>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,-44.997030,0> translate<64.914300,-1.535000,22.047200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.914300,-1.535000,25.196797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.836797,-1.535000,24.274300>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,44.997030,0> translate<64.914300,-1.535000,25.196797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.117497,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.614800,-1.535000,24.993600>}
box{<0,0,-0.304800><2.497303,0.035000,0.304800> rotate<0,0.000000,0> translate<65.117497,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.211603,-1.535000,62.000181>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.532000,-1.535000,61.679784>}
box{<0,0,-0.304800><0.453110,0.035000,0.304800> rotate<0,44.997030,0> translate<65.211603,-1.535000,62.000181> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.422300,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.614800,-1.535000,22.555200>}
box{<0,0,-0.304800><2.192500,0.035000,0.304800> rotate<0,0.000000,0> translate<65.422300,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.427141,-1.535000,28.473400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.094056,-1.535000,28.473400>}
box{<0,0,-0.304800><0.666916,0.035000,0.304800> rotate<0,0.000000,0> translate<65.427141,-1.535000,28.473400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.427141,-1.535000,33.350197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.094056,-1.535000,33.350197>}
box{<0,0,-0.304800><0.666916,0.035000,0.304800> rotate<0,0.000000,0> translate<65.427141,-1.535000,33.350197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.427141,-1.535000,34.975800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.661991,-1.535000,34.975800>}
box{<0,0,-0.304800><0.234850,0.035000,0.304800> rotate<0,0.000000,0> translate<65.427141,-1.535000,34.975800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.445403,-1.535000,14.958306>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.836797,-1.535000,15.349697>}
box{<0,0,-0.304800><0.553512,0.035000,0.304800> rotate<0,-44.996801,0> translate<65.445403,-1.535000,14.958306> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.445403,-1.535000,14.958306>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.990309,-1.535000,14.911881>}
box{<0,0,-0.304800><29.544943,0.035000,0.304800> rotate<0,0.090025,0> translate<65.445403,-1.535000,14.958306> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.481197,-1.535000,17.009900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.481197,-1.535000,17.068800>}
box{<0,0,-0.304800><0.058900,0.035000,0.304800> rotate<0,90.000000,0> translate<65.481197,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.481197,-1.535000,17.009900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.836797,-1.535000,16.654300>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<65.481197,-1.535000,17.009900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.481197,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.380513,-1.535000,17.068800>}
box{<0,0,-0.304800><22.899316,0.035000,0.304800> rotate<0,0.000000,0> translate<65.481197,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.532000,-1.535000,61.679784>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.582800,-1.535000,61.730588>}
box{<0,0,-0.304800><0.071844,0.035000,0.304800> rotate<0,-44.998792,0> translate<65.532000,-1.535000,61.679784> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.582800,-1.535000,64.947800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.582800,-1.535000,61.730588>}
box{<0,0,-0.304800><3.217212,0.035000,0.304800> rotate<0,-90.000000,0> translate<65.582800,-1.535000,61.730588> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.661991,-1.535000,34.975800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.471800,-1.535000,34.165991>}
box{<0,0,-0.304800><1.145243,0.035000,0.304800> rotate<0,44.997030,0> translate<65.661991,-1.535000,34.975800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.727097,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.988850,-1.535000,15.240000>}
box{<0,0,-0.304800><29.261753,0.035000,0.304800> rotate<0,0.000000,0> translate<65.727097,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.727097,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.614800,-1.535000,24.384000>}
box{<0,0,-0.304800><1.887703,0.035000,0.304800> rotate<0,0.000000,0> translate<65.727097,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.735200,-1.535000,26.144697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.657697,-1.535000,25.222200>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,44.997030,0> translate<65.735200,-1.535000,26.144697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.735200,-1.535000,27.449300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.735200,-1.535000,26.144697>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,-90.000000,0> translate<65.735200,-1.535000,26.144697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.735200,-1.535000,27.449300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.471800,-1.535000,28.185900>}
box{<0,0,-0.304800><1.041710,0.035000,0.304800> rotate<0,-44.997030,0> translate<65.735200,-1.535000,27.449300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.836797,-1.535000,15.349697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.836797,-1.535000,16.654300>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,90.000000,0> translate<65.836797,-1.535000,16.654300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.836797,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.986141,-1.535000,15.849600>}
box{<0,0,-0.304800><29.149344,0.035000,0.304800> rotate<0,0.000000,0> translate<65.836797,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.836797,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.983428,-1.535000,16.459200>}
box{<0,0,-0.304800><29.146631,0.035000,0.304800> rotate<0,0.000000,0> translate<65.836797,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.836797,-1.535000,22.969697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.836797,-1.535000,24.274300>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,90.000000,0> translate<65.836797,-1.535000,24.274300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.836797,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.614800,-1.535000,23.164800>}
box{<0,0,-0.304800><1.778003,0.035000,0.304800> rotate<0,0.000000,0> translate<65.836797,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.836797,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.614800,-1.535000,23.774400>}
box{<0,0,-0.304800><1.778003,0.035000,0.304800> rotate<0,0.000000,0> translate<65.836797,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.919797,-1.535000,46.278797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.919797,-1.535000,46.340200>}
box{<0,0,-0.304800><0.061403,0.035000,0.304800> rotate<0,90.000000,0> translate<65.919797,-1.535000,46.340200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.919797,-1.535000,46.278797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,46.278797>}
box{<0,0,-0.304800><0.368803,0.035000,0.304800> rotate<0,0.000000,0> translate<65.919797,-1.535000,46.278797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.919797,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,46.329600>}
box{<0,0,-0.304800><0.368803,0.035000,0.304800> rotate<0,0.000000,0> translate<65.919797,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.919797,-1.535000,46.340200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,46.340200>}
box{<0,0,-0.304800><0.368803,0.035000,0.304800> rotate<0,0.000000,0> translate<65.919797,-1.535000,46.340200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.919797,-1.535000,48.473797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.919797,-1.535000,49.340200>}
box{<0,0,-0.304800><0.866403,0.035000,0.304800> rotate<0,90.000000,0> translate<65.919797,-1.535000,49.340200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.919797,-1.535000,48.473797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,48.473797>}
box{<0,0,-0.304800><0.368803,0.035000,0.304800> rotate<0,0.000000,0> translate<65.919797,-1.535000,48.473797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.919797,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,48.768000>}
box{<0,0,-0.304800><0.368803,0.035000,0.304800> rotate<0,0.000000,0> translate<65.919797,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.919797,-1.535000,49.340200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,49.340200>}
box{<0,0,-0.304800><0.368803,0.035000,0.304800> rotate<0,0.000000,0> translate<65.919797,-1.535000,49.340200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.919797,-1.535000,51.473797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.919797,-1.535000,52.340200>}
box{<0,0,-0.304800><0.866403,0.035000,0.304800> rotate<0,90.000000,0> translate<65.919797,-1.535000,52.340200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.919797,-1.535000,51.473797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,51.473797>}
box{<0,0,-0.304800><0.368803,0.035000,0.304800> rotate<0,0.000000,0> translate<65.919797,-1.535000,51.473797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.919797,-1.535000,51.816000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,51.816000>}
box{<0,0,-0.304800><0.368803,0.035000,0.304800> rotate<0,0.000000,0> translate<65.919797,-1.535000,51.816000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.919797,-1.535000,52.340200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,52.340200>}
box{<0,0,-0.304800><0.368803,0.035000,0.304800> rotate<0,0.000000,0> translate<65.919797,-1.535000,52.340200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.094056,-1.535000,28.473400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.471800,-1.535000,28.629869>}
box{<0,0,-0.304800><0.408868,0.035000,0.304800> rotate<0,-22.498795,0> translate<66.094056,-1.535000,28.473400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.094056,-1.535000,33.350197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.471800,-1.535000,33.193728>}
box{<0,0,-0.304800><0.408868,0.035000,0.304800> rotate<0,22.498795,0> translate<66.094056,-1.535000,33.350197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,46.340200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,46.278797>}
box{<0,0,-0.304800><0.061403,0.035000,0.304800> rotate<0,-90.000000,0> translate<66.288600,-1.535000,46.278797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,49.238884>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,48.473797>}
box{<0,0,-0.304800><0.765087,0.035000,0.304800> rotate<0,-90.000000,0> translate<66.288600,-1.535000,48.473797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,49.340200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,49.238884>}
box{<0,0,-0.304800><0.101316,0.035000,0.304800> rotate<0,-90.000000,0> translate<66.288600,-1.535000,49.238884> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,52.238884>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,51.473797>}
box{<0,0,-0.304800><0.765087,0.035000,0.304800> rotate<0,-90.000000,0> translate<66.288600,-1.535000,51.473797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,52.340200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.288600,-1.535000,52.238884>}
box{<0,0,-0.304800><0.101316,0.035000,0.304800> rotate<0,-90.000000,0> translate<66.288600,-1.535000,52.238884> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.419797,-1.535000,56.774094>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.419797,-1.535000,57.037119>}
box{<0,0,-0.304800><0.263025,0.035000,0.304800> rotate<0,90.000000,0> translate<66.419797,-1.535000,57.037119> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.419797,-1.535000,56.774094>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.520966,-1.535000,56.732188>}
box{<0,0,-0.304800><0.109505,0.035000,0.304800> rotate<0,22.498893,0> translate<66.419797,-1.535000,56.774094> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.419797,-1.535000,57.037119>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.761278,-1.535000,57.378600>}
box{<0,0,-0.304800><0.482927,0.035000,0.304800> rotate<0,-44.997030,0> translate<66.419797,-1.535000,57.037119> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.471800,-1.535000,28.629869>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.471800,-1.535000,28.185900>}
box{<0,0,-0.304800><0.443969,0.035000,0.304800> rotate<0,-90.000000,0> translate<66.471800,-1.535000,28.185900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.471800,-1.535000,34.165991>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.471800,-1.535000,33.193728>}
box{<0,0,-0.304800><0.972262,0.035000,0.304800> rotate<0,-90.000000,0> translate<66.471800,-1.535000,33.193728> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.520966,-1.535000,56.732188>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.778188,-1.535000,56.474966>}
box{<0,0,-0.304800><0.363767,0.035000,0.304800> rotate<0,44.997030,0> translate<66.520966,-1.535000,56.732188> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.560353,-1.535000,56.692800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,56.692800>}
box{<0,0,-0.304800><2.857847,0.035000,0.304800> rotate<0,0.000000,0> translate<66.560353,-1.535000,56.692800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.657697,-1.535000,25.222200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.614800,-1.535000,25.222200>}
box{<0,0,-0.304800><0.957103,0.035000,0.304800> rotate<0,0.000000,0> translate<66.657697,-1.535000,25.222200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.685078,-1.535000,57.302400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,57.302400>}
box{<0,0,-0.304800><2.733122,0.035000,0.304800> rotate<0,0.000000,0> translate<66.685078,-1.535000,57.302400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.761278,-1.535000,57.378600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.135456,-1.535000,57.378600>}
box{<0,0,-0.304800><0.374178,0.035000,0.304800> rotate<0,0.000000,0> translate<66.761278,-1.535000,57.378600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.778188,-1.535000,56.474966>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.917397,-1.535000,56.138884>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,67.495551,0> translate<66.778188,-1.535000,56.474966> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.917397,-1.535000,55.574991>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.917397,-1.535000,56.138884>}
box{<0,0,-0.304800><0.563894,0.035000,0.304800> rotate<0,90.000000,0> translate<66.917397,-1.535000,56.138884> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.917397,-1.535000,55.574991>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,55.569200>}
box{<0,0,-0.304800><0.006268,0.035000,0.304800> rotate<0,67.483347,0> translate<66.917397,-1.535000,55.574991> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.917397,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,56.083200>}
box{<0,0,-0.304800><2.500803,0.035000,0.304800> rotate<0,0.000000,0> translate<66.917397,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,39.387788>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,44.145200>}
box{<0,0,-0.304800><4.757413,0.035000,0.304800> rotate<0,90.000000,0> translate<66.919797,-1.535000,44.145200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,39.387788>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.181781,-1.535000,39.125803>}
box{<0,0,-0.304800><0.370502,0.035000,0.304800> rotate<0,44.997030,0> translate<66.919797,-1.535000,39.387788> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.008316,-1.535000,39.624000>}
box{<0,0,-0.304800><4.088519,0.035000,0.304800> rotate<0,0.000000,0> translate<66.919797,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.398716,-1.535000,40.233600>}
box{<0,0,-0.304800><3.478919,0.035000,0.304800> rotate<0,0.000000,0> translate<66.919797,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,40.843200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.789116,-1.535000,40.843200>}
box{<0,0,-0.304800><2.869319,0.035000,0.304800> rotate<0,0.000000,0> translate<66.919797,-1.535000,40.843200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.191284,-1.535000,41.452800>}
box{<0,0,-0.304800><2.271488,0.035000,0.304800> rotate<0,0.000000,0> translate<66.919797,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.037200,-1.535000,42.062400>}
box{<0,0,-0.304800><2.117403,0.035000,0.304800> rotate<0,0.000000,0> translate<66.919797,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.037200,-1.535000,42.672000>}
box{<0,0,-0.304800><2.117403,0.035000,0.304800> rotate<0,0.000000,0> translate<66.919797,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.037200,-1.535000,43.281600>}
box{<0,0,-0.304800><2.117403,0.035000,0.304800> rotate<0,0.000000,0> translate<66.919797,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.037200,-1.535000,43.891200>}
box{<0,0,-0.304800><2.117403,0.035000,0.304800> rotate<0,0.000000,0> translate<66.919797,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,44.145200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.037200,-1.535000,44.145200>}
box{<0,0,-0.304800><2.117403,0.035000,0.304800> rotate<0,0.000000,0> translate<66.919797,-1.535000,44.145200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,54.473797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,55.569200>}
box{<0,0,-0.304800><1.095403,0.035000,0.304800> rotate<0,90.000000,0> translate<66.919797,-1.535000,55.569200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,54.473797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.015200,-1.535000,54.473797>}
box{<0,0,-0.304800><1.095403,0.035000,0.304800> rotate<0,0.000000,0> translate<66.919797,-1.535000,54.473797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,54.864000>}
box{<0,0,-0.304800><2.498403,0.035000,0.304800> rotate<0,0.000000,0> translate<66.919797,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.919797,-1.535000,55.473600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,55.473600>}
box{<0,0,-0.304800><2.498403,0.035000,0.304800> rotate<0,0.000000,0> translate<66.919797,-1.535000,55.473600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.135456,-1.535000,57.378600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.751603,-1.535000,57.633816>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-22.498454,0> translate<67.135456,-1.535000,57.378600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.181781,-1.535000,39.125803>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.436997,-1.535000,38.509656>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,67.495606,0> translate<67.181781,-1.535000,39.125803> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.227928,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.265197,-1.535000,39.014400>}
box{<0,0,-0.304800><24.037269,0.035000,0.304800> rotate<0,0.000000,0> translate<67.227928,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.436997,-1.535000,36.649206>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.436997,-1.535000,38.509656>}
box{<0,0,-0.304800><1.860450,0.035000,0.304800> rotate<0,90.000000,0> translate<67.436997,-1.535000,38.509656> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.436997,-1.535000,36.649206>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.381619,-1.535000,35.704584>}
box{<0,0,-0.304800><1.335897,0.035000,0.304800> rotate<0,44.997030,0> translate<67.436997,-1.535000,36.649206> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.436997,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.275394,-1.535000,37.185600>}
box{<0,0,-0.304800><3.838397,0.035000,0.304800> rotate<0,0.000000,0> translate<67.436997,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.436997,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.884994,-1.535000,37.795200>}
box{<0,0,-0.304800><4.447997,0.035000,0.304800> rotate<0,0.000000,0> translate<67.436997,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.436997,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.655597,-1.535000,38.404800>}
box{<0,0,-0.304800><23.218600,0.035000,0.304800> rotate<0,0.000000,0> translate<67.436997,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.510203,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.847166,-1.535000,36.576000>}
box{<0,0,-0.304800><3.336962,0.035000,0.304800> rotate<0,0.000000,0> translate<67.510203,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.614800,-1.535000,25.222200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.614800,-1.535000,21.920197>}
box{<0,0,-0.304800><3.302003,0.035000,0.304800> rotate<0,-90.000000,0> translate<67.614800,-1.535000,21.920197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.751603,-1.535000,57.633816>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.223181,-1.535000,58.105394>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-44.997030,0> translate<67.751603,-1.535000,57.633816> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.015200,-1.535000,54.473797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.020994,-1.535000,54.471397>}
box{<0,0,-0.304800><0.006271,0.035000,0.304800> rotate<0,22.499783,0> translate<68.015200,-1.535000,54.473797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.020994,-1.535000,54.471397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.584884,-1.535000,54.471397>}
box{<0,0,-0.304800><0.563891,0.035000,0.304800> rotate<0,0.000000,0> translate<68.020994,-1.535000,54.471397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.029787,-1.535000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,57.912000>}
box{<0,0,-0.304800><1.388413,0.035000,0.304800> rotate<0,0.000000,0> translate<68.029787,-1.535000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.119803,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.789800,-1.535000,35.966400>}
box{<0,0,-0.304800><2.669997,0.035000,0.304800> rotate<0,0.000000,0> translate<68.119803,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.223181,-1.535000,58.105394>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.478397,-1.535000,58.721541>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-67.495606,0> translate<68.223181,-1.535000,58.105394> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.275197,-1.535000,61.403025>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.275197,-1.535000,64.518991>}
box{<0,0,-0.304800><3.115966,0.035000,0.304800> rotate<0,90.000000,0> translate<68.275197,-1.535000,64.518991> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.275197,-1.535000,61.403025>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.478397,-1.535000,60.912456>}
box{<0,0,-0.304800><0.530988,0.035000,0.304800> rotate<0,67.495568,0> translate<68.275197,-1.535000,61.403025> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.275197,-1.535000,61.569600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.557031,-1.535000,61.569600>}
box{<0,0,-0.304800><0.281834,0.035000,0.304800> rotate<0,0.000000,0> translate<68.275197,-1.535000,61.569600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.275197,-1.535000,62.179200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.529200,-1.535000,62.179200>}
box{<0,0,-0.304800><0.254003,0.035000,0.304800> rotate<0,0.000000,0> translate<68.275197,-1.535000,62.179200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.275197,-1.535000,62.788800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.529200,-1.535000,62.788800>}
box{<0,0,-0.304800><0.254003,0.035000,0.304800> rotate<0,0.000000,0> translate<68.275197,-1.535000,62.788800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.275197,-1.535000,63.398400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.529200,-1.535000,63.398400>}
box{<0,0,-0.304800><0.254003,0.035000,0.304800> rotate<0,0.000000,0> translate<68.275197,-1.535000,63.398400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.275197,-1.535000,64.008000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.651725,-1.535000,64.008000>}
box{<0,0,-0.304800><0.376528,0.035000,0.304800> rotate<0,0.000000,0> translate<68.275197,-1.535000,64.008000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.275197,-1.535000,64.518991>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.704006,-1.535000,64.947800>}
box{<0,0,-0.304800><0.606428,0.035000,0.304800> rotate<0,-44.997030,0> translate<68.275197,-1.535000,64.518991> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.373806,-1.535000,64.617600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.204919,-1.535000,64.617600>}
box{<0,0,-0.304800><0.831113,0.035000,0.304800> rotate<0,0.000000,0> translate<68.373806,-1.535000,64.617600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.381619,-1.535000,35.704584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.724584,-1.535000,35.361619>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,44.997030,0> translate<68.381619,-1.535000,35.704584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.395578,-1.535000,58.521600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,58.521600>}
box{<0,0,-0.304800><1.022622,0.035000,0.304800> rotate<0,0.000000,0> translate<68.395578,-1.535000,58.521600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.458706,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.976316,-1.535000,60.960000>}
box{<0,0,-0.304800><0.517609,0.035000,0.304800> rotate<0,0.000000,0> translate<68.458706,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.478397,-1.535000,58.721541>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.478397,-1.535000,60.912456>}
box{<0,0,-0.304800><2.190916,0.035000,0.304800> rotate<0,90.000000,0> translate<68.478397,-1.535000,60.912456> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.478397,-1.535000,59.131200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,59.131200>}
box{<0,0,-0.304800><0.939803,0.035000,0.304800> rotate<0,0.000000,0> translate<68.478397,-1.535000,59.131200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.478397,-1.535000,59.740800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,59.740800>}
box{<0,0,-0.304800><0.939803,0.035000,0.304800> rotate<0,0.000000,0> translate<68.478397,-1.535000,59.740800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.478397,-1.535000,60.350400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,60.350400>}
box{<0,0,-0.304800><0.939803,0.035000,0.304800> rotate<0,0.000000,0> translate<68.478397,-1.535000,60.350400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.529200,-1.535000,61.636797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.691609,-1.535000,61.244706>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,67.495530,0> translate<68.529200,-1.535000,61.636797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.529200,-1.535000,63.712200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.529200,-1.535000,61.636797>}
box{<0,0,-0.304800><2.075403,0.035000,0.304800> rotate<0,-90.000000,0> translate<68.529200,-1.535000,61.636797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.529200,-1.535000,63.712200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.691609,-1.535000,64.104291>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,-67.495530,0> translate<68.529200,-1.535000,63.712200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.584884,-1.535000,54.471397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.920966,-1.535000,54.332188>}
box{<0,0,-0.304800><0.363772,0.035000,0.304800> rotate<0,22.498510,0> translate<68.584884,-1.535000,54.471397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.691609,-1.535000,61.244706>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.991706,-1.535000,60.944609>}
box{<0,0,-0.304800><0.424401,0.035000,0.304800> rotate<0,44.997030,0> translate<68.691609,-1.535000,61.244706> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.691609,-1.535000,64.104291>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,64.830881>}
box{<0,0,-0.304800><1.027554,0.035000,0.304800> rotate<0,-44.997030,0> translate<68.691609,-1.535000,64.104291> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.704006,-1.535000,64.947800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,64.947800>}
box{<0,0,-0.304800><0.714194,0.035000,0.304800> rotate<0,0.000000,0> translate<68.704006,-1.535000,64.947800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.724584,-1.535000,35.361619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.910197,-1.535000,34.913513>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,67.495456,0> translate<68.724584,-1.535000,35.361619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.726581,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.716597,-1.535000,35.356800>}
box{<0,0,-0.304800><1.990016,0.035000,0.304800> rotate<0,0.000000,0> translate<68.726581,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.910197,-1.535000,33.550400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.910197,-1.535000,34.913513>}
box{<0,0,-0.304800><1.363112,0.035000,0.304800> rotate<0,90.000000,0> translate<68.910197,-1.535000,34.913513> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.910197,-1.535000,33.550400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.789800,-1.535000,35.430006>}
box{<0,0,-0.304800><2.658162,0.035000,0.304800> rotate<0,-44.997078,0> translate<68.910197,-1.535000,33.550400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.910197,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.497397,-1.535000,34.137600>}
box{<0,0,-0.304800><0.587200,0.035000,0.304800> rotate<0,0.000000,0> translate<68.910197,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.910197,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.106997,-1.535000,34.747200>}
box{<0,0,-0.304800><1.196800,0.035000,0.304800> rotate<0,0.000000,0> translate<68.910197,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.920966,-1.535000,54.332188>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.936734,-1.535000,54.316416>}
box{<0,0,-0.304800><0.022303,0.035000,0.304800> rotate<0,45.002707,0> translate<68.920966,-1.535000,54.332188> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.936734,-1.535000,54.316416>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,54.797881>}
box{<0,0,-0.304800><0.680895,0.035000,0.304800> rotate<0,-44.997030,0> translate<68.936734,-1.535000,54.316416> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.991706,-1.535000,60.944609>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,60.518116>}
box{<0,0,-0.304800><0.603153,0.035000,0.304800> rotate<0,44.997030,0> translate<68.991706,-1.535000,60.944609> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.037200,-1.535000,41.824797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.199609,-1.535000,41.432706>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,67.495530,0> translate<69.037200,-1.535000,41.824797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.037200,-1.535000,44.145200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.037200,-1.535000,41.824797>}
box{<0,0,-0.304800><2.320403,0.035000,0.304800> rotate<0,-90.000000,0> translate<69.037200,-1.535000,41.824797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.199609,-1.535000,41.432706>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.850609,-1.535000,39.781706>}
box{<0,0,-0.304800><2.334867,0.035000,0.304800> rotate<0,44.997030,0> translate<69.199609,-1.535000,41.432706> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,60.518116>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,54.797881>}
box{<0,0,-0.304800><5.720234,0.035000,0.304800> rotate<0,-90.000000,0> translate<69.418200,-1.535000,54.797881> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,64.947800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.418200,-1.535000,64.830881>}
box{<0,0,-0.304800><0.116919,0.035000,0.304800> rotate<0,-90.000000,0> translate<69.418200,-1.535000,64.830881> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.053197,-1.535000,21.968006>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.053197,-1.535000,22.699016>}
box{<0,0,-0.304800><0.731009,0.035000,0.304800> rotate<0,90.000000,0> translate<70.053197,-1.535000,22.699016> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.053197,-1.535000,21.968006>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.101006,-1.535000,21.920197>}
box{<0,0,-0.304800><0.067613,0.035000,0.304800> rotate<0,44.997030,0> translate<70.053197,-1.535000,21.968006> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.053197,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.197009,-1.535000,22.555200>}
box{<0,0,-0.304800><0.143813,0.035000,0.304800> rotate<0,0.000000,0> translate<70.053197,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.053197,-1.535000,22.699016>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.424394,-1.535000,22.327816>}
box{<0,0,-0.304800><0.524954,0.035000,0.304800> rotate<0,44.997271,0> translate<70.053197,-1.535000,22.699016> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.053197,-1.535000,26.322981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.053197,-1.535000,29.032200>}
box{<0,0,-0.304800><2.709219,0.035000,0.304800> rotate<0,90.000000,0> translate<70.053197,-1.535000,29.032200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.053197,-1.535000,26.322981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.154800,-1.535000,26.424584>}
box{<0,0,-0.304800><0.143689,0.035000,0.304800> rotate<0,-44.997030,0> translate<70.053197,-1.535000,26.322981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.053197,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.154800,-1.535000,26.822400>}
box{<0,0,-0.304800><0.101603,0.035000,0.304800> rotate<0,0.000000,0> translate<70.053197,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.053197,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.154800,-1.535000,27.432000>}
box{<0,0,-0.304800><0.101603,0.035000,0.304800> rotate<0,0.000000,0> translate<70.053197,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.053197,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.154800,-1.535000,28.041600>}
box{<0,0,-0.304800><0.101603,0.035000,0.304800> rotate<0,0.000000,0> translate<70.053197,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.053197,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.154800,-1.535000,28.651200>}
box{<0,0,-0.304800><0.101603,0.035000,0.304800> rotate<0,0.000000,0> translate<70.053197,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.053197,-1.535000,29.032200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.154800,-1.535000,29.032200>}
box{<0,0,-0.304800><0.101603,0.035000,0.304800> rotate<0,0.000000,0> translate<70.053197,-1.535000,29.032200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.075603,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.656397,-1.535000,21.945600>}
box{<0,0,-0.304800><1.580794,0.035000,0.304800> rotate<0,0.000000,0> translate<70.075603,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.101006,-1.535000,21.920197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.630991,-1.535000,21.920197>}
box{<0,0,-0.304800><1.529984,0.035000,0.304800> rotate<0,0.000000,0> translate<70.101006,-1.535000,21.920197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.154800,-1.535000,29.032200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.154800,-1.535000,26.424584>}
box{<0,0,-0.304800><2.607616,0.035000,0.304800> rotate<0,-90.000000,0> translate<70.154800,-1.535000,26.424584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.424394,-1.535000,22.327816>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.040541,-1.535000,22.072600>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,22.498454,0> translate<70.424394,-1.535000,22.327816> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.789800,-1.535000,36.437513>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.789800,-1.535000,35.430006>}
box{<0,0,-0.304800><1.007506,0.035000,0.304800> rotate<0,-90.000000,0> translate<70.789800,-1.535000,35.430006> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.789800,-1.535000,36.437513>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.975413,-1.535000,36.885619>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-67.495456,0> translate<70.789800,-1.535000,36.437513> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.850609,-1.535000,39.781706>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.150706,-1.535000,39.481609>}
box{<0,0,-0.304800><0.424401,0.035000,0.304800> rotate<0,44.997030,0> translate<70.850609,-1.535000,39.781706> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.975413,-1.535000,36.885619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.864413,-1.535000,37.774619>}
box{<0,0,-0.304800><1.257236,0.035000,0.304800> rotate<0,-44.997030,0> translate<70.975413,-1.535000,36.885619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.040541,-1.535000,22.072600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.707456,-1.535000,22.072600>}
box{<0,0,-0.304800><0.666916,0.035000,0.304800> rotate<0,0.000000,0> translate<71.040541,-1.535000,22.072600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.150706,-1.535000,39.481609>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.542797,-1.535000,39.319200>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,22.498530,0> translate<71.150706,-1.535000,39.481609> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.542797,-1.535000,39.319200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.569997,-1.535000,39.319200>}
box{<0,0,-0.304800><20.027200,0.035000,0.304800> rotate<0,0.000000,0> translate<71.542797,-1.535000,39.319200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.630991,-1.535000,21.920197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.837097,-1.535000,22.126300>}
box{<0,0,-0.304800><0.291476,0.035000,0.304800> rotate<0,-44.996596,0> translate<71.630991,-1.535000,21.920197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.707456,-1.535000,22.072600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.837097,-1.535000,22.126300>}
box{<0,0,-0.304800><0.140322,0.035000,0.304800> rotate<0,-22.498928,0> translate<71.707456,-1.535000,22.072600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.864413,-1.535000,37.774619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.207378,-1.535000,38.117584>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-44.997030,0> translate<71.864413,-1.535000,37.774619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.950097,-1.535000,63.626997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.000897,-1.535000,63.677800>}
box{<0,0,-0.304800><0.071844,0.035000,0.304800> rotate<0,-44.998792,0> translate<71.950097,-1.535000,63.626997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.950097,-1.535000,63.626997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.000900,-1.535000,63.576197>}
box{<0,0,-0.304800><0.071844,0.035000,0.304800> rotate<0,44.995268,0> translate<71.950097,-1.535000,63.626997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.000897,-1.535000,63.677800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.525100,-1.535000,63.677800>}
box{<0,0,-0.304800><0.524203,0.035000,0.304800> rotate<0,0.000000,0> translate<72.000897,-1.535000,63.677800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.000900,-1.535000,63.576197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.525097,-1.535000,63.576197>}
box{<0,0,-0.304800><0.524197,0.035000,0.304800> rotate<0,0.000000,0> translate<72.000900,-1.535000,63.576197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.040475,-1.535000,48.340200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.613291,-1.535000,47.767388>}
box{<0,0,-0.304800><0.810081,0.035000,0.304800> rotate<0,44.996874,0> translate<72.040475,-1.535000,48.340200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.040475,-1.535000,48.340200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.976116,-1.535000,48.340200>}
box{<0,0,-0.304800><1.935641,0.035000,0.304800> rotate<0,0.000000,0> translate<72.040475,-1.535000,48.340200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.207378,-1.535000,38.117584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.655484,-1.535000,38.303197>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-22.498604,0> translate<72.207378,-1.535000,38.117584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.222278,-1.535000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.157916,-1.535000,48.158400>}
box{<0,0,-0.304800><1.935637,0.035000,0.304800> rotate<0,0.000000,0> translate<72.222278,-1.535000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.421475,-1.535000,50.973797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.466881,-1.535000,52.019200>}
box{<0,0,-0.304800><1.478425,0.035000,0.304800> rotate<0,-44.996945,0> translate<72.421475,-1.535000,50.973797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.421475,-1.535000,50.973797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.400200,-1.535000,50.973797>}
box{<0,0,-0.304800><2.978725,0.035000,0.304800> rotate<0,0.000000,0> translate<72.421475,-1.535000,50.973797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.439819,-1.535000,19.507197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.826619,-1.535000,19.667413>}
box{<0,0,-0.304800><0.418668,0.035000,0.304800> rotate<0,-22.498239,0> translate<72.439819,-1.535000,19.507197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.439819,-1.535000,19.507197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.632991,-1.535000,19.507197>}
box{<0,0,-0.304800><15.193172,0.035000,0.304800> rotate<0,0.000000,0> translate<72.439819,-1.535000,19.507197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.439825,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.632997,-1.535000,19.507200>}
box{<0,0,-0.304800><15.193172,0.035000,0.304800> rotate<0,0.000000,0> translate<72.439825,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.525097,-1.535000,63.576197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.575900,-1.535000,63.627000>}
box{<0,0,-0.304800><0.071846,0.035000,0.304800> rotate<0,-44.997030,0> translate<72.525097,-1.535000,63.576197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.525100,-1.535000,63.677800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.575900,-1.535000,63.627000>}
box{<0,0,-0.304800><0.071842,0.035000,0.304800> rotate<0,44.997030,0> translate<72.525100,-1.535000,63.677800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.567797,-1.535000,60.957000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.567797,-1.535000,61.095103>}
box{<0,0,-0.304800><0.138103,0.035000,0.304800> rotate<0,90.000000,0> translate<72.567797,-1.535000,61.095103> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.567797,-1.535000,60.957000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.636847,-1.535000,61.026053>}
box{<0,0,-0.304800><0.097654,0.035000,0.304800> rotate<0,-44.998327,0> translate<72.567797,-1.535000,60.957000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.567797,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.570797,-1.535000,60.960000>}
box{<0,0,-0.304800><0.003000,0.035000,0.304800> rotate<0,0.000000,0> translate<72.567797,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.567797,-1.535000,61.095103>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.636847,-1.535000,61.026053>}
box{<0,0,-0.304800><0.097651,0.035000,0.304800> rotate<0,44.997030,0> translate<72.567797,-1.535000,61.095103> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.593197,-1.535000,26.424584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.593197,-1.535000,29.387800>}
box{<0,0,-0.304800><2.963216,0.035000,0.304800> rotate<0,90.000000,0> translate<72.593197,-1.535000,29.387800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.593197,-1.535000,26.424584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.644000,-1.535000,26.373784>}
box{<0,0,-0.304800><0.071844,0.035000,0.304800> rotate<0,44.995268,0> translate<72.593197,-1.535000,26.424584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.593197,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.273944,-1.535000,26.822400>}
box{<0,0,-0.304800><0.680747,0.035000,0.304800> rotate<0,0.000000,0> translate<72.593197,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.593197,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.234800,-1.535000,27.432000>}
box{<0,0,-0.304800><2.641603,0.035000,0.304800> rotate<0,0.000000,0> translate<72.593197,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.593197,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.234800,-1.535000,28.041600>}
box{<0,0,-0.304800><2.641603,0.035000,0.304800> rotate<0,0.000000,0> translate<72.593197,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.593197,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.234800,-1.535000,28.651200>}
box{<0,0,-0.304800><2.641603,0.035000,0.304800> rotate<0,0.000000,0> translate<72.593197,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.593197,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.313206,-1.535000,29.260800>}
box{<0,0,-0.304800><2.720009,0.035000,0.304800> rotate<0,0.000000,0> translate<72.593197,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.593197,-1.535000,29.387800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.290484,-1.535000,29.387800>}
box{<0,0,-0.304800><0.697288,0.035000,0.304800> rotate<0,0.000000,0> translate<72.593197,-1.535000,29.387800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.613291,-1.535000,47.767388>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.913387,-1.535000,47.467291>}
box{<0,0,-0.304800><0.424401,0.035000,0.304800> rotate<0,44.997030,0> translate<72.613291,-1.535000,47.767388> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.644000,-1.535000,26.373784>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.964394,-1.535000,26.694181>}
box{<0,0,-0.304800><0.453107,0.035000,0.304800> rotate<0,-44.997310,0> translate<72.644000,-1.535000,26.373784> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.654078,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.121194,-1.535000,51.206400>}
box{<0,0,-0.304800><9.467116,0.035000,0.304800> rotate<0,0.000000,0> translate<72.654078,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.655484,-1.535000,38.303197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.459513,-1.535000,38.303197>}
box{<0,0,-0.304800><12.804028,0.035000,0.304800> rotate<0,0.000000,0> translate<72.655484,-1.535000,38.303197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.826619,-1.535000,19.667413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.169584,-1.535000,20.010378>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-44.997030,0> translate<72.826619,-1.535000,19.667413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.831878,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.767516,-1.535000,47.548800>}
box{<0,0,-0.304800><1.935637,0.035000,0.304800> rotate<0,0.000000,0> translate<72.831878,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.913387,-1.535000,47.467291>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.075797,-1.535000,47.075200>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,67.495530,0> translate<72.913387,-1.535000,47.467291> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.964394,-1.535000,26.694181>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.580541,-1.535000,26.949397>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-22.498454,0> translate<72.964394,-1.535000,26.694181> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.966094,-1.535000,31.826197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.027991,-1.535000,31.826197>}
box{<0,0,-0.304800><0.061897,0.035000,0.304800> rotate<0,0.000000,0> translate<72.966094,-1.535000,31.826197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.966094,-1.535000,31.826197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.202800,-1.535000,32.062903>}
box{<0,0,-0.304800><0.334753,0.035000,0.304800> rotate<0,-44.997030,0> translate<72.966094,-1.535000,31.826197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.027991,-1.535000,31.826197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.202800,-1.535000,32.001006>}
box{<0,0,-0.304800><0.247218,0.035000,0.304800> rotate<0,-44.997030,0> translate<73.027991,-1.535000,31.826197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.075797,-1.535000,44.518100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.075797,-1.535000,47.075200>}
box{<0,0,-0.304800><2.557100,0.035000,0.304800> rotate<0,90.000000,0> translate<73.075797,-1.535000,47.075200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.075797,-1.535000,44.518100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279000,-1.535000,44.314897>}
box{<0,0,-0.304800><0.287373,0.035000,0.304800> rotate<0,44.997030,0> translate<73.075797,-1.535000,44.518100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.075797,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.205916,-1.535000,45.110400>}
box{<0,0,-0.304800><4.130119,0.035000,0.304800> rotate<0,0.000000,0> translate<73.075797,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.075797,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.596316,-1.535000,45.720000>}
box{<0,0,-0.304800><3.520519,0.035000,0.304800> rotate<0,0.000000,0> translate<73.075797,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.075797,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.986716,-1.535000,46.329600>}
box{<0,0,-0.304800><2.910919,0.035000,0.304800> rotate<0,0.000000,0> translate<73.075797,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.075797,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.377116,-1.535000,46.939200>}
box{<0,0,-0.304800><2.301319,0.035000,0.304800> rotate<0,0.000000,0> translate<73.075797,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.093097,-1.535000,44.500800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.464903,-1.535000,44.500800>}
box{<0,0,-0.304800><0.371806,0.035000,0.304800> rotate<0,0.000000,0> translate<73.093097,-1.535000,44.500800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.169584,-1.535000,20.010378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.104497,-1.535000,20.945294>}
box{<0,0,-0.304800><1.322168,0.035000,0.304800> rotate<0,-44.997126,0> translate<73.169584,-1.535000,20.010378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.202800,-1.535000,32.062903>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.202800,-1.535000,32.001006>}
box{<0,0,-0.304800><0.061897,0.035000,0.304800> rotate<0,-90.000000,0> translate<73.202800,-1.535000,32.001006> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.228197,-1.535000,35.424900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.228197,-1.535000,35.689991>}
box{<0,0,-0.304800><0.265091,0.035000,0.304800> rotate<0,90.000000,0> translate<73.228197,-1.535000,35.689991> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.228197,-1.535000,35.424900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.278997,-1.535000,35.374097>}
box{<0,0,-0.304800><0.071844,0.035000,0.304800> rotate<0,44.998792,0> translate<73.228197,-1.535000,35.424900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.228197,-1.535000,35.689991>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.403006,-1.535000,35.864800>}
box{<0,0,-0.304800><0.247218,0.035000,0.304800> rotate<0,-44.997030,0> translate<73.228197,-1.535000,35.689991> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.263678,-1.535000,51.816000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.730794,-1.535000,51.816000>}
box{<0,0,-0.304800><9.467116,0.035000,0.304800> rotate<0,0.000000,0> translate<73.263678,-1.535000,51.816000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.276003,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.242597,-1.535000,20.116800>}
box{<0,0,-0.304800><14.966594,0.035000,0.304800> rotate<0,0.000000,0> translate<73.276003,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.278997,-1.535000,35.374097>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.656947,-1.535000,35.752047>}
box{<0,0,-0.304800><0.534502,0.035000,0.304800> rotate<0,-44.997030,0> translate<73.278997,-1.535000,35.374097> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.279000,-1.535000,44.314897>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.656947,-1.535000,44.692847>}
box{<0,0,-0.304800><0.534500,0.035000,0.304800> rotate<0,-44.997267,0> translate<73.279000,-1.535000,44.314897> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.290484,-1.535000,29.387800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.775513,-1.535000,29.387800>}
box{<0,0,-0.304800><0.485028,0.035000,0.304800> rotate<0,0.000000,0> translate<73.290484,-1.535000,29.387800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.403006,-1.535000,35.864800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.929159,-1.535000,35.864800>}
box{<0,0,-0.304800><0.526153,0.035000,0.304800> rotate<0,0.000000,0> translate<73.403006,-1.535000,35.864800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.456797,-1.535000,55.168797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.456797,-1.535000,56.835116>}
box{<0,0,-0.304800><1.666319,0.035000,0.304800> rotate<0,90.000000,0> translate<73.456797,-1.535000,56.835116> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.456797,-1.535000,55.168797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.846247,-1.535000,55.168797>}
box{<0,0,-0.304800><0.389450,0.035000,0.304800> rotate<0,0.000000,0> translate<73.456797,-1.535000,55.168797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.456797,-1.535000,55.473600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.768200,-1.535000,55.473600>}
box{<0,0,-0.304800><2.311403,0.035000,0.304800> rotate<0,0.000000,0> translate<73.456797,-1.535000,55.473600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.456797,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.768200,-1.535000,56.083200>}
box{<0,0,-0.304800><2.311403,0.035000,0.304800> rotate<0,0.000000,0> translate<73.456797,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.456797,-1.535000,56.692800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.801700,-1.535000,56.692800>}
box{<0,0,-0.304800><2.344903,0.035000,0.304800> rotate<0,0.000000,0> translate<73.456797,-1.535000,56.692800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.456797,-1.535000,56.835116>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.466881,-1.535000,56.845200>}
box{<0,0,-0.304800><0.014261,0.035000,0.304800> rotate<0,-44.997030,0> translate<73.456797,-1.535000,56.835116> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.466881,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.846247,-1.535000,52.019200>}
box{<0,0,-0.304800><0.379366,0.035000,0.304800> rotate<0,0.000000,0> translate<73.466881,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.466881,-1.535000,56.845200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.846247,-1.535000,56.845200>}
box{<0,0,-0.304800><0.379366,0.035000,0.304800> rotate<0,0.000000,0> translate<73.466881,-1.535000,56.845200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.580541,-1.535000,26.949397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.247456,-1.535000,26.949397>}
box{<0,0,-0.304800><0.666916,0.035000,0.304800> rotate<0,0.000000,0> translate<73.580541,-1.535000,26.949397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.656947,-1.535000,35.752047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.929159,-1.535000,35.864800>}
box{<0,0,-0.304800><0.294640,0.035000,0.304800> rotate<0,-22.498338,0> translate<73.656947,-1.535000,35.752047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.656947,-1.535000,44.692847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.235750,-1.535000,44.932597>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,-22.498675,0> translate<73.656947,-1.535000,44.692847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.775513,-1.535000,29.387800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.223619,-1.535000,29.573412>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-22.498604,0> translate<73.775513,-1.535000,29.387800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.846247,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.425050,-1.535000,52.258950>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,-22.498675,0> translate<73.846247,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.846247,-1.535000,55.168797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.425050,-1.535000,54.929047>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,22.498675,0> translate<73.846247,-1.535000,55.168797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.846247,-1.535000,56.845200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.425050,-1.535000,57.084950>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,-22.498675,0> translate<73.846247,-1.535000,56.845200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.885603,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.323391,-1.535000,20.726400>}
box{<0,0,-0.304800><0.437787,0.035000,0.304800> rotate<0,0.000000,0> translate<73.885603,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.976116,-1.535000,48.340200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.010519,-1.535000,44.305797>}
box{<0,0,-0.304800><5.705508,0.035000,0.304800> rotate<0,44.997030,0> translate<73.976116,-1.535000,48.340200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.104497,-1.535000,20.945294>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.366378,-1.535000,20.683412>}
box{<0,0,-0.304800><0.370356,0.035000,0.304800> rotate<0,44.997030,0> translate<74.104497,-1.535000,20.945294> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.223619,-1.535000,29.573412>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.112619,-1.535000,30.462413>}
box{<0,0,-0.304800><1.257236,0.035000,0.304800> rotate<0,-44.997030,0> translate<74.223619,-1.535000,29.573412> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.235750,-1.535000,44.932597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.862247,-1.535000,44.932597>}
box{<0,0,-0.304800><0.626497,0.035000,0.304800> rotate<0,0.000000,0> translate<74.235750,-1.535000,44.932597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.247456,-1.535000,26.949397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.863603,-1.535000,26.694181>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,22.498454,0> translate<74.247456,-1.535000,26.949397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.366378,-1.535000,20.683412>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.814484,-1.535000,20.497800>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,22.498604,0> translate<74.366378,-1.535000,20.683412> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.425050,-1.535000,52.258950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.540897,-1.535000,52.374800>}
box{<0,0,-0.304800><0.163834,0.035000,0.304800> rotate<0,-44.997803,0> translate<74.425050,-1.535000,52.258950> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.425050,-1.535000,54.929047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.540897,-1.535000,54.813197>}
box{<0,0,-0.304800><0.163834,0.035000,0.304800> rotate<0,44.997803,0> translate<74.425050,-1.535000,54.929047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.425050,-1.535000,57.084950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.868047,-1.535000,57.527947>}
box{<0,0,-0.304800><0.626492,0.035000,0.304800> rotate<0,-44.997030,0> translate<74.425050,-1.535000,57.084950> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.490097,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.258897,-1.535000,54.864000>}
box{<0,0,-0.304800><1.768800,0.035000,0.304800> rotate<0,0.000000,0> translate<74.490097,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.490097,-1.535000,63.627000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.802997,-1.535000,63.939900>}
box{<0,0,-0.304800><0.442507,0.035000,0.304800> rotate<0,-44.997030,0> translate<74.490097,-1.535000,63.627000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.490097,-1.535000,63.627000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.803000,-1.535000,63.314097>}
box{<0,0,-0.304800><0.442512,0.035000,0.304800> rotate<0,44.997030,0> translate<74.490097,-1.535000,63.627000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.520606,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.771197,-1.535000,29.870400>}
box{<0,0,-0.304800><1.250591,0.035000,0.304800> rotate<0,0.000000,0> translate<74.520606,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.540897,-1.535000,52.374800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.208097,-1.535000,52.374800>}
box{<0,0,-0.304800><1.667200,0.035000,0.304800> rotate<0,0.000000,0> translate<74.540897,-1.535000,52.374800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.540897,-1.535000,54.813197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.309703,-1.535000,54.813197>}
box{<0,0,-0.304800><1.768806,0.035000,0.304800> rotate<0,0.000000,0> translate<74.540897,-1.535000,54.813197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.554056,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.234800,-1.535000,26.822400>}
box{<0,0,-0.304800><0.680744,0.035000,0.304800> rotate<0,0.000000,0> translate<74.554056,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.642500,-1.535000,57.302400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.123800,-1.535000,57.302400>}
box{<0,0,-0.304800><1.481300,0.035000,0.304800> rotate<0,0.000000,0> translate<74.642500,-1.535000,57.302400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.718697,-1.535000,63.398400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.853800,-1.535000,63.398400>}
box{<0,0,-0.304800><0.135103,0.035000,0.304800> rotate<0,0.000000,0> translate<74.718697,-1.535000,63.398400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.802997,-1.535000,63.939900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.853800,-1.535000,63.889097>}
box{<0,0,-0.304800><0.071846,0.035000,0.304800> rotate<0,44.997030,0> translate<74.802997,-1.535000,63.939900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.803000,-1.535000,63.314097>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.853800,-1.535000,63.364897>}
box{<0,0,-0.304800><0.071842,0.035000,0.304800> rotate<0,-44.997030,0> translate<74.803000,-1.535000,63.314097> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.814484,-1.535000,20.497800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.508881,-1.535000,20.497800>}
box{<0,0,-0.304800><7.694397,0.035000,0.304800> rotate<0,0.000000,0> translate<74.814484,-1.535000,20.497800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.820294,-1.535000,59.359800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.868047,-1.535000,59.312050>}
box{<0,0,-0.304800><0.067531,0.035000,0.304800> rotate<0,44.995156,0> translate<74.820294,-1.535000,59.359800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.820294,-1.535000,59.359800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.928703,-1.535000,59.359800>}
box{<0,0,-0.304800><1.108409,0.035000,0.304800> rotate<0,0.000000,0> translate<74.820294,-1.535000,59.359800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.853800,-1.535000,63.889097>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.853800,-1.535000,63.364897>}
box{<0,0,-0.304800><0.524200,0.035000,0.304800> rotate<0,-90.000000,0> translate<74.853800,-1.535000,63.364897> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.862247,-1.535000,44.932597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.441050,-1.535000,44.692847>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,22.498675,0> translate<74.862247,-1.535000,44.932597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.863603,-1.535000,26.694181>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.184000,-1.535000,26.373784>}
box{<0,0,-0.304800><0.453110,0.035000,0.304800> rotate<0,44.997030,0> translate<74.863603,-1.535000,26.694181> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.868047,-1.535000,57.527947>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.107797,-1.535000,58.106750>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,-67.495385,0> translate<74.868047,-1.535000,57.527947> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.868047,-1.535000,59.312050>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.107797,-1.535000,58.733247>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,67.495385,0> translate<74.868047,-1.535000,59.312050> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.942959,-1.535000,59.131200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.768200,-1.535000,59.131200>}
box{<0,0,-0.304800><0.825241,0.035000,0.304800> rotate<0,0.000000,0> translate<74.942959,-1.535000,59.131200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.027128,-1.535000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.768200,-1.535000,57.912000>}
box{<0,0,-0.304800><0.741072,0.035000,0.304800> rotate<0,0.000000,0> translate<75.027128,-1.535000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.045513,-1.535000,67.386197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.493619,-1.535000,67.200584>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,22.498604,0> translate<75.045513,-1.535000,67.386197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.107797,-1.535000,58.106750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.107797,-1.535000,58.733247>}
box{<0,0,-0.304800><0.626497,0.035000,0.304800> rotate<0,90.000000,0> translate<75.107797,-1.535000,58.733247> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.107797,-1.535000,58.521600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.768200,-1.535000,58.521600>}
box{<0,0,-0.304800><0.660403,0.035000,0.304800> rotate<0,0.000000,0> translate<75.107797,-1.535000,58.521600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.112619,-1.535000,30.462413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.455584,-1.535000,30.805378>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-44.997030,0> translate<75.112619,-1.535000,30.462413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.130206,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.380797,-1.535000,30.480000>}
box{<0,0,-0.304800><1.250591,0.035000,0.304800> rotate<0,0.000000,0> translate<75.130206,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.168838,-1.535000,35.864800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.441050,-1.535000,35.752047>}
box{<0,0,-0.304800><0.294640,0.035000,0.304800> rotate<0,22.498338,0> translate<75.168838,-1.535000,35.864800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.168838,-1.535000,35.864800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.055703,-1.535000,35.864800>}
box{<0,0,-0.304800><0.886866,0.035000,0.304800> rotate<0,0.000000,0> translate<75.168838,-1.535000,35.864800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.184000,-1.535000,26.373784>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.234800,-1.535000,26.424584>}
box{<0,0,-0.304800><0.071842,0.035000,0.304800> rotate<0,-44.997030,0> translate<75.184000,-1.535000,26.373784> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.234800,-1.535000,29.071513>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.234800,-1.535000,26.424584>}
box{<0,0,-0.304800><2.646928,0.035000,0.304800> rotate<0,-90.000000,0> translate<75.234800,-1.535000,26.424584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.234800,-1.535000,29.071513>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.420412,-1.535000,29.519619>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-67.495456,0> translate<75.234800,-1.535000,29.071513> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.400200,-1.535000,50.973797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.792291,-1.535000,50.811388>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,22.498530,0> translate<75.400200,-1.535000,50.973797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.420412,-1.535000,29.519619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.657200,-1.535000,30.756403>}
box{<0,0,-0.304800><1.749079,0.035000,0.304800> rotate<0,-44.996958,0> translate<75.420412,-1.535000,29.519619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.441050,-1.535000,35.752047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.691997,-1.535000,35.501097>}
box{<0,0,-0.304800><0.354895,0.035000,0.304800> rotate<0,44.997387,0> translate<75.441050,-1.535000,35.752047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.441050,-1.535000,44.692847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.884047,-1.535000,44.249850>}
box{<0,0,-0.304800><0.626492,0.035000,0.304800> rotate<0,44.997030,0> translate<75.441050,-1.535000,44.692847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.455584,-1.535000,30.805378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.641197,-1.535000,31.253484>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-67.495456,0> translate<75.455584,-1.535000,30.805378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.493619,-1.535000,67.200584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.222403,-1.535000,66.471797>}
box{<0,0,-0.304800><1.030659,0.035000,0.304800> rotate<0,44.997153,0> translate<75.493619,-1.535000,67.200584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.573313,-1.535000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.657200,-1.535000,31.089600>}
box{<0,0,-0.304800><1.083888,0.035000,0.304800> rotate<0,0.000000,0> translate<75.573313,-1.535000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.633097,-1.535000,44.500800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.815516,-1.535000,44.500800>}
box{<0,0,-0.304800><2.182419,0.035000,0.304800> rotate<0,0.000000,0> translate<75.633097,-1.535000,44.500800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.638203,-1.535000,67.056000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.793791,-1.535000,67.056000>}
box{<0,0,-0.304800><3.155587,0.035000,0.304800> rotate<0,0.000000,0> translate<75.638203,-1.535000,67.056000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.641197,-1.535000,31.253484>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.641197,-1.535000,31.961297>}
box{<0,0,-0.304800><0.707812,0.035000,0.304800> rotate<0,90.000000,0> translate<75.641197,-1.535000,31.961297> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.641197,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.097100,-1.535000,31.699200>}
box{<0,0,-0.304800><1.455903,0.035000,0.304800> rotate<0,0.000000,0> translate<75.641197,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.641197,-1.535000,31.961297>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.884047,-1.535000,32.204147>}
box{<0,0,-0.304800><0.343442,0.035000,0.304800> rotate<0,-44.997030,0> translate<75.641197,-1.535000,31.961297> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.691997,-1.535000,35.501097>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.055703,-1.535000,35.864800>}
box{<0,0,-0.304800><0.514356,0.035000,0.304800> rotate<0,-44.996784,0> translate<75.691997,-1.535000,35.501097> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.768200,-1.535000,55.354697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.309703,-1.535000,54.813197>}
box{<0,0,-0.304800><0.765799,0.035000,0.304800> rotate<0,44.996865,0> translate<75.768200,-1.535000,55.354697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.768200,-1.535000,56.659300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.768200,-1.535000,55.354697>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,-90.000000,0> translate<75.768200,-1.535000,55.354697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.768200,-1.535000,56.659300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.123800,-1.535000,57.014900>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<75.768200,-1.535000,56.659300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.768200,-1.535000,57.894697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.123800,-1.535000,57.539097>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<75.768200,-1.535000,57.894697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.768200,-1.535000,59.199300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.768200,-1.535000,57.894697>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,-90.000000,0> translate<75.768200,-1.535000,57.894697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.768200,-1.535000,59.199300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.928703,-1.535000,59.359800>}
box{<0,0,-0.304800><0.226983,0.035000,0.304800> rotate<0,-44.996472,0> translate<75.768200,-1.535000,59.199300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.792291,-1.535000,50.811388>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.578881,-1.535000,46.024797>}
box{<0,0,-0.304800><6.769261,0.035000,0.304800> rotate<0,44.997030,0> translate<75.792291,-1.535000,50.811388> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.884047,-1.535000,32.204147>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.123797,-1.535000,32.782950>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,-67.495385,0> translate<75.884047,-1.535000,32.204147> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.884047,-1.535000,44.249850>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.123797,-1.535000,43.671047>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,67.495385,0> translate<75.884047,-1.535000,44.249850> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.927394,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.854672,-1.535000,32.308800>}
box{<0,0,-0.304800><0.927278,0.035000,0.304800> rotate<0,0.000000,0> translate<75.927394,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.006878,-1.535000,50.596800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.511594,-1.535000,50.596800>}
box{<0,0,-0.304800><5.504716,0.035000,0.304800> rotate<0,0.000000,0> translate<76.006878,-1.535000,50.596800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.032606,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.838788,-1.535000,43.891200>}
box{<0,0,-0.304800><1.806181,0.035000,0.304800> rotate<0,0.000000,0> translate<76.032606,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.123797,-1.535000,32.782950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.123797,-1.535000,33.155103>}
box{<0,0,-0.304800><0.372153,0.035000,0.304800> rotate<0,90.000000,0> translate<76.123797,-1.535000,33.155103> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.123797,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.333216,-1.535000,32.918400>}
box{<0,0,-0.304800><0.209419,0.035000,0.304800> rotate<0,0.000000,0> translate<76.123797,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.123797,-1.535000,33.155103>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.309697,-1.535000,32.969200>}
box{<0,0,-0.304800><0.262905,0.035000,0.304800> rotate<0,44.997512,0> translate<76.123797,-1.535000,33.155103> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.123797,-1.535000,43.552894>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.123797,-1.535000,43.671047>}
box{<0,0,-0.304800><0.118153,0.035000,0.304800> rotate<0,90.000000,0> translate<76.123797,-1.535000,43.671047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.123797,-1.535000,43.552894>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.309697,-1.535000,43.738797>}
box{<0,0,-0.304800><0.262905,0.035000,0.304800> rotate<0,-44.997512,0> translate<76.123797,-1.535000,43.552894> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.123800,-1.535000,57.539097>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.123800,-1.535000,57.014900>}
box{<0,0,-0.304800><0.524197,0.035000,0.304800> rotate<0,-90.000000,0> translate<76.123800,-1.535000,57.014900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.208097,-1.535000,52.374800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.690697,-1.535000,51.892200>}
box{<0,0,-0.304800><0.682499,0.035000,0.304800> rotate<0,44.997030,0> translate<76.208097,-1.535000,52.374800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.222403,-1.535000,66.471797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.725300,-1.535000,66.471797>}
box{<0,0,-0.304800><0.502897,0.035000,0.304800> rotate<0,0.000000,0> translate<76.222403,-1.535000,66.471797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.309697,-1.535000,32.969200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.312175,-1.535000,32.969200>}
box{<0,0,-0.304800><0.002478,0.035000,0.304800> rotate<0,0.000000,0> translate<76.309697,-1.535000,32.969200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.309697,-1.535000,43.738797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.614300,-1.535000,43.738797>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,0.000000,0> translate<76.309697,-1.535000,43.738797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.312175,-1.535000,32.969200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.395544,-1.535000,32.767928>}
box{<0,0,-0.304800><0.217855,0.035000,0.304800> rotate<0,67.495737,0> translate<76.312175,-1.535000,32.969200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.395544,-1.535000,32.767928>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.157544,-1.535000,32.005928>}
box{<0,0,-0.304800><1.077631,0.035000,0.304800> rotate<0,44.997030,0> translate<76.395544,-1.535000,32.767928> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.616478,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.113122,-1.535000,49.987200>}
box{<0,0,-0.304800><4.496644,0.035000,0.304800> rotate<0,0.000000,0> translate<76.616478,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.657200,-1.535000,31.259300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.657200,-1.535000,30.756403>}
box{<0,0,-0.304800><0.502897,0.035000,0.304800> rotate<0,-90.000000,0> translate<76.657200,-1.535000,30.756403> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.657200,-1.535000,31.259300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.280687,-1.535000,31.882788>}
box{<0,0,-0.304800><0.881744,0.035000,0.304800> rotate<0,-44.997030,0> translate<76.657200,-1.535000,31.259300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.690697,-1.535000,51.892200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.995300,-1.535000,51.892200>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,0.000000,0> translate<76.690697,-1.535000,51.892200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.725300,-1.535000,66.471797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.080900,-1.535000,66.116197>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<76.725300,-1.535000,66.471797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.750697,-1.535000,66.446400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.403391,-1.535000,66.446400>}
box{<0,0,-0.304800><2.652694,0.035000,0.304800> rotate<0,0.000000,0> translate<76.750697,-1.535000,66.446400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.080900,-1.535000,66.116197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.839512,-1.535000,66.116197>}
box{<0,0,-0.304800><0.758612,0.035000,0.304800> rotate<0,0.000000,0> translate<77.080900,-1.535000,66.116197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.157544,-1.535000,32.005928>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.280687,-1.535000,31.882788>}
box{<0,0,-0.304800><0.174149,0.035000,0.304800> rotate<0,44.996303,0> translate<77.157544,-1.535000,32.005928> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.226078,-1.535000,49.377600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.076800,-1.535000,49.377600>}
box{<0,0,-0.304800><3.850722,0.035000,0.304800> rotate<0,0.000000,0> translate<77.226078,-1.535000,49.377600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.292197,-1.535000,63.364897>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.292197,-1.535000,63.477597>}
box{<0,0,-0.304800><0.112700,0.035000,0.304800> rotate<0,90.000000,0> translate<77.292197,-1.535000,63.477597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.292197,-1.535000,63.364897>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.647797,-1.535000,63.009300>}
box{<0,0,-0.304800><0.502892,0.035000,0.304800> rotate<0,44.996778,0> translate<77.292197,-1.535000,63.364897> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.292197,-1.535000,63.398400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.371391,-1.535000,63.398400>}
box{<0,0,-0.304800><0.079194,0.035000,0.304800> rotate<0,0.000000,0> translate<77.292197,-1.535000,63.398400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.292197,-1.535000,63.477597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.774800,-1.535000,62.994991>}
box{<0,0,-0.304800><0.682506,0.035000,0.304800> rotate<0,44.997216,0> translate<77.292197,-1.535000,63.477597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.614300,-1.535000,43.738797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.800200,-1.535000,43.552894>}
box{<0,0,-0.304800><0.262905,0.035000,0.304800> rotate<0,44.997512,0> translate<77.614300,-1.535000,43.738797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.647797,-1.535000,62.661797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.647797,-1.535000,63.009300>}
box{<0,0,-0.304800><0.347503,0.035000,0.304800> rotate<0,90.000000,0> translate<77.647797,-1.535000,63.009300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.647797,-1.535000,62.661797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.774800,-1.535000,62.661797>}
box{<0,0,-0.304800><0.127003,0.035000,0.304800> rotate<0,0.000000,0> translate<77.647797,-1.535000,62.661797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.647797,-1.535000,62.788800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.774800,-1.535000,62.788800>}
box{<0,0,-0.304800><0.127003,0.035000,0.304800> rotate<0,0.000000,0> translate<77.647797,-1.535000,62.788800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.673197,-1.535000,26.424584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.673197,-1.535000,26.746200>}
box{<0,0,-0.304800><0.321616,0.035000,0.304800> rotate<0,90.000000,0> translate<77.673197,-1.535000,26.746200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.673197,-1.535000,26.424584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.875181,-1.535000,26.222603>}
box{<0,0,-0.304800><0.285647,0.035000,0.304800> rotate<0,44.996587,0> translate<77.673197,-1.535000,26.424584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.673197,-1.535000,26.746200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.282800,-1.535000,26.746200>}
box{<0,0,-0.304800><0.609603,0.035000,0.304800> rotate<0,0.000000,0> translate<77.673197,-1.535000,26.746200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.774800,-1.535000,62.994991>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.774800,-1.535000,62.661797>}
box{<0,0,-0.304800><0.333194,0.035000,0.304800> rotate<0,-90.000000,0> translate<77.774800,-1.535000,62.661797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.800200,-1.535000,43.798047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.800200,-1.535000,43.552894>}
box{<0,0,-0.304800><0.245153,0.035000,0.304800> rotate<0,-90.000000,0> translate<77.800200,-1.535000,43.552894> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.800200,-1.535000,43.798047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.010519,-1.535000,44.305797>}
box{<0,0,-0.304800><0.549585,0.035000,0.304800> rotate<0,-67.495371,0> translate<77.800200,-1.535000,43.798047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.835678,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.957900,-1.535000,48.768000>}
box{<0,0,-0.304800><3.122222,0.035000,0.304800> rotate<0,0.000000,0> translate<77.835678,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.839512,-1.535000,66.116197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.287619,-1.535000,65.930584>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,22.498604,0> translate<77.839512,-1.535000,66.116197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.868294,-1.535000,35.864800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.155800,-1.535000,35.577294>}
box{<0,0,-0.304800><0.406595,0.035000,0.304800> rotate<0,44.997030,0> translate<77.868294,-1.535000,35.864800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.868294,-1.535000,35.864800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.155800,-1.535000,35.864800>}
box{<0,0,-0.304800><0.287506,0.035000,0.304800> rotate<0,0.000000,0> translate<77.868294,-1.535000,35.864800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.875181,-1.535000,26.222603>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.951697,-1.535000,26.037875>}
box{<0,0,-0.304800><0.199948,0.035000,0.304800> rotate<0,67.495881,0> translate<77.875181,-1.535000,26.222603> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.879244,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.024153,-1.535000,26.212800>}
box{<0,0,-0.304800><0.144909,0.035000,0.304800> rotate<0,0.000000,0> translate<77.879244,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.951697,-1.535000,26.037875>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.080816,-1.535000,26.349603>}
box{<0,0,-0.304800><0.337411,0.035000,0.304800> rotate<0,-67.496058,0> translate<77.951697,-1.535000,26.037875> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.995300,-1.535000,51.892200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.917797,-1.535000,52.814697>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,-44.997030,0> translate<77.995300,-1.535000,51.892200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.080816,-1.535000,26.349603>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.282800,-1.535000,26.551584>}
box{<0,0,-0.304800><0.285647,0.035000,0.304800> rotate<0,-44.996587,0> translate<78.080816,-1.535000,26.349603> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.107991,-1.535000,67.741800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.060800,-1.535000,65.788991>}
box{<0,0,-0.304800><2.761690,0.035000,0.304800> rotate<0,44.997030,0> translate<78.107991,-1.535000,67.741800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.155800,-1.535000,35.864800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.155800,-1.535000,35.577294>}
box{<0,0,-0.304800><0.287506,0.035000,0.304800> rotate<0,-90.000000,0> translate<78.155800,-1.535000,35.577294> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.282800,-1.535000,26.746200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.282800,-1.535000,26.551584>}
box{<0,0,-0.304800><0.194616,0.035000,0.304800> rotate<0,-90.000000,0> translate<78.282800,-1.535000,26.551584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.287619,-1.535000,65.930584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.630584,-1.535000,65.587619>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,44.997030,0> translate<78.287619,-1.535000,65.930584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.300097,-1.535000,54.737000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.917797,-1.535000,54.119300>}
box{<0,0,-0.304800><0.873560,0.035000,0.304800> rotate<0,44.997030,0> translate<78.300097,-1.535000,54.737000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.300097,-1.535000,54.737000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.917797,-1.535000,55.354697>}
box{<0,0,-0.304800><0.873558,0.035000,0.304800> rotate<0,-44.996885,0> translate<78.300097,-1.535000,54.737000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.381403,-1.535000,65.836800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.012991,-1.535000,65.836800>}
box{<0,0,-0.304800><1.631587,0.035000,0.304800> rotate<0,0.000000,0> translate<78.381403,-1.535000,65.836800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.427097,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.721200,-1.535000,54.864000>}
box{<0,0,-0.304800><2.294103,0.035000,0.304800> rotate<0,0.000000,0> translate<78.427097,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.445278,-1.535000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.721200,-1.535000,48.158400>}
box{<0,0,-0.304800><2.275922,0.035000,0.304800> rotate<0,0.000000,0> translate<78.445278,-1.535000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.528700,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.340394,-1.535000,52.425600>}
box{<0,0,-0.304800><4.811694,0.035000,0.304800> rotate<0,0.000000,0> translate<78.528700,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.562197,-1.535000,57.014900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.562197,-1.535000,57.416728>}
box{<0,0,-0.304800><0.401828,0.035000,0.304800> rotate<0,90.000000,0> translate<78.562197,-1.535000,57.416728> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.562197,-1.535000,57.014900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.917797,-1.535000,56.659300>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<78.562197,-1.535000,57.014900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.562197,-1.535000,57.302400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.060800,-1.535000,57.302400>}
box{<0,0,-0.304800><1.498603,0.035000,0.304800> rotate<0,0.000000,0> translate<78.562197,-1.535000,57.302400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.562197,-1.535000,57.416728>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.795619,-1.535000,57.513413>}
box{<0,0,-0.304800><0.252653,0.035000,0.304800> rotate<0,-22.498069,0> translate<78.562197,-1.535000,57.416728> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.630584,-1.535000,65.587619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.027584,-1.535000,64.190619>}
box{<0,0,-0.304800><1.975656,0.035000,0.304800> rotate<0,44.997030,0> translate<78.630584,-1.535000,65.587619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.782697,-1.535000,54.254400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.313497,-1.535000,54.254400>}
box{<0,0,-0.304800><2.530800,0.035000,0.304800> rotate<0,0.000000,0> translate<78.782697,-1.535000,54.254400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.795619,-1.535000,57.513413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.684619,-1.535000,58.402413>}
box{<0,0,-0.304800><1.257236,0.035000,0.304800> rotate<0,-44.997030,0> translate<78.795619,-1.535000,57.513413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.884297,-1.535000,56.692800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.060800,-1.535000,56.692800>}
box{<0,0,-0.304800><1.176503,0.035000,0.304800> rotate<0,0.000000,0> translate<78.884297,-1.535000,56.692800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.917797,-1.535000,52.814697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.917797,-1.535000,54.119300>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,90.000000,0> translate<78.917797,-1.535000,54.119300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.917797,-1.535000,53.035200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.769200,-1.535000,53.035200>}
box{<0,0,-0.304800><4.851403,0.035000,0.304800> rotate<0,0.000000,0> translate<78.917797,-1.535000,53.035200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.917797,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.688484,-1.535000,53.644800>}
box{<0,0,-0.304800><3.770687,0.035000,0.304800> rotate<0,0.000000,0> translate<78.917797,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.917797,-1.535000,55.354697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.917797,-1.535000,56.659300>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,90.000000,0> translate<78.917797,-1.535000,56.659300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.917797,-1.535000,55.473600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.597194,-1.535000,55.473600>}
box{<0,0,-0.304800><1.679397,0.035000,0.304800> rotate<0,0.000000,0> translate<78.917797,-1.535000,55.473600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.917797,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.139203,-1.535000,56.083200>}
box{<0,0,-0.304800><1.221406,0.035000,0.304800> rotate<0,0.000000,0> translate<78.917797,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.991003,-1.535000,65.227200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.060800,-1.535000,65.227200>}
box{<0,0,-0.304800><1.069797,0.035000,0.304800> rotate<0,0.000000,0> translate<78.991003,-1.535000,65.227200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.054878,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.721200,-1.535000,47.548800>}
box{<0,0,-0.304800><1.666322,0.035000,0.304800> rotate<0,0.000000,0> translate<79.054878,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.194206,-1.535000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.060800,-1.535000,57.912000>}
box{<0,0,-0.304800><0.866594,0.035000,0.304800> rotate<0,0.000000,0> translate<79.194206,-1.535000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.392294,-1.535000,29.540197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.806797,-1.535000,29.954697>}
box{<0,0,-0.304800><0.586194,0.035000,0.304800> rotate<0,-44.996814,0> translate<79.392294,-1.535000,29.540197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.392294,-1.535000,29.540197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.393991,-1.535000,29.540197>}
box{<0,0,-0.304800><1.001697,0.035000,0.304800> rotate<0,0.000000,0> translate<79.392294,-1.535000,29.540197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.600603,-1.535000,64.617600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.060800,-1.535000,64.617600>}
box{<0,0,-0.304800><0.460197,0.035000,0.304800> rotate<0,0.000000,0> translate<79.600603,-1.535000,64.617600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.664478,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.008697,-1.535000,46.939200>}
box{<0,0,-0.304800><1.344219,0.035000,0.304800> rotate<0,0.000000,0> translate<79.664478,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.684619,-1.535000,58.402413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.027584,-1.535000,58.745378>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-44.997030,0> translate<79.684619,-1.535000,58.402413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.722497,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.724194,-1.535000,29.870400>}
box{<0,0,-0.304800><1.001697,0.035000,0.304800> rotate<0,0.000000,0> translate<79.722497,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.803806,-1.535000,58.521600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.060800,-1.535000,58.521600>}
box{<0,0,-0.304800><0.256994,0.035000,0.304800> rotate<0,0.000000,0> translate<79.803806,-1.535000,58.521600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.806797,-1.535000,29.954697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.806797,-1.535000,30.632400>}
box{<0,0,-0.304800><0.677703,0.035000,0.304800> rotate<0,90.000000,0> translate<79.806797,-1.535000,30.632400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.806797,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.822800,-1.535000,30.480000>}
box{<0,0,-0.304800><1.016003,0.035000,0.304800> rotate<0,0.000000,0> translate<79.806797,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.806797,-1.535000,30.632400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.359303,-1.535000,30.632400>}
box{<0,0,-0.304800><0.552506,0.035000,0.304800> rotate<0,0.000000,0> translate<79.806797,-1.535000,30.632400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.890000,-1.535000,69.408200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.313584,-1.535000,66.984619>}
box{<0,0,-0.304800><3.427464,0.035000,0.304800> rotate<0,44.996993,0> translate<79.890000,-1.535000,69.408200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.890000,-1.535000,69.408200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.748059,-1.535000,69.408200>}
box{<0,0,-0.304800><14.858059,0.035000,0.304800> rotate<0,0.000000,0> translate<79.890000,-1.535000,69.408200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.027584,-1.535000,58.745378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.060800,-1.535000,58.825572>}
box{<0,0,-0.304800><0.086800,0.035000,0.304800> rotate<0,-67.496590,0> translate<80.027584,-1.535000,58.745378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.027584,-1.535000,64.190619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.060800,-1.535000,64.110425>}
box{<0,0,-0.304800><0.086800,0.035000,0.304800> rotate<0,67.496590,0> translate<80.027584,-1.535000,64.190619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.060800,-1.535000,56.272484>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.246413,-1.535000,55.824378>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,67.495456,0> translate<80.060800,-1.535000,56.272484> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.060800,-1.535000,58.825572>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.060800,-1.535000,56.272484>}
box{<0,0,-0.304800><2.553087,0.035000,0.304800> rotate<0,-90.000000,0> translate<80.060800,-1.535000,56.272484> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.060800,-1.535000,65.788991>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.060800,-1.535000,64.110425>}
box{<0,0,-0.304800><1.678566,0.035000,0.304800> rotate<0,-90.000000,0> translate<80.060800,-1.535000,64.110425> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.246413,-1.535000,55.824378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.589378,-1.535000,55.481413>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,44.997030,0> translate<80.246413,-1.535000,55.824378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.274078,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.618297,-1.535000,46.329600>}
box{<0,0,-0.304800><1.344219,0.035000,0.304800> rotate<0,0.000000,0> translate<80.274078,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.359303,-1.535000,30.632400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.770069,-1.535000,30.802544>}
box{<0,0,-0.304800><0.444609,0.035000,0.304800> rotate<0,-22.498403,0> translate<80.359303,-1.535000,30.632400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.393991,-1.535000,29.540197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.822800,-1.535000,29.969006>}
box{<0,0,-0.304800><0.606428,0.035000,0.304800> rotate<0,-44.997030,0> translate<80.393991,-1.535000,29.540197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.413403,-1.535000,68.884800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.750384,-1.535000,68.884800>}
box{<0,0,-0.304800><14.336981,0.035000,0.304800> rotate<0,0.000000,0> translate<80.413403,-1.535000,68.884800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.578881,-1.535000,46.024797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.683200,-1.535000,46.024797>}
box{<0,0,-0.304800><5.104319,0.035000,0.304800> rotate<0,0.000000,0> translate<80.578881,-1.535000,46.024797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.589378,-1.535000,55.481413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.589381,-1.535000,55.481413>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<80.589378,-1.535000,55.481413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.589381,-1.535000,55.481413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.721200,-1.535000,55.349594>}
box{<0,0,-0.304800><0.186420,0.035000,0.304800> rotate<0,44.997030,0> translate<80.589381,-1.535000,55.481413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.721200,-1.535000,47.226697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.643697,-1.535000,46.304200>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,44.997030,0> translate<80.721200,-1.535000,47.226697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.721200,-1.535000,48.531300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.721200,-1.535000,47.226697>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,-90.000000,0> translate<80.721200,-1.535000,47.226697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.721200,-1.535000,48.531300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.076800,-1.535000,48.886900>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<80.721200,-1.535000,48.531300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.721200,-1.535000,54.846697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.643697,-1.535000,53.924200>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,44.997030,0> translate<80.721200,-1.535000,54.846697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.721200,-1.535000,55.349594>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.721200,-1.535000,54.846697>}
box{<0,0,-0.304800><0.502897,0.035000,0.304800> rotate<0,-90.000000,0> translate<80.721200,-1.535000,54.846697> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.770069,-1.535000,30.802544>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.822800,-1.535000,30.855278>}
box{<0,0,-0.304800><0.074575,0.035000,0.304800> rotate<0,-44.998728,0> translate<80.770069,-1.535000,30.802544> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.822800,-1.535000,30.855278>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.822800,-1.535000,29.969006>}
box{<0,0,-0.304800><0.886272,0.035000,0.304800> rotate<0,-90.000000,0> translate<80.822800,-1.535000,29.969006> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.023003,-1.535000,68.275200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.753094,-1.535000,68.275200>}
box{<0,0,-0.304800><13.730091,0.035000,0.304800> rotate<0,0.000000,0> translate<81.023003,-1.535000,68.275200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.076800,-1.535000,49.899513>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.076800,-1.535000,48.886900>}
box{<0,0,-0.304800><1.012612,0.035000,0.304800> rotate<0,-90.000000,0> translate<81.076800,-1.535000,48.886900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.076800,-1.535000,49.899513>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.262413,-1.535000,50.347619>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-67.495456,0> translate<81.076800,-1.535000,49.899513> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.262413,-1.535000,50.347619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.769200,-1.535000,52.854406>}
box{<0,0,-0.304800><3.545133,0.035000,0.304800> rotate<0,-44.997030,0> translate<81.262413,-1.535000,50.347619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.632603,-1.535000,67.665600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.755803,-1.535000,67.665600>}
box{<0,0,-0.304800><13.123200,0.035000,0.304800> rotate<0,0.000000,0> translate<81.632603,-1.535000,67.665600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.643697,-1.535000,46.304200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.948300,-1.535000,46.304200>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,0.000000,0> translate<81.643697,-1.535000,46.304200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.643697,-1.535000,53.924200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.146594,-1.535000,53.924200>}
box{<0,0,-0.304800><0.502897,0.035000,0.304800> rotate<0,0.000000,0> translate<81.643697,-1.535000,53.924200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.146594,-1.535000,53.924200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.240378,-1.535000,53.830413>}
box{<0,0,-0.304800><0.132633,0.035000,0.304800> rotate<0,44.997985,0> translate<82.146594,-1.535000,53.924200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.240378,-1.535000,53.830413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.688484,-1.535000,53.644800>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,22.498604,0> translate<82.240378,-1.535000,53.830413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.242203,-1.535000,67.056000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.758513,-1.535000,67.056000>}
box{<0,0,-0.304800><12.516309,0.035000,0.304800> rotate<0,0.000000,0> translate<82.242203,-1.535000,67.056000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.313584,-1.535000,66.984619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,66.536513>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,67.495456,0> translate<82.313584,-1.535000,66.984619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,57.073797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,66.536513>}
box{<0,0,-0.304800><9.462716,0.035000,0.304800> rotate<0,90.000000,0> translate<82.499197,-1.535000,66.536513> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,57.073797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.948300,-1.535000,57.073797>}
box{<0,0,-0.304800><0.449103,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,57.073797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,57.302400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.801872,-1.535000,57.302400>}
box{<0,0,-0.304800><12.302675,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,57.302400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.799159,-1.535000,57.912000>}
box{<0,0,-0.304800><12.299962,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,58.521600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.796450,-1.535000,58.521600>}
box{<0,0,-0.304800><12.297253,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,58.521600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,59.131200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.793741,-1.535000,59.131200>}
box{<0,0,-0.304800><12.294544,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,59.131200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,59.740800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.791031,-1.535000,59.740800>}
box{<0,0,-0.304800><12.291834,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,59.740800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,60.350400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.788322,-1.535000,60.350400>}
box{<0,0,-0.304800><12.289125,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,60.350400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.785612,-1.535000,60.960000>}
box{<0,0,-0.304800><12.286416,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,61.569600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.782903,-1.535000,61.569600>}
box{<0,0,-0.304800><12.283706,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,61.569600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,62.179200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.780194,-1.535000,62.179200>}
box{<0,0,-0.304800><12.280997,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,62.179200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,62.788800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.777481,-1.535000,62.788800>}
box{<0,0,-0.304800><12.278284,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,62.788800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,63.398400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.774772,-1.535000,63.398400>}
box{<0,0,-0.304800><12.275575,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,63.398400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,64.008000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.772063,-1.535000,64.008000>}
box{<0,0,-0.304800><12.272866,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,64.008000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,64.617600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.769353,-1.535000,64.617600>}
box{<0,0,-0.304800><12.270156,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,64.617600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,65.227200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.766644,-1.535000,65.227200>}
box{<0,0,-0.304800><12.267447,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,65.227200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,65.836800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.763934,-1.535000,65.836800>}
box{<0,0,-0.304800><12.264737,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,65.836800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.499197,-1.535000,66.446400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.761225,-1.535000,66.446400>}
box{<0,0,-0.304800><12.262028,0.035000,0.304800> rotate<0,0.000000,0> translate<82.499197,-1.535000,66.446400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.508881,-1.535000,20.497800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.815484,-1.535000,20.370800>}
box{<0,0,-0.304800><0.331865,0.035000,0.304800> rotate<0,22.498647,0> translate<82.508881,-1.535000,20.497800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.597800,-1.535000,28.295597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.732619,-1.535000,28.430413>}
box{<0,0,-0.304800><0.190660,0.035000,0.304800> rotate<0,-44.996366,0> translate<82.597800,-1.535000,28.295597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.597800,-1.535000,28.295597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.975394,-1.535000,28.295597>}
box{<0,0,-0.304800><1.377594,0.035000,0.304800> rotate<0,0.000000,0> translate<82.597800,-1.535000,28.295597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.688484,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.056703,-1.535000,53.644800>}
box{<0,0,-0.304800><1.368219,0.035000,0.304800> rotate<0,0.000000,0> translate<82.688484,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.732619,-1.535000,28.430413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.075584,-1.535000,28.773378>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-44.997030,0> translate<82.732619,-1.535000,28.430413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.815484,-1.535000,20.370800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.496597,-1.535000,20.370800>}
box{<0,0,-0.304800><5.681113,0.035000,0.304800> rotate<0,0.000000,0> translate<82.815484,-1.535000,20.370800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.948300,-1.535000,46.304200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.870797,-1.535000,47.226697>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,-44.997030,0> translate<82.948300,-1.535000,46.304200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.948300,-1.535000,57.073797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.870797,-1.535000,56.151300>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,44.997030,0> translate<82.948300,-1.535000,57.073797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.953406,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.150200,-1.535000,28.651200>}
box{<0,0,-0.304800><1.196794,0.035000,0.304800> rotate<0,0.000000,0> translate<82.953406,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.973700,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.466238,-1.535000,46.329600>}
box{<0,0,-0.304800><4.492537,0.035000,0.304800> rotate<0,0.000000,0> translate<82.973700,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.075584,-1.535000,28.773378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.261197,-1.535000,29.221484>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-67.495456,0> translate<83.075584,-1.535000,28.773378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.261197,-1.535000,29.221484>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.261197,-1.535000,30.335703>}
box{<0,0,-0.304800><1.114219,0.035000,0.304800> rotate<0,90.000000,0> translate<83.261197,-1.535000,30.335703> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.261197,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.437703,-1.535000,29.260800>}
box{<0,0,-0.304800><1.176506,0.035000,0.304800> rotate<0,0.000000,0> translate<83.261197,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.261197,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.726497,-1.535000,29.870400>}
box{<0,0,-0.304800><0.465300,0.035000,0.304800> rotate<0,0.000000,0> translate<83.261197,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.261197,-1.535000,30.335703>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.056697,-1.535000,29.540200>}
box{<0,0,-0.304800><1.125009,0.035000,0.304800> rotate<0,44.997143,0> translate<83.261197,-1.535000,30.335703> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.261197,-1.535000,31.894294>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.261197,-1.535000,32.358066>}
box{<0,0,-0.304800><0.463772,0.035000,0.304800> rotate<0,90.000000,0> translate<83.261197,-1.535000,32.358066> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.261197,-1.535000,31.894294>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.630688,-1.535000,32.263787>}
box{<0,0,-0.304800><0.522541,0.035000,0.304800> rotate<0,-44.997272,0> translate<83.261197,-1.535000,31.894294> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.261197,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.585672,-1.535000,32.308800>}
box{<0,0,-0.304800><0.324475,0.035000,0.304800> rotate<0,0.000000,0> translate<83.261197,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.261197,-1.535000,32.358066>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.341803,-1.535000,32.552669>}
box{<0,0,-0.304800><0.210637,0.035000,0.304800> rotate<0,-67.495797,0> translate<83.261197,-1.535000,32.358066> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.329297,-1.535000,56.692800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.804581,-1.535000,56.692800>}
box{<0,0,-0.304800><11.475284,0.035000,0.304800> rotate<0,0.000000,0> translate<83.329297,-1.535000,56.692800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.341803,-1.535000,32.552669>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.567928,-1.535000,32.326544>}
box{<0,0,-0.304800><0.319789,0.035000,0.304800> rotate<0,44.997030,0> translate<83.341803,-1.535000,32.552669> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.451209,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.489797,-1.535000,43.798047>}
box{<0,0,-0.304800><0.100829,0.035000,0.304800> rotate<0,67.494384,0> translate<83.451209,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.451209,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.003394,-1.535000,43.891200>}
box{<0,0,-0.304800><1.552184,0.035000,0.304800> rotate<0,0.000000,0> translate<83.451209,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.489797,-1.535000,43.552894>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.489797,-1.535000,43.798047>}
box{<0,0,-0.304800><0.245153,0.035000,0.304800> rotate<0,90.000000,0> translate<83.489797,-1.535000,43.798047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.489797,-1.535000,43.552894>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.548697,-1.535000,43.611797>}
box{<0,0,-0.304800><0.083299,0.035000,0.304800> rotate<0,-44.998550,0> translate<83.489797,-1.535000,43.552894> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.515197,-1.535000,48.886900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.515197,-1.535000,49.151991>}
box{<0,0,-0.304800><0.265091,0.035000,0.304800> rotate<0,90.000000,0> translate<83.515197,-1.535000,49.151991> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.515197,-1.535000,48.886900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.870797,-1.535000,48.531300>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<83.515197,-1.535000,48.886900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.515197,-1.535000,49.151991>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.822553,-1.535000,49.459347>}
box{<0,0,-0.304800><0.434667,0.035000,0.304800> rotate<0,-44.997030,0> translate<83.515197,-1.535000,49.151991> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.548697,-1.535000,43.611797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.853300,-1.535000,43.611797>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,0.000000,0> translate<83.548697,-1.535000,43.611797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.567928,-1.535000,32.326544>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.630688,-1.535000,32.263787>}
box{<0,0,-0.304800><0.088753,0.035000,0.304800> rotate<0,44.995604,0> translate<83.567928,-1.535000,32.326544> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.583300,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.845591,-1.535000,46.939200>}
box{<0,0,-0.304800><3.262291,0.035000,0.304800> rotate<0,0.000000,0> translate<83.583300,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.634097,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.513897,-1.535000,48.768000>}
box{<0,0,-0.304800><0.879800,0.035000,0.304800> rotate<0,0.000000,0> translate<83.634097,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.740806,-1.535000,49.377600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.904297,-1.535000,49.377600>}
box{<0,0,-0.304800><0.163491,0.035000,0.304800> rotate<0,0.000000,0> translate<83.740806,-1.535000,49.377600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.769200,-1.535000,53.357300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.769200,-1.535000,52.854406>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-90.000000,0> translate<83.769200,-1.535000,52.854406> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.769200,-1.535000,53.357300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.056703,-1.535000,53.644800>}
box{<0,0,-0.304800><0.406589,0.035000,0.304800> rotate<0,-44.996719,0> translate<83.769200,-1.535000,53.357300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.822553,-1.535000,49.459347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.691697,-1.535000,48.590200>}
box{<0,0,-0.304800><1.229157,0.035000,0.304800> rotate<0,44.997133,0> translate<83.822553,-1.535000,49.459347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.870797,-1.535000,47.226697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.870797,-1.535000,48.531300>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,90.000000,0> translate<83.870797,-1.535000,48.531300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.870797,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.235991,-1.535000,47.548800>}
box{<0,0,-0.304800><2.365194,0.035000,0.304800> rotate<0,0.000000,0> translate<83.870797,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.870797,-1.535000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.626391,-1.535000,48.158400>}
box{<0,0,-0.304800><1.755594,0.035000,0.304800> rotate<0,0.000000,0> translate<83.870797,-1.535000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.870797,-1.535000,56.083197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.870797,-1.535000,56.151300>}
box{<0,0,-0.304800><0.068103,0.035000,0.304800> rotate<0,90.000000,0> translate<83.870797,-1.535000,56.151300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.870797,-1.535000,56.083197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.777513,-1.535000,56.083197>}
box{<0,0,-0.304800><5.906716,0.035000,0.304800> rotate<0,0.000000,0> translate<83.870797,-1.535000,56.083197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.870797,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.807291,-1.535000,56.083200>}
box{<0,0,-0.304800><10.936494,0.035000,0.304800> rotate<0,0.000000,0> translate<83.870797,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.975394,-1.535000,28.295597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.150200,-1.535000,28.470406>}
box{<0,0,-0.304800><0.247216,0.035000,0.304800> rotate<0,-44.997542,0> translate<83.975394,-1.535000,28.295597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.056697,-1.535000,29.540200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.717103,-1.535000,29.540200>}
box{<0,0,-0.304800><0.660406,0.035000,0.304800> rotate<0,0.000000,0> translate<84.056697,-1.535000,29.540200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.150200,-1.535000,28.973300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.150200,-1.535000,28.470406>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-90.000000,0> translate<84.150200,-1.535000,28.470406> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.150200,-1.535000,28.973300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.717103,-1.535000,29.540200>}
box{<0,0,-0.304800><0.801720,0.035000,0.304800> rotate<0,-44.996872,0> translate<84.150200,-1.535000,28.973300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.691697,-1.535000,48.590200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.194591,-1.535000,48.590200>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,0.000000,0> translate<84.691697,-1.535000,48.590200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.853300,-1.535000,43.611797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.912200,-1.535000,43.552894>}
box{<0,0,-0.304800><0.083299,0.035000,0.304800> rotate<0,44.998550,0> translate<84.853300,-1.535000,43.611797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.912200,-1.535000,43.671047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.912200,-1.535000,43.552894>}
box{<0,0,-0.304800><0.118153,0.035000,0.304800> rotate<0,-90.000000,0> translate<84.912200,-1.535000,43.552894> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.912200,-1.535000,43.671047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.003394,-1.535000,43.891200>}
box{<0,0,-0.304800><0.238293,0.035000,0.304800> rotate<0,-67.494803,0> translate<84.912200,-1.535000,43.671047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.194591,-1.535000,48.590200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.447378,-1.535000,46.337412>}
box{<0,0,-0.304800><3.185923,0.035000,0.304800> rotate<0,44.997030,0> translate<85.194591,-1.535000,48.590200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.459513,-1.535000,38.303197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.907619,-1.535000,38.117584>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,22.498604,0> translate<85.459513,-1.535000,38.303197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.683200,-1.535000,46.024797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.075291,-1.535000,45.862388>}
box{<0,0,-0.304800><0.424396,0.035000,0.304800> rotate<0,22.498530,0> translate<85.683200,-1.535000,46.024797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.716894,-1.535000,29.895797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.716900,-1.535000,29.895800>}
box{<0,0,-0.304800><0.000007,0.035000,0.304800> rotate<0,-26.563298,0> translate<85.716894,-1.535000,29.895797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.716894,-1.535000,29.895797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.377300,-1.535000,29.895797>}
box{<0,0,-0.304800><0.660406,0.035000,0.304800> rotate<0,0.000000,0> translate<85.716894,-1.535000,29.895797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.716900,-1.535000,29.895800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.410800,-1.535000,29.895800>}
box{<0,0,-0.304800><0.693900,0.035000,0.304800> rotate<0,0.000000,0> translate<85.716900,-1.535000,29.895800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.801197,-1.535000,26.551588>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.801197,-1.535000,26.672991>}
box{<0,0,-0.304800><0.121403,0.035000,0.304800> rotate<0,90.000000,0> translate<85.801197,-1.535000,26.672991> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.801197,-1.535000,26.551588>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.003181,-1.535000,26.349603>}
box{<0,0,-0.304800><0.285649,0.035000,0.304800> rotate<0,44.997030,0> translate<85.801197,-1.535000,26.551588> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.801197,-1.535000,26.672991>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.874406,-1.535000,26.746200>}
box{<0,0,-0.304800><0.103534,0.035000,0.304800> rotate<0,-44.997030,0> translate<85.801197,-1.535000,26.672991> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.874406,-1.535000,26.746200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.377300,-1.535000,26.746200>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,0.000000,0> translate<85.874406,-1.535000,26.746200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.907619,-1.535000,38.117584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.685841,-1.535000,37.339363>}
box{<0,0,-0.304800><1.100572,0.035000,0.304800> rotate<0,44.997030,0> translate<85.907619,-1.535000,38.117584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.003181,-1.535000,26.349603>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.079697,-1.535000,26.164878>}
box{<0,0,-0.304800><0.199945,0.035000,0.304800> rotate<0,67.495539,0> translate<86.003181,-1.535000,26.349603> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.059850,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.099547,-1.535000,26.212800>}
box{<0,0,-0.304800><0.039697,0.035000,0.304800> rotate<0,0.000000,0> translate<86.059850,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.075291,-1.535000,45.862388>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.091291,-1.535000,44.846387>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,44.997030,0> translate<86.075291,-1.535000,45.862388> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.079697,-1.535000,26.164878>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.208816,-1.535000,26.476603>}
box{<0,0,-0.304800><0.337408,0.035000,0.304800> rotate<0,-67.495855,0> translate<86.079697,-1.535000,26.164878> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.208816,-1.535000,26.476603>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.410800,-1.535000,26.678588>}
box{<0,0,-0.304800><0.285649,0.035000,0.304800> rotate<0,-44.997030,0> translate<86.208816,-1.535000,26.476603> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.217678,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.744800,-1.535000,45.720000>}
box{<0,0,-0.304800><5.527122,0.035000,0.304800> rotate<0,0.000000,0> translate<86.217678,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.230003,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.141675,-1.535000,37.795200>}
box{<0,0,-0.304800><0.911672,0.035000,0.304800> rotate<0,0.000000,0> translate<86.230003,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.301097,-1.535000,51.435000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.918797,-1.535000,50.817300>}
box{<0,0,-0.304800><0.873560,0.035000,0.304800> rotate<0,44.997030,0> translate<86.301097,-1.535000,51.435000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.301097,-1.535000,51.435000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.918797,-1.535000,52.052697>}
box{<0,0,-0.304800><0.873558,0.035000,0.304800> rotate<0,-44.996885,0> translate<86.301097,-1.535000,51.435000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.377300,-1.535000,26.746200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.410800,-1.535000,26.779703>}
box{<0,0,-0.304800><0.047378,0.035000,0.304800> rotate<0,-44.999702,0> translate<86.377300,-1.535000,26.746200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.377300,-1.535000,29.895797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.410800,-1.535000,29.862294>}
box{<0,0,-0.304800><0.047378,0.035000,0.304800> rotate<0,44.999702,0> translate<86.377300,-1.535000,29.895797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.402697,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.410800,-1.535000,29.870400>}
box{<0,0,-0.304800><0.008103,0.035000,0.304800> rotate<0,0.000000,0> translate<86.402697,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.410800,-1.535000,26.779703>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.410800,-1.535000,26.678588>}
box{<0,0,-0.304800><0.101116,0.035000,0.304800> rotate<0,-90.000000,0> translate<86.410800,-1.535000,26.678588> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.410800,-1.535000,29.895800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.410800,-1.535000,29.862294>}
box{<0,0,-0.304800><0.033506,0.035000,0.304800> rotate<0,-90.000000,0> translate<86.410800,-1.535000,29.862294> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.529697,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.468391,-1.535000,51.206400>}
box{<0,0,-0.304800><4.938694,0.035000,0.304800> rotate<0,0.000000,0> translate<86.529697,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.631294,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.918797,-1.535000,53.357300>}
box{<0,0,-0.304800><0.406589,0.035000,0.304800> rotate<0,44.996719,0> translate<86.631294,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.631294,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.029994,-1.535000,53.644800>}
box{<0,0,-0.304800><2.398700,0.035000,0.304800> rotate<0,0.000000,0> translate<86.631294,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.682097,-1.535000,51.816000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.858791,-1.535000,51.816000>}
box{<0,0,-0.304800><4.176694,0.035000,0.304800> rotate<0,0.000000,0> translate<86.682097,-1.535000,51.816000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.685841,-1.535000,37.339363>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.996928,-1.535000,37.650453>}
box{<0,0,-0.304800><0.439946,0.035000,0.304800> rotate<0,-44.997318,0> translate<86.685841,-1.535000,37.339363> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.827278,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.744800,-1.535000,45.110400>}
box{<0,0,-0.304800><4.917522,0.035000,0.304800> rotate<0,0.000000,0> translate<86.827278,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.918797,-1.535000,50.314406>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.918797,-1.535000,50.817300>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,90.000000,0> translate<86.918797,-1.535000,50.817300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.918797,-1.535000,50.314406>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.643006,-1.535000,48.590197>}
box{<0,0,-0.304800><2.438400,0.035000,0.304800> rotate<0,44.997030,0> translate<86.918797,-1.535000,50.314406> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.918797,-1.535000,50.596800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.077991,-1.535000,50.596800>}
box{<0,0,-0.304800><5.159194,0.035000,0.304800> rotate<0,0.000000,0> translate<86.918797,-1.535000,50.596800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.918797,-1.535000,52.052697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.918797,-1.535000,53.357300>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,90.000000,0> translate<86.918797,-1.535000,53.357300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.918797,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.249191,-1.535000,52.425600>}
box{<0,0,-0.304800><3.330394,0.035000,0.304800> rotate<0,0.000000,0> translate<86.918797,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.918797,-1.535000,53.035200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.639591,-1.535000,53.035200>}
box{<0,0,-0.304800><2.720794,0.035000,0.304800> rotate<0,0.000000,0> translate<86.918797,-1.535000,53.035200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.996928,-1.535000,37.650453>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.377928,-1.535000,38.031453>}
box{<0,0,-0.304800><0.538815,0.035000,0.304800> rotate<0,-44.997030,0> translate<86.996928,-1.535000,37.650453> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.091291,-1.535000,44.846387>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.149922,-1.535000,44.787753>}
box{<0,0,-0.304800><0.082919,0.035000,0.304800> rotate<0,44.998557,0> translate<87.091291,-1.535000,44.846387> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.149922,-1.535000,44.787753>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.379050,-1.535000,44.692847>}
box{<0,0,-0.304800><0.248006,0.035000,0.304800> rotate<0,22.498147,0> translate<87.149922,-1.535000,44.787753> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.246003,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.687591,-1.535000,49.987200>}
box{<0,0,-0.304800><5.441587,0.035000,0.304800> rotate<0,0.000000,0> translate<87.246003,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.377928,-1.535000,38.031453>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.788694,-1.535000,38.201597>}
box{<0,0,-0.304800><0.444609,0.035000,0.304800> rotate<0,-22.498403,0> translate<87.377928,-1.535000,38.031453> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.379050,-1.535000,44.692847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.757000,-1.535000,44.314897>}
box{<0,0,-0.304800><0.534502,0.035000,0.304800> rotate<0,44.997030,0> translate<87.379050,-1.535000,44.692847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.447378,-1.535000,46.337412>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.895484,-1.535000,46.151800>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,22.498604,0> translate<87.447378,-1.535000,46.337412> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.571097,-1.535000,44.500800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.942903,-1.535000,44.500800>}
box{<0,0,-0.304800><0.371806,0.035000,0.304800> rotate<0,0.000000,0> translate<87.571097,-1.535000,44.500800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.632991,-1.535000,19.507197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.496597,-1.535000,20.370800>}
box{<0,0,-0.304800><1.221321,0.035000,0.304800> rotate<0,-44.996927,0> translate<87.632991,-1.535000,19.507197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.757000,-1.535000,44.314897>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.134947,-1.535000,44.692847>}
box{<0,0,-0.304800><0.534500,0.035000,0.304800> rotate<0,-44.997267,0> translate<87.757000,-1.535000,44.314897> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.788694,-1.535000,38.201597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.452391,-1.535000,38.201597>}
box{<0,0,-0.304800><2.663697,0.035000,0.304800> rotate<0,0.000000,0> translate<87.788694,-1.535000,38.201597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.855603,-1.535000,49.377600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.268800,-1.535000,49.377600>}
box{<0,0,-0.304800><5.413197,0.035000,0.304800> rotate<0,0.000000,0> translate<87.855603,-1.535000,49.377600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.895484,-1.535000,46.151800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.315991,-1.535000,46.151800>}
box{<0,0,-0.304800><3.420506,0.035000,0.304800> rotate<0,0.000000,0> translate<87.895484,-1.535000,46.151800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.134947,-1.535000,44.692847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.713750,-1.535000,44.932597>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,-22.498675,0> translate<88.134947,-1.535000,44.692847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.380513,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.828619,-1.535000,17.254413>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-22.498604,0> translate<88.380513,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.380513,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.980719,-1.535000,17.068800>}
box{<0,0,-0.304800><6.600206,0.035000,0.304800> rotate<0,0.000000,0> translate<88.380513,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.465203,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.268800,-1.535000,48.768000>}
box{<0,0,-0.304800><4.803597,0.035000,0.304800> rotate<0,0.000000,0> translate<88.465203,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.643006,-1.535000,48.590197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.063513,-1.535000,48.590197>}
box{<0,0,-0.304800><3.420506,0.035000,0.304800> rotate<0,0.000000,0> translate<88.643006,-1.535000,48.590197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.713750,-1.535000,44.932597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.340247,-1.535000,44.932597>}
box{<0,0,-0.304800><0.626497,0.035000,0.304800> rotate<0,0.000000,0> translate<88.713750,-1.535000,44.932597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.828619,-1.535000,17.254413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.527619,-1.535000,21.953413>}
box{<0,0,-0.304800><6.645390,0.035000,0.304800> rotate<0,-44.997030,0> translate<88.828619,-1.535000,17.254413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.029994,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.268800,-1.535000,49.405991>}
box{<0,0,-0.304800><5.994579,0.035000,0.304800> rotate<0,44.997051,0> translate<89.029994,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.252606,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.978009,-1.535000,17.678400>}
box{<0,0,-0.304800><5.725403,0.035000,0.304800> rotate<0,0.000000,0> translate<89.252606,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.340247,-1.535000,44.932597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.919050,-1.535000,44.692847>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,22.498675,0> translate<89.340247,-1.535000,44.932597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.401553,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.919050,-1.535000,35.752047>}
box{<0,0,-0.304800><0.560134,0.035000,0.304800> rotate<0,22.498411,0> translate<89.401553,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.401553,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.093800,-1.535000,35.966400>}
box{<0,0,-0.304800><0.692247,0.035000,0.304800> rotate<0,0.000000,0> translate<89.401553,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.777513,-1.535000,56.083197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.225619,-1.535000,55.897584>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,22.498604,0> translate<89.777513,-1.535000,56.083197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.862206,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.975300,-1.535000,18.288000>}
box{<0,0,-0.304800><5.113094,0.035000,0.304800> rotate<0,0.000000,0> translate<89.862206,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.890597,-1.535000,27.203397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.890597,-1.535000,28.493072>}
box{<0,0,-0.304800><1.289675,0.035000,0.304800> rotate<0,90.000000,0> translate<89.890597,-1.535000,28.493072> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.890597,-1.535000,27.203397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.503456,-1.535000,27.203397>}
box{<0,0,-0.304800><0.612859,0.035000,0.304800> rotate<0,0.000000,0> translate<89.890597,-1.535000,27.203397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.890597,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.490800,-1.535000,27.432000>}
box{<0,0,-0.304800><1.600203,0.035000,0.304800> rotate<0,0.000000,0> translate<89.890597,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.890597,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.490800,-1.535000,28.041600>}
box{<0,0,-0.304800><1.600203,0.035000,0.304800> rotate<0,0.000000,0> translate<89.890597,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.890597,-1.535000,28.493072>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.307209,-1.535000,29.909688>}
box{<0,0,-0.304800><2.003395,0.035000,0.304800> rotate<0,-44.997093,0> translate<89.890597,-1.535000,28.493072> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.919050,-1.535000,35.752047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.093800,-1.535000,35.577294>}
box{<0,0,-0.304800><0.247136,0.035000,0.304800> rotate<0,44.997542,0> translate<89.919050,-1.535000,35.752047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.919050,-1.535000,44.692847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.362047,-1.535000,44.249850>}
box{<0,0,-0.304800><0.626492,0.035000,0.304800> rotate<0,44.997030,0> translate<89.919050,-1.535000,44.692847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.048722,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.490800,-1.535000,28.651200>}
box{<0,0,-0.304800><1.442078,0.035000,0.304800> rotate<0,0.000000,0> translate<90.048722,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.093800,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.093800,-1.535000,35.577294>}
box{<0,0,-0.304800><0.389106,0.035000,0.304800> rotate<0,-90.000000,0> translate<90.093800,-1.535000,35.577294> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.111097,-1.535000,44.500800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.744800,-1.535000,44.500800>}
box{<0,0,-0.304800><1.633703,0.035000,0.304800> rotate<0,0.000000,0> translate<90.111097,-1.535000,44.500800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.225619,-1.535000,55.897584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.568584,-1.535000,55.554619>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,44.997030,0> translate<90.225619,-1.535000,55.897584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.246197,-1.535000,32.009719>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.246197,-1.535000,32.088297>}
box{<0,0,-0.304800><0.078578,0.035000,0.304800> rotate<0,90.000000,0> translate<90.246197,-1.535000,32.088297> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.246197,-1.535000,32.009719>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.298928,-1.535000,32.062453>}
box{<0,0,-0.304800><0.074575,0.035000,0.304800> rotate<0,-44.998728,0> translate<90.246197,-1.535000,32.009719> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.246197,-1.535000,32.088297>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.362047,-1.535000,32.204147>}
box{<0,0,-0.304800><0.163837,0.035000,0.304800> rotate<0,-44.997030,0> translate<90.246197,-1.535000,32.088297> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.298928,-1.535000,32.062453>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.709694,-1.535000,32.232597>}
box{<0,0,-0.304800><0.444609,0.035000,0.304800> rotate<0,-22.498403,0> translate<90.298928,-1.535000,32.062453> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.362047,-1.535000,32.204147>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.601797,-1.535000,32.782950>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,-67.495385,0> translate<90.362047,-1.535000,32.204147> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.362047,-1.535000,44.249850>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.601797,-1.535000,43.671047>}
box{<0,0,-0.304800><0.626493,0.035000,0.304800> rotate<0,67.495385,0> translate<90.362047,-1.535000,44.249850> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.405394,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.295700,-1.535000,32.308800>}
box{<0,0,-0.304800><0.890306,0.035000,0.304800> rotate<0,0.000000,0> translate<90.405394,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.452391,-1.535000,38.201597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.569997,-1.535000,39.319200>}
box{<0,0,-0.304800><1.580532,0.035000,0.304800> rotate<0,-44.996950,0> translate<90.452391,-1.535000,38.201597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.471806,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.972591,-1.535000,18.897600>}
box{<0,0,-0.304800><4.500784,0.035000,0.304800> rotate<0,0.000000,0> translate<90.471806,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.503456,-1.535000,27.203397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.119603,-1.535000,26.948181>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,22.498454,0> translate<90.503456,-1.535000,27.203397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.510606,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.744800,-1.535000,43.891200>}
box{<0,0,-0.304800><1.234194,0.035000,0.304800> rotate<0,0.000000,0> translate<90.510606,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.568584,-1.535000,55.554616>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.568584,-1.535000,55.554619>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<90.568584,-1.535000,55.554619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.568584,-1.535000,55.554616>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.828578,-1.535000,51.294622>}
box{<0,0,-0.304800><6.024541,0.035000,0.304800> rotate<0,44.997030,0> translate<90.568584,-1.535000,55.554616> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.601797,-1.535000,32.782950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.601797,-1.535000,32.901103>}
box{<0,0,-0.304800><0.118153,0.035000,0.304800> rotate<0,90.000000,0> translate<90.601797,-1.535000,32.901103> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.601797,-1.535000,32.901103>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.660697,-1.535000,32.842200>}
box{<0,0,-0.304800><0.083299,0.035000,0.304800> rotate<0,44.998550,0> translate<90.601797,-1.535000,32.901103> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.601797,-1.535000,43.552894>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.601797,-1.535000,43.671047>}
box{<0,0,-0.304800><0.118153,0.035000,0.304800> rotate<0,90.000000,0> translate<90.601797,-1.535000,43.671047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.601797,-1.535000,43.552894>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.660697,-1.535000,43.611797>}
box{<0,0,-0.304800><0.083299,0.035000,0.304800> rotate<0,-44.998550,0> translate<90.601797,-1.535000,43.552894> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.649600,-1.535000,55.473600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.810000,-1.535000,55.473600>}
box{<0,0,-0.304800><4.160400,0.035000,0.304800> rotate<0,0.000000,0> translate<90.649600,-1.535000,55.473600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.658322,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.490800,-1.535000,29.260800>}
box{<0,0,-0.304800><0.832478,0.035000,0.304800> rotate<0,0.000000,0> translate<90.658322,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.660697,-1.535000,32.842200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.965300,-1.535000,32.842200>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,0.000000,0> translate<90.660697,-1.535000,32.842200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.660697,-1.535000,43.611797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.744800,-1.535000,43.611797>}
box{<0,0,-0.304800><1.084103,0.035000,0.304800> rotate<0,0.000000,0> translate<90.660697,-1.535000,43.611797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.709694,-1.535000,32.232597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.219497,-1.535000,32.232597>}
box{<0,0,-0.304800><0.509803,0.035000,0.304800> rotate<0,0.000000,0> translate<90.709694,-1.535000,32.232597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.081406,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.969881,-1.535000,19.507200>}
box{<0,0,-0.304800><3.888475,0.035000,0.304800> rotate<0,0.000000,0> translate<91.081406,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.119603,-1.535000,26.948181>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.440000,-1.535000,26.627784>}
box{<0,0,-0.304800><0.453110,0.035000,0.304800> rotate<0,44.997030,0> translate<91.119603,-1.535000,26.948181> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.219497,-1.535000,32.232597>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.676697,-1.535000,32.689797>}
box{<0,0,-0.304800><0.646578,0.035000,0.304800> rotate<0,-44.997030,0> translate<91.219497,-1.535000,32.232597> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.245384,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.490800,-1.535000,26.822400>}
box{<0,0,-0.304800><0.245416,0.035000,0.304800> rotate<0,0.000000,0> translate<91.245384,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.259200,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.812709,-1.535000,54.864000>}
box{<0,0,-0.304800><3.553509,0.035000,0.304800> rotate<0,0.000000,0> translate<91.259200,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.267922,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.346497,-1.535000,29.870400>}
box{<0,0,-0.304800><0.078575,0.035000,0.304800> rotate<0,0.000000,0> translate<91.267922,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.307209,-1.535000,29.909688>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.490800,-1.535000,29.726097>}
box{<0,0,-0.304800><0.259636,0.035000,0.304800> rotate<0,44.997030,0> translate<91.307209,-1.535000,29.909688> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.315991,-1.535000,46.151800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.744800,-1.535000,45.722991>}
box{<0,0,-0.304800><0.606428,0.035000,0.304800> rotate<0,44.997030,0> translate<91.315991,-1.535000,46.151800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.440000,-1.535000,26.627784>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.490800,-1.535000,26.678588>}
box{<0,0,-0.304800><0.071844,0.035000,0.304800> rotate<0,-44.998792,0> translate<91.440000,-1.535000,26.627784> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.490800,-1.535000,29.726097>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.490800,-1.535000,26.678588>}
box{<0,0,-0.304800><3.047509,0.035000,0.304800> rotate<0,-90.000000,0> translate<91.490800,-1.535000,26.678588> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.676697,-1.535000,32.689797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.981300,-1.535000,32.689797>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,0.000000,0> translate<91.676697,-1.535000,32.689797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.691006,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.967169,-1.535000,20.116800>}
box{<0,0,-0.304800><3.276162,0.035000,0.304800> rotate<0,0.000000,0> translate<91.691006,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.744800,-1.535000,45.722991>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.744800,-1.535000,43.611797>}
box{<0,0,-0.304800><2.111194,0.035000,0.304800> rotate<0,-90.000000,0> translate<91.744800,-1.535000,43.611797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.868800,-1.535000,54.254400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.815419,-1.535000,54.254400>}
box{<0,0,-0.304800><2.946619,0.035000,0.304800> rotate<0,0.000000,0> translate<91.868800,-1.535000,54.254400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.965300,-1.535000,32.842200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.887797,-1.535000,33.764697>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,-44.997030,0> translate<91.965300,-1.535000,32.842200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.041500,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.910263,-1.535000,32.918400>}
box{<0,0,-0.304800><2.868763,0.035000,0.304800> rotate<0,0.000000,0> translate<92.041500,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.063513,-1.535000,48.590197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.511619,-1.535000,48.404584>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,22.498604,0> translate<92.063513,-1.535000,48.590197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.300606,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.964459,-1.535000,20.726400>}
box{<0,0,-0.304800><2.663853,0.035000,0.304800> rotate<0,0.000000,0> translate<92.300606,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.478400,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.818128,-1.535000,53.644800>}
box{<0,0,-0.304800><2.339728,0.035000,0.304800> rotate<0,0.000000,0> translate<92.478400,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.511619,-1.535000,48.404584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.854584,-1.535000,48.061619>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,44.997030,0> translate<92.511619,-1.535000,48.404584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.532197,-1.535000,35.424900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.532197,-1.535000,36.832991>}
box{<0,0,-0.304800><1.408091,0.035000,0.304800> rotate<0,90.000000,0> translate<92.532197,-1.535000,36.832991> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.532197,-1.535000,35.424900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.887797,-1.535000,35.069300>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<92.532197,-1.535000,35.424900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.532197,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.896713,-1.535000,35.966400>}
box{<0,0,-0.304800><2.364516,0.035000,0.304800> rotate<0,0.000000,0> translate<92.532197,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.532197,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.894003,-1.535000,36.576000>}
box{<0,0,-0.304800><2.361806,0.035000,0.304800> rotate<0,0.000000,0> translate<92.532197,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.532197,-1.535000,36.832991>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.882416,-1.535000,39.183213>}
box{<0,0,-0.304800><3.323713,0.035000,0.304800> rotate<0,-44.997068,0> translate<92.532197,-1.535000,36.832991> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.600297,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.899425,-1.535000,35.356800>}
box{<0,0,-0.304800><2.299128,0.035000,0.304800> rotate<0,0.000000,0> translate<92.600297,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.651100,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.907553,-1.535000,33.528000>}
box{<0,0,-0.304800><2.256453,0.035000,0.304800> rotate<0,0.000000,0> translate<92.651100,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.757803,-1.535000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.268800,-1.535000,48.158400>}
box{<0,0,-0.304800><0.510997,0.035000,0.304800> rotate<0,0.000000,0> translate<92.757803,-1.535000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.854584,-1.535000,48.061619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.268800,-1.535000,47.647400>}
box{<0,0,-0.304800><0.585792,0.035000,0.304800> rotate<0,44.997246,0> translate<92.854584,-1.535000,48.061619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.884803,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.891294,-1.535000,37.185600>}
box{<0,0,-0.304800><2.006491,0.035000,0.304800> rotate<0,0.000000,0> translate<92.884803,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.887797,-1.535000,33.764697>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.887797,-1.535000,35.069300>}
box{<0,0,-0.304800><1.304603,0.035000,0.304800> rotate<0,90.000000,0> translate<92.887797,-1.535000,35.069300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.887797,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.904844,-1.535000,34.137600>}
box{<0,0,-0.304800><2.017047,0.035000,0.304800> rotate<0,0.000000,0> translate<92.887797,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.887797,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.902134,-1.535000,34.747200>}
box{<0,0,-0.304800><2.014337,0.035000,0.304800> rotate<0,0.000000,0> translate<92.887797,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.910206,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.961750,-1.535000,21.336000>}
box{<0,0,-0.304800><2.051544,0.035000,0.304800> rotate<0,0.000000,0> translate<92.910206,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.981300,-1.535000,32.689797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.903797,-1.535000,31.767300>}
box{<0,0,-0.304800><1.304608,0.035000,0.304800> rotate<0,44.997030,0> translate<92.981300,-1.535000,32.689797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.088000,-1.535000,53.035200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.820841,-1.535000,53.035200>}
box{<0,0,-0.304800><1.732841,0.035000,0.304800> rotate<0,0.000000,0> translate<93.088000,-1.535000,53.035200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.268800,-1.535000,49.405991>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.268800,-1.535000,47.647400>}
box{<0,0,-0.304800><1.758591,0.035000,0.304800> rotate<0,-90.000000,0> translate<93.268800,-1.535000,47.647400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.362297,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.912972,-1.535000,32.308800>}
box{<0,0,-0.304800><1.550675,0.035000,0.304800> rotate<0,0.000000,0> translate<93.362297,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.494403,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.888584,-1.535000,37.795200>}
box{<0,0,-0.304800><1.394181,0.035000,0.304800> rotate<0,0.000000,0> translate<93.494403,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.519806,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.959041,-1.535000,21.945600>}
box{<0,0,-0.304800><1.439234,0.035000,0.304800> rotate<0,0.000000,0> translate<93.519806,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.527619,-1.535000,21.953413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.870584,-1.535000,22.296378>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-44.997030,0> translate<93.527619,-1.535000,21.953413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.697600,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.823550,-1.535000,52.425600>}
box{<0,0,-0.304800><1.125950,0.035000,0.304800> rotate<0,0.000000,0> translate<93.697600,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.870584,-1.535000,22.296378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.056197,-1.535000,22.744484>}
box{<0,0,-0.304800><0.485027,0.035000,0.304800> rotate<0,-67.495456,0> translate<93.870584,-1.535000,22.296378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.903797,-1.535000,31.037831>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.903797,-1.535000,31.767300>}
box{<0,0,-0.304800><0.729469,0.035000,0.304800> rotate<0,90.000000,0> translate<93.903797,-1.535000,31.767300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.903797,-1.535000,31.037831>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.929197,-1.535000,30.976513>}
box{<0,0,-0.304800><0.066371,0.035000,0.304800> rotate<0,67.494794,0> translate<93.903797,-1.535000,31.037831> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.903797,-1.535000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.918394,-1.535000,31.089600>}
box{<0,0,-0.304800><1.014597,0.035000,0.304800> rotate<0,0.000000,0> translate<93.903797,-1.535000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.903797,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.915684,-1.535000,31.699200>}
box{<0,0,-0.304800><1.011888,0.035000,0.304800> rotate<0,0.000000,0> translate<93.903797,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.929197,-1.535000,26.678588>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.929197,-1.535000,30.976513>}
box{<0,0,-0.304800><4.297925,0.035000,0.304800> rotate<0,90.000000,0> translate<93.929197,-1.535000,30.976513> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.929197,-1.535000,26.678588>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.131181,-1.535000,26.476603>}
box{<0,0,-0.304800><0.285649,0.035000,0.304800> rotate<0,44.997030,0> translate<93.929197,-1.535000,26.678588> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.929197,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.937363,-1.535000,26.822400>}
box{<0,0,-0.304800><1.008166,0.035000,0.304800> rotate<0,0.000000,0> translate<93.929197,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.929197,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.934653,-1.535000,27.432000>}
box{<0,0,-0.304800><1.005456,0.035000,0.304800> rotate<0,0.000000,0> translate<93.929197,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.929197,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.931941,-1.535000,28.041600>}
box{<0,0,-0.304800><1.002744,0.035000,0.304800> rotate<0,0.000000,0> translate<93.929197,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.929197,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.929231,-1.535000,28.651200>}
box{<0,0,-0.304800><1.000034,0.035000,0.304800> rotate<0,0.000000,0> translate<93.929197,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.929197,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.926522,-1.535000,29.260800>}
box{<0,0,-0.304800><0.997325,0.035000,0.304800> rotate<0,0.000000,0> translate<93.929197,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.929197,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.923813,-1.535000,29.870400>}
box{<0,0,-0.304800><0.994616,0.035000,0.304800> rotate<0,0.000000,0> translate<93.929197,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.929197,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.921103,-1.535000,30.480000>}
box{<0,0,-0.304800><0.991906,0.035000,0.304800> rotate<0,0.000000,0> translate<93.929197,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.977791,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.956331,-1.535000,22.555200>}
box{<0,0,-0.304800><0.978541,0.035000,0.304800> rotate<0,0.000000,0> translate<93.977791,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.056197,-1.535000,22.744484>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.056197,-1.535000,22.978409>}
box{<0,0,-0.304800><0.233925,0.035000,0.304800> rotate<0,90.000000,0> translate<94.056197,-1.535000,22.978409> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.056197,-1.535000,22.978409>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.131181,-1.535000,23.053394>}
box{<0,0,-0.304800><0.106044,0.035000,0.304800> rotate<0,-44.997030,0> translate<94.056197,-1.535000,22.978409> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.104003,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.885875,-1.535000,38.404800>}
box{<0,0,-0.304800><0.781872,0.035000,0.304800> rotate<0,0.000000,0> translate<94.104003,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.131181,-1.535000,23.053394>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.386397,-1.535000,23.669541>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,-67.495606,0> translate<94.131181,-1.535000,23.053394> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.131181,-1.535000,26.476603>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.386397,-1.535000,25.860456>}
box{<0,0,-0.304800><0.666912,0.035000,0.304800> rotate<0,67.495606,0> translate<94.131181,-1.535000,26.476603> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.177325,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.953622,-1.535000,23.164800>}
box{<0,0,-0.304800><0.776297,0.035000,0.304800> rotate<0,0.000000,0> translate<94.177325,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.240453,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.940072,-1.535000,26.212800>}
box{<0,0,-0.304800><0.699619,0.035000,0.304800> rotate<0,0.000000,0> translate<94.240453,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.307200,-1.535000,51.816000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.826259,-1.535000,51.816000>}
box{<0,0,-0.304800><0.519059,0.035000,0.304800> rotate<0,0.000000,0> translate<94.307200,-1.535000,51.816000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.386397,-1.535000,23.669541>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.386397,-1.535000,25.860456>}
box{<0,0,-0.304800><2.190916,0.035000,0.304800> rotate<0,90.000000,0> translate<94.386397,-1.535000,25.860456> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.386397,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.950913,-1.535000,23.774400>}
box{<0,0,-0.304800><0.564516,0.035000,0.304800> rotate<0,0.000000,0> translate<94.386397,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.386397,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.948200,-1.535000,24.384000>}
box{<0,0,-0.304800><0.561803,0.035000,0.304800> rotate<0,0.000000,0> translate<94.386397,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.386397,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.945491,-1.535000,24.993600>}
box{<0,0,-0.304800><0.559094,0.035000,0.304800> rotate<0,0.000000,0> translate<94.386397,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.386397,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.942781,-1.535000,25.603200>}
box{<0,0,-0.304800><0.556384,0.035000,0.304800> rotate<0,0.000000,0> translate<94.386397,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.713603,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.883166,-1.535000,39.014400>}
box{<0,0,-0.304800><0.169562,0.035000,0.304800> rotate<0,0.000000,0> translate<94.713603,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.748059,-1.535000,69.408200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.828578,-1.535000,51.294622>}
box{<0,0,-0.304800><18.113757,0.035000,0.304800> rotate<0,89.739387,0> translate<94.748059,-1.535000,69.408200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.882416,-1.535000,39.183213>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.990309,-1.535000,14.911881>}
box{<0,0,-0.304800><24.271571,0.035000,0.304800> rotate<0,89.739381,0> translate<94.882416,-1.535000,39.183213> }
texture{col_pol}
}
#end
union{
cylinder{<66.802000,0.038000,59.817000><66.802000,-1.538000,59.817000>0.508000}
cylinder{<64.262000,0.038000,59.817000><64.262000,-1.538000,59.817000>0.508000}
cylinder{<61.722000,0.038000,59.817000><61.722000,-1.538000,59.817000>0.508000}
cylinder{<37.465000,0.038000,42.799000><37.465000,-1.538000,42.799000>0.406400}
cylinder{<37.465000,0.038000,45.339000><37.465000,-1.538000,45.339000>0.406400}
cylinder{<76.073000,0.038000,64.897000><76.073000,-1.538000,64.897000>0.406400}
cylinder{<73.533000,0.038000,64.897000><73.533000,-1.538000,64.897000>0.406400}
cylinder{<77.343000,0.038000,58.547000><77.343000,-1.538000,58.547000>0.406400}
cylinder{<77.343000,0.038000,61.087000><77.343000,-1.538000,61.087000>0.406400}
cylinder{<41.148000,0.038000,42.799000><41.148000,-1.538000,42.799000>0.406400}
cylinder{<41.148000,0.038000,44.831000><41.148000,-1.538000,44.831000>0.406400}
cylinder{<77.343000,0.038000,56.007000><77.343000,-1.538000,56.007000>0.406400}
cylinder{<77.343000,0.038000,53.467000><77.343000,-1.538000,53.467000>0.406400}
cylinder{<76.073000,0.038000,62.357000><76.073000,-1.538000,62.357000>0.406400}
cylinder{<73.533000,0.038000,62.357000><73.533000,-1.538000,62.357000>0.406400}
cylinder{<53.213000,0.038000,18.288000><53.213000,-1.538000,18.288000>0.406400}
cylinder{<53.213000,0.038000,20.828000><53.213000,-1.538000,20.828000>0.406400}
cylinder{<48.895000,0.038000,18.415000><48.895000,-1.538000,18.415000>0.406400}
cylinder{<48.895000,0.038000,20.447000><48.895000,-1.538000,20.447000>0.406400}
cylinder{<30.607000,0.038000,42.164000><30.607000,-1.538000,42.164000>0.558800}
cylinder{<20.447000,0.038000,42.164000><20.447000,-1.538000,42.164000>0.558800}
cylinder{<33.401000,0.038000,48.006000><33.401000,-1.538000,48.006000>0.508000}
cylinder{<33.401000,0.038000,45.466000><33.401000,-1.538000,45.466000>0.508000}
cylinder{<33.401000,0.038000,42.926000><33.401000,-1.538000,42.926000>0.508000}
cylinder{<41.402000,0.038000,30.861000><41.402000,-1.538000,30.861000>0.558800}
cylinder{<41.402000,0.038000,33.401000><41.402000,-1.538000,33.401000>0.558800}
cylinder{<41.402000,0.038000,35.941000><41.402000,-1.538000,35.941000>0.558800}
cylinder{<45.720000,0.038000,42.799000><45.720000,-1.538000,42.799000>0.406400}
cylinder{<45.720000,0.038000,45.339000><45.720000,-1.538000,45.339000>0.406400}
cylinder{<60.960000,0.038000,23.368000><60.960000,-1.538000,23.368000>0.406400}
cylinder{<60.960000,0.038000,20.828000><60.960000,-1.538000,20.828000>0.406400}
cylinder{<85.344000,0.038000,52.705000><85.344000,-1.538000,52.705000>0.406400}
cylinder{<85.344000,0.038000,50.165000><85.344000,-1.538000,50.165000>0.406400}
cylinder{<89.027000,0.038000,42.037000><89.027000,-1.538000,42.037000>0.406400}
cylinder{<86.487000,0.038000,42.037000><86.487000,-1.538000,42.037000>0.406400}
cylinder{<86.487000,0.038000,34.417000><86.487000,-1.538000,34.417000>0.406400}
cylinder{<89.027000,0.038000,34.417000><89.027000,-1.538000,34.417000>0.406400}
cylinder{<81.915000,0.038000,42.164000><81.915000,-1.538000,42.164000>0.406400}
cylinder{<79.375000,0.038000,42.164000><79.375000,-1.538000,42.164000>0.406400}
cylinder{<79.375000,0.038000,34.544000><79.375000,-1.538000,34.544000>0.406400}
cylinder{<81.915000,0.038000,34.544000><81.915000,-1.538000,34.544000>0.406400}
cylinder{<74.549000,0.038000,42.037000><74.549000,-1.538000,42.037000>0.406400}
cylinder{<72.009000,0.038000,42.037000><72.009000,-1.538000,42.037000>0.406400}
cylinder{<72.009000,0.038000,34.417000><72.009000,-1.538000,34.417000>0.406400}
cylinder{<74.549000,0.038000,34.417000><74.549000,-1.538000,34.417000>0.406400}
cylinder{<20.193000,0.038000,44.958000><20.193000,-1.538000,44.958000>0.508000}
cylinder{<20.193000,0.038000,47.498000><20.193000,-1.538000,47.498000>0.508000}
cylinder{<73.533000,0.038000,53.594000><73.533000,-1.538000,53.594000>0.406400}
cylinder{<73.533000,0.038000,58.420000><73.533000,-1.538000,58.420000>0.406400}
cylinder{<70.993000,0.038000,62.357000><70.993000,-1.538000,62.357000>0.406400}
cylinder{<70.993000,0.038000,64.897000><70.993000,-1.538000,64.897000>0.406400}
cylinder{<67.310000,0.038000,26.797000><67.310000,-1.538000,26.797000>0.406400}
cylinder{<59.690000,0.038000,26.797000><59.690000,-1.538000,26.797000>0.406400}
cylinder{<56.515000,0.038000,26.670000><56.515000,-1.538000,26.670000>0.406400}
cylinder{<48.895000,0.038000,26.670000><48.895000,-1.538000,26.670000>0.406400}
cylinder{<91.313000,0.038000,42.037000><91.313000,-1.538000,42.037000>0.406400}
cylinder{<91.313000,0.038000,34.417000><91.313000,-1.538000,34.417000>0.406400}
cylinder{<84.201000,0.038000,42.037000><84.201000,-1.538000,42.037000>0.406400}
cylinder{<84.201000,0.038000,34.417000><84.201000,-1.538000,34.417000>0.406400}
cylinder{<76.962000,0.038000,42.164000><76.962000,-1.538000,42.164000>0.406400}
cylinder{<76.962000,0.038000,34.544000><76.962000,-1.538000,34.544000>0.406400}
cylinder{<84.709000,0.038000,31.115000><84.709000,-1.538000,31.115000>0.406400}
cylinder{<92.329000,0.038000,31.115000><92.329000,-1.538000,31.115000>0.406400}
cylinder{<78.105000,0.038000,28.321000><78.105000,-1.538000,28.321000>0.406400}
cylinder{<85.725000,0.038000,28.321000><85.725000,-1.538000,28.321000>0.406400}
cylinder{<70.612000,0.038000,30.607000><70.612000,-1.538000,30.607000>0.406400}
cylinder{<78.232000,0.038000,30.607000><78.232000,-1.538000,30.607000>0.406400}
cylinder{<46.736000,0.038000,40.386000><46.736000,-1.538000,40.386000>0.406400}
cylinder{<39.116000,0.038000,40.386000><39.116000,-1.538000,40.386000>0.406400}
cylinder{<64.262000,0.038000,23.622000><64.262000,-1.538000,23.622000>0.406400}
cylinder{<64.262000,0.038000,16.002000><64.262000,-1.538000,16.002000>0.406400}
cylinder{<82.296000,0.038000,47.879000><82.296000,-1.538000,47.879000>0.406400}
cylinder{<82.296000,0.038000,55.499000><82.296000,-1.538000,55.499000>0.406400}
cylinder{<45.339000,0.038000,27.559000><45.339000,-1.538000,27.559000>0.406400}
cylinder{<45.339000,0.038000,35.179000><45.339000,-1.538000,35.179000>0.406400}
cylinder{<65.760600,0.038000,37.414200><65.760600,-1.538000,37.414200>0.508000}
cylinder{<65.760600,0.038000,30.911800><65.760600,-1.538000,30.911800>0.508000}
cylinder{<61.239400,0.038000,37.414200><61.239400,-1.538000,37.414200>0.508000}
cylinder{<61.239400,0.038000,30.911800><61.239400,-1.538000,30.911800>0.508000}
cylinder{<55.600600,0.038000,37.287200><55.600600,-1.538000,37.287200>0.508000}
cylinder{<55.600600,0.038000,30.784800><55.600600,-1.538000,30.784800>0.508000}
cylinder{<51.079400,0.038000,37.287200><51.079400,-1.538000,37.287200>0.508000}
cylinder{<51.079400,0.038000,30.784800><51.079400,-1.538000,30.784800>0.508000}
cylinder{<92.710000,0.038000,24.765000><92.710000,-1.538000,24.765000>0.508000}
cylinder{<90.170000,0.038000,24.765000><90.170000,-1.538000,24.765000>0.508000}
cylinder{<87.630000,0.038000,24.765000><87.630000,-1.538000,24.765000>0.508000}
cylinder{<84.582000,0.038000,24.638000><84.582000,-1.538000,24.638000>0.508000}
cylinder{<82.042000,0.038000,24.638000><82.042000,-1.538000,24.638000>0.508000}
cylinder{<79.502000,0.038000,24.638000><79.502000,-1.538000,24.638000>0.508000}
cylinder{<76.454000,0.038000,24.511000><76.454000,-1.538000,24.511000>0.508000}
cylinder{<73.914000,0.038000,24.511000><73.914000,-1.538000,24.511000>0.508000}
cylinder{<71.374000,0.038000,24.511000><71.374000,-1.538000,24.511000>0.508000}
cylinder{<56.769000,0.038000,59.563000><56.769000,-1.538000,59.563000>0.508000}
cylinder{<54.229000,0.038000,59.563000><54.229000,-1.538000,59.563000>0.508000}
cylinder{<51.689000,0.038000,59.563000><51.689000,-1.538000,59.563000>0.508000}
cylinder{<49.149000,0.038000,59.563000><49.149000,-1.538000,59.563000>0.508000}
cylinder{<43.688000,0.038000,18.796000><43.688000,-1.538000,18.796000>0.558800}
cylinder{<43.688000,0.038000,21.336000><43.688000,-1.538000,21.336000>0.558800}
cylinder{<43.688000,0.038000,23.876000><43.688000,-1.538000,23.876000>0.558800}
cylinder{<30.872000,0.038000,56.281000><30.872000,-1.538000,56.281000>0.475000}
cylinder{<30.872000,0.038000,58.781000><30.872000,-1.538000,58.781000>0.475000}
cylinder{<28.872000,0.038000,58.781000><28.872000,-1.538000,58.781000>0.475000}
cylinder{<28.872000,0.038000,56.281000><28.872000,-1.538000,56.281000>0.475000}
//Holes(fast)/Vias
cylinder{<39.497000,0.038000,48.514000><39.497000,-1.538000,48.514000>0.350000 }
cylinder{<39.497000,0.038000,42.418000><39.497000,-1.538000,42.418000>0.350000 }
cylinder{<59.944000,0.038000,68.961000><59.944000,-1.538000,68.961000>0.350000 }
cylinder{<59.817000,0.038000,60.452000><59.817000,-1.538000,60.452000>0.350000 }
cylinder{<55.372000,0.038000,41.656000><55.372000,-1.538000,41.656000>0.350000 }
cylinder{<49.657000,0.038000,41.656000><49.657000,-1.538000,41.656000>0.350000 }
cylinder{<49.911000,0.038000,41.402000><49.911000,-1.538000,41.402000>0.350000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//BOOT silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,58.547000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.167000,0.000000,58.547000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.167000,0.000000,58.547000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.167000,0.000000,58.547000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.532000,0.000000,59.182000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<65.532000,0.000000,59.182000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.532000,0.000000,59.182000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.532000,0.000000,60.452000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<65.532000,0.000000,60.452000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.532000,0.000000,60.452000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.167000,0.000000,61.087000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<65.532000,0.000000,60.452000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.532000,0.000000,59.182000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.897000,0.000000,58.547000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<64.897000,0.000000,58.547000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.897000,0.000000,58.547000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,58.547000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.627000,0.000000,58.547000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,58.547000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,59.182000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<62.992000,0.000000,59.182000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,59.182000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,60.452000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.992000,0.000000,60.452000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,60.452000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,61.087000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.992000,0.000000,60.452000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,61.087000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.897000,0.000000,61.087000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.627000,0.000000,61.087000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.897000,0.000000,61.087000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.532000,0.000000,60.452000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<64.897000,0.000000,61.087000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,59.182000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,60.452000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<68.072000,0.000000,60.452000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,58.547000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,59.182000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<67.437000,0.000000,58.547000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,60.452000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,61.087000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<67.437000,0.000000,61.087000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.167000,0.000000,61.087000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,61.087000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.167000,0.000000,61.087000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,59.182000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,58.547000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.357000,0.000000,58.547000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,58.547000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.087000,0.000000,58.547000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.087000,0.000000,58.547000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.087000,0.000000,58.547000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.452000,0.000000,59.182000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<60.452000,0.000000,59.182000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.452000,0.000000,59.182000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.452000,0.000000,60.452000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<60.452000,0.000000,60.452000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.452000,0.000000,60.452000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.087000,0.000000,61.087000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<60.452000,0.000000,60.452000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.087000,0.000000,61.087000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,61.087000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.087000,0.000000,61.087000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,61.087000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,60.452000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<62.357000,0.000000,61.087000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<64.262000,0.000000,59.817000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<66.802000,0.000000,59.817000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<61.722000,0.000000,59.817000>}
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,41.910000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.830000,0.000000,41.910000> }
object{ARC(0.508000,0.152400,180.000000,270.000000,0.036000) translate<36.830000,0.000000,42.418000>}
object{ARC(0.508000,0.152400,270.000000,360.000000,0.036000) translate<38.100000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.322000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.322000,0.000000,42.418000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.322000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,46.228000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,46.228000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.830000,0.000000,46.228000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,42.418000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.608000,0.000000,42.418000> }
object{ARC(0.508000,0.152400,90.000000,180.000000,0.036000) translate<36.830000,0.000000,45.720000>}
object{ARC(0.508000,0.152400,0.000000,90.000000,0.036000) translate<38.100000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<36.703000,0.000000,43.764200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<38.227000,0.000000,43.764200>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,0.000000,0> translate<36.703000,0.000000,43.764200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<36.703000,0.000000,44.399200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<38.227000,0.000000,44.399200>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,0.000000,0> translate<36.703000,0.000000,44.399200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,45.339000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,44.399200>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.465000,0.000000,44.399200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,42.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,43.764200>}
box{<0,0,-0.076200><0.965200,0.036000,0.076200> rotate<0,90.000000,0> translate<37.465000,0.000000,43.764200> }
//C1-32K silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.962000,0.000000,65.532000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.962000,0.000000,64.262000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.962000,0.000000,64.262000> }
object{ARC(0.508000,0.152400,270.000000,360.000000,0.036000) translate<76.454000,0.000000,64.262000>}
object{ARC(0.508000,0.152400,0.000000,90.000000,0.036000) translate<76.454000,0.000000,65.532000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.152000,0.000000,63.754000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.454000,0.000000,63.754000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.152000,0.000000,63.754000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,65.532000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,64.262000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<72.644000,0.000000,64.262000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.152000,0.000000,66.040000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.454000,0.000000,66.040000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.152000,0.000000,66.040000> }
object{ARC(0.508000,0.152400,180.000000,270.000000,0.036000) translate<73.152000,0.000000,64.262000>}
object{ARC(0.508000,0.152400,90.000000,180.000000,0.036000) translate<73.152000,0.000000,65.532000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<75.107800,0.000000,64.135000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<75.107800,0.000000,65.659000>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,90.000000,0> translate<75.107800,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<74.472800,0.000000,64.135000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<74.472800,0.000000,65.659000>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,90.000000,0> translate<74.472800,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,0.000000,64.897000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.472800,0.000000,64.897000>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,0.000000,0> translate<73.533000,0.000000,64.897000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.073000,0.000000,64.897000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.107800,0.000000,64.897000>}
box{<0,0,-0.076200><0.965200,0.036000,0.076200> rotate<0,0.000000,0> translate<75.107800,0.000000,64.897000> }
//C1-BM silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.708000,0.000000,57.658000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.708000,0.000000,57.658000> }
object{ARC(0.508000,0.152400,180.000000,270.000000,0.036000) translate<76.708000,0.000000,58.166000>}
object{ARC(0.508000,0.152400,270.000000,360.000000,0.036000) translate<77.978000,0.000000,58.166000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,61.468000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,58.166000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.200000,0.000000,58.166000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.708000,0.000000,61.976000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.708000,0.000000,61.976000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.486000,0.000000,61.468000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.486000,0.000000,58.166000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<78.486000,0.000000,58.166000> }
object{ARC(0.508000,0.152400,90.000000,180.000000,0.036000) translate<76.708000,0.000000,61.468000>}
object{ARC(0.508000,0.152400,0.000000,90.000000,0.036000) translate<77.978000,0.000000,61.468000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<76.581000,0.000000,59.512200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<78.105000,0.000000,59.512200>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,0.000000,0> translate<76.581000,0.000000,59.512200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<76.581000,0.000000,60.147200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<78.105000,0.000000,60.147200>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,0.000000,0> translate<76.581000,0.000000,60.147200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.343000,0.000000,61.087000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.343000,0.000000,60.147200>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.343000,0.000000,60.147200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.343000,0.000000,58.547000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.343000,0.000000,59.512200>}
box{<0,0,-0.076200><0.965200,0.036000,0.076200> rotate<0,90.000000,0> translate<77.343000,0.000000,59.512200> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,42.291000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,43.053000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.148000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,43.053000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.148000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,43.561000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.164000,0.000000,43.561000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.132000,0.000000,43.561000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.132000,0.000000,43.561000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.132000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.132000,0.000000,43.053000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.132000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.132000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,43.053000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.132000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,45.339000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.148000,0.000000,45.339000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,43.053000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.370000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,42.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,42.799000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.116000,0.000000,42.799000> }
difference{
cylinder{<41.148000,0,43.815000><41.148000,0.036000,43.815000>2.616200 translate<0,0.000000,0>}
cylinder{<41.148000,-0.1,43.815000><41.148000,0.135000,43.815000>2.463800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-90.000000,0> translate<41.148000,0.000000,44.323000>}
//C2-8M silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.708000,0.000000,56.896000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,56.896000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.708000,0.000000,56.896000> }
object{ARC(0.508000,0.152400,0.000000,90.000000,0.036000) translate<77.978000,0.000000,56.388000>}
object{ARC(0.508000,0.152400,90.000000,180.000000,0.036000) translate<76.708000,0.000000,56.388000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.486000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.486000,0.000000,56.388000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,90.000000,0> translate<78.486000,0.000000,56.388000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.708000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.708000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,56.388000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,90.000000,0> translate<76.200000,0.000000,56.388000> }
object{ARC(0.508000,0.152400,270.000000,360.000000,0.036000) translate<77.978000,0.000000,53.086000>}
object{ARC(0.508000,0.152400,180.000000,270.000000,0.036000) translate<76.708000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<78.105000,0.000000,55.041800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<76.581000,0.000000,55.041800>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,0.000000,0> translate<76.581000,0.000000,55.041800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<78.105000,0.000000,54.406800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<76.581000,0.000000,54.406800>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,0.000000,0> translate<76.581000,0.000000,54.406800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.343000,0.000000,53.467000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.343000,0.000000,54.406800>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,90.000000,0> translate<77.343000,0.000000,54.406800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.343000,0.000000,56.007000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.343000,0.000000,55.041800>}
box{<0,0,-0.076200><0.965200,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.343000,0.000000,55.041800> }
//C2-32K silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.962000,0.000000,62.992000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.962000,0.000000,61.722000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.962000,0.000000,61.722000> }
object{ARC(0.508000,0.152400,270.000000,360.000000,0.036000) translate<76.454000,0.000000,61.722000>}
object{ARC(0.508000,0.152400,0.000000,90.000000,0.036000) translate<76.454000,0.000000,62.992000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.152000,0.000000,61.214000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.454000,0.000000,61.214000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.152000,0.000000,61.214000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,62.992000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,61.722000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<72.644000,0.000000,61.722000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.152000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.454000,0.000000,63.500000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.152000,0.000000,63.500000> }
object{ARC(0.508000,0.152400,180.000000,270.000000,0.036000) translate<73.152000,0.000000,61.722000>}
object{ARC(0.508000,0.152400,90.000000,180.000000,0.036000) translate<73.152000,0.000000,62.992000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<75.107800,0.000000,61.595000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<75.107800,0.000000,63.119000>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,90.000000,0> translate<75.107800,0.000000,63.119000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<74.472800,0.000000,61.595000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<74.472800,0.000000,63.119000>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,90.000000,0> translate<74.472800,0.000000,63.119000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,0.000000,62.357000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.472800,0.000000,62.357000>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,0.000000,0> translate<73.533000,0.000000,62.357000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.073000,0.000000,62.357000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.107800,0.000000,62.357000>}
box{<0,0,-0.076200><0.965200,0.036000,0.076200> rotate<0,0.000000,0> translate<75.107800,0.000000,62.357000> }
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,17.399000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.578000,0.000000,17.399000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.578000,0.000000,17.399000> }
object{ARC(0.508000,0.152400,180.000000,270.000000,0.036000) translate<52.578000,0.000000,17.907000>}
object{ARC(0.508000,0.152400,270.000000,360.000000,0.036000) translate<53.848000,0.000000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,17.907000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.070000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.578000,0.000000,21.717000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.578000,0.000000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,17.907000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.356000,0.000000,17.907000> }
object{ARC(0.508000,0.152400,90.000000,180.000000,0.036000) translate<52.578000,0.000000,21.209000>}
object{ARC(0.508000,0.152400,0.000000,90.000000,0.036000) translate<53.848000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<52.451000,0.000000,19.253200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.975000,0.000000,19.253200>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,0.000000,0> translate<52.451000,0.000000,19.253200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<52.451000,0.000000,19.888200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.975000,0.000000,19.888200>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,0.000000,0> translate<52.451000,0.000000,19.888200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,19.888200>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.213000,0.000000,19.888200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,19.253200>}
box{<0,0,-0.076200><0.965200,0.036000,0.076200> rotate<0,90.000000,0> translate<53.213000,0.000000,19.253200> }
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,18.669000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.895000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,18.669000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.895000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,19.177000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.911000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,19.177000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.879000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,18.669000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.879000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,18.669000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.879000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,20.955000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.895000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,18.669000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.117000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,18.415000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.863000,0.000000,18.415000> }
difference{
cylinder{<48.895000,0,19.431000><48.895000,0.036000,19.431000>2.616200 translate<0,0.000000,0>}
cylinder{<48.895000,-0.1,19.431000><48.895000,0.135000,19.431000>2.463800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-90.000000,0> translate<48.895000,0.000000,19.939000>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,40.894000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.495000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,43.434000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.559000,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,43.434000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.495000,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,40.894000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.495000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<30.607000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<29.591000,0.000000,42.164000>}
box{<0,0,-0.381000><1.016000,0.036000,0.381000> rotate<0,0.000000,0> translate<29.591000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<20.447000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<21.463000,0.000000,42.164000>}
box{<0,0,-0.381000><1.016000,0.036000,0.381000> rotate<0,0.000000,0> translate<20.447000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.892000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,42.164000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.892000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,42.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,41.529000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.543000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,42.164000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,32.003271,0> translate<25.527000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,42.164000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.527000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,42.799000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-32.003271,0> translate<25.527000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,42.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,42.164000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.527000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,41.529000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.527000,0.000000,41.529000> }
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-0.000000,0> translate<24.130000,0.000000,42.164000>}
box{<-0.952500,0,-0.381000><0.952500,0.036000,0.381000> rotate<0,-0.000000,0> translate<28.511500,0.000000,42.164000>}
box{<-0.952500,0,-0.381000><0.952500,0.036000,0.381000> rotate<0,-0.000000,0> translate<22.542500,0.000000,42.164000>}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.510000,-1.536000,61.488000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.510000,-1.536000,51.288000>}
box{<0,0,-0.101600><10.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<44.510000,-1.536000,51.288000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.510000,-1.536000,51.288000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.310000,-1.536000,51.288000>}
box{<0,0,-0.101600><5.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.310000,-1.536000,51.288000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.310000,-1.536000,51.288000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.310000,-1.536000,61.488000>}
box{<0,0,-0.101600><10.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<39.310000,-1.536000,61.488000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.310000,-1.536000,61.488000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.510000,-1.536000,61.488000>}
box{<0,0,-0.101600><5.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.310000,-1.536000,61.488000> }
difference{
cylinder{<43.535000,0,60.588000><43.535000,0.036000,60.588000>0.442200 translate<0,-1.536000,0>}
cylinder{<43.535000,-0.1,60.588000><43.535000,0.135000,60.588000>0.442200 translate<0,-1.536000,0>}}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<45.199300,-1.536000,60.613000>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<45.199300,-1.536000,59.963100>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<45.199300,-1.536000,59.313100>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<45.199300,-1.536000,58.663100>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<45.199300,-1.536000,58.013100>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<45.199300,-1.536000,57.363100>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<45.199300,-1.536000,56.713100>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<45.199300,-1.536000,56.062900>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<45.199300,-1.536000,55.412900>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<45.199300,-1.536000,54.762900>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<45.199300,-1.536000,54.112900>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<45.199300,-1.536000,53.462900>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<45.199300,-1.536000,52.812900>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<45.199300,-1.536000,52.163000>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<38.620700,-1.536000,52.163000>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<38.620700,-1.536000,52.812900>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<38.620700,-1.536000,53.462900>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<38.620700,-1.536000,54.112900>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<38.620700,-1.536000,54.762900>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<38.620700,-1.536000,55.412900>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<38.620700,-1.536000,56.062900>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<38.620700,-1.536000,56.713100>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<38.620700,-1.536000,57.363100>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<38.620700,-1.536000,58.013100>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<38.620700,-1.536000,58.663100>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<38.620700,-1.536000,59.313100>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<38.620700,-1.536000,59.963100>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-270.000000,0> translate<38.620700,-1.536000,60.613000>}
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.798000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.877000,0.000000,40.513000>}
box{<0,0,-0.063500><2.923760,0.036000,0.063500> rotate<0,2.489389,0> translate<31.877000,0.000000,40.513000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.623000,0.000000,40.767000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.877000,0.000000,40.513000>}
box{<0,0,-0.063500><0.359210,0.036000,0.063500> rotate<0,44.997030,0> translate<31.623000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.623000,0.000000,40.767000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.623000,0.000000,50.165000>}
box{<0,0,-0.063500><9.398000,0.036000,0.063500> rotate<0,90.000000,0> translate<31.623000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.877000,0.000000,50.419000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.623000,0.000000,50.165000>}
box{<0,0,-0.063500><0.359210,0.036000,0.063500> rotate<0,-44.997030,0> translate<31.623000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.877000,0.000000,50.419000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.798000,0.000000,50.546000>}
box{<0,0,-0.063500><2.923760,0.036000,0.063500> rotate<0,-2.489389,0> translate<31.877000,0.000000,50.419000> }
difference{
cylinder{<32.232600,0,49.961800><32.232600,0.036000,49.961800>0.317500 translate<0,0.000000,0>}
cylinder{<32.232600,-0.1,49.961800><32.232600,0.135000,49.961800>0.190500 translate<0,0.000000,0>}}
box{<-5.334000,0,-0.381000><5.334000,0.036000,0.381000> rotate<0,-270.000000,0> translate<35.560000,0.000000,45.466000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-270.000000,0> translate<34.925000,0.000000,49.847500>}
box{<-0.381000,0,-0.254000><0.381000,0.036000,0.254000> rotate<0,-270.000000,0> translate<34.925000,0.000000,46.736000>}
box{<-0.889000,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-270.000000,0> translate<34.925000,0.000000,48.006000>}
box{<-0.381000,0,-0.254000><0.381000,0.036000,0.254000> rotate<0,-270.000000,0> translate<34.925000,0.000000,44.196000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-270.000000,0> translate<34.925000,0.000000,41.084500>}
box{<-0.889000,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-270.000000,0> translate<34.925000,0.000000,45.466000>}
box{<-0.889000,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-270.000000,0> translate<34.925000,0.000000,42.926000>}
//IC3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,38.608000>}
box{<0,0,-0.076200><10.414000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.862000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,28.194000>}
box{<0,0,-0.076200><10.414000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.987000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,38.608000>}
box{<0,0,-0.076200><12.446000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.416000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,37.719000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.416000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.892000,0.000000,37.719000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.892000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.892000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.892000,0.000000,38.608000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.892000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.892000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,38.608000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.987000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,28.194000>}
box{<0,0,-0.076200><12.446000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.416000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,29.083000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.416000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.892000,0.000000,29.083000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.892000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.892000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.892000,0.000000,28.194000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.892000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.892000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,28.194000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.987000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<38.227000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<38.227000,0.000000,37.973000>}
box{<0,0,-0.025400><9.144000,0.036000,0.025400> rotate<0,90.000000,0> translate<38.227000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.972000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<38.227000,0.000000,37.973000>}
box{<0,0,-0.025400><8.255000,0.036000,0.025400> rotate<0,0.000000,0> translate<29.972000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.972000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.972000,0.000000,28.829000>}
box{<0,0,-0.025400><9.144000,0.036000,0.025400> rotate<0,-90.000000,0> translate<29.972000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<38.227000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.972000,0.000000,28.829000>}
box{<0,0,-0.025400><8.255000,0.036000,0.025400> rotate<0,0.000000,0> translate<29.972000,0.000000,28.829000> }
difference{
cylinder{<26.416000,0,33.401000><26.416000,0.036000,33.401000>1.879600 translate<0,0.000000,0>}
cylinder{<26.416000,-0.1,33.401000><26.416000,0.135000,33.401000>1.727200 translate<0,0.000000,0>}}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-90.000000,0> translate<41.973500,0.000000,35.941000>}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-90.000000,0> translate<41.973500,0.000000,33.401000>}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-90.000000,0> translate<41.973500,0.000000,30.861000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-90.000000,0> translate<40.259000,0.000000,30.861000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-90.000000,0> translate<40.259000,0.000000,33.401000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-90.000000,0> translate<40.259000,0.000000,35.941000>}
//LED1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.990000,0.000000,45.643800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.450000,0.000000,45.643800>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,0.000000,0> translate<44.450000,0.000000,45.643800> }
object{ARC(1.524000,0.152400,230.196236,269.999846,0.036000) translate<45.720003,0.000000,44.069000>}
object{ARC(1.524000,0.152400,269.997604,311.630812,0.036000) translate<45.720063,0.000000,44.069000>}
object{ARC(1.524000,0.152400,90.000537,130.601702,0.036000) translate<45.720016,0.000000,44.069000>}
object{ARC(1.524000,0.152400,50.196236,89.999846,0.036000) translate<45.719997,0.000000,44.069000>}
object{ARC(1.524000,0.152400,125.537354,179.998691,0.036000) translate<45.720000,0.000000,44.068966>}
object{ARC(1.524000,0.152400,180.000000,233.130102,0.036000) translate<45.720000,0.000000,44.069000>}
object{ARC(1.524000,0.152400,0.000307,52.127183,0.036000) translate<45.720000,0.000000,44.068991>}
object{ARC(1.524000,0.152400,307.872817,359.999693,0.036000) translate<45.720000,0.000000,44.069009>}
object{ARC(0.635000,0.152400,180.000000,270.000000,0.036000) translate<45.720000,0.000000,44.069000>}
object{ARC(1.016000,0.152400,180.000000,270.000000,0.036000) translate<45.720000,0.000000,44.069000>}
object{ARC(0.635000,0.152400,0.000000,90.000000,0.036000) translate<45.720000,0.000000,44.069000>}
object{ARC(1.016000,0.152400,0.000000,90.000000,0.036000) translate<45.720000,0.000000,44.069000>}
object{ARC(2.032000,0.254000,129.807234,180.000342,0.036000) translate<45.720000,0.000000,44.069012>}
object{ARC(2.032000,0.254000,180.001692,241.928641,0.036000) translate<45.720000,0.000000,44.069059>}
object{ARC(2.032000,0.254000,359.998944,409.761966,0.036000) translate<45.720000,0.000000,44.069038>}
object{ARC(2.032000,0.254000,299.746365,360.001580,0.036000) translate<45.720000,0.000000,44.068944>}
object{ARC(2.032000,0.254000,241.698217,269.999918,0.036000) translate<45.720003,0.000000,44.069000>}
object{ARC(2.032000,0.254000,269.997652,301.605872,0.036000) translate<45.720084,0.000000,44.069000>}
//LED2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.690000,0.000000,20.523200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.230000,0.000000,20.523200>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,0.000000,0> translate<59.690000,0.000000,20.523200> }
object{ARC(1.524000,0.152400,50.196236,89.999846,0.036000) translate<60.959997,0.000000,22.098000>}
object{ARC(1.524000,0.152400,89.997604,131.630812,0.036000) translate<60.959938,0.000000,22.098000>}
object{ARC(1.524000,0.152400,270.000537,310.601702,0.036000) translate<60.959984,0.000000,22.098000>}
object{ARC(1.524000,0.152400,230.196236,269.999846,0.036000) translate<60.960003,0.000000,22.098000>}
object{ARC(1.524000,0.152400,305.537354,359.998691,0.036000) translate<60.960000,0.000000,22.098034>}
object{ARC(1.524000,0.152400,0.000000,53.130102,0.036000) translate<60.960000,0.000000,22.098000>}
object{ARC(1.524000,0.152400,180.000307,232.127183,0.036000) translate<60.960000,0.000000,22.098009>}
object{ARC(1.524000,0.152400,127.872817,179.999693,0.036000) translate<60.960000,0.000000,22.097991>}
object{ARC(0.635000,0.152400,0.000000,90.000000,0.036000) translate<60.960000,0.000000,22.098000>}
object{ARC(1.016000,0.152400,0.000000,90.000000,0.036000) translate<60.960000,0.000000,22.098000>}
object{ARC(0.635000,0.152400,180.000000,270.000000,0.036000) translate<60.960000,0.000000,22.098000>}
object{ARC(1.016000,0.152400,180.000000,270.000000,0.036000) translate<60.960000,0.000000,22.098000>}
object{ARC(2.032000,0.254000,309.807234,360.000342,0.036000) translate<60.960000,0.000000,22.097988>}
object{ARC(2.032000,0.254000,0.001692,61.928641,0.036000) translate<60.960000,0.000000,22.097941>}
object{ARC(2.032000,0.254000,179.998944,229.761966,0.036000) translate<60.960000,0.000000,22.097963>}
object{ARC(2.032000,0.254000,119.746365,180.001580,0.036000) translate<60.960000,0.000000,22.098056>}
object{ARC(2.032000,0.254000,61.698217,89.999918,0.036000) translate<60.959997,0.000000,22.098000>}
object{ARC(2.032000,0.254000,89.997652,121.605872,0.036000) translate<60.959916,0.000000,22.098000>}
//LED3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<84.074000,0.000000,49.860200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<86.614000,0.000000,49.860200>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,0.000000,0> translate<84.074000,0.000000,49.860200> }
object{ARC(1.524000,0.152400,50.196236,89.999846,0.036000) translate<85.343997,0.000000,51.435000>}
object{ARC(1.524000,0.152400,89.997604,131.630812,0.036000) translate<85.343938,0.000000,51.435000>}
object{ARC(1.524000,0.152400,270.000537,310.601702,0.036000) translate<85.343984,0.000000,51.435000>}
object{ARC(1.524000,0.152400,230.196236,269.999846,0.036000) translate<85.344003,0.000000,51.435000>}
object{ARC(1.524000,0.152400,305.537354,359.998691,0.036000) translate<85.344000,0.000000,51.435034>}
object{ARC(1.524000,0.152400,0.000000,53.130102,0.036000) translate<85.344000,0.000000,51.435000>}
object{ARC(1.524000,0.152400,180.000307,232.127183,0.036000) translate<85.344000,0.000000,51.435009>}
object{ARC(1.524000,0.152400,127.872817,179.999693,0.036000) translate<85.344000,0.000000,51.434991>}
object{ARC(0.635000,0.152400,0.000000,90.000000,0.036000) translate<85.344000,0.000000,51.435000>}
object{ARC(1.016000,0.152400,0.000000,90.000000,0.036000) translate<85.344000,0.000000,51.435000>}
object{ARC(0.635000,0.152400,180.000000,270.000000,0.036000) translate<85.344000,0.000000,51.435000>}
object{ARC(1.016000,0.152400,180.000000,270.000000,0.036000) translate<85.344000,0.000000,51.435000>}
object{ARC(2.032000,0.254000,309.807234,360.000342,0.036000) translate<85.344000,0.000000,51.434988>}
object{ARC(2.032000,0.254000,0.001692,61.928641,0.036000) translate<85.344000,0.000000,51.434941>}
object{ARC(2.032000,0.254000,179.998944,229.761966,0.036000) translate<85.344000,0.000000,51.434963>}
object{ARC(2.032000,0.254000,119.746365,180.001580,0.036000) translate<85.344000,0.000000,51.435056>}
object{ARC(2.032000,0.254000,61.698217,89.999918,0.036000) translate<85.343997,0.000000,51.435000>}
object{ARC(2.032000,0.254000,89.997652,121.605872,0.036000) translate<85.343916,0.000000,51.435000>}
//OK1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.297000,0.000000,35.306000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<85.217000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.297000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,41.148000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<85.217000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,41.148000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,90.000000,0> translate<85.217000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.297000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.297000,0.000000,37.211000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,90.000000,0> translate<90.297000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.297000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.297000,0.000000,39.243000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<90.297000,0.000000,39.243000> }
object{ARC(1.016000,0.152400,90.000000,270.000000,0.036000) translate<90.297000,0.000000,38.227000>}
//OK2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,35.433000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.105000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,41.275000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.105000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,41.275000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,90.000000,0> translate<78.105000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,37.338000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,90.000000,0> translate<83.185000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,39.370000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.185000,0.000000,39.370000> }
object{ARC(1.016000,0.152400,90.000000,270.000000,0.036000) translate<83.185000,0.000000,38.354000>}
//OK3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.739000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.819000,0.000000,35.306000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.739000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.819000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.739000,0.000000,41.148000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.739000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.739000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.739000,0.000000,41.148000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,90.000000,0> translate<70.739000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.819000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.819000,0.000000,37.211000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,90.000000,0> translate<75.819000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.819000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.819000,0.000000,39.243000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.819000,0.000000,39.243000> }
object{ARC(1.016000,0.152400,90.000000,270.000000,0.036000) translate<75.819000,0.000000,38.227000>}
//PWR silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,45.593000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.923000,0.000000,45.593000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,45.593000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,46.228000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.923000,0.000000,45.593000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,46.228000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.828000,0.000000,46.228000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.558000,0.000000,46.228000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.828000,0.000000,46.228000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,45.593000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<20.828000,0.000000,46.228000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.828000,0.000000,43.688000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.558000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,43.688000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.923000,0.000000,44.323000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.828000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,44.323000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.828000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,45.593000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,44.323000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.463000,0.000000,44.323000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,46.228000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,46.863000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.923000,0.000000,46.863000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,46.863000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,48.133000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.923000,0.000000,48.133000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,48.133000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,48.768000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.923000,0.000000,48.133000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.828000,0.000000,48.768000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.558000,0.000000,48.768000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.828000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,48.133000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<20.828000,0.000000,48.768000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,48.133000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,46.863000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.463000,0.000000,46.863000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,46.863000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.828000,0.000000,46.228000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.828000,0.000000,46.228000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<20.193000,0.000000,44.958000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<20.193000,0.000000,47.498000>}
//Q1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<75.692000,0.000000,52.959000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<75.692000,0.000000,59.055000>}
box{<0,0,-0.203200><6.096000,0.036000,0.203200> rotate<0,90.000000,0> translate<75.692000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<71.374000,0.000000,52.959000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<71.374000,0.000000,59.055000>}
box{<0,0,-0.203200><6.096000,0.036000,0.203200> rotate<0,90.000000,0> translate<71.374000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.184000,0.000000,52.959000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.184000,0.000000,59.055000>}
box{<0,0,-0.076200><6.096000,0.036000,0.076200> rotate<0,90.000000,0> translate<75.184000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,59.055000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,52.959000>}
box{<0,0,-0.076200><6.096000,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.882000,0.000000,52.959000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.771000,0.000000,55.753000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.771000,0.000000,56.261000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<72.771000,0.000000,56.261000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.771000,0.000000,56.261000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.295000,0.000000,56.261000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.771000,0.000000,56.261000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.295000,0.000000,56.261000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.295000,0.000000,55.753000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.295000,0.000000,55.753000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.295000,0.000000,55.753000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.771000,0.000000,55.753000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.771000,0.000000,55.753000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.771000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,0.000000,56.642000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.771000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.295000,0.000000,56.642000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.533000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.771000,0.000000,55.372000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,0.000000,55.372000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.771000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,0.000000,55.372000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.295000,0.000000,55.372000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.533000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,0.000000,57.277000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<73.533000,0.000000,57.277000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,0.000000,55.372000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,0.000000,54.737000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<73.533000,0.000000,54.737000> }
object{ARC(2.159000,0.406400,180.000000,360.000000,0.036000) translate<73.533000,0.000000,52.959000>}
object{ARC(2.159000,0.406400,0.000000,180.000000,0.036000) translate<73.533000,0.000000,59.055000>}
object{ARC(1.651000,0.152400,180.000000,360.000000,0.036000) translate<73.533000,0.000000,52.959000>}
object{ARC(1.651000,0.152400,0.000000,180.000000,0.036000) translate<73.533000,0.000000,59.055000>}
//Q2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.501000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.501000,0.000000,63.754000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<71.501000,0.000000,63.754000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,63.754000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.501000,0.000000,63.754000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.485000,0.000000,63.754000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,63.754000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,63.500000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.485000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.501000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,63.500000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.485000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.501000,0.000000,63.246000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.993000,0.000000,63.246000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.993000,0.000000,63.246000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.501000,0.000000,64.008000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.993000,0.000000,64.008000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.993000,0.000000,64.008000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.993000,0.000000,64.008000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.993000,0.000000,64.389000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<70.993000,0.000000,64.389000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.993000,0.000000,64.008000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,64.008000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.485000,0.000000,64.008000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.993000,0.000000,63.246000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.993000,0.000000,62.865000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.993000,0.000000,62.865000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.993000,0.000000,63.246000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,63.246000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.485000,0.000000,63.246000> }
object{ARC(1.016000,0.152400,134.998366,179.997689,0.036000) translate<70.993000,0.000000,63.626959>}
object{ARC(1.016000,0.152400,180.002311,225.001634,0.036000) translate<70.993000,0.000000,63.627041>}
object{ARC(1.016000,0.152400,314.998366,359.997689,0.036000) translate<70.993000,0.000000,63.627041>}
object{ARC(1.016000,0.152400,0.002311,45.001634,0.036000) translate<70.993000,0.000000,63.626959>}
difference{
cylinder{<70.993000,0,63.627000><70.993000,0.036000,63.627000>1.092200 translate<0,0.000000,0>}
cylinder{<70.993000,-0.1,63.627000><70.993000,0.135000,63.627000>0.939800 translate<0,0.000000,0>}}
//R-IN1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<59.690000,0.000000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<60.579000,0.000000,26.797000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<59.690000,0.000000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<67.310000,0.000000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<66.421000,0.000000,26.797000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<66.421000,0.000000,26.797000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<65.786000,0.000000,26.035000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<65.786000,0.000000,27.559000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<61.214000,0.000000,27.559000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<61.214000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,26.035000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<66.040000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.786000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.405000,0.000000,25.781000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<65.405000,0.000000,25.781000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.278000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.405000,0.000000,25.781000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<65.278000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.786000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.405000,0.000000,27.813000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<65.405000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.278000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.405000,0.000000,27.813000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<65.278000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.722000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,25.781000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<61.595000,0.000000,25.781000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.722000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.278000,0.000000,25.908000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.722000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.722000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,27.813000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<61.595000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.722000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.278000,0.000000,27.686000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.722000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.214000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,25.781000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.214000,0.000000,25.781000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.214000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,27.813000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.214000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,26.035000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.960000,0.000000,26.035000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<60.769500,0.000000,26.797000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<66.230500,0.000000,26.797000>}
//R-IN2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<48.895000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<49.784000,0.000000,26.670000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<48.895000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<56.515000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<55.626000,0.000000,26.670000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<55.626000,0.000000,26.670000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<54.991000,0.000000,25.908000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<54.991000,0.000000,27.432000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<50.419000,0.000000,27.432000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<50.419000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,25.908000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.245000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,25.654000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.610000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.483000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,25.654000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<54.483000,0.000000,25.781000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,27.686000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.610000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.483000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,27.686000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.483000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,25.654000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<50.800000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.483000,0.000000,25.781000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.927000,0.000000,25.781000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,27.686000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<50.800000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.483000,0.000000,27.559000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.927000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,25.654000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.419000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,27.686000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.419000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,25.908000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.165000,0.000000,25.908000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<49.974500,0.000000,26.670000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<55.435500,0.000000,26.670000>}
//R-SERVOA1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<91.313000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<91.313000,0.000000,35.306000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<91.313000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<91.313000,0.000000,42.037000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<91.313000,0.000000,41.148000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<91.313000,0.000000,41.148000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<92.075000,0.000000,40.513000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<90.551000,0.000000,40.513000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<90.551000,0.000000,35.941000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<92.075000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.551000,0.000000,40.767000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.075000,0.000000,40.767000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<90.551000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.329000,0.000000,40.513000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.329000,0.000000,40.132000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<92.329000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.202000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.329000,0.000000,40.132000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<92.202000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.297000,0.000000,40.513000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.297000,0.000000,40.132000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<90.297000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.424000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.297000,0.000000,40.132000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<90.297000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.202000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.329000,0.000000,36.322000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<92.202000,0.000000,36.449000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.202000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.202000,0.000000,40.005000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<92.202000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.424000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.297000,0.000000,36.322000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<90.297000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.424000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.424000,0.000000,40.005000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<90.424000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.329000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.329000,0.000000,36.322000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<92.329000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.297000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.297000,0.000000,36.322000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<90.297000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.551000,0.000000,35.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.075000,0.000000,35.687000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<90.551000,0.000000,35.687000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<91.313000,0.000000,35.496500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<91.313000,0.000000,40.957500>}
//R-SERVOA2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<84.201000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<84.201000,0.000000,35.306000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<84.201000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<84.201000,0.000000,42.037000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<84.201000,0.000000,41.148000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<84.201000,0.000000,41.148000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<84.963000,0.000000,40.513000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<83.439000,0.000000,40.513000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<83.439000,0.000000,35.941000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<84.963000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.439000,0.000000,40.767000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.963000,0.000000,40.767000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.439000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,40.513000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,40.132000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<85.217000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.090000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,40.132000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<85.090000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,40.513000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,40.132000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.185000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,40.132000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<83.185000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.090000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,36.322000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<85.090000,0.000000,36.449000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.090000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.090000,0.000000,40.005000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<85.090000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,36.322000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<83.185000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,40.005000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<83.312000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,36.322000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<85.217000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,36.322000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<83.185000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.439000,0.000000,35.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.963000,0.000000,35.687000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.439000,0.000000,35.687000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<84.201000,0.000000,35.496500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<84.201000,0.000000,40.957500>}
//R-SERVOA3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<76.962000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<76.962000,0.000000,35.433000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<76.962000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<76.962000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<76.962000,0.000000,41.275000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<76.962000,0.000000,41.275000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<77.724000,0.000000,40.640000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<76.200000,0.000000,40.640000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<76.200000,0.000000,36.068000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<77.724000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.724000,0.000000,40.894000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.200000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,40.259000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.978000,0.000000,40.259000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.851000,0.000000,40.132000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,40.259000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<77.851000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,0.000000,40.259000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.946000,0.000000,40.259000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.073000,0.000000,40.132000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,0.000000,40.259000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<75.946000,0.000000,40.259000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.851000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,36.449000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<77.851000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.851000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.851000,0.000000,40.132000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<77.851000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.073000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,0.000000,36.449000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<75.946000,0.000000,36.449000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.073000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.073000,0.000000,40.132000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<76.073000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,36.449000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<77.978000,0.000000,36.449000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,0.000000,36.449000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<75.946000,0.000000,36.449000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.724000,0.000000,35.814000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.200000,0.000000,35.814000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<76.962000,0.000000,35.623500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<76.962000,0.000000,41.084500>}
//R-SERVOB1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<92.329000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<91.440000,0.000000,31.115000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<91.440000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<84.709000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<85.598000,0.000000,31.115000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<84.709000,0.000000,31.115000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<86.233000,0.000000,31.877000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<86.233000,0.000000,30.353000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<90.805000,0.000000,30.353000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<90.805000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.979000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.979000,0.000000,31.877000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<85.979000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.233000,0.000000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.614000,0.000000,32.131000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<86.233000,0.000000,32.131000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.741000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.614000,0.000000,32.131000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<86.614000,0.000000,32.131000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.233000,0.000000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.614000,0.000000,30.099000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<86.233000,0.000000,30.099000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.741000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.614000,0.000000,30.099000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<86.614000,0.000000,30.099000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.297000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.424000,0.000000,32.131000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<90.297000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.297000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.741000,0.000000,32.004000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<86.741000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.297000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.424000,0.000000,30.099000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<90.297000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.297000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.741000,0.000000,30.226000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<86.741000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.805000,0.000000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.424000,0.000000,32.131000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<90.424000,0.000000,32.131000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.805000,0.000000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.424000,0.000000,30.099000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<90.424000,0.000000,30.099000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.059000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.059000,0.000000,31.877000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<91.059000,0.000000,31.877000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<91.249500,0.000000,31.115000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<85.788500,0.000000,31.115000>}
//R-SERVOB2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<85.725000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<84.836000,0.000000,28.321000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<84.836000,0.000000,28.321000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<78.105000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<78.994000,0.000000,28.321000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<78.105000,0.000000,28.321000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<79.629000,0.000000,29.083000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<79.629000,0.000000,27.559000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<84.201000,0.000000,27.559000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<84.201000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.375000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.375000,0.000000,29.083000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<79.375000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.629000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,29.337000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.629000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.137000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,29.337000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<80.010000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.629000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,27.305000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.629000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.137000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,27.305000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.010000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.693000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.820000,0.000000,29.337000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<83.693000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.693000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.137000,0.000000,29.210000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<80.137000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.693000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.820000,0.000000,27.305000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<83.693000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.693000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.137000,0.000000,27.432000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<80.137000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.201000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.820000,0.000000,29.337000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.820000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.201000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.820000,0.000000,27.305000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.820000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.455000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.455000,0.000000,29.083000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<84.455000,0.000000,29.083000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<84.645500,0.000000,28.321000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<79.184500,0.000000,28.321000>}
//R-SERVOB3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<78.232000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<77.343000,0.000000,30.607000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<77.343000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<70.612000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<71.501000,0.000000,30.607000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<70.612000,0.000000,30.607000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<72.136000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<72.136000,0.000000,29.845000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<76.708000,0.000000,29.845000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<76.708000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,31.369000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<71.882000,0.000000,31.369000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.136000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.517000,0.000000,31.623000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.136000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.517000,0.000000,31.623000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<72.517000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.136000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.517000,0.000000,29.591000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.136000,0.000000,29.591000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.517000,0.000000,29.591000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<72.517000,0.000000,29.591000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.327000,0.000000,31.623000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<76.200000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,31.496000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.644000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.327000,0.000000,29.591000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<76.200000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,29.718000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.644000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.708000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.327000,0.000000,31.623000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.327000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.708000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.327000,0.000000,29.591000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.327000,0.000000,29.591000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.962000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.962000,0.000000,31.369000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<76.962000,0.000000,31.369000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<77.152500,0.000000,30.607000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<71.691500,0.000000,30.607000>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<39.116000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<40.005000,0.000000,40.386000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<39.116000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<46.736000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<45.847000,0.000000,40.386000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<45.847000,0.000000,40.386000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<45.212000,0.000000,39.624000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<45.212000,0.000000,41.148000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<40.640000,0.000000,41.148000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<40.640000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.466000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.466000,0.000000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.466000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.212000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.831000,0.000000,39.370000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.831000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.831000,0.000000,39.370000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<44.704000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.212000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.831000,0.000000,41.402000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.831000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.831000,0.000000,41.402000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.704000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,39.370000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.021000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,39.497000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.148000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,41.402000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.021000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,41.275000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.148000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,39.370000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.640000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,41.402000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.640000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.386000,0.000000,39.624000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<40.195500,0.000000,40.386000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<45.656500,0.000000,40.386000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<64.262000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<64.262000,0.000000,16.891000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<64.262000,0.000000,16.891000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<64.262000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<64.262000,0.000000,22.733000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<64.262000,0.000000,22.733000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<65.024000,0.000000,22.098000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<63.500000,0.000000,22.098000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<63.500000,0.000000,17.526000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<65.024000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.024000,0.000000,22.352000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.500000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.278000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.278000,0.000000,21.717000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<65.278000,0.000000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.151000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.278000,0.000000,21.717000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<65.151000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,21.717000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<63.246000,0.000000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.373000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,21.717000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<63.246000,0.000000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.151000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.278000,0.000000,17.907000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<65.151000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.151000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.151000,0.000000,21.590000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<65.151000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.373000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,17.907000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<63.246000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.373000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.373000,0.000000,21.590000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<63.373000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.278000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.278000,0.000000,17.907000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<65.278000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,17.907000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<63.246000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.024000,0.000000,17.272000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.500000,0.000000,17.272000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<64.262000,0.000000,17.081500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<64.262000,0.000000,22.542500>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<82.296000,0.000000,55.499000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<82.296000,0.000000,54.610000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<82.296000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<82.296000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<82.296000,0.000000,48.768000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<82.296000,0.000000,48.768000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<81.534000,0.000000,49.403000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<83.058000,0.000000,49.403000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<83.058000,0.000000,53.975000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<81.534000,0.000000,53.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.058000,0.000000,49.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.534000,0.000000,49.149000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<81.534000,0.000000,49.149000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.280000,0.000000,49.403000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.280000,0.000000,49.784000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<81.280000,0.000000,49.784000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.407000,0.000000,49.911000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.280000,0.000000,49.784000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<81.280000,0.000000,49.784000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,49.403000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,49.784000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<83.312000,0.000000,49.784000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,49.911000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,49.784000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<83.185000,0.000000,49.911000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.407000,0.000000,53.467000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.280000,0.000000,53.594000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<81.280000,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.407000,0.000000,53.467000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.407000,0.000000,49.911000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.407000,0.000000,49.911000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,53.467000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,53.594000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<83.185000,0.000000,53.467000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,53.467000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,49.911000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.185000,0.000000,49.911000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.280000,0.000000,53.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.280000,0.000000,53.594000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.280000,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,53.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,53.594000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.312000,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.058000,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.534000,0.000000,54.229000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<81.534000,0.000000,54.229000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<82.296000,0.000000,54.419500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<82.296000,0.000000,48.958500>}
//RV6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<45.339000,0.000000,35.179000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<45.339000,0.000000,34.290000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<45.339000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<45.339000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<45.339000,0.000000,28.448000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<45.339000,0.000000,28.448000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<44.577000,0.000000,29.083000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<46.101000,0.000000,29.083000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<46.101000,0.000000,33.655000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<44.577000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,28.829000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.577000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,29.464000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.323000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,29.464000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.323000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,29.464000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.355000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,29.464000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.228000,0.000000,29.591000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,33.274000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<44.323000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,29.591000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.450000,0.000000,29.591000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,33.274000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.228000,0.000000,33.147000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,29.591000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.228000,0.000000,29.591000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,33.274000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.323000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,33.274000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.355000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,33.909000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.577000,0.000000,33.909000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<45.339000,0.000000,34.099500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<45.339000,0.000000,28.638500>}
//S1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.738000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.738000,0.000000,31.115000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.738000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.738000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.262000,0.000000,30.861000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.738000,0.000000,30.861000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.262000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.262000,0.000000,30.861000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.262000,0.000000,30.861000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.516000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,31.115000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.516000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.262000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.262000,0.000000,37.211000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.262000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.262000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.738000,0.000000,37.465000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.738000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.738000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.738000,0.000000,37.465000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.738000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,31.623000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<66.040000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.452000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,31.115000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<60.452000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,0.000000,31.115000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.960000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,37.211000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<66.040000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.516000,0.000000,37.211000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.516000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.452000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,37.211000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<60.452000,0.000000,36.703000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,0.000000,37.211000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.960000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<64.770000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.230000,0.000000,35.433000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<62.230000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.230000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.230000,0.000000,35.433000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,90.000000,0> translate<62.230000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.230000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<64.770000,0.000000,32.893000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<62.230000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<64.770000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<64.770000,0.000000,32.893000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,-90.000000,0> translate<64.770000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<66.548000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<66.294000,0.000000,35.433000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<66.294000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<66.294000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<66.294000,0.000000,35.433000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,90.000000,0> translate<66.294000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<66.294000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<66.548000,0.000000,32.893000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<66.294000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.706000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.706000,0.000000,35.433000>}
box{<0,0,-0.025400><2.413000,0.036000,0.025400> rotate<0,90.000000,0> translate<60.706000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.706000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.452000,0.000000,33.020000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<60.452000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.706000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.452000,0.000000,35.433000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<60.452000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.452000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.452000,0.000000,32.004000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<60.452000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.452000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.452000,0.000000,36.322000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.452000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.452000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.452000,0.000000,35.433000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.452000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,36.322000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<66.548000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,32.004000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.548000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,32.893000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.548000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,35.433000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.548000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,36.322000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.548000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.452000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.452000,0.000000,33.020000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.452000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.452000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.452000,0.000000,32.004000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.452000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.738000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,0.000000,31.115000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.484000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.262000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.516000,0.000000,31.115000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.262000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.738000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,0.000000,37.211000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.484000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.262000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.516000,0.000000,37.211000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.262000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.341000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.341000,0.000000,32.893000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.341000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.786000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.786000,0.000000,35.433000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<65.786000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.008000,0.000000,36.576000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.008000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,36.576000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.230000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.008000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.119000,0.000000,36.322000>}
box{<0,0,-0.076200><0.924574,0.036000,0.076200> rotate<0,-15.944344,0> translate<63.119000,0.000000,36.322000> }
difference{
cylinder{<63.500000,0,34.163000><63.500000,0.036000,34.163000>1.854200 translate<0,0.000000,0>}
cylinder{<63.500000,-0.1,34.163000><63.500000,0.135000,34.163000>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<61.341000,0,36.322000><61.341000,0.036000,36.322000>0.584200 translate<0,0.000000,0>}
cylinder{<61.341000,-0.1,36.322000><61.341000,0.135000,36.322000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<61.468000,0,32.004000><61.468000,0.036000,32.004000>0.584200 translate<0,0.000000,0>}
cylinder{<61.468000,-0.1,32.004000><61.468000,0.135000,32.004000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<65.659000,0,32.004000><65.659000,0.036000,32.004000>0.584200 translate<0,0.000000,0>}
cylinder{<65.659000,-0.1,32.004000><65.659000,0.135000,32.004000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<65.659000,0,36.322000><65.659000,0.036000,36.322000>0.584200 translate<0,0.000000,0>}
cylinder{<65.659000,-0.1,36.322000><65.659000,0.135000,36.322000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<63.500000,0,34.163000><63.500000,0.036000,34.163000>0.660400 translate<0,0.000000,0>}
cylinder{<63.500000,-0.1,34.163000><63.500000,0.135000,34.163000>0.609600 translate<0,0.000000,0>}}
difference{
cylinder{<63.500000,0,34.163000><63.500000,0.036000,34.163000>0.330200 translate<0,0.000000,0>}
cylinder{<63.500000,-0.1,34.163000><63.500000,0.135000,34.163000>0.177800 translate<0,0.000000,0>}}
//S2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.578000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.578000,0.000000,30.988000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.578000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.578000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.102000,0.000000,30.734000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.578000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.102000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.102000,0.000000,30.734000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.102000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,30.988000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.356000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.102000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.102000,0.000000,37.084000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.102000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.102000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.578000,0.000000,37.338000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.578000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.578000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.578000,0.000000,37.338000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.578000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,31.496000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<55.880000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,30.988000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<50.292000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,30.988000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.800000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,37.084000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<55.880000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,37.084000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.356000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,37.084000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<50.292000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,37.084000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.800000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.610000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.070000,0.000000,35.306000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<52.070000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.070000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.070000,0.000000,35.306000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,90.000000,0> translate<52.070000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.070000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.610000,0.000000,32.766000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<52.070000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.610000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.610000,0.000000,32.766000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,-90.000000,0> translate<54.610000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.388000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.134000,0.000000,35.306000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<56.134000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.134000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.134000,0.000000,35.306000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,90.000000,0> translate<56.134000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.134000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.388000,0.000000,32.766000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<56.134000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.546000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.546000,0.000000,35.306000>}
box{<0,0,-0.025400><2.413000,0.036000,0.025400> rotate<0,90.000000,0> translate<50.546000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.546000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.292000,0.000000,32.893000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<50.292000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.546000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.292000,0.000000,35.306000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<50.292000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,31.877000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.292000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,36.195000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.292000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,35.306000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.292000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,36.195000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.388000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,31.877000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.388000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,32.766000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.388000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,35.306000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.388000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,36.195000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.388000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,32.893000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.292000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,31.877000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.292000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.578000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,30.988000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.324000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.102000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,30.988000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.102000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.578000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,37.084000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.324000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.102000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,37.084000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.102000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,32.766000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.181000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,0.000000,35.306000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.626000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,36.449000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.848000,0.000000,36.449000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.832000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,36.449000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.070000,0.000000,36.449000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,36.195000>}
box{<0,0,-0.076200><0.924574,0.036000,0.076200> rotate<0,-15.944344,0> translate<52.959000,0.000000,36.195000> }
difference{
cylinder{<53.340000,0,34.036000><53.340000,0.036000,34.036000>1.854200 translate<0,0.000000,0>}
cylinder{<53.340000,-0.1,34.036000><53.340000,0.135000,34.036000>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<51.181000,0,36.195000><51.181000,0.036000,36.195000>0.584200 translate<0,0.000000,0>}
cylinder{<51.181000,-0.1,36.195000><51.181000,0.135000,36.195000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<51.308000,0,31.877000><51.308000,0.036000,31.877000>0.584200 translate<0,0.000000,0>}
cylinder{<51.308000,-0.1,31.877000><51.308000,0.135000,31.877000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<55.499000,0,31.877000><55.499000,0.036000,31.877000>0.584200 translate<0,0.000000,0>}
cylinder{<55.499000,-0.1,31.877000><55.499000,0.135000,31.877000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<55.499000,0,36.195000><55.499000,0.036000,36.195000>0.584200 translate<0,0.000000,0>}
cylinder{<55.499000,-0.1,36.195000><55.499000,0.135000,36.195000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<53.340000,0,34.036000><53.340000,0.036000,34.036000>0.660400 translate<0,0.000000,0>}
cylinder{<53.340000,-0.1,34.036000><53.340000,0.135000,34.036000>0.609600 translate<0,0.000000,0>}}
difference{
cylinder{<53.340000,0,34.036000><53.340000,0.036000,34.036000>0.330200 translate<0,0.000000,0>}
cylinder{<53.340000,-0.1,34.036000><53.340000,0.135000,34.036000>0.177800 translate<0,0.000000,0>}}
//SERVOA silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.345000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.075000,0.000000,23.495000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.075000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.075000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.440000,0.000000,24.130000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<91.440000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.440000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.440000,0.000000,25.400000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<91.440000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.440000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.075000,0.000000,26.035000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<91.440000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.440000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.805000,0.000000,23.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<90.805000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.805000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.535000,0.000000,23.495000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<89.535000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.535000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.900000,0.000000,24.130000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<88.900000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.900000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.900000,0.000000,25.400000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<88.900000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.900000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.535000,0.000000,26.035000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<88.900000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.535000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.805000,0.000000,26.035000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<89.535000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.805000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.440000,0.000000,25.400000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<90.805000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.980000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.980000,0.000000,25.400000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<93.980000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.345000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.980000,0.000000,24.130000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<93.345000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.980000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.345000,0.000000,26.035000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<93.345000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.075000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.345000,0.000000,26.035000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.075000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.900000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.265000,0.000000,23.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<88.265000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.265000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.995000,0.000000,23.495000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<86.995000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.995000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.360000,0.000000,24.130000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<86.360000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.360000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.360000,0.000000,25.400000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<86.360000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.360000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.995000,0.000000,26.035000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<86.360000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.995000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.265000,0.000000,26.035000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<86.995000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.265000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.900000,0.000000,25.400000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<88.265000,0.000000,26.035000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<90.170000,0.000000,24.765000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<92.710000,0.000000,24.765000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<87.630000,0.000000,24.765000>}
//SERVOB silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.947000,0.000000,23.368000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.947000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.947000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,24.003000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<83.312000,0.000000,24.003000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,25.273000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<83.312000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.947000,0.000000,25.908000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<83.312000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.677000,0.000000,23.368000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<82.677000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.677000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.407000,0.000000,23.368000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<81.407000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.407000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.772000,0.000000,24.003000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<80.772000,0.000000,24.003000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.772000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.772000,0.000000,25.273000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<80.772000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.772000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.407000,0.000000,25.908000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.772000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.407000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.677000,0.000000,25.908000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<81.407000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.677000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,25.273000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<82.677000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.852000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.852000,0.000000,25.273000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<85.852000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.852000,0.000000,24.003000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<85.217000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.852000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,25.908000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<85.217000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.947000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,25.908000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.947000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.772000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.137000,0.000000,23.368000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.137000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.137000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.867000,0.000000,23.368000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.867000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.867000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.232000,0.000000,24.003000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<78.232000,0.000000,24.003000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.232000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.232000,0.000000,25.273000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<78.232000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.232000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.867000,0.000000,25.908000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<78.232000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.867000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.137000,0.000000,25.908000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.867000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.137000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.772000,0.000000,25.273000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<80.137000,0.000000,25.908000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<82.042000,0.000000,24.638000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<84.582000,0.000000,24.638000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<79.502000,0.000000,24.638000>}
//SERVOC silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.819000,0.000000,23.241000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.819000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.819000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.184000,0.000000,23.876000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<75.184000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.184000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.184000,0.000000,25.146000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<75.184000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.184000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.819000,0.000000,25.781000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<75.184000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.184000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.549000,0.000000,23.241000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<74.549000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.549000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.279000,0.000000,23.241000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.279000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.279000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,23.876000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<72.644000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,25.146000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<72.644000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.279000,0.000000,25.781000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<72.644000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.279000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.549000,0.000000,25.781000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.279000,0.000000,25.781000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.549000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.184000,0.000000,25.146000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<74.549000,0.000000,25.781000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.724000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.724000,0.000000,25.146000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<77.724000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.724000,0.000000,23.876000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<77.089000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.724000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,0.000000,25.781000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<77.089000,0.000000,25.781000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.819000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,0.000000,25.781000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.819000,0.000000,25.781000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.009000,0.000000,23.241000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<72.009000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.009000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.739000,0.000000,23.241000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.739000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.739000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.104000,0.000000,23.876000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<70.104000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.104000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.104000,0.000000,25.146000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<70.104000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.104000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.739000,0.000000,25.781000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<70.104000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.739000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.009000,0.000000,25.781000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.739000,0.000000,25.781000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.009000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,25.146000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<72.009000,0.000000,25.781000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<73.914000,0.000000,24.511000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<76.454000,0.000000,24.511000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<71.374000,0.000000,24.511000>}
//SWD silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,58.293000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<52.324000,0.000000,58.293000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,58.293000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,58.293000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.054000,0.000000,58.293000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,58.293000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,58.928000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<50.419000,0.000000,58.928000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,60.198000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.419000,0.000000,60.198000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,60.198000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,60.833000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<50.419000,0.000000,60.198000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,60.833000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,60.833000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.054000,0.000000,60.833000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,60.833000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,60.198000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<52.324000,0.000000,60.833000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.404000,0.000000,58.293000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,0.000000,58.293000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.134000,0.000000,58.293000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,0.000000,58.293000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,58.928000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<55.499000,0.000000,58.928000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,60.198000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.499000,0.000000,60.198000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,60.198000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,0.000000,60.833000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<55.499000,0.000000,60.198000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.864000,0.000000,58.293000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.864000,0.000000,58.293000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.864000,0.000000,58.293000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,0.000000,58.293000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.594000,0.000000,58.293000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,0.000000,58.293000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,58.928000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<52.959000,0.000000,58.928000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,60.198000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.959000,0.000000,60.198000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,60.198000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,0.000000,60.833000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<52.959000,0.000000,60.198000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,0.000000,60.833000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.864000,0.000000,60.833000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.594000,0.000000,60.833000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.864000,0.000000,60.833000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,60.198000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.864000,0.000000,60.833000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,60.198000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<58.039000,0.000000,60.198000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.404000,0.000000,58.293000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,58.928000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.404000,0.000000,58.293000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,60.198000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.404000,0.000000,60.833000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<57.404000,0.000000,60.833000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,0.000000,60.833000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.404000,0.000000,60.833000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.134000,0.000000,60.833000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,58.293000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,58.293000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.514000,0.000000,58.293000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,58.293000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,58.928000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<47.879000,0.000000,58.928000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,60.198000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.879000,0.000000,60.198000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,60.198000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,60.833000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<47.879000,0.000000,60.198000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,58.293000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,58.928000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<49.784000,0.000000,58.293000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,60.198000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,60.833000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<49.784000,0.000000,60.833000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,60.833000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,60.833000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.514000,0.000000,60.833000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<51.689000,0.000000,59.563000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<54.229000,0.000000,59.563000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<56.769000,0.000000,59.563000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<49.149000,0.000000,59.563000>}
//T1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.608000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.608000,0.000000,26.543000>}
box{<0,0,-0.063500><10.414000,0.036000,0.063500> rotate<0,90.000000,0> translate<38.608000,0.000000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.733000,0.000000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.733000,0.000000,16.129000>}
box{<0,0,-0.063500><10.414000,0.036000,0.063500> rotate<0,-90.000000,0> translate<22.733000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.608000,0.000000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.162000,0.000000,26.543000>}
box{<0,0,-0.063500><12.446000,0.036000,0.063500> rotate<0,0.000000,0> translate<26.162000,0.000000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.162000,0.000000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.162000,0.000000,25.654000>}
box{<0,0,-0.063500><0.889000,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.162000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.162000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.638000,0.000000,25.654000>}
box{<0,0,-0.063500><1.524000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.638000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.638000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.638000,0.000000,26.543000>}
box{<0,0,-0.063500><0.889000,0.036000,0.063500> rotate<0,90.000000,0> translate<24.638000,0.000000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.638000,0.000000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.733000,0.000000,26.543000>}
box{<0,0,-0.063500><1.905000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.733000,0.000000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.608000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.162000,0.000000,16.129000>}
box{<0,0,-0.063500><12.446000,0.036000,0.063500> rotate<0,0.000000,0> translate<26.162000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.162000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.162000,0.000000,17.018000>}
box{<0,0,-0.063500><0.889000,0.036000,0.063500> rotate<0,90.000000,0> translate<26.162000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.162000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.638000,0.000000,17.018000>}
box{<0,0,-0.063500><1.524000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.638000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.638000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.638000,0.000000,16.129000>}
box{<0,0,-0.063500><0.889000,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.638000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.638000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.733000,0.000000,16.129000>}
box{<0,0,-0.063500><1.905000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.733000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<37.973000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<37.973000,0.000000,25.908000>}
box{<0,0,-0.025400><9.144000,0.036000,0.025400> rotate<0,90.000000,0> translate<37.973000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.718000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<37.973000,0.000000,25.908000>}
box{<0,0,-0.025400><8.255000,0.036000,0.025400> rotate<0,0.000000,0> translate<29.718000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.718000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.718000,0.000000,16.764000>}
box{<0,0,-0.025400><9.144000,0.036000,0.025400> rotate<0,-90.000000,0> translate<29.718000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<37.973000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.718000,0.000000,16.764000>}
box{<0,0,-0.025400><8.255000,0.036000,0.025400> rotate<0,0.000000,0> translate<29.718000,0.000000,16.764000> }
difference{
cylinder{<26.162000,0,21.336000><26.162000,0.036000,21.336000>1.866900 translate<0,0.000000,0>}
cylinder{<26.162000,-0.1,21.336000><26.162000,0.135000,21.336000>1.739900 translate<0,0.000000,0>}}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-90.000000,0> translate<41.719500,0.000000,23.876000>}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-90.000000,0> translate<41.719500,0.000000,21.336000>}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-90.000000,0> translate<41.719500,0.000000,18.796000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-90.000000,0> translate<40.005000,0.000000,18.796000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-90.000000,0> translate<40.005000,0.000000,21.336000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-90.000000,0> translate<40.005000,0.000000,23.876000>}
box{<-0.381000,0,-0.952500><0.381000,0.036000,0.952500> rotate<0,-90.000000,0> translate<42.989500,0.000000,18.796000>}
box{<-0.381000,0,-0.952500><0.381000,0.036000,0.952500> rotate<0,-90.000000,0> translate<42.989500,0.000000,21.336000>}
box{<-0.381000,0,-0.952500><0.381000,0.036000,0.952500> rotate<0,-90.000000,0> translate<42.989500,0.000000,23.876000>}
//U1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.903000,-1.536000,54.057000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.503000,-1.536000,54.457000>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,44.997030,0> translate<66.503000,-1.536000,54.457000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.503000,-1.536000,54.457000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.703000,-1.536000,54.457000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<57.703000,-1.536000,54.457000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.703000,-1.536000,54.457000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.303000,-1.536000,54.057000>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,-44.997030,0> translate<57.303000,-1.536000,54.057000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.303000,-1.536000,54.057000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.303000,-1.536000,45.257000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<57.303000,-1.536000,45.257000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.303000,-1.536000,45.257000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.703000,-1.536000,44.857000>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,44.997030,0> translate<57.303000,-1.536000,45.257000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.703000,-1.536000,44.857000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.503000,-1.536000,44.857000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<57.703000,-1.536000,44.857000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.503000,-1.536000,44.857000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.903000,-1.536000,45.257000>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,-44.997030,0> translate<66.503000,-1.536000,44.857000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.903000,-1.536000,45.257000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.903000,-1.536000,54.057000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<66.903000,-1.536000,54.057000> }
difference{
cylinder{<66.103000,0,53.657000><66.103000,0.036000,53.657000>0.409700 translate<0,-1.536000,0>}
cylinder{<66.103000,-0.1,53.657000><66.103000,0.135000,53.657000>0.155700 translate<0,-1.536000,0>}}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<67.503000,-1.536000,53.407000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<67.503000,-1.536000,52.907000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<67.503000,-1.536000,52.407000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<67.503000,-1.536000,51.907000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<67.503000,-1.536000,51.407000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<67.503000,-1.536000,50.907000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<67.503000,-1.536000,50.407000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<67.503000,-1.536000,49.907000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<67.503000,-1.536000,49.407000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<67.503000,-1.536000,48.907000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<67.503000,-1.536000,48.407000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<67.503000,-1.536000,47.907000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<67.503000,-1.536000,47.407000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<67.503000,-1.536000,46.907000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<67.503000,-1.536000,46.407000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<67.503000,-1.536000,45.907000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<65.853000,-1.536000,44.257000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<65.353000,-1.536000,44.257000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<64.853000,-1.536000,44.257000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<64.353000,-1.536000,44.257000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<63.853000,-1.536000,44.257000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<63.353000,-1.536000,44.257000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<62.853000,-1.536000,44.257000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<62.353000,-1.536000,44.257000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<61.853000,-1.536000,44.257000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<61.353000,-1.536000,44.257000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<60.853000,-1.536000,44.257000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<60.353000,-1.536000,44.257000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<59.853000,-1.536000,44.257000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<59.353000,-1.536000,44.257000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<58.853000,-1.536000,44.257000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<58.353000,-1.536000,44.257000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<56.703000,-1.536000,45.907000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<56.703000,-1.536000,46.407000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<56.703000,-1.536000,46.907000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<56.703000,-1.536000,47.407000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<56.703000,-1.536000,47.907000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<56.703000,-1.536000,48.407000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<56.703000,-1.536000,48.907000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<56.703000,-1.536000,49.407000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<56.703000,-1.536000,49.907000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<56.703000,-1.536000,50.407000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<56.703000,-1.536000,50.907000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<56.703000,-1.536000,51.407000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<56.703000,-1.536000,51.907000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<56.703000,-1.536000,52.407000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<56.703000,-1.536000,52.907000>}
box{<-0.600000,0,-0.100000><0.600000,0.036000,0.100000> rotate<0,-180.000000,0> translate<56.703000,-1.536000,53.407000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<58.353000,-1.536000,55.057000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<58.853000,-1.536000,55.057000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<59.353000,-1.536000,55.057000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<59.853000,-1.536000,55.057000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<60.353000,-1.536000,55.057000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<60.853000,-1.536000,55.057000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<61.353000,-1.536000,55.057000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<61.853000,-1.536000,55.057000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<62.353000,-1.536000,55.057000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<62.853000,-1.536000,55.057000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<63.353000,-1.536000,55.057000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<63.853000,-1.536000,55.057000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<64.353000,-1.536000,55.057000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<64.853000,-1.536000,55.057000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<65.353000,-1.536000,55.057000>}
box{<-0.100000,0,-0.600000><0.100000,0.036000,0.600000> rotate<0,-180.000000,0> translate<65.853000,-1.536000,55.057000>}
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.762000,0.000000,63.431000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.012000,0.000000,63.431000>}
box{<0,0,-0.127000><15.750000,0.036000,0.127000> rotate<0,0.000000,0> translate<16.012000,0.000000,63.431000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.012000,0.000000,63.431000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.012000,0.000000,51.631000>}
box{<0,0,-0.127000><11.800000,0.036000,0.127000> rotate<0,-90.000000,0> translate<16.012000,0.000000,51.631000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.012000,0.000000,51.631000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.762000,0.000000,51.631000>}
box{<0,0,-0.127000><15.750000,0.036000,0.127000> rotate<0,0.000000,0> translate<16.012000,0.000000,51.631000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.762000,0.000000,51.631000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.762000,0.000000,63.431000>}
box{<0,0,-0.127000><11.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<31.762000,0.000000,63.431000> }
object{ARC(0.500000,0.050800,180.000000,360.000000,0.036000) translate<26.392000,0.000000,59.991000>}
object{ARC(0.500000,0.050800,180.000000,360.000000,0.036000) translate<25.392000,0.000000,59.991000>}
object{ARC(0.500000,0.050800,0.000000,180.000000,0.036000) translate<25.892000,0.000000,53.866000>}
object{ARC(1.000000,0.050800,0.000000,180.000000,0.036000) translate<25.892000,0.000000,54.116000>}
object{ARC(1.891594,0.050800,352.405356,367.594643,0.036000) translate<24.517000,0.000000,53.616000>}
object{ARC(3.627672,0.050800,349.832244,361.889378,0.036000) translate<23.266300,0.000000,53.996397>}
object{ARC(2.374922,0.050800,180.250904,198.673740,0.036000) translate<27.266900,0.000000,54.126400>}
object{ARC(0.625000,0.050800,180.000000,360.000000,0.036000) translate<26.267000,0.000000,55.866000>}
object{ARC(0.187500,0.050800,180.000000,360.000000,0.036000) translate<26.204500,0.000000,56.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.892000,0.000000,61.366000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,61.366000>}
box{<0,0,-0.025400><2.000000,0.036000,0.025400> rotate<0,0.000000,0> translate<24.892000,0.000000,61.366000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,61.366000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,60.741000>}
box{<0,0,-0.025400><0.625000,0.036000,0.025400> rotate<0,-90.000000,0> translate<24.892000,0.000000,60.741000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,60.741000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.892000,0.000000,60.741000>}
box{<0,0,-0.025400><1.000000,0.036000,0.025400> rotate<0,0.000000,0> translate<24.892000,0.000000,60.741000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.892000,0.000000,60.741000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.892000,0.000000,60.741000>}
box{<0,0,-0.025400><1.000000,0.036000,0.025400> rotate<0,0.000000,0> translate<25.892000,0.000000,60.741000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.892000,0.000000,60.741000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.892000,0.000000,61.366000>}
box{<0,0,-0.025400><0.625000,0.036000,0.025400> rotate<0,90.000000,0> translate<26.892000,0.000000,61.366000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.892000,0.000000,60.741000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.392000,0.000000,59.991000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,-56.306216,0> translate<26.392000,0.000000,59.991000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.392000,0.000000,59.991000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.892000,0.000000,60.741000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,56.306216,0> translate<25.892000,0.000000,60.741000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.892000,0.000000,60.741000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.392000,0.000000,59.991000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,-56.306216,0> translate<25.392000,0.000000,59.991000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.392000,0.000000,59.991000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,60.741000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,56.306216,0> translate<24.892000,0.000000,60.741000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,59.991000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,60.741000>}
box{<0,0,-0.025400><0.750000,0.036000,0.025400> rotate<0,90.000000,0> translate<24.892000,0.000000,60.741000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.892000,0.000000,59.991000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.892000,0.000000,60.741000>}
box{<0,0,-0.025400><0.750000,0.036000,0.025400> rotate<0,90.000000,0> translate<26.892000,0.000000,60.741000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.892000,0.000000,59.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,59.241000>}
box{<0,0,-0.025400><2.000000,0.036000,0.025400> rotate<0,0.000000,0> translate<24.892000,0.000000,59.241000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,59.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,57.491000>}
box{<0,0,-0.025400><1.750000,0.036000,0.025400> rotate<0,-90.000000,0> translate<24.892000,0.000000,57.491000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,57.491000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.392000,0.000000,57.491000>}
box{<0,0,-0.025400><0.500000,0.036000,0.025400> rotate<0,0.000000,0> translate<24.892000,0.000000,57.491000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.392000,0.000000,57.491000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.392000,0.000000,58.616000>}
box{<0,0,-0.025400><1.125000,0.036000,0.025400> rotate<0,90.000000,0> translate<25.392000,0.000000,58.616000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.392000,0.000000,58.616000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.642000,0.000000,58.616000>}
box{<0,0,-0.025400><0.250000,0.036000,0.025400> rotate<0,0.000000,0> translate<25.392000,0.000000,58.616000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.642000,0.000000,58.616000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.642000,0.000000,57.491000>}
box{<0,0,-0.025400><1.125000,0.036000,0.025400> rotate<0,-90.000000,0> translate<25.642000,0.000000,57.491000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.642000,0.000000,57.491000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.142000,0.000000,57.491000>}
box{<0,0,-0.025400><0.500000,0.036000,0.025400> rotate<0,0.000000,0> translate<25.642000,0.000000,57.491000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.142000,0.000000,57.491000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.142000,0.000000,58.616000>}
box{<0,0,-0.025400><1.125000,0.036000,0.025400> rotate<0,90.000000,0> translate<26.142000,0.000000,58.616000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.142000,0.000000,58.616000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.392000,0.000000,58.616000>}
box{<0,0,-0.025400><0.250000,0.036000,0.025400> rotate<0,0.000000,0> translate<26.142000,0.000000,58.616000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.392000,0.000000,58.616000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.392000,0.000000,57.491000>}
box{<0,0,-0.025400><1.125000,0.036000,0.025400> rotate<0,-90.000000,0> translate<26.392000,0.000000,57.491000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.392000,0.000000,57.491000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.892000,0.000000,57.491000>}
box{<0,0,-0.025400><0.500000,0.036000,0.025400> rotate<0,0.000000,0> translate<26.392000,0.000000,57.491000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.892000,0.000000,57.491000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.892000,0.000000,59.241000>}
box{<0,0,-0.025400><1.750000,0.036000,0.025400> rotate<0,90.000000,0> translate<26.892000,0.000000,59.241000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.892000,0.000000,57.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,57.241000>}
box{<0,0,-0.025400><2.000000,0.036000,0.025400> rotate<0,0.000000,0> translate<24.892000,0.000000,57.241000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,57.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,56.616000>}
box{<0,0,-0.025400><0.625000,0.036000,0.025400> rotate<0,-90.000000,0> translate<24.892000,0.000000,56.616000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,56.616000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.642000,0.000000,56.616000>}
box{<0,0,-0.025400><0.750000,0.036000,0.025400> rotate<0,0.000000,0> translate<24.892000,0.000000,56.616000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.642000,0.000000,56.616000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,56.116000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,-33.687844,0> translate<24.892000,0.000000,56.116000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,56.116000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,55.366000>}
box{<0,0,-0.025400><0.750000,0.036000,0.025400> rotate<0,-90.000000,0> translate<24.892000,0.000000,55.366000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.892000,0.000000,55.366000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.642000,0.000000,55.866000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,-33.687844,0> translate<24.892000,0.000000,55.366000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.392000,0.000000,56.616000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.017000,0.000000,56.616000>}
box{<0,0,-0.025400><0.375000,0.036000,0.025400> rotate<0,0.000000,0> translate<26.017000,0.000000,56.616000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.892000,0.000000,57.241000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.892000,0.000000,55.866000>}
box{<0,0,-0.025400><1.375000,0.036000,0.025400> rotate<0,-90.000000,0> translate<26.892000,0.000000,55.866000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.392000,0.000000,56.616000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.392000,0.000000,56.241000>}
box{<0,0,-0.025400><0.375000,0.036000,0.025400> rotate<0,-90.000000,0> translate<26.392000,0.000000,56.241000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.017000,0.000000,56.616000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.017000,0.000000,56.241000>}
box{<0,0,-0.025400><0.375000,0.036000,0.025400> rotate<0,-90.000000,0> translate<26.017000,0.000000,56.241000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.892000,0.000000,53.866000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.892000,0.000000,53.366000>}
box{<0,0,-0.025400><0.500000,0.036000,0.025400> rotate<0,-90.000000,0> translate<25.892000,0.000000,53.366000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.892000,0.000000,53.866000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.392000,0.000000,53.866000>}
box{<0,0,-0.025400><0.500000,0.036000,0.025400> rotate<0,0.000000,0> translate<25.392000,0.000000,53.866000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.392000,0.000000,53.371000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.837000,0.000000,53.371000>}
box{<0,0,-0.025400><0.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<26.392000,0.000000,53.371000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.892000,0.000000,53.366000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.017000,0.000000,53.366000>}
box{<0,0,-0.025400><0.875000,0.036000,0.025400> rotate<0,0.000000,0> translate<25.017000,0.000000,53.366000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.142000,0.000000,63.431000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.012000,0.000000,63.431000>}
box{<0,0,-0.127000><8.130000,0.036000,0.127000> rotate<0,0.000000,0> translate<16.012000,0.000000,63.431000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.077000,0.000000,51.631000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.762000,0.000000,51.631000>}
box{<0,0,-0.127000><3.685000,0.036000,0.127000> rotate<0,0.000000,0> translate<28.077000,0.000000,51.631000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.762000,0.000000,63.431000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.077000,0.000000,63.431000>}
box{<0,0,-0.127000><3.685000,0.036000,0.127000> rotate<0,0.000000,0> translate<28.077000,0.000000,63.431000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.012000,0.000000,51.631000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.142000,0.000000,51.631000>}
box{<0,0,-0.127000><8.130000,0.036000,0.127000> rotate<0,0.000000,0> translate<16.012000,0.000000,51.631000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  SPION_3D(-55.778500,0,-42.349500,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//X1	PN61729-S	PN61729-S
