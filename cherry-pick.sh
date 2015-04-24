#!/usr/bin/env bash

if [ "$REPO_BRANCH" = "cm-11.0" ] || [ "$DEVICE" = "degaswifi" ]
then
  echo -e $CL_BLU"Cherrypicking EGL patches - Merge changes from 4.3.1 which enables HWC and EGL"$CL_RST
  cd frameworks/native
  git fetch https://github.com/suyouxin/android_frameworks_native android-5.0.0-xo4
  git cherry-pick 641e7659e44a6cc216b5a74860bccb88e5a11b1e
  echo -e $CL_BLU"Cherrypicking EGL patches - increasing buffers number for application dequeue"$CL_RST
  git cherry-pick e3af52ad5027c3c224da785c9bc0f25a79741454
  echo -e $CL_BLU"Cherrypicking EGL patches - remove bufferqueue debug flag"$CL_RST
  git cherry-pick 9f4da9c064eed09661a6e17dfe49bf3e41de59be
  echo -e $CL_BLU"Cherrypicking EGL patches - Remove buffercount hack, change waitForFreeSlotThenRelock to blocking"$CL_RST
  git cherry-pick f3f73dd6fcf0cbe7828a2fdeef46aed395016a20
  cd ../..
fi

if [ "$REPO_BRANCH" = "cm-11.0" ] || [ "$DEVICE" = "degaswifi" ]
then
  echo -e $CL_BLU"Cherrypicking libhardware patches - bring in Marvell extension for HWC"$CL_RST
  cd hardware/libhardware
  git fetch https://github.com/suyouxin/android_hardware_libhardware android-5.0.0-xo4
  git cherry-pick b804d20e6bc23fbdbc62060cea71b195d1eeb8d9
  cd ../..
fi

if [ "$REPO_BRANCH" = "cm-11.0" ] || [ "$DEVICE" = "degaswifi" ]
then
  echo -e $CL_BLU"Cherrypicking multimedia patches - merge changes from 4.3.1 branch"$CL_RST
  cd hardware/libhardware
  git fetch https://github.com/suyouxin/android_system_core android-5.0.0-xo4
  git cherry-pick 190deefb0918a0d2e22406cc4b34fb16aec32b9e
  cd ../..
fi

