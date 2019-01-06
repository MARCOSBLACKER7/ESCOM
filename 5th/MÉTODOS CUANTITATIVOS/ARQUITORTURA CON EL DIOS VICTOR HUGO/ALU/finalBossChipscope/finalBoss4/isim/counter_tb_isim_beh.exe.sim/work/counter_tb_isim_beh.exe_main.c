/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *WORK_P_0450891074;
char *IEEE_P_3499444699;
char *WORK_P_2901011879;
char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *IEEE_P_3620187407;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_p_0450891074_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_p_2901011879_init();
    ieee_p_1242562249_init();
    work_a_0524141230_3212880686_init();
    work_a_1259183420_3212880686_init();
    work_a_1985133471_1446275585_init();
    work_a_3353191842_1446275585_init();
    work_a_3604004464_3212880686_init();
    work_a_3222946569_3212880686_init();
    work_a_2841847718_3212880686_init();
    work_a_2564782701_1446275585_init();
    work_a_3175194644_1523302143_init();
    work_a_3623861919_2372691052_init();
    work_a_3639607394_2647518972_init();
    work_a_3983655784_3391526516_init();
    work_a_1047974001_3212880686_init();
    work_a_0508150645_2372691052_init();


    xsi_register_tops("work_a_0508150645_2372691052");

    WORK_P_0450891074 = xsi_get_engine_memory("work_p_0450891074");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    WORK_P_2901011879 = xsi_get_engine_memory("work_p_2901011879");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");

    return xsi_run_simulation(argc, argv);

}
