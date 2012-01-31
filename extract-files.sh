#!/bin/bash

# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE=griffin
MANUFACTURER=matsunichi

mkdir prebuilt

# TODO - get the kernel and other good stuff

mkdir -p ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
mkdir -p ../../../vendor/$MANUFACTURER/$DEVICE/prebuilt

# DSP related libs and firmware
DSP_files="baseimage.dof baseimage.map 720p_h264vdec_sn.dll64P \
           720p_h264venc_sn.dll64P 720p_mp4vdec_sn.dll64P 720p_mp4venc_sn.dll64P \
           chromasuppress.l64p conversions.dll64P dctn_dyn.dll64P \
           ddspbase_tiomap3430.dof64P dfgm.dll64P dynbase_tiomap3430.dof64P \
           eenf_ti.l64P g711dec_sn.dll64P g711enc_sn.dll64P g722dec_sn.dll64P \
           g722enc_sn.dll64P g726dec_sn.dll64P g726enc_sn.dll64P g729dec_sn.dll64P \
           g729enc_sn.dll64P h264vdec_sn.dll64P h264venc_sn.dll64P \
           ilbcdec_sn.dll64P ilbcenc_sn.dll64P ipp_sn.dll64P jpegdec_sn.dll64P \
           jpegenc_sn.dll64P m4venc_sn.dll64P monitor_tiomap3430.dof64P \
           mp3dec_sn.dll64P mp4vdec_sn.dll64P mpeg4aacdec_sn.dll64P \
           mpeg4aacenc_sn.dll64P nbamrdec_sn.dll64P nbamrenc_sn.dll64P \
           postprocessor_dualout.dll64P qosdyn_3430.dll64P ringio.dll64P \
           star.l64P usn.dll64P vpp_sn.dll64P wbamrdec_sn.dll64P \
           wbamrenc_sn.dll64P wmadec_sn.dll64P wmv9dec_sn.dll64P yuvconvert.l64p"
if [ -z "$1" ]; then
    for file in $DSP_files; do adb pull "/system/lib/dsp/$file" "../../../vendor/$MANUFACTURER/$DEVICE/proprietary/$file"; done
else
    for file in $DSP_files; do cp "$1/lib/dsp/$file" "../../../vendor/$MANUFACTURER/$DEVICE/proprietary/$file"; done
fi

# DSP Codecs
DSP_codecs="libbridge.so libomap_mm_library_jni.so \
            libomx_aacdec_sharedlibrary.so libomx_amrdec_sharedlibrary.so \
            libomx_amrenc_sharedlibrary.so libomx_avcdec_sharedlibrary.so \
            libOMX_Core.so libOMX.ITTIAM.AAC.decode.so \
            libOMX.ITTIAM.AAC.encode.so libomx_m4vdec_sharedlibrary.so \
            libomx_mp3dec_sharedlibrary.so libomx_sharedlibrary.so \
            libOMX.TI.720P.Decoder.so libOMX.TI.720P.Encoder.so \
            libOMX.TI.AAC.decode.so libOMX.TI.AAC.encode.so \
            libOMX.TI.AMR.decode.so libOMX.TI.AMR.encode.so \
            libOMX.TI.G711.decode.so libOMX.TI.G711.encode.so \
            libOMX.TI.G722.decode.so libOMX.TI.G722.encode.so \
            libOMX.TI.G726.decode.so libOMX.TI.G726.encode.so \
            libOMX.TI.G729.decode.so libOMX.TI.G729.encode.so \
            libOMX.TI.h264.splt.Encoder.so libOMX.TI.ILBC.decode.so \
            libOMX.TI.ILBC.encode.so libOMX.TI.JPEG.decoder.so \
            libOMX.TI.JPEG.encoder.so libOMX.TI.MP3.decode.so \
            libOMX.TI.mp4.splt.Encoder.so libOMX.TI.Video.Decoder.so \
            libOMX.TI.Video.encoder.so libOMX.TI.VPP.so \
            libOMX.TI.WBAMR.decode.so libOMX.TI.WBAMR.encode.so \
            libOMX.TI.WMA.decode.so libopencore_asflocalreg.so \
            libopencore_asflocal.so libopencore_author.so \
            libopencore_common.so libopencore_downloadreg.so \
            libopencore_download.so libopencorehw.so \
            libopencore_mp4localreg.so libopencore_mp4local.so \
            libopencore_net_support.so libopencore_player.so \
            libopencore_rtspreg.so libopencore_rtsp.so libPERF.so \
            libstagefright_omx.so libVendor_ti_omx_config_parser.so \
            libVendor_ti_omx.so"
if [ -z "$1" ]; then
    for file in $DSP_codecs; do adb pull "/system/lib/$file" "../../../vendor/$MANUFACTURER/$DEVICE/proprietary/$file"; done
