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
static const char *ng0 = "C:/Users/marco/Documents/ESCOM/QUINTO SEMESTRE/ARQUITECTURA DE COMPUTADORAS/DistRam/TestBench.vhd";
extern char *STD_TEXTIO;
extern char *IEEE_P_3564397177;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
void ieee_p_3564397177_sub_1496949865_91900896(char *, char *, char *, unsigned char , unsigned char , int );
void ieee_p_3564397177_sub_2743816878_91900896(char *, char *, char *, char *);
void ieee_p_3564397177_sub_3205433008_91900896(char *, char *, char *, char *, char *, unsigned char , int );
void ieee_p_3564397177_sub_3988856810_91900896(char *, char *, char *, char *, char *);


static void work_a_0762707025_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 4168U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 4816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 2208U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3976);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 4816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 2208U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3976);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_0762707025_2372691052_p_1(char *t0)
{
    char t5[16];
    char t10[8];
    char t11[8];
    char t12[8];
    char t13[8];
    char t18[8];
    char t19[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    int64 t14;
    int t15;
    char *t16;
    unsigned char t17;
    int t20;

LAB0:    t1 = (t0 + 4416U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 3120U);
    t3 = (t0 + 9198);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 1;
    t7 = (t6 + 4U);
    *((int *)t7) = 12;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (12 - 1);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    std_textio_file_open1(t2, t3, t5, (unsigned char)0);
    xsi_set_current_line(110, ng0);
    t2 = (t0 + 3016U);
    t3 = (t0 + 9210);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 1;
    t7 = (t6 + 4U);
    *((int *)t7) = 14;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (14 - 1);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    std_textio_file_open1(t2, t3, t5, (unsigned char)1);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 9224);
    t4 = (t0 + 3584U);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t2, 5U);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 4224);
    t3 = (t0 + 3296U);
    t4 = (t0 + 3584U);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    memcpy(t10, t7, 5U);
    t6 = (t0 + 8920U);
    t8 = (5U + 1);
    std_textio_write7(STD_TEXTIO, t2, t3, t10, t6, (unsigned char)0, t8);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 9229);
    t4 = (t0 + 3584U);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t2, 5U);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 4224);
    t3 = (t0 + 3296U);
    t4 = (t0 + 3584U);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    memcpy(t11, t7, 5U);
    t6 = (t0 + 8920U);
    t8 = (5U + 1);
    std_textio_write7(STD_TEXTIO, t2, t3, t11, t6, (unsigned char)0, t8);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 9234);
    t4 = (t0 + 3584U);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t2, 5U);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 4224);
    t3 = (t0 + 3296U);
    t4 = (t0 + 3584U);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    memcpy(t12, t7, 5U);
    t6 = (t0 + 8920U);
    t8 = (5U + 1);
    std_textio_write7(STD_TEXTIO, t2, t3, t12, t6, (unsigned char)0, t8);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 9239);
    t4 = (t0 + 3584U);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t2, 5U);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 4224);
    t3 = (t0 + 3296U);
    t4 = (t0 + 3584U);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    memcpy(t13, t7, 5U);
    t6 = (t0 + 8920U);
    t8 = (5U + 1);
    std_textio_write7(STD_TEXTIO, t2, t3, t13, t6, (unsigned char)0, t8);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 4224);
    t3 = (t0 + 3016U);
    t4 = (t0 + 3296U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t4);
    xsi_set_current_line(122, ng0);
    t14 = (10 * 1000LL);
    t2 = (t0 + 4224);
    xsi_process_wait(t2, t14);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(123, ng0);
    t2 = (t0 + 9244);
    *((int *)t2) = 0;
    t3 = (t0 + 9248);
    *((int *)t3) = 11;
    t8 = 0;
    t15 = 11;

LAB8:    if (t8 <= t15)
        goto LAB9;

LAB11:    xsi_set_current_line(143, ng0);
    t2 = (t0 + 3120U);
    std_textio_file_close(t2);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 3016U);
    std_textio_file_close(t2);
    xsi_set_current_line(146, ng0);

