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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/marco/OneDrive/Escritorio/finalBossChipscope/finalBoss4/src/barrel_shifter.vhd";



static void work_a_2841847718_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    int t5;
    char *t6;
    int t7;
    int t8;
    char *t9;
    char *t10;
    int t11;
    int t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    unsigned char t19;
    char *t20;
    char *t21;
    int t22;
    int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    int t28;
    int t29;
    char *t30;
    char *t31;
    char *t32;
    int t33;
    int t34;
    int t35;
    int t36;
    char *t37;
    unsigned char t38;
    char *t39;
    char *t40;
    int t41;
    int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;

LAB0:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 2288U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    memcpy(t1, t2, 16U);

LAB3:    xsi_set_current_line(59, ng0);
    t5 = (4 - 1);
    t1 = (t0 + 6292);
    *((int *)t1) = 0;
    t2 = (t0 + 6296);
    *((int *)t2) = t5;
    t7 = 0;
    t8 = t5;

LAB10:    if (t7 <= t8)
        goto LAB11;

LAB13:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB26;

LAB28:    xsi_set_current_line(76, ng0);
    t1 = (t0 + 2288U);
    t2 = *((char **)t1);
    t1 = (t0 + 3672);
    t6 = (t1 + 56U);
    t9 = *((char **)t6);
    t10 = (t9 + 56U);
    t18 = *((char **)t10);
    memcpy(t18, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);

LAB27:    t1 = (t0 + 3592);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(52, ng0);
    t5 = (16 - 1);
    t1 = (t0 + 6284);
    *((int *)t1) = 0;
    t6 = (t0 + 6288);
    *((int *)t6) = t5;
    t7 = 0;
    t8 = t5;

LAB5:    if (t7 <= t8)
        goto LAB6;

LAB8:    goto LAB3;

LAB6:    xsi_set_current_line(53, ng0);
    t9 = (t0 + 1032U);
    t10 = *((char **)t9);
    t11 = (16 - 1);
    t9 = (t0 + 6284);
    t12 = *((int *)t9);
    t13 = (t11 - t12);
    t14 = (t13 - 15);
    t15 = (t14 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t13);
    t16 = (1U * t15);
    t17 = (0 + t16);
    t18 = (t10 + t17);
    t19 = *((unsigned char *)t18);
    t20 = (t0 + 2288U);
    t21 = *((char **)t20);
    t20 = (t0 + 6284);
    t22 = *((int *)t20);
    t23 = (t22 - 15);
    t24 = (t23 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, *((int *)t20));
    t25 = (1U * t24);
    t26 = (0 + t25);
    t27 = (t21 + t26);
    *((unsigned char *)t27) = t19;

LAB7:    t1 = (t0 + 6284);
    t7 = *((int *)t1);
    t2 = (t0 + 6288);
    t8 = *((int *)t2);
    if (t7 == t8)
        goto LAB8;

LAB9:    t5 = (t7 + 1);
    t7 = t5;
    t6 = (t0 + 6284);
    *((int *)t6) = t7;
    goto LAB5;

LAB11:    xsi_set_current_line(60, ng0);
    t11 = (16 - 1);
    t6 = (t0 + 6300);
    *((int *)t6) = t11;
    t9 = (t0 + 6304);
    *((int *)t9) = 0;
    t12 = t11;
    t13 = 0;

LAB14:    if (t12 >= t13)
        goto LAB15;

LAB17:
LAB12:    t1 = (t0 + 6292);
    t7 = *((int *)t1);
    t2 = (t0 + 6296);
    t8 = *((int *)t2);
    if (t7 == t8)
        goto LAB13;

LAB25:    t5 = (t7 + 1);
    t7 = t5;
    t6 = (t0 + 6292);
    *((int *)t6) = t7;
    goto LAB10;

LAB15:    xsi_set_current_line(61, ng0);
    t10 = (t0 + 1192U);
    t18 = *((char **)t10);
    t10 = (t0 + 6292);
    t14 = *((int *)t10);
    t22 = (t14 - 3);
    t15 = (t22 * -1);
    xsi_vhdl_check_range_of_index(3, 0, -1, *((int *)t10));
    t16 = (1U * t15);
    t17 = (0 + t16);
    t20 = (t18 + t17);
    t3 = *((unsigned char *)t20);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB18;

