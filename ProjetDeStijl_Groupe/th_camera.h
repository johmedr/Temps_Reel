/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   th_camera.h
 * Author: yop
 *
 * Created on 21 mai 2017, 19:51
 */

#ifndef TH_CAMERA_H
#define TH_CAMERA_H

#include "includes.h"
#include "imagerie.h"
#include "tcpServer.h"

#define TH_ACQUERIR_COMPRESSER_PRIO
#define TH_ACQUERIR_COMPRESSER_STKSIZE
#define TH_ACQUERIR_COMPRESSER_MODE
#define TH_ACQUERIR_COMPRESSER_PERIOD

#define TH_CALIBRER_ARENE_PRIO
#define TH_CALIBRER_ARENE_STKSIZE
#define TH_CALIBRER_ARENE_MODE

#ifdef __cplusplus
extern "C" {
#endif
    
    RT_TASK th_acquerir_compresser; 
    RT_TASK th_calibrer_arene; 
    void acquerir_compresser(void * args); 
    void calibrer_arene(void * args); 
    
#ifdef __cplusplus
}
#endif

#endif /* TH_CAMERA_H */