LAB19:    *((char **)t1) = &&LAB20;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB9:    xsi_set_current_line(124, ng0);
    t4 = (t0 + 4224);
    t6 = (t0 + 3120U);
    t7 = (t0 + 3368U);
    std_textio_readline(STD_TEXTIO, t4, t6, t7);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 4224);
    t3 = (t0 + 3368U);
    t4 = (t0 + 2568U);
    t6 = *((char **)t4);
    t4 = (t0 + 8904U);
    ieee_p_3564397177_sub_3988856810_91900896(IEEE_P_3564397177, t2, t3, t6, t4);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 2568U);
    t3 = *((char **)t2);
    t2 = (t0 + 4880);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t16 = *((char **)t7);
    memcpy(t16, t3, 16U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 4224);
    t3 = (t0 + 3368U);
    t4 = (t0 + 2448U);
    t6 = *((char **)t4);
    t4 = (t0 + 8888U);
    ieee_p_3564397177_sub_3988856810_91900896(IEEE_P_3564397177, t2, t3, t6, t4);
    xsi_set_current_line(129, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t2 = (t0 + 4944);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t16 = *((char **)t7);
    memcpy(t16, t3, 8U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 4224);
    t3 = (t0 + 3368U);
    t4 = (t0 + 2688U);
    t6 = *((char **)t4);
    t4 = (t6 + 0);
    ieee_p_3564397177_sub_2743816878_91900896(IEEE_P_3564397177, t2, t3, t4);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 2688U);
    t3 = *((char **)t2);
    t17 = *((unsigned char *)t3);
    t2 = (t0 + 5008);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t16 = *((char **)t7);
    *((unsigned char *)t16) = t17;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(133, ng0);

LAB14:    t2 = (t0 + 4736);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB10:    t2 = (t0 + 9244);
    t8 = *((int *)t2);
    t3 = (t0 + 9248);
    t15 = *((int *)t3);
    if (t8 == t15)
        goto LAB11;

LAB16:    t20 = (t8 + 1);
    t8 = t20;
    t4 = (t0 + 9244);
    *((int *)t4) = t8;
    goto LAB8;

LAB12:    t4 = (t0 + 4736);
    *((int *)t4) = 0;
    xsi_set_current_line(134, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 2328U);
    t4 = *((char **)t2);
    t2 = (t4 + 0);
    memcpy(t2, t3, 16U);
    xsi_set_current_line(136, ng0);
    t2 = (t0 + 4224);
    t3 = (t0 + 3296U);
    t4 = (t0 + 2568U);
    t6 = *((char **)t4);
    memcpy(t5, t6, 16U);
    t4 = (t0 + 8904U);
    ieee_p_3564397177_sub_3205433008_91900896(IEEE_P_3564397177, t2, t3, t5, t4, (unsigned char)0, 5);
    xsi_set_current_line(137, ng0);
    t2 = (t0 + 4224);
    t3 = (t0 + 3296U);
    t4 = (t0 + 2448U);
    t6 = *((char **)t4);
    memcpy(t18, t6, 8U);
    t4 = (t0 + 8888U);
    ieee_p_3564397177_sub_3205433008_91900896(IEEE_P_3564397177, t2, t3, t18, t4, (unsigned char)0, 5);
    xsi_set_current_line(138, ng0);
    t2 = (t0 + 4224);
    t3 = (t0 + 3296U);
    t4 = (t0 + 2688U);
    t6 = *((char **)t4);
    t17 = *((unsigned char *)t6);
    ieee_p_3564397177_sub_1496949865_91900896(IEEE_P_3564397177, t2, t3, t17, (unsigned char)0, 5);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 4224);
    t3 = (t0 + 3296U);
    t4 = (t0 + 2328U);
    t6 = *((char **)t4);
    memcpy(t19, t6, 16U);
    t4 = (t0 + 8872U);
    ieee_p_3564397177_sub_3205433008_91900896(IEEE_P_3564397177, t2, t3, t19, t4, (unsigned char)0, 5);
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 4224);
    t3 = (t0 + 3016U);
    t4 = (t0 + 3296U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t4);
    goto LAB10;

LAB13:    t3 = (t0 + 992U);
    t17 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t17 == 1)
        goto LAB12;
    else
        goto LAB14;

LAB15:    goto LAB13;

LAB17:    goto LAB2;

LAB18:    goto LAB17;

LAB20:    goto LAB18;

}


extern void work_a_0762707025_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0762707025_2372691052_p_0,(void *)work_a_0762707025_2372691052_p_1};
	xsi_register_didat("work_a_0762707025_2372691052", "isim/TB_RAM_D_isim_beh.exe.sim/work/a_0762707025_2372691052.didat");
	xsi_register_executes(pe);
}
