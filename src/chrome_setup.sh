function change_language_if_needed() {
  if [ ! -z "${LANGUAGE// }" ] && [ ! -z "${COUNTRY// }" ]; then
    echo "Language will be changed to ${LANGUAGE}-${COUNTRY}"
    until adb root
    do
    	sleep 1
    done
    until adb shell "setprop persist.sys.language ${LANGUAGE}; setprop persist.sys.country ${COUNTRY}; setprop persist.sys.locale ${LANGUAGE}-${COUNTRY}; stop; start"
    do
    	sleep 1
    done
    until adb unroot
    do
    	sleep 1
    done
    echo "Language is changed!"
  fi
}
  
  until adb root
  do
    sleep 1
  done
  until adb shell svc wifi disable
  do 
    sleep 2
  done
  until adb shell svc bluetooth disable
  do
    sleep 1
  done
  until adb shell echo '"chrome --disable-fre --no-default-browser-check --no-first-run" > /data/local/tmp/chrome-command-line'
  do 
    sleep 1
  done
  until adb shell settings put global window_animation_scale 0
  do
        sleep 1
  done
  until adb shell settings put global transition_animation_scale 0
  do
        sleep 1
  done
  until adb shell settings put global animator_duration_scale 0
  do
        sleep 1
  done
  until adb unroot
  do
    sleep 1
  done
  change_language_if_needed
  ##until adb reboot
  ##do
  ##  sleep 1
  done