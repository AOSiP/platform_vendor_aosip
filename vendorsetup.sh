if [ -z ${variant} ]; then
  export variant="userdebug";
fi

for combo in $(ls vendor/aosip/products/aosip_*.mk | sed -e 's/vendor\/aosip\/products\///' -e "s/.mk/-$variant/")
do
add_lunch_combo ${combo}
done