LAB20:
LAB19:
LAB16:    t1 = (t0 + 6300);
    t12 = *((int *)t1);
    t2 = (t0 + 6304);
    t13 = *((int *)t2);
    if (t12 == t13)
        goto LAB17;

LAB24:    t5 = (t12 + -1);
    t12 = t5;
    t6 = (t0 + 6300);
    *((int *)t6) = t12;
    goto LAB14;

LAB18:    xsi_set_current_line(62, ng0);
    t21 = (t0 + 6300);
    t27 = (t0 + 6292);
    t23 = xsi_vhdl_pow(2, *((int *)t27));
    t28 = *((int *)t21);
    t29 = (t28 - t23);
    t19 = (t29 >= 0);
    if (t19 != 0)
        goto LAB21;

LAB23:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 2288U);
    t2 = *((char **)t1);
    t1 = (t0 + 6300);
    t5 = *((int *)t1);
    t11 = (t5 - 15);
    t15 = (t11 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, *((int *)t1));
    t16 = (1U * t15);
    t17 = (0 + t16);
    t6 = (t2 + t17);
    *((unsigned char *)t6) = (unsigned char)2;

LAB22:    goto LAB19;

LAB21:    xsi_set_current_line(63, ng0);
    t30 = (t0 + 2288U);
    t31 = *((char **)t30);
    t30 = (t0 + 6300);
    t32 = (t0 + 6292);
    t33 = xsi_vhdl_pow(2, *((int *)t32));
    t34 = *((int *)t30);
    t35 = (t34 - t33);
    t36 = (t35 - 15);
    t24 = (t36 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t35);
    t25 = (1U * t24);
    t26 = (0 + t25);
    t37 = (t31 + t26);
    t38 = *((unsigned char *)t37);
    t39 = (t0 + 2288U);
    t40 = *((char **)t39);
    t39 = (t0 + 6300);
    t41 = *((int *)t39);
    t42 = (t41 - 15);
    t43 = (t42 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, *((int *)t39));
    t44 = (1U * t43);
    t45 = (0 + t44);
    t46 = (t40 + t45);
    *((unsigned char *)t46) = t38;
    goto LAB22;

LAB26:    xsi_set_current_line(72, ng0);
    t5 = (16 - 1);
    t1 = (t0 + 6308);
    *((int *)t1) = 0;
    t6 = (t0 + 6312);
    *((int *)t6) = t5;
    t7 = 0;
    t8 = t5;

LAB29:    if (t7 <= t8)
        goto LAB30;

LAB32:    goto LAB27;

LAB30:    xsi_set_current_line(73, ng0);
    t9 = (t0 + 2288U);
    t10 = *((char **)t9);
    t11 = (16 - 1);
    t9 = (t0 + 6308);
    t12 = *((int *)t9);
    t13 = (t11 - t12);
    t14 = (t13 - 15);
    t15 = (t14 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t13);
    t16 = (1U * t15);
    t17 = (0 + t16);
    t18 = (t10 + t17);
    t19 = *((unsigned char *)t18);
    t20 = (t0 + 6308);
    t22 = *((int *)t20);
    t23 = (t22 - 15);
    t24 = (t23 * -1);
    t25 = (1 * t24);
    t26 = (0U + t25);
    t21 = (t0 + 3672);
    t27 = (t21 + 56U);
    t30 = *((char **)t27);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    *((unsigned char *)t32) = t19;
    xsi_driver_first_trans_delta(t21, t26, 1, 0LL);

LAB31:    t1 = (t0 + 6308);
    t7 = *((int *)t1);
    t2 = (t0 + 6312);
    t8 = *((int *)t2);
    if (t7 == t8)
        goto LAB32;

LAB33:    t5 = (t7 + 1);
    t7 = t5;
    t6 = (t0 + 6308);
    *((int *)t6) = t7;
    goto LAB29;

}


extern void work_a_2841847718_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2841847718_3212880686_p_0};
	xsi_register_didat("work_a_2841847718_3212880686", "isim/counter_tb_isim_beh.exe.sim/work/a_2841847718_3212880686.didat");
	xsi_register_executes(pe);
}
