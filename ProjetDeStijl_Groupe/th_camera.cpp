/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "th_camera.h"

void acquerir_compresser(void * args) { 
    int cameraIsOpen = -1, comIsOk = -1;
    Camera rpi_cam; 
    Jpg image_jpg; 
    Image image; 
    printf("tacquerir_compresse : demarrage\n");
    if(rt_task_set_periodic(NULL, TM_NOW, TH_ACQUERIR_COMPRESSER_PERIOD) != 0) { 
        while(1) { 
            // Mettre ici l'activation/la desactivation grace a le th_calibrer
            rt_task_wait_period(NULL); 
            if(cameraIsOpen != 0) { // Camera non ouverte
                cameraIsOpen = openCamera(rpi_cam); 
                if( cameraIsOpen != 0 ) continue; // Si on a echoue l'ouverture, on passe à l'iteration suivante
            }
            // Acquisition de l'image
            getImg(rpi_cam, image); 
            // Compression 
            imgCompress(image, image_jpg);
            // Envoi de l'image
            if( (comIsOk = sendToUi(IMG, image_jpg)) == -1 ) break; 
        }
    }
}

void calibrer_arene(void * args) { 
    printf("tcalibrer_arene : demarrage\n");
}
