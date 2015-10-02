#!/bin/bash
awk -f YmapsURLToKML.awk ymapsurl.url > out.kml