else
    for file in $DSP_codecs; do cp "$1/lib/$file" "../../../vendor/$MANUFACTURER/$DEVICE/proprietary/$file"; done
fi

# SGX SDK
SGX_SDK="lib/libIMGegl.so lib/egl/libGLES_android.so lib/egl/egl.cfg \
         bin/pvrsrvinit lib/libsrv_um.so lib/hw/gralloc.omap3.so \
         lib/libpvrPVR2D_FLIPWSEGL.so lib/libusc.so \
         lib/libglslcompiler.so lib/libPVRScopeServices.so \
         lib/libpvrANDROID_WSEGL.so lib/libpvrPVR2D_FRONTWSEGL.so \
         lib/libOpenVG.so lib/libpvr2d.so lib/libsrv_init.so \
         lib/libOpenVGU.so lib/egl/libGLESv1_CM_POWERVR_SGX530_125.so \
         lib/egl/libEGL_POWERVR_SGX530_125.so \
         lib/egl/libGLESv2_POWERVR_SGX530_125.so"
if [ -z "$1" ]; then
    for file in $SGX_SDK; do adb pull "/system/$file" "../../../vendor/$MANUFACTURER/$DEVICE/proprietary/`basename $file`"; done
else
    for file in $SGX_SDK; do cp "$1/lib/$file" "../../../vendor/$MANUFACTURER/$DEVICE/proprietary/`basename $file`"; done
fi

# audio legacy
audio_legacy="lib/libaudiopolicy.so lib/libaudio.so lib/libasound.so \
              lib/liba2dp.so usr/share/alsa/init/hda \
              usr/share/alsa/init/00main usr/share/alsa/init/help \
              usr/share/alsa/init/default usr/share/alsa/init/info \
              usr/share/alsa/init/test usr/share/alsa/pcm/surround51.conf \
              usr/share/alsa/pcm/surround41.conf \
              usr/share/alsa/pcm/default.conf usr/share/alsa/pcm/dmix.conf \
              usr/share/alsa/pcm/modem.conf usr/share/alsa/pcm/side.conf \
              usr/share/alsa/pcm/front.conf usr/share/alsa/pcm/iec958.conf \
              usr/share/alsa/pcm/surround50.conf \
              usr/share/alsa/pcm/surround40.conf \
              usr/share/alsa/pcm/surround71.conf usr/share/alsa/pcm/dpl.conf \
              usr/share/alsa/pcm/dsnoop.conf usr/share/alsa/pcm/rear.conf \
              usr/share/alsa/pcm/center_lfe.conf \
              usr/share/alsa/cards/aliases.conf usr/share/alsa/alsa.conf"
if [ -z "$1" ]; then
    for file in $audio_legacy; do adb pull "/system/$file" "../../../vendor/$MANUFACTURER/$DEVICE/proprietary/`basename $file`"; done
else
    for file in $audio_legacy; do cp "$1/lib/$file" "../../../vendor/$MANUFACTURER/$DEVICE/proprietary/`basename $file`"; done
fi
exit 0

