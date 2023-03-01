# outdooractive

OutdoorActive API

## Adding POIs to my account

Create `caves_elphin_25m.gpx.txt` and run
```
add_poi.sh
```

The output from a successful POI addition is JSON, see `caves_elphin_25m.gpx.txt_output.json`

Note that if you run the script twice you'll get the POIs added twice,
it doesn't check for duplicates.
