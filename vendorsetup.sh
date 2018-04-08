for f in $(cat vendor/aosip/aosip.devices); do
    add_lunch_combo aosip_$f-userdebug;
    add_lunch_combo aosip_$f-user;
done