# TODO from here down
(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g > ../../../vendor/$MANUFACTURER/$DEVICE/device-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/__MANUFACTURER__/__DEVICE__/extract-files.sh - DO NOT EDIT

PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libopencore_rtsp.so:/system/lib/libopencore_rtsp.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.G722.decode.so:/system/lib/libOMX.TI.G722.decode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libopencorehw.so:/system/lib/libopencorehw.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libopencore_player.so:/system/lib/libopencore_player.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.G729.encode.so:/system/lib/libOMX.TI.G729.encode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libVendor_ti_omx.so:/system/lib/libVendor_ti_omx.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.AMR.decode.so:/system/lib/libOMX.TI.AMR.decode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libLCML.so:/system/lib/libLCML.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libomx_amrenc_sharedlibrary.so:/system/lib/libomx_amrenc_sharedlibrary.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libbridge.so:/system/lib/libbridge.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.MP3.decode.so:/system/lib/libOMX.TI.MP3.decode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libopencore_common.so:/system/lib/libopencore_common.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.JPEG.encoder.so:/system/lib/libOMX.TI.JPEG.encoder.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.WBAMR.decode.so:/system/lib/libOMX.TI.WBAMR.decode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libomx_m4vdec_sharedlibrary.so:/system/lib/libomx_m4vdec_sharedlibrary.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libopencore_download.so:/system/lib/libopencore_download.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libomx_aacdec_sharedlibrary.so:/system/lib/libomx_aacdec_sharedlibrary.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libVendor_ti_omx_config_parser.so:/system/lib/libVendor_ti_omx_config_parser.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.G722.encode.so:/system/lib/libOMX.TI.G722.encode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.Video.Decoder.so:/system/lib/libOMX.TI.Video.Decoder.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libomx_mp3dec_sharedlibrary.so:/system/lib/libomx_mp3dec_sharedlibrary.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.AAC.encode.so:/system/lib/libOMX.TI.AAC.encode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libopencore_rtspreg.so:/system/lib/libopencore_rtspreg.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.720P.Decoder.so:/system/lib/libOMX.TI.720P.Decoder.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libPERF.so:/system/lib/libPERF.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.ILBC.encode.so:/system/lib/libOMX.TI.ILBC.encode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.AAC.decode.so:/system/lib/libOMX.TI.AAC.decode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libopencore_author.so:/system/lib/libopencore_author.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libopencore_mp4localreg.so:/system/lib/libopencore_mp4localreg.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.G726.decode.so:/system/lib/libOMX.TI.G726.decode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.VPP.so:/system/lib/libOMX.TI.VPP.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.JPEG.decoder.so:/system/lib/libOMX.TI.JPEG.decoder.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.Video.encoder.so:/system/lib/libOMX.TI.Video.encoder.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libomx_amrdec_sharedlibrary.so:/system/lib/libomx_amrdec_sharedlibrary.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX_Core.so:/system/lib/libOMX_Core.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.G711.decode.so:/system/lib/libOMX.TI.G711.decode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.WBAMR.encode.so:/system/lib/libOMX.TI.WBAMR.encode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libomx_avcdec_sharedlibrary.so:/system/lib/libomx_avcdec_sharedlibrary.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libomap_mm_library_jni.so:/system/lib/libomap_mm_library_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libopencore_downloadreg.so:/system/lib/libopencore_downloadreg.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.G729.decode.so:/system/lib/libOMX.TI.G729.decode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libomx_sharedlibrary.so:/system/lib/libomx_sharedlibrary.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.WMA.decode.so:/system/lib/libOMX.TI.WMA.decode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.ILBC.decode.so:/system/lib/libOMX.TI.ILBC.decode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libopencore_net_support.so:/system/lib/libopencore_net_support.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.G726.encode.so:/system/lib/libOMX.TI.G726.encode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libopencore_mp4local.so:/system/lib/libopencore_mp4local.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.G711.encode.so:/system/lib/libOMX.TI.G711.encode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOMX.TI.AMR.encode.so:/system/lib/libOMX.TI.AMR.encode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libIMGegl.so:/system/lib/libIMGegl.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/g729enc_sn.dll64P:/system/lib/dsp/g729enc_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/g722dec_sn.dll64P:/system/lib/dsp/g722dec_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/wbamrenc_sn.dll64P:/system/lib/dsp/wbamrenc_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/mp3dec_sn.dll64P:/system/lib/dsp/mp3dec_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/baseimage.map:/system/lib/dsp/baseimage.map \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/g726enc_sn.dll64P:/system/lib/dsp/g726enc_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/qosdyn_3430.dll64P:/system/lib/dsp/qosdyn_3430.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/nbamrdec_sn.dll64P:/system/lib/dsp/nbamrdec_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/postprocessor_dualout.dll64P:/system/lib/dsp/postprocessor_dualout.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/wbamrdec_sn.dll64P:/system/lib/dsp/wbamrdec_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/conversions.dll64P:/system/lib/dsp/conversions.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/ddspbase_tiomap3430.dof64P:/system/lib/dsp/ddspbase_tiomap3430.dof64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/monitor_tiomap3430.dof64P:/system/lib/dsp/monitor_tiomap3430.dof64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/yuvconvert.l64p:/system/lib/dsp/yuvconvert.l64p \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/wmadec_sn.dll64P:/system/lib/dsp/wmadec_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/dctn_dyn.dll64P:/system/lib/dsp/dctn_dyn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/jpegenc_sn.dll64P:/system/lib/dsp/jpegenc_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/g722enc_sn.dll64P:/system/lib/dsp/g722enc_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/vpp_sn.dll64P:/system/lib/dsp/vpp_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/wmv9dec_sn.dll64P:/system/lib/dsp/wmv9dec_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/dfgm.dll64P:/system/lib/dsp/dfgm.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/g729dec_sn.dll64P:/system/lib/dsp/g729dec_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/g711enc_sn.dll64P:/system/lib/dsp/g711enc_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/h264venc_sn.dll64P:/system/lib/dsp/h264venc_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/jpegdec_sn.dll64P:/system/lib/dsp/jpegdec_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/mp4vdec_sn.dll64P:/system/lib/dsp/mp4vdec_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/ipp_sn.dll64P:/system/lib/dsp/ipp_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/mpeg4aacenc_sn.dll64P:/system/lib/dsp/mpeg4aacenc_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/nbamrenc_sn.dll64P:/system/lib/dsp/nbamrenc_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/star.l64P:/system/lib/dsp/star.l64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/dynbase_tiomap3430.dof64P:/system/lib/dsp/dynbase_tiomap3430.dof64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/g726dec_sn.dll64P:/system/lib/dsp/g726dec_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/mpeg4aacdec_sn.dll64P:/system/lib/dsp/mpeg4aacdec_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/eenf_ti.l64P:/system/lib/dsp/eenf_ti.l64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/baseimage.dof:/system/lib/dsp/baseimage.dof \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/ringio.dll64P:/system/lib/dsp/ringio.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/usn.dll64P:/system/lib/dsp/usn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/ilbcenc_sn.dll64P:/system/lib/dsp/ilbcenc_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/m4venc_sn.dll64P:/system/lib/dsp/m4venc_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/chromasuppress.l64p:/system/lib/dsp/chromasuppress.l64p \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/h264vdec_sn.dll64P:/system/lib/dsp/h264vdec_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/ilbcdec_sn.dll64P:/system/lib/dsp/ilbcdec_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/g711dec_sn.dll64P:/system/lib/dsp/g711dec_sn.dll64P \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libGLES_android.so:/system/lib/egl/libGLES_android.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/egl.cfg:/system/lib/egl/egl.cfg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/pvrsrvinit:/system/bin/pvrsrvinit \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/powervr.ini:/system/etc/powervr.ini \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOpenVGU.so:/system/lib/libOpenVGU.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libEGL_POWERVR_SGX530_125.so:/system/lib/egl/libEGL_POWERVR_SGX530_125.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libGLESv2_POWERVR_SGX530_125.so:/system/lib/egl/libGLESv2_POWERVR_SGX530_125.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libGLESv1_CM_POWERVR_SGX530_125.so:/system/lib/egl/libGLESv1_CM_POWERVR_SGX530_125.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsrv_um.so:/system/lib/libsrv_um.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libIMGegl.so:/system/lib/libIMGegl.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/gralloc.omap3.so:/system/lib/hw/gralloc.omap3.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libpvrPVR2D_FLIPWSEGL.so:/system/lib/libpvrPVR2D_FLIPWSEGL.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libusc.so:/system/lib/libusc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libglslcompiler.so:/system/lib/libglslcompiler.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libPVRScopeServices.so:/system/lib/libPVRScopeServices.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libpvrANDROID_WSEGL.so:/system/lib/libpvrANDROID_WSEGL.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libpvrPVR2D_FRONTWSEGL.so:/system/lib/libpvrPVR2D_FRONTWSEGL.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libOpenVG.so:/system/lib/libOpenVG.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libpvr2d.so:/system/lib/libpvr2d.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsrv_init.so:/system/lib/libsrv_init.so \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/libaudio.so:/system/lib/libaudio.so \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/libaudiopolicy.so:/system/lib/libaudiopolicy.so \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/alsa.omap3.so:/system/lib/hw/alsa.omap3.so \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/libaudio.so:/system/lib/libaudio.so \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/liba2dp.so:/system/lib/liba2dp.so \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/libasound.so:/system/lib/libasound.so \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/hda:/system/usr/share/alsa/init/hda \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/00main:/system/usr/share/alsa/init/00main \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/help:/system/usr/share/alsa/init/help \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/default:/system/usr/share/alsa/init/default \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/info:/system/usr/share/alsa/init/info \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/test:/system/usr/share/alsa/init/test \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/surround51.conf:/system/usr/share/alsa/pcm/surround51.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/surround41.conf:/system/usr/share/alsa/pcm/surround41.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/default.conf:/system/usr/share/alsa/pcm/default.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/dmix.conf:/system/usr/share/alsa/pcm/dmix.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/modem.conf:/system/usr/share/alsa/pcm/modem.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/side.conf:/system/usr/share/alsa/pcm/side.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/front.conf:/system/usr/share/alsa/pcm/front.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/iec958.conf:/system/usr/share/alsa/pcm/iec958.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/surround50.conf:/system/usr/share/alsa/pcm/surround50.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/surround40.conf:/system/usr/share/alsa/pcm/surround40.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/surround71.conf:/system/usr/share/alsa/pcm/surround71.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/dpl.conf:/system/usr/share/alsa/pcm/dpl.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/dsnoop.conf:/system/usr/share/alsa/pcm/dsnoop.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/rear.conf:/system/usr/share/alsa/pcm/rear.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/center_lfe.conf:/system/usr/share/alsa/pcm/center_lfe.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/aliases.conf:/system/usr/share/alsa/cards/aliases.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/prebuilt/alsa.conf:/system/usr/share/alsa/alsa.conf \\

EOF


./setup-makefiles.sh
